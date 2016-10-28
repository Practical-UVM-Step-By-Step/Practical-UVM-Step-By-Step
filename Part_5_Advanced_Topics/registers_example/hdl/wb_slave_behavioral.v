`include "timescale.v"
`include "wb_model_defines.v"
module wb_dut
(
	CLK_I,
	RST_I,
	ACK_O,
	ADR_I,
	CYC_I,
	DAT_O,
	DAT_I,
	ERR_O,
	RTY_O,
	SEL_I,
	STB_I,
	WE_I,
	CAB_I
);

/*------------------------------------------------------------------------------------------------------
WISHBONE signals
------------------------------------------------------------------------------------------------------*/
input                   CLK_I;
input                   RST_I;
output                  ACK_O;
input   `WB_ADDR_TYPE   ADR_I;
input                   CYC_I;
output  `WB_DATA_TYPE   DAT_O;
input   `WB_DATA_TYPE   DAT_I;
output                  ERR_O;
output                  RTY_O;
input   `WB_SEL_TYPE    SEL_I;
input                   STB_I;
input                   WE_I;
input                   CAB_I;

reg     `WB_DATA_TYPE   DAT_O;

/*------------------------------------------------------------------------------------------------------
Asynchronous dual-port RAM signals for storing and fetching the data
------------------------------------------------------------------------------------------------------*/
//reg     `WB_DATA_TYPE wb_memory [0:16777215]; // WB memory - 24 addresses connected - 2 LSB not used
reg     `WB_DATA_TYPE wb_memory [0:1048575]; // WB memory - 20 addresses connected - 2 LSB not used
reg     `WB_DATA_TYPE mem_wr_data_out;
reg     `WB_DATA_TYPE mem_rd_data_in;


/*------------------------------------------------------------------------------------------------------
Maximum values for WAIT and RETRY counters and which response !!!
------------------------------------------------------------------------------------------------------*/
reg     [2:0]  a_e_r_resp; // tells with which cycle_termination_signal must wb_slave respond !
reg     [3:0]  wait_cyc;
reg     [7:0]  max_retry;
integer i1;
// assign registers to default state while in reset
always@(RST_I)
begin
  if (RST_I)
  begin
    a_e_r_resp <= 3'b100; // do not respond
    wait_cyc   <= 4'b10; // no wait cycles
    max_retry  <= 8'h0; // no retries
  end
end //reset

task cycle_response;
  input [2:0]  ack_err_rty_resp; // acknowledge, error or retry response input flags
  input [3:0]  wait_cycles; // if wait cycles before each data termination cycle (ack, err or rty)
  input [7:0]  retry_cycles; // noumber of retry cycles before acknowledge cycle
begin
  // assign values
  a_e_r_resp <= #1 ack_err_rty_resp;
  wait_cyc   <= #1 wait_cycles;
  max_retry  <= #1 retry_cycles;
end
endtask // cycle_response

/*------------------------------------------------------------------------------------------------------
Tasks for writing and reading to and from memory !!!
------------------------------------------------------------------------------------------------------*/
reg    `WB_ADDR_TYPE task_wr_adr_i;
reg    `WB_ADDR_TYPE task_rd_adr_i;
reg    `WB_DATA_TYPE task_dat_i;
reg    `WB_DATA_TYPE task_dat_o;
reg    `WB_SEL_TYPE  task_sel_i;
reg                  task_wr_data;
reg                  task_data_written;
reg    `WB_DATA_TYPE task_mem_wr_data;


wire sel_mem = (ADR_I[31:0] > 32'h0400&& ADR_I[31:0] < 32'h8000)?1:0;
wire sel_reg = ((ADR_I[31:0] < 32'h0400)?1:0 ) & CYC_I;
/*------------------------------------------------------------------------------------------------------
Internal signals and logic
------------------------------------------------------------------------------------------------------*/
reg            calc_ack;
reg            calc_err;
reg            calc_rty;

reg     [7:0]  retry_cnt;
reg     [7:0]  retry_num;
reg            retry_expired;

/*------------------------------------------------------------------------------------------------------
Here are all the actual registers

------------------------------------------------------------------------------------------------------*/

// The normal register is 32 bits wide. This register is extra wide. 
reg [64:0] extra_wide_register; // Address @104
reg [31:0] read_only_register;  // this is a read_only register
reg [31:0] CHIP_ID ;  // this is a read_only register

reg [15:0] r_RO_register; //	Read Only
reg [15:0] r_RW_register; //	Read, Write
reg [16:0] r_RC_register; //	Read Clears All
reg [16:0] r_RS_register; //	Read Sets All
reg [16:0] r_WRC_register; //	Write, Read Clears All
reg [16:0] r_WRS_register; //	Write, Read Sets All
reg [16:0] r_WC_register; //	Write Clears All
reg [16:0] r_WS_register; //	Write Sets All
reg [17:0] r_WSRC_register; //	Write Sets All, Read Clears All
reg [17:0] r_WCRS_register; //	Write Clears All, Read Sets All
reg [17:0] r_WSRS_register; //	Write Clears All, Read Sets All
reg [16:0] r_W1C_register; //	Write 1 to Clear
reg [16:0] r_W1S_register; //	Write 1 to Set
reg [16:0] r_W1T_register; //	Write 1 to Toggle
reg [16:0] r_W0C_register; //	Write 0 to Clear
reg [16:0] r_W0S_register; //	Write 0 to Set
reg [16:0] r_W0T_register; //	Write 0 to Toggle
reg [17:0] r_W1SRC_register; //	Write 1 to Set, Read Clears All
reg [17:0] r_W1CRS_register; //	Write 1 to Clear, Read Sets All
reg [17:0] r_W0SRC_register; //	Write 0 to Set, Read Clears All
reg [17:0] r_W0CRS_register; //	Write 0 to Clear, Read Sets All
reg [16:0] r_WO_register; //	Write Only
reg [16:0] r_WOC_register; //	Write Only Clears All
reg [16:0] r_WOS_register; //	Write Only Sets All
reg [16:0] r_W1_register; //	Write Once
reg [16:0] r_WO1_register; //	Write Only, Once

reg [31:0] r_aliased_1; //	Source for Alias
reg [15:0] r_aliased_2; //	Alias destination

reg [15:0] master_index; //	Index Register
reg [31:0] register_array[16]; // Register array for Index registers.

reg [31:0] fifo_data_reg;
reg [31:0] fifo_read_reg;
integer i;

// Wires for address decode
 reg completed_access;
 int wr_counter = 0;
 int wr_counter_01 = 0;

 initial begin
	 wr_counter = 0;
	 wr_counter_01 = 0;
 end



/*
reg [16:0] r_WRC_register; //	Write, Read Clears All
reg [16:0] r_WRS_register; //	Write, Read Sets All
reg [16:0] r_WC_register; //	Write Clears All
reg [16:0] r_WS_register; //	Write Sets All
reg [17:0] r_WSRC_register; //	Write Sets All, Read Clears All
reg [17:0] r_WCRS_register; //	Write Clears All, Read Sets All
reg [16:0] r_W1C_register; //	Write 1 to Clear
reg [16:0] r_W1S_register; //	Write 1 to Set
reg [16:0] r_W1T_register; //	Write 1 to Toggle
reg [16:0] r_W0C_register; //	Write 0 to Clear
reg [16:0] r_W0S_register; //	Write 0 to Set
reg [16:0] r_W0T_register; //	Write 0 to Toggle
reg [17:0] r_W1SRC_register; //	Write 1 to Set, Read Clears All
reg [17:0] r_W1CRS_register; //	Write 1 to Clear, Read Sets All
reg [17:0] r_W0SRC_register; //	Write 0 to Set, Read Clears All
reg [17:0] r_W0CRS_register; //	Write 0 to Clear, Read Sets All
reg [16:0] r_WO_register; //	Write Only
reg [16:0] r_WOC_register; //	Write Only Clears All
reg [16:0] r_WOS_register; //	Write Only Sets All
reg [16:0] r_W1_register; //	Write Once
reg [16:0] r_WO1_register; //	Write Only, Once
*/

// reset  values for the registers
always@(posedge RST_I or posedge CLK_I)
begin
	if (RST_I) begin
		  CHIP_ID <= 'h01765a03;
		   r_RO_register <= 'h0c;
		   r_RW_register <= 'h10;
		   r_RC_register <= 'h14;
		   r_RS_register <= 'h18;
		   r_WRC_register <= 'h1c;
		   r_WRS_register <= 'h20;
		   r_WC_register <= 'h24;
		   r_WS_register <= 'h28;
		   r_WSRC_register <= 'h2c;
		   r_WCRS_register <= 'h30;
		   r_W1C_register <= 'h34;
		   r_W1S_register <= 'h38;
		   r_W1T_register <= 'h3c;
		   r_W0C_register <= 'h40;
		   r_W0S_register <= 'h44;
		   r_W0T_register <= 'h48;
		   r_W1SRC_register <= 'h4c;
		   r_W1CRS_register <= 'h50;
		   r_W0SRC_register <= 'h54;
		   r_W0CRS_register <= 'h58;
		   r_WO_register <= 'h5c;
		   r_WOC_register <= 'h60;
		   r_WOS_register <= 'h64;
		   r_W1_register <= 'h68;
		   r_WO1_register <= 'h6c;
		   r_aliased_1 <= 'h70;
		   r_aliased_2 <= 'h74;
		   master_index <= 'h78;
		   wr_counter = 0;
		   wr_counter_01 = 0;
        end

  else 
  	begin 
		if(sel_reg) begin
			case(ADR_I[7:0])
		   'h00:  begin
		   		if(WE_I) begin
					// Write should just not work. This is a read only register.
				end
				else begin
				DAT_O <= CHIP_ID;
				end
			      end
					
		   'h0c:  begin
		   		if(WE_I) begin
					// Write should just not work. This is a read only register.
				end
				else begin
				DAT_O <= {16'b0, r_RO_register};
		
				end
			      end
		
		   'h10:  begin
		   		if(WE_I) begin
				 r_RW_register <= DAT_I[15:0];	
				end
				else begin
				DAT_O <= {16'b0, r_RW_register};
		
				end
			      end
		
		   'h14:  begin
		   		if(WE_I) begin
				 // r_RC_register <= DAT_I[15:0];	
				end
				else begin
			        // perform the read.	
				DAT_O <= {16'b0, r_RC_register[15:0]};
				// Since this is a read-2-clear register, clear out the contents
				r_RC_register <= 16'b0;
		
				end
			      end
		
		   'h18:  begin
		   		if(WE_I) begin
				 // r_RS_register <= DAT_I[15:0];	
				end
				else begin
			        // perform the read.	
				DAT_O <= {16'b0, r_RS_register};
			        // perform the read.	
				r_RS_register <= 16'hFFFF;

		
				end
			      end
		
		   'h1c:  begin
		   		if(WE_I) begin
				 r_WRC_register <= DAT_I[15:0];	
				end
				else begin
				DAT_O <= {16'b0, r_WRC_register};
				r_WRC_register <= 16'b0;
		
				end
			      end
		
		   'h20:  begin
		   		if(WE_I) begin
				 r_WRS_register <= DAT_I[15:0];	
				end
				else begin
				 DAT_O <= {16'b0, r_WRS_register};
				 r_WRS_register <= 16'hffff;
		
				end
			      end
		
		   'h24:  begin
		   		if(WE_I) begin
				// r_WC_register <= DAT_I[15:0];	
				 r_WC_register <= 16'h0;	
				end
				else begin
				DAT_O <= {16'b0, r_WC_register};
		
				end
			      end
		
		   'h28:  begin
		   		if(WE_I) begin
				 // r_WS_register <= DAT_I[15:0];	
				 r_WS_register <= 16'hffff;	
				end
				else begin
				DAT_O <= {16'b0, r_WS_register};
		
				end
			      end
		
		   'h2c:  begin
		   		if(WE_I) begin
				 // r_WSRC_register <= DAT_I[15:0];	
				 r_WSRC_register <= 16'hffff ;	
				end
				else begin
				DAT_O <= {16'b0, r_WSRC_register};
				 r_WSRC_register <= 16'h0 ;	
		
				end
			      end
		
		   'h30:  begin
		   		if(WE_I) begin
				// r_WCRS_register <= DAT_I[15:0];	
				 r_WCRS_register <= 16'h0;	
				end
				else begin
				DAT_O <= {16'b0, r_WCRS_register};
				 r_WCRS_register <= 16'hffff ;	
		
				end
			      end
		
		   'h34:  begin
		   		if(WE_I) begin
				 r_W1C_register <= DAT_I[15:0];	
				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 1) 
				 			r_W1C_register[i] <= 0;	
				end
				 	
				end
				else begin
				DAT_O <= {16'b0, r_W1C_register};
		
				end
			      end
		
		   'h38:  begin
		   		if(WE_I) begin
				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 1) 
				 			r_W1S_register[i] <= 1;	
				end
				end
				else begin
				DAT_O <= {16'b0, r_W1S_register};
		
				end
			      end
		
		   'h3c:  begin
		   		if(WE_I) begin
				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 1) 
				 			r_W1T_register[i] <=  ~r_W1T_register[i];	
				end
				end
				else begin
				DAT_O <= {16'b0, r_W1T_register};
		
				end
			      end
		
		   'h40:  begin
		   		if(WE_I) begin
				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 0) 
				 			r_W0C_register[i] <=  0;	
				end
				end
				else begin
				DAT_O <= {16'b0, r_W0C_register};
		
				end
			      end
		
		   'h44:  begin
		   		if(WE_I) begin
				 r_W0S_register <= DAT_I[15:0];	
				 r_W0S_register[16] <= 1;	
				end
				else begin
				DAT_O <= {16'b0, r_W0S_register};
		
				end
			      end
		
		   'h48:  begin
		   		if(WE_I) begin
				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 0) 
				 			r_W0T_register[i] <=  ~ r_W0T_register[i];	
				end
				end
				else begin
				DAT_O <= {16'b0, r_W0T_register};
		
				end
			      end
		
		     'h4c:  begin
		   
		   		if(WE_I) begin
				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 1) 
				 			r_W1SRC_register[i] <=  1;
				end
				end
				else begin
				DAT_O <= {16'b0, r_W1SRC_register};
				 r_W1SRC_register <= 16'h0;	
		
				end
			      end
		     'h50:  begin
		   
		   		if(WE_I) begin
				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 1) 
				 			r_W1CRS_register[i] <=  0;
				end
				end
				else begin
				DAT_O <= {16'b0, r_W1SRC_register};
				 r_W1CRS_register <= 16'hffff;	
		
				end
			      end


		   'h54:  begin
		   		if(WE_I) begin

				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 0) 
				 			r_W0SRC_register[i] <=  1;
				end
				end
				else begin
				DAT_O <= {16'b0, r_W0SRC_register};
				 r_W0SRC_register <= 16'h0;	
		
				end
			      end
		
		   'h58:  begin
		   		if(WE_I) begin
				 for(i = 0; i < 16; i++) begin
					 	if(DAT_I[i] == 0) 
				 			r_W0CRS_register[i] <=  0;
				end
				end
				else begin
				 r_W0CRS_register <= 16'hffff;	
		
				end
			      end
		
		   'h5c:  begin
		   		if(WE_I) begin
				 r_WO_register <= DAT_I[15:0];	
				end
				else begin
				DAT_O <= {16'b0, 16'hx};
				end
			      end
		
		   'h60:  begin
		   		if(WE_I) begin
				 r_WOC_register <= 16'h0;	
				end
				else begin
				DAT_O <= {16'b0, 16'hx};
		
				end
			      end
		
		   'h64:  begin
		   		if(WE_I) begin
				 r_W0S_register <= 16'hffff;	
				end
				else begin
				DAT_O <= {16'b0, 16'hx};
				end
			      end
		
		   'h68:  begin
		   		if(WE_I) begin
				wr_counter ++;
					if(wr_counter == 1) 
						r_W1_register <= DAT_I[15:0];	
				end
				else begin
				DAT_O <= {16'b0, r_W1_register};
				end
			      end
		
		   'h6c:  begin
		   		if(WE_I) begin
				wr_counter_01 ++;
					if(wr_counter_01 == 1) 
				 r_WO1_register <= DAT_I[15:0];	
				end
				else begin
				DAT_O <= {16'b0, r_WO1_register};
				end
			      end
		
		   'h70:  begin
		   		if(WE_I) begin
				 r_aliased_1 <= DAT_I[15:0];	
				end
				else begin
				end
			      end
		
		   'h74:  begin
		   		if(WE_I) begin
				end
				else begin
				DAT_O <= {16'b0, r_aliased_1};
				end
			      end
		
		   'h78:  begin
		   		if(WE_I) begin
				 master_index <= DAT_I[15:0];	
				end
				else begin
				DAT_O <= {16'b0, master_index};
		
				end
			      end

			      default: $display("!!!!!ERROR!!! Address is not on list!! %04x\n",ADR_I[7:0]);
		
			endcase
		end

  	end
end



/// --End Register Definition
// Retry counter
always@(posedge RST_I or posedge CLK_I)
begin
  if (RST_I)
    retry_cnt <= #1 8'h00;
  else
  begin
    if (calc_ack || calc_err)
      retry_cnt <= #1 8'h00;
    else if (calc_rty)
      retry_cnt <= #1 retry_num;
  end
end

always@(retry_cnt or max_retry)
begin
  if (retry_cnt < max_retry)
  begin
    retry_num = retry_cnt + 1'b1;
    retry_expired = 1'b0;
  end
  else
  begin
    retry_num = retry_cnt;
    retry_expired = 1'b1;
  end
end

reg     [3:0]  wait_cnt;
reg     [3:0]  wait_num;
reg            wait_expired;

// Wait counter
always@(posedge RST_I or posedge CLK_I)
begin
  if (RST_I)
    wait_cnt <= #1 4'h0;
  else
  begin
    if (wait_expired || ~STB_I)
      wait_cnt <= #1 4'h0;
    else
      wait_cnt <= #1 wait_num;
  end
end

always@(wait_cnt or wait_cyc or STB_I or a_e_r_resp or retry_expired)
begin
  if ((wait_cyc > 0) && (STB_I))
  begin
    if (wait_cnt < wait_cyc) // 4'h2)
    begin
      wait_num = wait_cnt + 1'b1;
      wait_expired = 1'b0;
      calc_ack = 1'b0;
      calc_err = 1'b0;
      calc_rty = 1'b0;
    end
    else
    begin
      wait_num = wait_cnt;
      wait_expired = 1'b1;
      if (a_e_r_resp == 3'b100)
      begin
        calc_ack = 1'b1;
        calc_err = 1'b0;
        calc_rty = 1'b0;
      end
      else
      if (a_e_r_resp == 3'b010)
      begin
        calc_ack = 1'b0;
        calc_err = 1'b1;
        calc_rty = 1'b0;
      end
      else
      if (a_e_r_resp == 3'b001)
      begin
        calc_err = 1'b0;
        if (retry_expired)
        begin
          calc_ack = 1'b1;
          calc_rty = 1'b0;
        end
        else
        begin
          calc_ack = 1'b0;
          calc_rty = 1'b1;
        end
      end
      else
      begin
        calc_ack = 1'b0;
        calc_err = 1'b0;
        calc_rty = 1'b0;
      end
    end
  end
  else
  if ((wait_cyc == 0) && (STB_I))
  begin
    wait_num = 2'h0;
    wait_expired = 1'b1;
    if (a_e_r_resp == 3'b100)
    begin
      calc_ack = 1'b1;
      calc_err = 1'b0;
      calc_rty = 1'b0;
    end
    else if (a_e_r_resp == 3'b010)
    begin
      calc_ack = 1'b0;
      calc_err = 1'b1;
      calc_rty = 1'b0;
    end
    else if (a_e_r_resp == 3'b001)
    begin
      calc_err = 1'b0;
      if (retry_expired)
      begin
        calc_ack = 1'b1;
        calc_rty = 1'b0;
      end
      else
      begin
        calc_ack = 1'b0;
        calc_rty = 1'b1;
      end
    end
    else
    begin
      calc_ack = 1'b0;
      calc_err = 1'b0;
      calc_rty = 1'b0;
    end
  end
  else
  begin
    wait_num = 2'h0;
    wait_expired = 1'b0;
    calc_ack = 1'b0;
    calc_err = 1'b0;
    calc_rty = 1'b0;
  end
end

wire rd_sel = (CYC_I && STB_I && ~WE_I);
wire wr_sel = (CYC_I && STB_I && WE_I);

// Generate cycle termination signals
assign ACK_O = calc_ack && STB_I;
assign ERR_O = calc_err && STB_I;
assign RTY_O = calc_rty && STB_I;

// Assign address to asynchronous memory
always@(RST_I or ADR_I)
begin
  if (RST_I) // this is added because at start of test bench we need address change in order to get data!
  begin
    #1 mem_rd_data_in = `WB_DATA_WIDTH'hxxxx_xxxx;
  end
  else
  begin
