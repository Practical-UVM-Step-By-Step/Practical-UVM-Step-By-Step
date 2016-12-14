//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_fifo.v                                                  ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/project,ethmac                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Julius Baxter (julius@opencores.org)                  ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "ethmac_defines.v"
`include "timescale.v"

module eth_fifo (data_in, data_out, clk, reset, write, read, clear, 
		 almost_full, full, almost_empty, empty, cnt);

   parameter DATA_WIDTH    = 32;
   parameter DEPTH         = 8;
   parameter CNT_WIDTH     = 3;

   input                     clk;
   input                     reset;
   input                     write;
   input                     read;
   input                     clear;
   input [DATA_WIDTH-1:0]    data_in;

   output [DATA_WIDTH-1:0]   data_out;
   output                    almost_full;
   output                    full;
   output                    almost_empty;
   output                    empty;
   output [CNT_WIDTH-1:0]    cnt;


   reg [CNT_WIDTH-1:0] 	     read_pointer;
   reg [CNT_WIDTH-1:0] 	     cnt;
   
   always @ (posedge clk or posedge reset)
     begin
	if(reset)
	  cnt <= 0;
	else
	  if(clear)
	    cnt <= { {(CNT_WIDTH-1){1'b0}}, read^write};
	  else
	    if(read ^ write)
	      if(read)
		cnt <= cnt - 1;
	      else
		cnt <= cnt + 1;
     end

      
   assign empty = ~(|cnt);
   assign almost_empty = cnt==1;
   assign full  = {{32-CNT_WIDTH{1'b0}},cnt} == (DEPTH-1);
   assign almost_full  = {{32-CNT_WIDTH{1'b0}},cnt} == (DEPTH-2);

   
`ifdef ETH_FIFO_GENERIC

   reg     [DATA_WIDTH-1:0]  fifo  [0:DEPTH-1] /*synthesis syn_ramstyle = "no_rw_check"*/ ;
   
   
   // This should make the synthesis tool infer a RAM
   reg [CNT_WIDTH-1:0] 	     waddr, raddr, raddr_reg;
   reg 			     clear_reg; // Register the clear pulse

   reg 			     fallthrough_read;
   reg [CNT_WIDTH-1:0] 	     fallthrough_read_addr;

   
   always @(posedge clk)
     if (reset)
       fallthrough_read <= 0;
     else
       fallthrough_read <= empty & write;

   always @(posedge clk)
     if (empty & write)
       fallthrough_read_addr <= waddr;   
   
   always @(posedge clk)
     if (reset)
       waddr <= 0;
     else if (write)
       waddr <= waddr + 1;

   always @(posedge clk)
     if (reset)
       raddr <= 0;
     else if (clear)
       raddr <= waddr;
     else if (read | clear_reg)
       raddr <= raddr + 1;
   
   always @ (posedge clk)
     if (write & ~full)
       fifo[waddr] <=  data_in;


   always @(posedge clk)
     clear_reg <= clear;

   always @ (posedge clk)
     if (read | clear_reg)
       raddr_reg <= raddr;
     else if (fallthrough_read) // To pulse RE for fall-through on Xilinx
       raddr_reg <= fallthrough_read_addr;   
   
   assign  data_out = fifo[raddr_reg];

   always @ (posedge clk or posedge reset)
     begin
	if(reset)
	  read_pointer <= 0;
	else
	  if(clear)
	    // Begin read pointer at 1
	    read_pointer <= { {(CNT_WIDTH-1){1'b0}}, 1'b1};
	  else
	    if(read & ~empty)
	      read_pointer <= read_pointer + 1'b1;
     end


`else // !`ifdef ETH_FIFO_GENERIC

   reg     [CNT_WIDTH-1:0]   write_pointer;


   always @ (posedge clk or posedge reset)
     begin
	if(reset)
	  read_pointer <= 0;
	else
	  if(clear)
	    read_pointer <= { {(CNT_WIDTH-1){1'b0}}, read};
	  else
	    if(read & ~empty)
	      read_pointer <= read_pointer + 1'b1;
     end

   always @ (posedge clk or posedge reset)
     begin
	if(reset)
	  write_pointer <= 0;
	else
	  if(clear)
	    write_pointer <= { {(CNT_WIDTH-1){1'b0}}, write};
	  else
	    if(write & ~full)
	      write_pointer <= write_pointer + 1'b1;
     end // always @ (posedge clk or posedge reset)

`endif // !`ifdef ETH_FIFO_GENERIC
   
 `ifdef ETH_FIFO_XILINX

   generate
      if (CNT_WIDTH==4)
	begin
	   xilinx_dist_ram_16x32 fifo
	     ( .data_out(data_out), 
	       .we(write & ~full),
	       .data_in(data_in),
	       .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	       .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	       .wclk(clk)
	       );
	end // if (CNT_WIDTH==4)
      else if (CNT_WIDTH==6)
	begin

	   wire  [DATA_WIDTH-1:0]  data_out0;
	   wire [DATA_WIDTH-1:0]   data_out1;
	   wire [DATA_WIDTH-1:0]   data_out2;
	   wire [DATA_WIDTH-1:0]   data_out3;
	   
	   wire 		   we_ram0,we_ram1,we_ram2,we_ram3;

	   assign we_ram0 = (write_pointer[5:4]==2'b00);
	   assign we_ram1 = (write_pointer[5:4]==2'b01);
	   assign we_ram2 = (write_pointer[5:4]==2'b10);
	   assign we_ram3 = (write_pointer[5:4]==2'b11);
	   
	   assign data_out = (read_pointer[5:4]==2'b11) ? data_out3 :
			     (read_pointer[5:4]==2'b10) ? data_out2 :
			     (read_pointer[5:4]==2'b01) ? data_out1 : data_out0;
	   
	   xilinx_dist_ram_16x32 fifo0
	     ( .data_out(data_out0), 
	       .we(write & ~full & we_ram0),
	       .data_in(data_in),
	       .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	       .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	       .wclk(clk)
	       );
	   
	   xilinx_dist_ram_16x32 fifo1
	     ( .data_out(data_out1), 
	       .we(write & ~full & we_ram1),
	       .data_in(data_in),
	       .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	       .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	       .wclk(clk)
	       );

	   xilinx_dist_ram_16x32 fifo2
	     ( .data_out(data_out2), 
	       .we(write & ~full & we_ram2),
	       .data_in(data_in),
	       .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	       .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	       .wclk(clk)
	       );
	   
	   xilinx_dist_ram_16x32 fifo3
	     ( .data_out(data_out3), 
	       .we(write & ~full & we_ram3),
	       .data_in(data_in),
	       .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	       .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	       .wclk(clk)
	       );    
	end // if (CNT_WIDTH==6)
      
   endgenerate
 `endif //  `ifdef ETH_FIFO_XILINX

   `ifdef ETH_FIFO_RAMB18

   wire [8:0] 			   read_pointer_to_xilinx_ram;
   wire [8:0] 			   read_pointer_preincremented;
   assign read_pointer_preincremented = read_pointer + 1;
   
   assign read_pointer_to_xilinx_ram = (read) ? 
				       read_pointer_preincremented :
				       read_pointer;
   
   wire [8:0] 			   write_pointer_to_xilinx_ram;
   assign write_pointer_to_xilinx_ram = {{(9-CNT_WIDTH){1'b0}},write_pointer};
   
   // synthesis translate_off
   // Port A - Write
   // Port B - Rread
   BLK_MEM_GEN_V3_1 #(
		      .C_ADDRA_WIDTH(9),
		      .C_ADDRB_WIDTH(9),
		      .C_ALGORITHM(1),
		      .C_BYTE_SIZE(9),
		      .C_COMMON_CLK(0),
		      .C_DEFAULT_DATA("0"),
		      .C_DISABLE_WARN_BHV_COLL(0),
		      .C_DISABLE_WARN_BHV_RANGE(0),
		      .C_FAMILY("virtex5"),
		      .C_HAS_ENA(0),
		      .C_HAS_ENB(0),
		      .C_HAS_INJECTERR(0),
		      .C_HAS_MEM_OUTPUT_REGS_A(0),
		      .C_HAS_MEM_OUTPUT_REGS_B(0),
		      .C_HAS_MUX_OUTPUT_REGS_A(0),
		      .C_HAS_MUX_OUTPUT_REGS_B(0),
		      .C_HAS_REGCEA(0),
		      .C_HAS_REGCEB(0),
		      .C_HAS_RSTA(0),
		      .C_HAS_RSTB(0),
		      .C_INITA_VAL("0"),
		      .C_INITB_VAL("0"),
		      .C_INIT_FILE_NAME("no_coe_file_loaded"),
		      .C_LOAD_INIT_FILE(0),
		      .C_MEM_TYPE(1),
		      .C_MUX_PIPELINE_STAGES(0),
		      .C_PRIM_TYPE(1),
		      .C_READ_DEPTH_A(512),
		      .C_READ_DEPTH_B(512),
		      .C_READ_WIDTH_A(32),
		      .C_READ_WIDTH_B(32),
		      .C_RSTRAM_A(0),
		      .C_RSTRAM_B(0),
		      .C_RST_PRIORITY_A("CE"),
		      .C_RST_PRIORITY_B("CE"),
		      .C_RST_TYPE("SYNC"),
		      .C_SIM_COLLISION_CHECK("WARNING_ONLY"),
		      .C_USE_BYTE_WEA(0),
		      .C_USE_BYTE_WEB(0),
		      .C_USE_DEFAULT_DATA(0),
		      .C_USE_ECC(0),
		      .C_WEA_WIDTH(1),
		      .C_WEB_WIDTH(1),
		      .C_WRITE_DEPTH_A(512),
		      .C_WRITE_DEPTH_B(512),
		      .C_WRITE_MODE_A("WRITE_FIRST"),
		      .C_WRITE_MODE_B("READ_FIRST"),
		      .C_WRITE_WIDTH_A(32),
		      .C_WRITE_WIDTH_B(32),
		      .C_XDEVICEFAMILY("virtex5"))
   inst (
	 .CLKA(clk),
	 .WEA(write),
	 .ADDRA(write_pointer_to_xilinx_ram),
	 .DINA(data_in),
	 .CLKB(clk),
	 .ADDRB(read_pointer_to_xilinx_ram),
	 .DOUTB(data_out),
	 .RSTA(reset),
	 .ENA(),
	 .REGCEA(),
	 .DOUTA(),
	 .RSTB(),
	 .ENB(),
	 .REGCEB(),
	 .WEB(),
	 .DINB(),
	 .INJECTSBITERR(),
	 .INJECTDBITERR(),
	 .SBITERR(),
	 .DBITERR(),
	 .RDADDRECC()
	 );
   // synthesis translate_on
   `endif //  `ifdef ETH_FIFO_RAMB18
   
   
   
 `ifdef ETH_ALTERA_ALTSYNCRAM
   altera_dpram_16x32	altera_dpram_16x32_inst
   (
    .data             (data_in),
    .wren             (write & ~full),
    .wraddress        (clear ? {CNT_WIDTH-1{1'b0}} : write_pointer),
    .rdaddress        (clear ? {CNT_WIDTH-1{1'b0}} : read_pointer ),
    .clock            (clk),
    .q                (data_out)
    );  //exemplar attribute altera_dpram_16x32_inst NOOPT TRUE
 `endif //  `ifdef ETH_ALTERA_ALTSYNCRAM
   

endmodule // eth_fifo

