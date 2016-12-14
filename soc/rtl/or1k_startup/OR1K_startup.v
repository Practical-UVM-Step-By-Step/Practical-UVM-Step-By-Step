//////////////////////////////////////////////////////////////////////
////                                                              ////
////  OR1K_startup                                                ////
////                                                              ////
////  This file is part of the OR1K startup IP core project       ////
////  http://www.opencores.org/                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Michael Unneback (unneback@opencores.org)             ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors                                   ////
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
module OR1K_startup
  (
    input [6:2]       wb_adr_i,
    input 	      wb_stb_i,
    input 	      wb_cyc_i,
    output reg [31:0] wb_dat_o,
    output reg 	      wb_ack_o,
    input 	      wb_clk,
    input 	      wb_rst
   );
   always @ (posedge wb_clk or posedge wb_rst)
     if (wb_rst)
       wb_dat_o <= 32'h15000000;
     else
       case (wb_adr_i)
`ifdef USE_SDRAM
	  0 : wb_dat_o <= 32'h18000000;
	  1 : wb_dat_o <= 32'hA8200000;
	  2 : wb_dat_o <= 32'h1880B000;
	  3 : wb_dat_o <= 32'hA8A00520;
	  4 : wb_dat_o <= 32'hA8600001;
	  5 : wb_dat_o <= 32'h04000014;
	  6 : wb_dat_o <= 32'hD4041818;
	  7 : wb_dat_o <= 32'h04000012;
	  8 : wb_dat_o <= 32'hD4040000;
	  9 : wb_dat_o <= 32'hE0431804;
	 10 : wb_dat_o <= 32'h0400000F;
	 11 : wb_dat_o <= 32'h9C210008;
	 12 : wb_dat_o <= 32'h0400000D;
	 13 : wb_dat_o <= 32'hE1031804;
	 14 : wb_dat_o <= 32'hE4080000;
	 15 : wb_dat_o <= 32'h0FFFFFFB;
	 16 : wb_dat_o <= 32'hD4081800;
	 17 : wb_dat_o <= 32'h04000008;
	 18 : wb_dat_o <= 32'h9C210004;
	 19 : wb_dat_o <= 32'hD4011800;
	 20 : wb_dat_o <= 32'hE4011000;
	 21 : wb_dat_o <= 32'h0FFFFFFC;
	 22 : wb_dat_o <= 32'hA8C00100;
	 23 : wb_dat_o <= 32'h44003000;
	 24 : wb_dat_o <= 32'hD4040018;
	 25 : wb_dat_o <= 32'hD4042810;
	 26 : wb_dat_o <= 32'h84640010;
	 27 : wb_dat_o <= 32'hBC030520;
	 28 : wb_dat_o <= 32'h13FFFFFE;
	 29 : wb_dat_o <= 32'h15000000;
	 30 : wb_dat_o <= 32'h44004800;
	 31 : wb_dat_o <= 32'h84640000;
`else // !`ifdef USE_SDRAM
	 // Zero r0 and jump to 0x00000100
	  0 : wb_dat_o <= 32'h18000000;
	  1 : wb_dat_o <= 32'hA8200000;
	  2 : wb_dat_o <= 32'hA8C00100;
	  3 : wb_dat_o <= 32'h44003000;
	  4 : wb_dat_o <= 32'h15000000;
`endif // !`ifdef USE_SDRAM
       endcase
   always @ (posedge wb_clk or posedge wb_rst)
     if (wb_rst)
       wb_ack_o <= 1'b0;
     else
       wb_ack_o <= wb_stb_i & wb_cyc_i & !wb_ack_o;
endmodule 
