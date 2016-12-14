//////////////////////////////////////////////////////////////////////
////                                                              ////
////  SMII                                                        ////
////                                                              ////
////  Description                                                 ////
////  Low pin count serial MII ethernet interface                 ////
////                                                              ////
////  To Do:                                                      ////
////   -                                                          ////
////                                                              ////
////  Author(s):                                                  ////
////      - Michael Unneback, unneback@opencores.org              ////
////        ORSoC AB          michael.unneback@orsoc.se           ////
////      - Julius Baxter,    julius@orsoc.se                     ////
////        ORSoC AB                                              ////
////                                                              ////
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
`include "synthesis-defines.v"
`include "orpsoc-defines.v" // To determine synthesis technology.
module smii_if
  (
   // SMII
    output     tx,
    input      rx,
   // MII
   // TX
    input [3:0] mtxd,
    input 	mtxen,
    input 	mtxerr,
    output 	mtx_clk,
   // RX
    output [3:0] mrxd,
    output	 mrxdv,
    output 	 mrxerr,
    output  	 mrx_clk,
    output 	 mcoll,
    output reg	 mcrs,
    output reg	 speed,
    output reg	 duplex,
    output reg	 link,
   // internal
    input [10:1] tx_smii_state,
    input [10:1] next_tx_smii_state,
    input [10:1] rx_smii_state,   
   // clock and reset
    input 	 eth_clk,
    input 	 eth_rst
   );

   reg [7:0] 	 tx_data_reg;
   reg 		 tx_data_reg_valid;
   reg 		 a0;
   reg 		 state_data;

   reg [3:0] 	 rx_tmp;

   reg [3:0] 	 rxd_nib;
   reg 		 rxdv, rxerr;
   
   reg 		 jabber;

   reg [10:1] 	 tx_cnt;
   reg [10:1] 	 rx_cnt;
   
   
   /////////////////////////////////////////////////
   // Transmit

   // Tx segment counter when !speed
   always @ (posedge eth_clk or posedge eth_rst)
     if (eth_rst)
       tx_cnt <= 10'b00_0000_0001;
     else if (tx_smii_state[10])
       tx_cnt <= {tx_cnt[9:1],tx_cnt[10]};
   
   // MII signals registered in eth_clk domain
   reg 		 txen_r, txerr_r;   
   // TX clock generation to the MAC
   reg 		 mtx_clk_gen, mtx_clk_gen_reg,  
		 mtx_clk_gen_reg2, mtx_clk_gen_reg3, 
		 mtx_clk_gen_reg4, mtx_clk_gen_reg5,
		 mtx_clk_gen_reg6, mtx_clk_gen_reg7,
		 tx_first_clk_gen,
		 tx_first_clk_reg, tx_first_clk_reg2,
		 tx_first_clk_reg3, tx_first_clk_reg4, 
		 tx_first_clk_reg5, tx_first_clk_reg6,
		 tx_first_clk_reg7;

   // Generate clocks when state is 2, and 7 when transmitting
   // We then sample the MII txen signal, to see if we have a valid data frame
   // coming up. We can do this 2 or 3 clocks after the MII tx clk. If we do it
   // 2 then we allow 2 cycles for our mtxen_r signal to propegate, doubling the
   // period contstraint for the path from mtxen_r to the stuff it controls in
   // eth_clk domain. If we allow 3 from the eth MAC, then all stuff on the 
   // eth_clk side of mtxen_r must meet the 125MHz timing.
   //
   // Once the data is sampled at the right times (plenty after they come from
   // the eth MAC, should be no issues there), then it all propegates through
   // relatively various levels of registering, configured so that the signals
   // appear in the tx_bits[] vector at the right time to be registered once
   // more before before having its bits AND-OR selected based on the smii state
   // The final SMII TX bit is generated from a sync counter that is one ahead
   // of the one we output.
   
   wire 	 tx_first_clk, tx_second_clk;
   assign tx_first_clk = (tx_smii_state[2] & 
			  ( speed | ( !speed & tx_cnt[10]) ) );
   assign tx_second_clk = (tx_smii_state[7] & 
			   txen_r & ( speed | ( !speed & tx_cnt[1]) ) );
   
   always @(posedge eth_clk)
     if (eth_rst)
       mtx_clk_gen <= 1'b0;
     else if (mtx_clk_gen)
       mtx_clk_gen <= 1'b0;
   // Clock high
     else if (tx_first_clk | tx_second_clk)
       mtx_clk_gen <= 1'b1;
   
   always @(posedge eth_clk)
     mtx_clk_gen_reg <= mtx_clk_gen;
   
   always @(posedge eth_clk)
     mtx_clk_gen_reg2 <= mtx_clk_gen_reg;
   
   always @(posedge eth_clk)
     mtx_clk_gen_reg3 <= mtx_clk_gen_reg2;
   
   always @(posedge eth_clk)
     mtx_clk_gen_reg4 <= mtx_clk_gen_reg3;

   always @(posedge eth_clk)
     mtx_clk_gen_reg5 <= mtx_clk_gen_reg4;

   always @(posedge eth_clk)
     mtx_clk_gen_reg6 <= mtx_clk_gen_reg5;

   always @(posedge eth_clk)
     mtx_clk_gen_reg7 <= mtx_clk_gen_reg6;

   always @(posedge eth_clk)
     tx_first_clk_gen <= tx_first_clk;
   
   always @(posedge eth_clk)
     tx_first_clk_reg <= tx_first_clk_gen;

   always @(posedge eth_clk)
     tx_first_clk_reg2 <= tx_first_clk_reg;

   always @(posedge eth_clk)
     tx_first_clk_reg3 <= tx_first_clk_reg2;

   always @(posedge eth_clk)
     tx_first_clk_reg4 <= tx_first_clk_reg3;
   
   always @(posedge eth_clk)
     tx_first_clk_reg5 <= tx_first_clk_reg4;

   always @(posedge eth_clk)
     tx_first_clk_reg6 <= tx_first_clk_reg5;
   
   always @(posedge eth_clk)
     tx_first_clk_reg7 <= tx_first_clk_reg6;
   
   
   // Register MII TX enable
   always @(posedge eth_clk)
     if (eth_rst)
       txen_r <= 1'b0;
     else if (tx_first_clk_reg3)
       txen_r <= mtxen;

   // Register MII TX error
   always @(posedge eth_clk)
     if (eth_rst)
       txerr_r <= 1'b0;
     else if (tx_first_clk_reg3)
       txerr_r <= mtxerr;

   // Register indicating if we're going to sample the second nibble of data
   reg 	tx_nib_second;
   always @(posedge eth_clk)
     if (eth_rst)
       tx_nib_second <= 0;
     else if (mtx_clk_gen_reg4)
       begin
	  if (!txen_r)
	    tx_nib_second <= 0;
	  else
	    tx_nib_second <= ~tx_nib_second;
       end
   // Byte register, appropriately storing nibbles as we recieve them from MAC
   reg [7:0] mtxd_r;
   always @(posedge eth_clk)
     if (txen_r & mtx_clk_gen_reg4 & !tx_nib_second)
       mtxd_r[3:0] <= mtxd;
     else if (txen_r & mtx_clk_gen_reg4 & tx_nib_second)
       mtxd_r[7:4] <= mtxd;
   
   // Sample our registered version of txen_r when we generate our
   // "first" of the 2 TX clocks per frame.
   reg 	     tx_state_or_data; // 0 = state, 1 = data
   always @ (posedge eth_clk)
     if (eth_rst)
       tx_state_or_data <= 0;   
     else if (tx_first_clk_reg4)
       tx_state_or_data <= txen_r;

   reg [10:1] tx_bits, tx_bits_reg, tx_bits_reg2;
   always @(posedge eth_clk)
     begin
	tx_bits_reg <= tx_bits;
	tx_bits[1] <= txerr_r;
	tx_bits[2] <= tx_state_or_data;
	tx_bits[3] <= (tx_state_or_data) ? mtxd_r[0] : txerr_r;
	tx_bits[4] <= (tx_state_or_data) ? mtxd_r[1] : speed;
	tx_bits[5] <= (tx_state_or_data) ? mtxd_r[2] : duplex;
	tx_bits[6] <= (tx_state_or_data) ? mtxd_r[3] : link;
	tx_bits[7] <= (tx_state_or_data) ? mtxd_r[4] : 0;
	tx_bits[8] <= (tx_state_or_data) ? mtxd_r[5] : 1;
	tx_bits[9] <= (tx_state_or_data) ? mtxd_r[6] : 1;
	tx_bits[10] <= (tx_state_or_data) ? mtxd_r[7] : 1;
     end

   // Generate tx output bit one clock infront, because we register
   // in the IOB too.
   reg tx_bit;
   always @(posedge eth_clk)
     tx_bit <= |(tx_bits_reg & next_tx_smii_state);
     
     assign tx = tx_bit;

