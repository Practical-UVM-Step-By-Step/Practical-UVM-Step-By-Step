//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Generic simple PLL model                                    ////
////                                                              ////
////  Description                                                 ////
////  Basic PLL model, with clkx2, clkdiv, locked, outputs        ////
////                                                              ////
////  To Do:                                                      ////
////  A clkmult output                                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - Julius Baxter     julius@opencores.org                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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
`timescale  1 ps / 1 ps
//Generic model of a PLL
//All outputs are synchronous with clk_in
//Divide for clkdiv output set by divider parameter
//Locked signal goes high 8 clocks after reset
//Note the timescale ^^^^^ - cannot be changed!
module generic_pll(/*AUTOARG*/
   // Outputs
   clk1x, clk2x, clkdiv, locked,
   // Inputs
   clk_in, rst_in
   );
`ifndef VERILATOR
   input clk_in;
   input rst_in;   
   output reg clk1x;
   output reg clk2x;
   output reg clkdiv;
   output reg locked;

   parameter  DIVIDER = 8;
   
   

   // Locked shiftreg will hold locked low until 8 cycles after reset
   // Clocks should start outputting a few clocks before hand
   reg [7:0] 	  locked_shiftreg;
   always @(posedge clk_in or negedge rst_in) 
     begin
	if (rst_in) locked_shiftreg <= 8'h0;
	else locked_shiftreg <= {1'b1, locked_shiftreg[7:1]};
     end

   always @(posedge clk_in or posedge rst_in)
     begin
	if (rst_in) locked <= 1'b0;
	else
	  locked <= locked_shiftreg[0];

     end
   
   integer   clk_in_edge; //variable to store the times at which we get our edges
   integer   clk_in_period [3:0]; // array to store 4 calculated periods
   integer   period; //period value used to generate output clocks
   
   // determine clock period
   always @(posedge clk_in or posedge rst_in)
     begin
	if (rst_in == 1) begin
	   clk_in_period[0] <= 0;
	   clk_in_period[1] <= 0;
	   clk_in_period[2] <= 0;
	   clk_in_period[3] <= 0;
	   clk_in_edge <= 0;
	end
	else begin
	   clk_in_edge <= $time;
	   clk_in_period[3] <= clk_in_period[2];
	   clk_in_period[2] <= clk_in_period[1];
	   clk_in_period[1] <= clk_in_period[0];
	   if (clk_in_edge != 0)
	     clk_in_period[0] <= $time - clk_in_edge;
	end // else: !if(rst_in == 1)
     end // always @ (posedge clk_in or posedge rst_in)

   // Calculate average of our clk_in period
   always @(clk_in_period[3] or clk_in_period[2] or 
	    clk_in_period[1] or clk_in_period[0]) begin
      period <= ((clk_in_period[3] + clk_in_period[2] +
		  clk_in_period[1] + clk_in_period[0])/4);
   end

   // generate clk1x out
   always @(posedge clk_in or posedge rst_in)
     if (rst_in)
       clk1x <= 0;
     else begin
	if (clk_in == 1 && locked_shiftreg[4]) begin
	   clk1x <= 1;
	   #(period / 2) clk1x <= 0;
	end
	else
	  clk1x <= 0;
     end
 // generate clk2x out
   always @(posedge clk_in or posedge rst_in)
     if (rst_in)
       clk2x <= 0;
     else begin
	if (clk_in == 1 && locked_shiftreg[4]) begin
	   clk2x <= 1;
	   #(period / 4) clk2x <= 0;
	   #(period / 4) clk2x <= 1;
	   #(period / 4) clk2x <= 0;	   
	end
	else
	  clk2x <= 0;
     end

   //generate clkdiv out
   always @(posedge clk_in or posedge rst_in)
     if (rst_in) 
	clkdiv <= 1'b0;
     else begin
	if (clk_in == 1 && locked_shiftreg[4]) begin
	   clkdiv <= 1'b1;
	   #(DIVIDER*period/2) clkdiv <= 1'b0;
	   #(DIVIDER*period/2);	   
	end
     end	  
`else // !`ifndef VERILATOR
   input clk_in;
   input rst_in;   
   output clk1x;
   output clk2x;
   output clkdiv;
   output reg locked;

   parameter  DIVIDER = 8;

   always @(posedge clk_in) locked <= ~rst_in;
   assign clk1x = clk_in;
   assign clk2x = 0;
   assign clkdiv= 0;
`endif // !`ifndef VERILATOR   
   
endmodule // generic_pll
