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
module smii_txrx
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
    output reg [3:0] mrxd,
    output reg	 mrxdv,
    output reg	 mrxerr,
    output  	 mrx_clk,
    output 	 mcoll,
    output reg	 mcrs,
`ifdef SMII_SPEED
    output reg	 speed,
`endif
`ifdef SMII_DUPLEX
    output reg	 duplex,
`endif
`ifdef SMII_LINK
    output reg	 link,
`endif
   // internal
    input [10:1] state,
   // clock and reset
    input 	 clk,
    input 	 rst
   );

   reg [7:0]		 tx_data_reg;
   reg 			 tx_data_reg_valid;
   reg 			 a0;
   reg 			 state_data;

   reg [3:0] 	 rx_tmp;
   
`ifndef SMII_SPEED
   reg 		 speed;
`endif   
`ifndef SMII_DUPLEX
   reg 		 duplex;
`endif
`ifndef SMII_LINK
   reg 		 link;
`endif
   reg 		 jabber;

   reg 		 mtx_clk_tmp, mrx_clk_tmp;

   reg [3:0] 	 tx_cnt;
   reg [3:0] 	 rx_cnt;
   
   /////////////////////////////////////////////////
   // Speed

   always @ (posedge clk or posedge rst)
     if (rst)
       tx_cnt <= 4'd0;
     else
       if (speed)
	 tx_cnt <= 4'd0;
       else if (state[10])
	 if (tx_cnt == 4'd9)
	   tx_cnt <= 4'd0;
	 else
	   tx_cnt <= tx_cnt + 4'd1;
   
   /////////////////////////////////////////////////
   // Transmit

   /* Timing scheme:
    If we're fast ethernet, we clock every segment. Otherwise it's every 10 segments for 10mbit ethernet.
    For 10mbit ethernet it doesn't really matter where we clock it - we have plenty of time to put out the right bits.
    For fast ethernet, we have to do it at the right points.
    so the MII TX nibble clocks come on the 8th state of the segment prior to the one we will output, then on the 3rd clock of the segment we're currently outputting.*/
`define MII_TXNIB1_CLK 8
`define MII_TXNIB2_CLK 3

   // tx_data_reg_valid here helps us make sure we always sample data beginning with the nib1 clock
`define MII_TX_CLK_ASSERT ( \
  ((state[`MII_TXNIB1_CLK] | (state[`MII_TXNIB2_CLK] & tx_data_reg_valid))  \
			   & \
			   ( \
			     ((tx_cnt == 4'd0) & speed) | \
			     ((tx_cnt == 4'd9) & !(speed) & state[`MII_TXNIB1_CLK]) | \
      			     ((tx_cnt == 4'd0) & !(speed) & tx_data_reg_valid & state[`MII_TXNIB2_CLK]) \
			      )))

`define MII_TX_CLOCKED ( \
  ((state[`MII_TXNIB1_CLK+1] | (state[`MII_TXNIB2_CLK+1] & tx_data_reg_valid))  \
			   & \
			   ( \
			     ((tx_cnt == 4'd0) & speed) | \
			     ((tx_cnt == 4'd9) & !(speed) & state[`MII_TXNIB1_CLK + 1]) | \
      			     ((tx_cnt == 4'd0) & !(speed) & tx_data_reg_valid & state[`MII_TXNIB2_CLK + 1]) \
			      )))
  
     always @ (posedge clk or posedge rst)
     if (rst)
       mtx_clk_tmp <= 1'b0;
     else
       if (`MII_TX_CLK_ASSERT)
	 mtx_clk_tmp <= 1'b1;
       else //if (state[`MII_TXNIB1_CLK + 1] | state[`MII_TXNIB2_CLK + 1])
	 mtx_clk_tmp <= 1'b0;

`ifdef ACTEL
   gbuf bufg1
     (
      .CLK(mtx_clk_tmp),
      .GL(mtx_clk)
      );
`else
   assign  mtx_clk = mtx_clk_tmp;
`endif

   // storage of data from MII
   always @ (posedge clk or posedge rst)
     if (rst)
       begin
	  tx_data_reg <= 8'd0;
	  tx_data_reg_valid <= 1'b0;
	  a0 <= 1'b0;
       end
     else
       if (`MII_TX_CLOCKED)
	 begin
	    /* Toggale a0 when MII TX_EN goes high */
	    if (!mtxen)
	      a0 <= 1'b0;
	    else
	      a0 <= ~a0;

	    tx_data_reg_valid <= mtxen;
	    
	    /* Sample the nibble */
	    if (mtxen & !a0)
	      tx_data_reg[3:0] <= mtxd;	    
	    else if (mtxen & a0)
	      tx_data_reg[7:4] <= mtxd;	    
	    
	 end // if ((state[4] | state[9]) & (tx_cnt == 4'd0))
   

   /* Determine if we output a data byte or the inter-frame sequence 
    with status information */
   always @ (posedge clk or posedge rst)
     if (rst)
       state_data <= 1'b0;
     else
       if (state[1] & (tx_cnt == 4'd0))
	 state_data <= tx_data_reg_valid;
   
   /* A wire hooked up from bit 0 with the last byte of the state counter/shiftreg */
   wire [7:0] state_data_byte;
   assign state_data_byte[7:0] = state[10:3];
   
   /* Assign the SMII TX wire */
   /* First bit always TX_ERR, then depending on the next bit, TX_EN, output
    either the inter-frame status byte or a data byte */
   assign tx = state[1] ? mtxerr :
	       state[2] ? ((tx_data_reg_valid & (tx_cnt == 4'd0)) | state_data) :
	       state_data ? |(state_data_byte & tx_data_reg) :
	       |(state_data_byte & {3'b111,jabber,link,duplex,speed,mtxerr});

   /////////////////////////////////////////////////
   // Receive

   always @ (posedge clk or posedge rst)
     if (rst)
       rx_cnt <= 4'd0;
     else
       if (speed)
	 rx_cnt <= 4'd0;
       else if (!mrxdv & state[8] & rx_tmp[3]) // Getting ready for data
	 rx_cnt <= 4'd9;
       else if (state[10]) // wrap
	 if (rx_cnt == 4'd9)
	   rx_cnt <= 4'd0;
	 else
	   rx_cnt <= rx_cnt + 4'd1;
   
   always @ (posedge clk or posedge rst)
     if (rst)
       begin
	  {mcrs, mrxdv, mrxerr, speed, duplex, link, jabber} <= 7'b0001110;
	  rx_tmp <= 4'h0;	  
	  mrxd <= 4'h0;
       end
     else
       begin
	  /* Continually shift rx into rx_tmp bit 2, and shift rx_tmp along */
	  rx_tmp[2:0] <= {rx,rx_tmp[2:1]};
`define RX_BEGIN_STATE 3
	  /* We appear to be beginning our sampling when state bit 3 is set */
	  if (state[`RX_BEGIN_STATE]) //3
	    mcrs <= rx;	  
	  
	  /* rx_tmp[3] is used as the RX_DV bit*/
	  if (state[`RX_BEGIN_STATE+1])
	    rx_tmp[3] <= rx;

	  if (rx_tmp[3]) //If data byte valid, and when we've got the first nibble, output it */
	    begin
	       /* At this stage we've got the first 3 bits of the bottom 
		nibble - we can sample the rx line directly to get the 
		4th, and we'll also indicate that this byte is valid by 
		raising the MII RX data valid (dv) line. */
	       if (state[`RX_BEGIN_STATE+5])
		 {mrxdv,mrxd} <=  {rx_tmp[3],rx,rx_tmp[2:0]};
	       /* High nibble, we have 3 bits and the final one is on 
		the line - put it out for the MAC to read.*/
	       else if (state[`RX_BEGIN_STATE-1])
		 mrxd <=  {rx,rx_tmp[2:0]};
	    end
	  else
	    begin
	       /* Not a data byte, it's the inter-frame status byte */
	       if (state[`RX_BEGIN_STATE+2])
		 mrxerr <=  rx;
	       if (state[`RX_BEGIN_STATE+3])
		 speed <=  rx;
	       if (state[`RX_BEGIN_STATE+4])
		 duplex <=  rx;
	       if (state[`RX_BEGIN_STATE+5])
		 begin
		    link <=  rx;
		    mrxdv <=  1'b0;
		 end
	       if (state[`RX_BEGIN_STATE+6])
		 jabber <=  rx;
	    end
       end // else: !if(rst)
   
   always @ (posedge clk or posedge rst)
     if (rst)
       mrx_clk_tmp <= 1'b0;
     else
       //if ((state[1] | state[6]) & (rx_cnt == 4'd0))
       if (((state[`RX_BEGIN_STATE+3] | state[`RX_BEGIN_STATE-1]) & (rx_cnt == 4'd0) & speed)
	   | ((((state[`RX_BEGIN_STATE+3] & (rx_cnt == 4'd0)) | (state[`RX_BEGIN_STATE-1]) & (rx_cnt == 4'd1) & !speed ) )))
	 mrx_clk_tmp <= 1'b1;
       //else if (state[3] | state[8])
       else if (state[`RX_BEGIN_STATE+5] | state[`RX_BEGIN_STATE+1])
	 mrx_clk_tmp <= 1'b0;

`ifdef ACTEL
   gbuf bufg2
     (
      .CLK(mrx_clk_tmp),
      .GL(mrx_clk)
      );
`else
   assign  mrx_clk = mrx_clk_tmp;
`endif
   
assign mcoll =  mcrs & mtxen & !duplex;
      
   
endmodule // smii_top

