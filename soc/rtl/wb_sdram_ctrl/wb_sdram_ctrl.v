`include "wb_sdram_ctrl_defines.v"
module `MODULE_NAME
  (
   // wishbone i/f
    input [31:0]      wb_dat_i,
    output [31:0]     wb_dat_o,
    input [3:0]       wb_sel_i,
    input [`WB_ADR_HI:2]      wb_adr_i,
    input 	      wb_we_i,
    input [2:0]       wb_cti_i,
    input 	      wb_stb_i,
    input 	      wb_cyc_i,
    output  	      wb_ack_o,
   // SDRAM IO
    output 	      sdr_cke_o,   
    output reg	      sdr_cs_n_o,  
    output reg	      sdr_ras_n_o, 
    output reg	      sdr_cas_n_o, 
    output reg	      sdr_we_n_o,  
    output reg [12:0] sdr_a_o,
    output reg  [1:0] sdr_ba_o,
    inout [`SDRAM_DATA_WIDTH-1:0] sdr_dq_io,
    output reg [`SDRAM_DATA_WIDTH/8-1:0] sdr_dqm_o,
   // system
    input sdram_clk,
    input wb_clk,
    input wb_rst
   );

   reg    ref_req;
   wire   ref_ack;
   /* verilator lint_off UNOPTFLAT */
   wire	  rd_ack, rd_ack_o, wr_ack, wr_ack_o, cmd_ack;
   /* verilator lint_on UNOPTFLAT */
   reg [`BA_SIZE-1:0] ba;
   reg [`ROW_SIZE-1:0] row;

   // terminate current cycle if !stb&!cyc, empty fifo
   // restart if adr_fail (non consecutive adr inc), empty fifo
   wire   terminate, adr_fail, clear;
   
   wire   end_of_burst;
   wire   burst_counter_set;
   reg [`COL_SIZE-1:0]  burst_counter;   
`ifdef SDRAM16   
   wire [`BURST_SIZE:0] burst_counter_next;
   reg [`BURST_SIZE:0] 	burst_counter_init;
`endif

   wire 		fifo_we;
   
   wire [1:0]  sdr_ba;
   wire [12:0] sdr_a;

   reg 	       sdr_dq_oe_reg;
   wire [`SDRAM_DATA_WIDTH-1:0] sdr_dq_i, sdr_dq_o;
   wire [`SDRAM_DATA_WIDTH/8-1:0] sdr_dqm;
   
   // counter 100us delay and refresh interval
   reg [12:0] counter;
   wire       counter_zf; // counter zero flag
   assign counter_zf = (counter==13'd0);    
   always @ (posedge wb_clk or posedge wb_rst)
     if (wb_rst)
       counter <= 13'd`DLY_INIT;
     else if (counter_zf)
       counter <= 13'd`AREF_INIT;
     else
       counter <= counter - 13'd1;

   always @ (posedge wb_clk or posedge wb_rst)
     if (wb_rst)
       ref_req <= 1'b0;
     else
       if (counter_zf)
	 ref_req <= 1'b1;
       else if (ref_ack)
	 ref_req <= 1'b0;
   
`ifdef SDRAM16   
   assign burst_counter_next = burst_counter[`BURST_SIZE:0] + {{`BURST_SIZE{1'b0}},1'b1};
   always @ (posedge sdram_clk or posedge wb_rst)
     if (wb_rst)
       begin
	  ba <= `BA_SIZE'd0;
	  row <= `ROW_SIZE'd0;	  
	  burst_counter_init <= `BURST_SIZE'd0;
	  burst_counter <= `COL_SIZE'd0;
       end
     else
       if (burst_counter_set)
	 begin
	    ba <= `BA;
	    row <= `ROW;
	    // A fix of the fix.
	    // We previously adjusted the burst_counter, which is very important - it determines the address
	    // we generate and use for the SDRAM column addressing.
	    // So instead, when we receive an (arguably incorrect) access request, with the cycle indicator
	    // showing "burst end" (wb_cti_i=3'b111), we change burst_counter_init so it should show that
	    // the transfer will end after a single 32-bit word transaction has taken place (2 16-bit word
	    // transactions)
	    burst_counter_init <= (wb_cti_i == 3'b111) ? {wb_adr_i[`BURST_SIZE-1+2:2],1'b0} + 2 : {wb_adr_i[`BURST_SIZE-1+2:2],1'b0};	    
	    burst_counter <= {wb_adr_i[`COL_SIZE+2:2],1'b0};
	 end
       else if (rd_ack | wr_ack)
	 begin
	    burst_counter[`BURST_SIZE:0] <= burst_counter_next;	    
	 end
   assign end_of_burst = (wb_cti_i==3'b000) ? (burst_counter[0]==1'b1) : (burst_counter_next == burst_counter_init);
`endif

   wb_sdram_ctrl_fsm fsm0
     (
      .dly_100us(counter_zf),
      .ref_req(ref_req),
      .ref_ack(ref_ack),
      .accept_cmd(burst_counter_set),
      .rd_ack(rd_ack),
      .wr_ack(wr_ack),
      .clear(clear),
      .wb_stb(wb_stb_i),
      .wb_cyc(wb_cyc_i),
      .wb_we(wb_we_i),
      .wb_ack(wb_ack_o & ((wb_cti_i==3'b000) | (wb_cti_i==3'b111))),
      .end_of_burst(end_of_burst),
      .wb_adr_i({`BA,`ROW,burst_counter}),
      .a({sdr_ba,sdr_a}),
      .cmd(`CMD),
      .cs_n(sdr_cs_n),
      .sdram_clk(sdram_clk),
      .wb_rst(wb_rst)
      );

