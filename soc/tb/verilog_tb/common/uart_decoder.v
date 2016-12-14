//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ORPSoC Testbench UART Decoder                               ////
////                                                              ////
////  Description                                                 ////
////  ORPSoC Testbench UART output decoder                        ////
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

// Decodes UART signals sent over the line defined by UART_TX_LINE

// `include this file in the testbench and define UART_TX_LINE
// Uses define CLOCK_RATE as the frequency of the clock in Hz

// Receieves and decodes 8-bit,  1 stop bit, no parity UART signals.

// Requires definition of:
// CLK_RATE - frequency of system clock in Hz
// CLK_PERIOD - period of clock frequency in ns
// UART_BAUDRATE - otherwise defaults to 115200
// UART_TX_LINE - name of the UART output signal (normally a wire)

// if it's not already defined, uses UART_BAUDRATE as baud to receive
// bytes at
`ifndef UART_BAUDRATE
 `define UART_BAUDRATE 115200
`endif

`ifndef CLOCK_RATE
initial
  begin
     $display("* WARNING: uart_decoder included but CLOCK_RATE not defined.");
  end
`else
 `ifdef UART_TX_LINE
   parameter UART_TX_WAIT = (`CLOCK_RATE / `UART_BAUDRATE) * `CLOCK_PERIOD;
   
   // Something to trigger the task
   always @(posedge clk)
     uart_decoder;
   
   task uart_decoder;
      reg [7:0] tx_byte;
      begin
	 
	 while (`UART_TX_LINE !== 1'b1)
	   @(`UART_TX_LINE); 
	 // Wait for start bit
	 //while (`UART_TX_LINE == 1'b1)
	 while (`UART_TX_LINE !== 1'b0)
           @(`UART_TX_LINE);
	 #(UART_TX_WAIT+(UART_TX_WAIT/2));
	 tx_byte[0] = `UART_TX_LINE;
	 #UART_TX_WAIT;
	 tx_byte[1] = `UART_TX_LINE;
	 #UART_TX_WAIT;
	 tx_byte[2] = `UART_TX_LINE;
	 #UART_TX_WAIT;
	 tx_byte[3] = `UART_TX_LINE;
	 #UART_TX_WAIT;
	 tx_byte[4] = `UART_TX_LINE;
	 #UART_TX_WAIT;
	 tx_byte[5] = `UART_TX_LINE;
	 #UART_TX_WAIT;
	 tx_byte[6] = `UART_TX_LINE;
	 #UART_TX_WAIT;
	 tx_byte[7] = `UART_TX_LINE;
	 #UART_TX_WAIT;
	 //Check for stop bit
	 //if (`UART_TX_LINE == 1'b0)
	 if (`UART_TX_LINE !== 1'b1)
	   begin
              //$display("* WARNING: user stop bit not received when expected at time %d__", $time);
	      // Wait for return to idle
	      //while (`UART_TX_LINE == 1'b0)
	      while (`UART_TX_LINE !== 1'b1)
		@(`UART_TX_LINE);
	      //$display("* USER UART returned to idle at time %d",$time);
	   end
	 // display the char
	 $write("%c", tx_byte);
      end
   endtask // user_uart_read_byte
 `else // !`ifdef UART_TX_LINE
   // If this file was included but not setup properly
   initial 
     begin
	$display("* WARNING: uart_decoder included but UART_TX_LINE not defined.");
     end
 `endif // !`ifdef UART_TX_LINE
`endif // !`ifndef CLOCK_RATE