`ifdef ACTEL

    wire GND;
    
    GND GND_1_net(.Y(GND));
    CLKDLY Inst1(.CLK(mtx_clk_gen), .GL(mtx_clk), .DLYGL0(GND), .DLYGL1(GND), 
        .DLYGL2(GND), .DLYGL3(GND), .DLYGL4(GND)) /* synthesis black_box */;
/*
   gbuf mtx_clk_bufg
     (
      .CLK(mtx_clk_gen),
      .GL(mtx_clk)
      );
*/
`else
   assign mtx_clk = mtx_clk_gen;
`endif

   /////////////////////////////////////////////////
   // Receive

`ifndef SYNTHESIS   
   reg [79:0] rx_statename;
   always @* begin
      case (1)
	rx_smii_state[1]   :
          rx_statename = "CRS";
	rx_smii_state[2] :
          rx_statename = "RX_DV";
	rx_smii_state[3]:
          rx_statename = "RXD0/RXERR";
	rx_smii_state[4]:
          rx_statename = "RXD1/Fast";
	rx_smii_state[5]:
          rx_statename = "RXD2/Dupl";
	rx_smii_state[6]:
          rx_statename = "RXD3/Link";
	rx_smii_state[7]:
          rx_statename = "RXD4/Jabb";
	rx_smii_state[8]:
          rx_statename = "RXD5/UNV";
	rx_smii_state[9]:
          rx_statename = "RXD6/FCD";
	rx_smii_state[10] :
          rx_statename = "RXD7/AS1";
	default:
          rx_statename = "XXXXXXX";
      endcase // case (1)
   end // always @ *