//    #1 mem_rd_data_in = wb_memory[ADR_I[25:2]];
    #1 mem_rd_data_in = wb_memory[ADR_I[21:2]];
  end
end

// Data input/output interface
always@(rd_sel or mem_rd_data_in or RST_I)
begin
  if (RST_I)
    DAT_O <=#1 `WB_DATA_WIDTH'hxxxx_xxxx;	// assign outputs to unknown state while in reset
  else if (rd_sel)
    DAT_O <=#1 mem_rd_data_in;
  else
    DAT_O <=#1 `WB_DATA_WIDTH'hxxxx_xxxx;
end
always@(CLK_I or wr_sel or task_wr_data or ADR_I or task_wr_adr_i or 
        mem_wr_data_out or DAT_I or task_mem_wr_data or task_dat_i or
        SEL_I or task_sel_i)
begin
 completed_access = !CYC_I && wait_expired;
end






always@(RST_I or task_rd_adr_i)
begin
  if (RST_I)
    task_dat_o = `WB_DATA_WIDTH'hxxxx_xxxx;
  else
	 
    task_dat_o = wb_memory[task_rd_adr_i[21:2]];
end
always@(CLK_I or wr_sel or task_wr_data or ADR_I or task_wr_adr_i or 
        mem_wr_data_out or DAT_I or task_mem_wr_data or task_dat_i or
        SEL_I or task_sel_i)
begin
 if(sel_mem) begin
  if (task_wr_data)
  begin
    task_mem_wr_data = wb_memory[task_wr_adr_i[21:2]];

    if (task_sel_i[3])
      task_mem_wr_data[31:24] = task_dat_i[31:24];
    if (task_sel_i[2])
      task_mem_wr_data[23:16] = task_dat_i[23:16];
    if (task_sel_i[1])
      task_mem_wr_data[15: 8] = task_dat_i[15: 8];
    if (task_sel_i[0])
      task_mem_wr_data[ 7: 0] = task_dat_i[ 7: 0];

    wb_memory[task_wr_adr_i[21:2]] = task_mem_wr_data; // write data
    task_data_written = 1;
  end
  else if (wr_sel && ~CLK_I )
  begin
    mem_wr_data_out = wb_memory[ADR_I[21:2]]; // if no SEL_I is active, old value will be written

    if (SEL_I[3])
      mem_wr_data_out[31:24] = DAT_I[31:24];
    if (SEL_I[2])
      mem_wr_data_out[23:16] = DAT_I[23:16];
    if (SEL_I[1])
      mem_wr_data_out[15: 8] = DAT_I[15: 8];
    if (SEL_I[0])
      mem_wr_data_out[ 7: 0] = DAT_I[ 7: 0];

//    wb_memory[ADR_I[25:2]]  <= mem_wr_data_out; // write data
    wb_memory[ADR_I[21:2]]  = mem_wr_data_out; // write data
  end
  end // sel_mem
end

initial begin // This process takes care of the memory aspect

	for(i1 =0; i1 < 1024 *200; i1 = i1+1) begin
		wb_memory[i1] = i1*4;
	end


end

// The Cycle is complete when CYC_I is negated. Hence, it is safe to clear the values of the registers. 
// To do so, we use the upper bits. 


always @(negedge CYC_I) begin
	

end
endmodule
