/*
 * SMII <-> MII interface
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

module smii
  (
   eth_clk,
   eth_rst,
   eth_sync_pad_o,
   eth_tx_pad_o,
   eth_rx_pad_i,
   mtxd,
   mtxen,
   mtxerr,
   mtx_clk,
   mrxd,
   mrxdv,
   mrxerr,
   mrx_clk,
   mcoll,
   mcrs,
   speed,
   duplex,
   link
   );
   
   input eth_clk;
   input eth_rst; // active high reset synchronous to ethernet clock

   // SMII
   output reg eth_sync_pad_o /*synthesis syn_useioff=1 syn_allow_retiming=0 syn_noprune=1*/;
   output reg eth_tx_pad_o /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   input      eth_rx_pad_i;
   
   
   // MII
   // TX
   input [3:0] mtxd;
   input       mtxen;
   input       mtxerr;
   output      mtx_clk;
   // RX
   output [3:0] mrxd;
   output 	mrxdv;
   output 	mrxerr;
   output 	mrx_clk;
   output 	mcoll;
   output 	mcrs;
   output 	speed;
   output 	duplex;
   output 	link;


   // Wires from pads
   wire 	smii_tx;
   reg 		smii_rx /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   

   // Sync generation
   wire [10:1] 	tx_smii_state;
   wire [10:1] 	next_tx_smii_state;
   wire [10:1] 	rx_smii_state;
   wire 	smii_sync;
   smii_sync smii_sync0
     (
      .sync(smii_sync),
      .tx_state(tx_smii_state),
      .next_tx_state(next_tx_smii_state),
      .rx_state(rx_smii_state),
      .clk(eth_clk),
      .rst(eth_rst)
      );

   // IOB regs for SMII
   always @(posedge eth_clk) eth_sync_pad_o <= smii_sync;
   always @(posedge eth_clk) eth_tx_pad_o <= smii_tx;
   always @(posedge eth_clk) smii_rx <= eth_rx_pad_i;
   
   
   smii_if smii_if0
     (
      // SMII signals
      .tx				(smii_tx),
      .rx				(smii_rx),
      .tx_smii_state			(tx_smii_state[10:1]),
      .next_tx_smii_state               (next_tx_smii_state[10:1]),
      .rx_smii_state			(rx_smii_state[10:1]),
      // MAC MII receive
      .mrxd				(mrxd[3:0]),
      .mrxdv				(mrxdv),
      .mrxerr				(mrxerr),
      .mrx_clk				(mrx_clk),
      // MAC MII transmit
      .mtx_clk				(mtx_clk),
      .mtxd				(mtxd[3:0]),
      .mtxen				(mtxen),
      .mtxerr				(mtxerr),
      // Collision
      .mcoll				(mcoll),
      // Carrier sense
      .mcrs				(mcrs),
      // Speedy ethernet
      .speed				(speed),
      // Duplex indicator
      .duplex				(duplex),
      // Linke indicator
      .link				(link),
      // Clocks, resets
      .eth_clk				(eth_clk),
      .eth_rst				(eth_rst)
      );   
   
endmodule // smii
