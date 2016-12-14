//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ORPSoC Testbench UART Stimulus                              ////
////                                                              ////
////  Description                                                 ////
////  ORPSoC Testbench UART input generator                       ////
////                                                              ////
////  To Do:                                                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////      - jb, jb@orsoc.se                                       ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2010 Authors and OPENCORES.ORG                 ////
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

// Encodes 8-bit, 1 stop bit, no parity UART signals at 115200 buad
`timescale 1ns/1ns
module uart_stim(clk, uart_rx);

   input clk;   
   output reg uart_rx;


   
   // Default baud of 115200, period (ns)
   parameter uart_baudrate_period_ns = 8680;

   // Uart Stim file - we include it
   parameter stim_file = "uart0_stim.v";
   
   // Something to trigger the task
   reg [7:0]  next_byte;
   parameter len = 11; // Number of chars in string
   reg [(len*8)-1:0] uart_string;
   integer 	i;

   /*
   initial
     begin
	uart_rx = 1;	
	uart_string = "dhry 100\n!\n";
	
	#12_000_000;       	
	for(i=0;i<len;i=i+1)
	  begin
	     uart_tx_byte(uart_string[(len*8)-1:(len*8)-8]);
	     #20_000_000;
	     // Shift along string
	     uart_string = {uart_string[(len*8)-9:0],8'h00};
	  end
     end
    */
   // Task to drive UART RX line (transmit a char) - 1 stop bit, no parity
   task uart_tx_byte;
    input [7:0] tx_byte;
      begin
	 // Start bit
	 uart_rx = 1'b0;
	 #uart_baudrate_period_ns;
	 uart_rx = tx_byte[0];
	 #uart_baudrate_period_ns;
	 uart_rx = tx_byte[1];
	 #uart_baudrate_period_ns;
	 uart_rx = tx_byte[2];
	 #uart_baudrate_period_ns;
	 uart_rx = tx_byte[3];
	 #uart_baudrate_period_ns;
	 uart_rx = tx_byte[4];
	 #uart_baudrate_period_ns;
	 uart_rx = tx_byte[5];
	 #uart_baudrate_period_ns;
	 uart_rx = tx_byte[6];
	 #uart_baudrate_period_ns;
	 uart_rx = tx_byte[7];
	 #uart_baudrate_period_ns;
	 // Stop bit
	 uart_rx = 1'b1;
	 #uart_baudrate_period_ns;
      end
   endtask // uart_tx_byte

endmodule // uart_decoder
