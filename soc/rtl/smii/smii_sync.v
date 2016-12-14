/*
 * SMII sync generation module
 * 
 * Generate sync to PHY, and for internal statemachines
 * 
 * Julius Baxter, julius.baxter@orsoc.se
 * 
 */
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009, 2010 Authors and OPENCORES.ORG           ////
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
module smii_sync
  (
   // SMII sync
    output            sync,
   // internal
    output [10:1]     tx_state,
    output [10:1]     next_tx_state,
    output [10:1]     rx_state,

   // clock amd reset
    input 	      clk,
    input 	      rst
   );
   reg [10:1] next_tx_state_r;
   reg [10:1] tx_state_r;
   
   reg [10:1] 	      rx_state_int;
   reg [10:1] 	      rx_state_int2;
   reg [10:1] 	      rx_state_int3;
      
   // sync shall go high every 10:th cycle
   always @ (posedge clk)
     if (rst)
       begin
	  next_tx_state_r <= 10'b0000000010;
	  tx_state_r <= 0;
       end
     else
       begin
	  tx_state_r <= next_tx_state_r;	  
	  next_tx_state_r <= {next_tx_state_r[9:1],next_tx_state_r[10]};
       end
   
   assign tx_state = tx_state_r;
   assign next_tx_state = next_tx_state_r;   
   assign sync = tx_state_r[1];

   always @(posedge clk)
     begin
	rx_state_int <= {tx_state_r[9:1],tx_state_r[10]};
	rx_state_int2 <= rx_state_int;
	rx_state_int3 <= rx_state_int2;
     end
   // rx_state counter is 2 clocks behind tx state due to flops in and out of
   // FPGA
   assign rx_state = rx_state_int3;
   
endmodule // smii_sync
