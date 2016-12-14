module wb_sdram_ctrl_fifo
  (
    input [16-1:0]      d_i,
    input 			    we_i,
    input 			    clear,
    input 			    clk_i,
    output [32-1:0]     wb_dat_o,
    input 			    wb_cyc_i,
    input 			    wb_stb_i,
    output 			    wb_ack_o,
    input 			    wb_clk,
    input 			    rst
   );

   reg [32-1:0] ram [0:3];
   reg [16-1:0] tmp;
   
   reg [2-1:0] 		    adr_i;
   wire [2-1:0] 		    adr_i_next;
   reg [2-1:0] 		    adr_o;
   wire [2-1:0] 		    adr_o_next;
   reg 					    a0;

   always @ (posedge clk_i or posedge rst)
     if (rst)
       a0 <= 1'b0;
     else
       if (clear)
	 a0 <= 1'b0;
       else if (we_i)
	 a0 <= ~a0;

   always @ (posedge clk_i or posedge rst)
     if (rst)
       tmp <= 16'd0;
     else
       tmp <= d_i;
   
   // write adr counter
   assign adr_i_next = (adr_i==3) ? 2'd0 : adr_i + 2'd1;
   always @ (posedge clk_i or posedge rst)
     if (rst)
       adr_i <= 2'd0;
     else
       if (clear)
	 adr_i <= 2'd0;
       else if (we_i & a0)
         adr_i <= adr_i_next;
   
   // read adr counter
   assign adr_o_next = (adr_o==3) ? 2'd0 : adr_o + 2'd1;
   always @ (posedge clk_i or posedge rst)
     if (rst)
       adr_o <= {2{1'b0}};
     else
       if (clear)
	 adr_o <= 2'd0;
       else if (wb_cyc_i & wb_stb_i & !(adr_i==adr_o))
         adr_o <= adr_o_next;   
   
   assign wb_ack_o = wb_cyc_i & wb_stb_i & !(adr_i==adr_o);
      
   // write to mem
   always @ (posedge clk_i)
     if (we_i & (a0==1'b1))
	 ram[adr_i] <= {tmp,d_i};

   assign wb_dat_o = ram[adr_o];

endmodule // fifo
   
 