`endif
   
   reg 	      rxdv_thisframe;
   wire       rxdv_lastframe;
   reg       rxdv_lastframe_r;
   reg [9:0]  rxd_thisframe;
   reg [9:0]  rxd_lastframe;

   // Logic to detect change in ethernet speed
   reg 	      speed_r;
   always @(posedge eth_clk)
     speed_r <= speed;
   
   wire       speed_edge;
   assign speed_edge = speed_r != speed;
   
   
   always @ (posedge eth_clk or posedge eth_rst)
     if (eth_rst)
       rx_cnt <= 10'd1;
   // Data coming in, or we've changed from fast to slow ethernet
     else if ((!rxdv_lastframe & rx_smii_state[8] & rxdv_thisframe) | speed_edge)
       rx_cnt[10] <= ~speed; // Will be high if not in 100MBit mode
     else if (rx_smii_state[10]) // wrap
       if (rx_cnt[10])
	 rx_cnt[10:1] <= {9'b000000000, ~speed}; // Clears bit when fasteth
       else
	 rx_cnt <= {rx_cnt[9:1],1'b0};
   
   always @(posedge eth_clk)
     if (rx_smii_state[2])
       rxdv_thisframe <= rx;

   always @(posedge eth_clk)
     if (rx_smii_state[1])
       mcrs <= rx;
   
   always @(posedge eth_clk) // shift register sampling incoming data
     rxd_thisframe <= {rx, rxd_thisframe[9:1]};
   
   always @(posedge eth_clk)
     if (rx_smii_state[1])
	  rxd_lastframe <= rxd_thisframe;

   assign rxdv_lastframe = rxd_lastframe[1];
   
   // Must remember with rxd_thisframe, data has been registered, so state 
   // counter is 1 infront of what we have in it
   
   always @(posedge eth_clk)
     if (eth_rst)
       begin
	  {rxdv, rxerr, speed, duplex, link, jabber} <= 6'b001110;
       end
     else
       begin
	  if (rx_smii_state[10]) // Look at sampled shift reg
	    begin
	       if ((!rxdv_lastframe)) // !RX DV from last frame
		 begin
		    rxerr <= rxd_lastframe[2];
		    speed <= rxd_lastframe[3];
		    duplex <= rxd_lastframe[4];
		    link <= rxd_lastframe[5];
		    jabber <= rxd_lastframe[6];
		    // rxd_thisframe[7] should be 1 if
		 end
	    end
       end // else: !if(eth_rst)

   // Latch the nibbles at the appropriate moments
   always @(posedge eth_clk)
     if (rx_smii_state[2])
       rxd_nib <= rxd_lastframe[5:2];
     else if (rx_smii_state[8])
       rxd_nib <= rxd_lastframe[9:6];

   // Nibble write enables 
   reg rx_we_nib0, rx_we_nib1;
   
   always @(posedge eth_clk)
     if (eth_rst)
       rx_we_nib0 <= 0;
     else if (rx_smii_state[3] & rxdv_lastframe & 
	      !(!rxdv_thisframe & rx))
       // Check in state 3, if DV was high for buffered frame (lastframe), and
       // if the incoming frame doesn't negate it with error being signaled
       rx_we_nib0 <= 1;
     else 
       rx_we_nib0 <= 0;

   always @(posedge eth_clk)
     if (eth_rst)
       rx_we_nib1 <= 0;
     else if (rx_smii_state[8] & !(!rxdv_thisframe & (rxd_thisframe[5] | !rx))
	      & rxdv_lastframe)
       // Check in state 8, if DV was high last frame, and this frame isn't a
       // status frame indicating either error or not upper nibble valid, in
       // which case we do not generate a WE to the FIFO
       rx_we_nib1 <= 1;
     else
       rx_we_nib1 <= 0;
   
   // Pipelining of clocks to MAC, this should run at 125MHz
   reg nib_rx_clock;
   always @(posedge eth_clk)
     nib_rx_clock <= ((rx_smii_state[4] & rx_we_nib0)|(rx_smii_state[9] & rx_we_nib1));

   // Enable for mrxclk inbetween frame receive
   reg inbetween_rx_clock;
   always @(posedge eth_clk)
     inbetween_rx_clock <= rx_smii_state[4];//(!rxdv_thisframe & !rxdv_lastframe);
       
   // Enable to clock the segment in the 10MBit mode, change rx_cnt[x] to alter 
   // which of the 10 the segments we use
   reg thissegment_rx_clock; 
   always @(posedge eth_clk)
     thissegment_rx_clock <= speed | (rx_cnt[6] & !speed);
   
   reg mrx_clk_gen;
   // Receive MII clock generation (very similar to Receive FIFO WE generation)
   // This ends up being only about 20MHz when clocking in data
   always @(posedge eth_clk) 
     if (eth_rst)
       mrx_clk_gen <= 0;
     else if (mrx_clk_gen)
       mrx_clk_gen <= 0;
     else if ((nib_rx_clock | inbetween_rx_clock) & thissegment_rx_clock )
       mrx_clk_gen <= 1;

 `ifdef ACTEL

    
    CLKDLY Inst2(.CLK(mrx_clk_gen), .GL(mrx_clk), .DLYGL0(GND), .DLYGL1(GND), 
        .DLYGL2(GND), .DLYGL3(GND), .DLYGL4(GND)) /* synthesis black_box */;

/*
   gbuf mrx_clk_bufg
     (
      .CLK(mrx_clk_gen),
      .GL(mrx_clk)
      );
*/
 `else
   assign mrx_clk = mrx_clk_gen;  
 `endif
   
   assign mrxd = rxd_nib;
   assign mrxdv = rxdv_lastframe;
   assign mrxerr = rxerr;
   
   assign mcoll =  mcrs & mtxen & !duplex;
   
endmodule // smii_if