`ifdef SDRAM16
   assign sdr_dqm = ((burst_counter[0]==1'b0) & wr_ack) ? ~wb_sel_i[3:2] : 
		    ((burst_counter[0]==1'b1) & wr_ack) ? ~wb_sel_i[1:0] :
		    2'b00;
`endif
   
   // output registers
   always @ (posedge sdram_clk or posedge wb_rst)
     if (wb_rst)
       begin
	  sdr_cs_n_o <= 1'b1;
	  {sdr_ras_n_o, sdr_cas_n_o, sdr_we_n_o} <= `CMD_NOP;	  
	  {sdr_ba_o,sdr_a_o} <= 15'd0;
	  sdr_dqm_o <= {`SDRAM_DATA_WIDTH/8{1'b0}};
       end
     else
       begin
	  sdr_cs_n_o <= #1 sdr_cs_n;	  
	  {sdr_ras_n_o, sdr_cas_n_o, sdr_we_n_o} <= #1 `CMD;
	  {sdr_ba_o,sdr_a_o} <= #1 {sdr_ba,sdr_a};
	  sdr_dqm_o <= #1 sdr_dqm;
  end

   assign sdr_cke_o = 1'b1;

`ifdef SDRAM16   
   assign sdr_dq_o = (burst_counter[0]==1'b0) ? wb_dat_i[31:16] : wb_dat_i[15:0];
`endif
   
   // Tristate driver for data bus
//   assign sdr_dq_oe = wr_ack; -- sdr_dq_oe was not declared! changed its only reference --jb
   reg [`SDRAM_DATA_WIDTH-1:0] sdr_dq_o_reg;
   always @ (posedge sdram_clk or posedge wb_rst)
     if (wb_rst)
       {sdr_dq_oe_reg,sdr_dq_o_reg} <= {1'b0,`SDRAM_DATA_WIDTH'd0};
     else
       {sdr_dq_oe_reg,sdr_dq_o_reg} <= {wr_ack,sdr_dq_o};//{sdr_dq_oe_reg,sdr_dq_o_reg} <= {sdr_dq_oe,sdr_dq_o}; --jb

   assign #1 sdr_dq_io = sdr_dq_oe_reg ? sdr_dq_o_reg : {`SDRAM_DATA_WIDTH{1'bz}};
   assign #1 sdr_dq_i = sdr_dq_io;

   // delay fifo_fill in accordance to cas latency
   delay #
     (
      .depth(`CL+1),
      .width(1)
      )
   delay1
     (
      .d(rd_ack),
      .q(fifo_we),
      .clear(clear | terminate),
      .clk(sdram_clk),
      .rst(wb_rst)
      );

`ifdef SDRAM16
   assign wr_ack_o = wr_ack & burst_counter[0];
`endif
   

   // wishbone buffer
   wb_sdram_ctrl_fifo fifo
     (
      .d_i(sdr_dq_i),
      .we_i(fifo_we),
      .clear(clear | terminate),
      .clk_i(sdram_clk),
      .wb_dat_o(wb_dat_o),
      .wb_cyc_i(wb_cyc_i),
      .wb_stb_i(wb_stb_i),
      .wb_ack_o(rd_ack_o),
      .wb_clk(wb_clk),
      .rst(wb_rst)
   );


   assign terminate = ~wb_cyc_i & ~wb_stb_i;
   assign adr_fail = ~(wb_adr_i[`WB_ADR_HI:4]=={ba,row,burst_counter[`COL_SIZE-1:3]});
   assign clear = adr_fail & rd_ack_o;
/* verilator lint_off UNOPTFLAT */
   assign wb_ack_o = (rd_ack_o & !adr_fail) | wr_ack_o;
/* verilator lint_on UNOPTFLAT */
endmodule // wb_sdram_ctrl
