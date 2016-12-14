//////////////////////////////////////////////////////////////////////
////                                                              ////
////  SMII Receiver/Decoder (usually at PHY end)                  ////
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
////      - Julius Baxter, jb@orsoc.se                            ////
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
module smii_phy
  (
   // SMII
    input     smii_tx,
    input     smii_sync,
    output reg    smii_rx,
   
   // MII
   // TX
   /* ALL I/Os swapped compared to SMII on MAC end MAC - jb */
    output reg [3:0] ethphy_mii_tx_d,
    output reg 	     ethphy_mii_tx_en,
    output reg 	     ethphy_mii_tx_err,
    input 	     ethphy_mii_tx_clk,
   // RX
    input [3:0]      ethphy_mii_rx_d,
    input 	     ethphy_mii_rx_dv,
    input 	     ethphy_mii_rx_err,
    input 	     ethphy_mii_rx_clk,
    input 	     ethphy_mii_mcoll,
    input 	     ethphy_mii_crs,

    input 	     fast_ethernet,
    input 	     duplex,
    input 	     link,

   // internal
    //input [10:1] state,
   // clock and reset
    input 	 clk, /* Global reference clock for both SMII modules */
    input 	 rst_n
   );

   reg [3:0] 	 rx_tmp;
   
   reg 		 jabber = 0;

   reg 		 mtx_clk_tmp, mrx_clk_tmp;

   reg [3:0] 	 tx_cnt;
   reg [3:0] 	 rx_cnt;

   
/**************************************************************************/
/* Counters */
/**************************************************************************/

   /* Generate the state counter, based on incoming sync signal */
   /* 10-bit shift register, indicating where we are */
   reg [10:1] 	 state_shiftreg;
   
   /* A wire hooked up from bit 0 with the last byte of the state counter/shiftreg */
   wire [7:0] state_shiftreg_top_byte;
   assign state_shiftreg_top_byte[7:0] = state_shiftreg[10:3];

   always @(posedge clk)
     begin
	if (!rst_n)
	  begin
	     state_shiftreg <= 10'b0000000001;
	  end
	else
	  begin
	     if (smii_sync) /* sync signal from MAC */
	       state_shiftreg <= 10'b0000000010;
	     else if (state_shiftreg[10])
	       state_shiftreg <= 10'b0000000001;
	     else
	       state_shiftreg[10:2] <= state_shiftreg[9:1];
	  end // else: !if(!rst_n)	
     end // always @ (posedge clk)
   
   
   /* counter from 0 to 9, counting the 10-bit segments we'll transmit
    via SMII*/
   reg [3:0] segment_ctr; 

   always @(posedge clk)
     begin
	if(!rst_n)
	  segment_ctr <= 4'h0;
	else
	  begin
 	     if(fast_ethernet) /* If using 100Mbs, then each segment is 
			    different, we don't count the repeats */
	       segment_ctr <= 4'h0;
	     else if (state_shiftreg[10])
	       if (segment_ctr == 4'h9) /* Wrap */
		 segment_ctr <= 4'h0;
	       else /* Increment */
		 segment_ctr <= segment_ctr + 1'b1;
	  end
     end // always @ (posedge clk)

 
/**************************************************************************/
/* RX path logic PHY->(MII->SMII)->MAC */
/**************************************************************************/

   reg rx_nibble_sel, rx_byte_valid;
   reg [7:0] rx_data_byte_rx_clk;

   reg [4:0] rx_dv_nib_0;
   reg 	     rx_nib_first,rx_nib_first_r;  // if high, nib_0 contains the "first" of the pair of nibs
   reg [3:0] rx_segment_begin_num;

   // Allow us to check if RX DV has been low for a while
   reg [3:0] rx_dv_long_low_sr;
   wire      rx_dv_long_low;   
   always @(posedge ethphy_mii_rx_clk)
     rx_dv_long_low_sr[3:0] <= {rx_dv_long_low_sr[2:0], ethphy_mii_rx_dv};
   assign rx_dv_long_low = ~(|rx_dv_long_low_sr[3:0]);
   reg      rx_dv;
   wire [8:0] rx_fifo_out;
   wire       rx_fifo_empty,rx_fifo_almost_empty;
   reg 	      rx_fifo_pop;
   
   always @(posedge ethphy_mii_rx_clk or negedge rst_n)
     begin
	if(!rst_n)
	  begin
	     rx_dv_nib_0 <= 0;
	     rx_nib_first <= 0;
	     rx_nib_first_r <= 0;
	  end
	else
	  begin
	     if (!rx_nib_first)
	       rx_dv_nib_0 <= {ethphy_mii_rx_dv,ethphy_mii_rx_d};
	     if(ethphy_mii_rx_dv)
	       rx_nib_first <= ~rx_nib_first;

	     rx_nib_first_r <= rx_nib_first;
	     
	  end
     end // always @ (posedge ethphy_mii_rx_clk or negedge rst_n)

     always @(posedge clk or negedge rst_n)
       begin 
	  if (!rst_n) rx_fifo_pop <= 0;
	  else rx_fifo_pop <= (rx_fifo_almost_empty) ? (rx_fifo_pop ? ~rx_fifo_empty : rx_fifo_pop) : 1;

	  rx_dv <= (state_shiftreg[10] & (((rx_segment_begin_num == (segment_ctr-1)) && !fast_ethernet)| fast_ethernet)) ? (rx_fifo_pop) : rx_dv;
       end
   
   always @(posedge clk)
     begin
	/* remember which counter value we were at when rx enable/valid
	 went high.	 
	 This is only useful when not doing fast ethernet*/

	/* rx en has gone high - remember the sequence number we're in */
	if ((rx_segment_begin_num == 4'hf) & (~rx_dv_long_low))
	  rx_segment_begin_num <= segment_ctr;
	
	/* If rx enable goes low again, reset the segment number */  
	if (rx_dv_long_low)
	     /* reset to 0xf */
	     rx_segment_begin_num <= 4'hf;
     end
   
	  

     /* A fifo, storing RX bytes coming from the PHY interface */
   generic_fifo #(9, 64) rx_fifo
     (
      // Outputs
      .psh_full				(),
      .pop_q				(rx_fifo_out),
      .pop_empty			(rx_fifo_empty),
      .almost_empty                     (rx_fifo_almost_empty),
      // Inputs
      .async_rst_n			(rst_n),
      .psh_clk				(ethphy_mii_rx_clk),
      .psh_we				(rx_nib_first_r),
      .psh_d				({ethphy_mii_rx_err,ethphy_mii_rx_d,rx_dv_nib_0[3:0]}),
      .pop_clk				(clk),
      .pop_re				((state_shiftreg[1] & rx_fifo_pop)&(((rx_segment_begin_num == segment_ctr) && !fast_ethernet)| fast_ethernet)));

 
  `ifdef RX_SYNC_1
   
    /* Assign the rx line out */
   always @(posedge clk)
    smii_rx <= state_shiftreg[1] ? ethphy_mii_crs : /* 1st bit is MII CRS */
		    state_shiftreg[2] ? ((rx_dv & (segment_ctr==4'h0) & !fast_ethernet) | 
					 rx_dv) :
	       // inter-frame status byte or data byte
	       state_shiftreg[3] ? (rx_dv ?  (rx_fifo_out[0]) : ethphy_mii_rx_err) :
	       state_shiftreg[4] ? (rx_dv ?  (rx_fifo_out[1]) : fast_ethernet) :
	       state_shiftreg[5] ? (rx_dv ?  (rx_fifo_out[2]) : duplex) :
	       state_shiftreg[6] ? (rx_dv ?  (rx_fifo_out[3]) : link) :
	       state_shiftreg[7] ? (rx_dv ?  (rx_fifo_out[4]) : jabber) :
	       state_shiftreg[8] ? (rx_dv ?  (rx_fifo_out[5]) : 1) :
	       state_shiftreg[9] ? (rx_dv ?  (rx_fifo_out[6]) : 0) :
	       state_shiftreg[10] ? (rx_dv ?  (rx_fifo_out[7]) : 1) : 0;

  `else // !`ifdef RX_SYNC_1
   
       /* Assign the rx line out */
   always @(posedge clk)
    smii_rx <= state_shiftreg[10] ? ethphy_mii_crs : /* 1st bit is MII CRS */
		    state_shiftreg[1] ? ((rx_dv & (segment_ctr==4'h0) & !fast_ethernet) | 
					 rx_dv) :
	       // inter-frame status byte or data byte
	       state_shiftreg[2] ? (rx_dv ?  (rx_fifo_out[0]) : ethphy_mii_rx_err) :
	       state_shiftreg[3] ? (rx_dv ?  (rx_fifo_out[1]) : fast_ethernet) :
	       state_shiftreg[4] ? (rx_dv ?  (rx_fifo_out[2]) : duplex) :
	       state_shiftreg[5] ? (rx_dv ?  (rx_fifo_out[3]) : link) :
	       state_shiftreg[6] ? (rx_dv ?  (rx_fifo_out[4]) : jabber) :
	       state_shiftreg[7] ? (rx_dv ?  (rx_fifo_out[5]) : 1) :
	       state_shiftreg[8] ? (rx_dv ?  (rx_fifo_out[6]) : 0) :
	       state_shiftreg[9] ? (rx_dv ?  (rx_fifo_out[7]) : 1) : 0;
  `endif // !`ifdef RX_SYNC_1
   

   /* Status seq.: CRS, DV, ER, Speed, Duplex, Link, Jabber, UPV, FCD, 1 */
   //    {1'b1,1'b0,1'b1,jabber,link,duplex,,ethphy_mii_rx_err});
 

/**************************************************************************/
/* TX path logic MAC->(SMII->MII)->PHY */
/**************************************************************************/

   /* We ignore the data when TX_EN bit is not high - 
    it's only used in MAC to MAC comms*/


   /* Register the sequence appropriately as it comes in */
   reg tx_er_seqbit_scratch;
   reg tx_en_seqbit_scratch;
   reg [7:0] tx_data_byte_scratch;

   reg [2:0] tx_byte_to_phy; /* PHY sourced TX_CLK domain */
   
   wire      tx_fifo_empty, tx_fifo_almost_empty;
   wire      tx_fifo_full;
   wire [7:0] tx_fifo_q_dat;
   wire       tx_fifo_q_err;
   reg 	      tx_fifo_pop;
   reg [3:0]  tx_segment_begin_num;
   wire [3:0] tx_segment_load_num;
   
   assign tx_segment_load_num = (tx_segment_begin_num == 0) ? 4'h9 : tx_segment_begin_num - 1;
   
   /* Signal to tell us an appropriate time to copy the values out of the 
    temp regs we put the incoming TX line into when we've received a 
    sequence off the SMII TX line that has TX_EN high */
   wire      tx_seqbits_copy;
   assign tx_seqbits_copy = (
			     (
			      ((!fast_ethernet) & (segment_ctr == tx_segment_load_num)) | 
			      fast_ethernet
			     )
			     & tx_en_seqbit_scratch & state_shiftreg[1]
			    );

   always @(posedge clk)
     begin
	/* remember which counter value we were at when tx enable/valid
	 went high.	 
	 This is only useful when not doing fast ethernet*/

	/* tx en has gone high - remember the sequence number we're in */
	if ((tx_segment_begin_num == 4'hf) & (tx_en_seqbit_scratch))
	  tx_segment_begin_num <= segment_ctr;
	
	/* If tx enable goes low again, reset the segment number */  
	if (!tx_en_seqbit_scratch)
	     /* reset to 0xf */
	     tx_segment_begin_num <= 4'hf;
     end
   

   always @(posedge clk)
     begin
	if (!rst_n)
	  begin
	     tx_er_seqbit_scratch <= 0;
	     tx_en_seqbit_scratch <= 0;
	     tx_data_byte_scratch <= 0;
	  end
	else
	  begin
	     if(state_shiftreg[1])
	       tx_er_seqbit_scratch <= smii_tx;
	     
	     if(state_shiftreg[2])
	       tx_en_seqbit_scratch <= smii_tx;
	     
	     /* Preserve all but current bit of interest, as indicated
	      by state vector bit (reversed, becuase we get MSbit 
	      first) and OR in the current smii_tx line value at this 
	      position*/
	     if((|state_shiftreg[10:3]) & tx_en_seqbit_scratch)
	       tx_data_byte_scratch <= (tx_data_byte_scratch & ~state_shiftreg_top_byte) |
				       ({8{smii_tx}} & state_shiftreg_top_byte);
	     
	  end
     end // always @ (posedge clk)
   
   reg [3:0] nib;
   
   
   
   /* In the event we have a valid byte frame then get it to the 
    PHY as quickly as possible - this is TX_CLK domain */
   always @(posedge ethphy_mii_tx_clk or negedge rst_n)
     begin
	if(!rst_n)
	  begin
	     tx_byte_to_phy <= 0;
	     tx_fifo_pop <= 1'b0;
	     /* Output MII registers to the PHY */
	     ethphy_mii_tx_d <= 0;
	     ethphy_mii_tx_en <= 0;
	     ethphy_mii_tx_err <= 0;
	     
	  end
	else
	  begin
	     /* If fast_ethernet/100mbs we wait until the FIFO is full
	      otherwise, we push out the byte each time we get one */
	     //if((!tx_fifo_empty && !fast_ethernet) ||
	     //(tx_fifo_full && fast_ethernet))
	     if (!tx_fifo_almost_empty)
	       begin
		  if(tx_byte_to_phy == 0) 
		    begin
		       tx_byte_to_phy <= 1;
		       tx_fifo_pop <= 1;		       
		    end
	       end
	     
	     /* FIFO control loop */
	     if (tx_byte_to_phy == 1)/* Output bits 3-0 (bottom nibble ) */
	       begin

		  ethphy_mii_tx_en <= 1;		  

		  tx_fifo_pop <= 0;
		  
		  tx_byte_to_phy <= 2;

		  ethphy_mii_tx_d <= tx_fifo_q_dat[3:0];
		  nib <= tx_fifo_q_dat[7:4];
		  ethphy_mii_tx_err <= tx_fifo_q_err;

	       end
	     else if (tx_byte_to_phy == 2) /* Output bits 7-4 (top nibble) */
	       begin
		  //ethphy_mii_tx_d <= tx_fifo_q_dat[7:4];
		  
		  ethphy_mii_tx_d <= nib;
		  
		  if(!tx_fifo_empty) /* Check if more in FIFO */
		    begin
		       tx_fifo_pop <= 1;
		       tx_byte_to_phy <= 1;
		    end
		  else /* Finish up */
		    begin
		       tx_byte_to_phy <= 3;
		       ethphy_mii_tx_en <= 0;
		    end
	       end
	     else if (tx_byte_to_phy == 3) /* De-assert TX_EN */
	       begin
		  tx_byte_to_phy <= 2'b00;
	       end
	  end // else: !if(!rst_n)
     end // always @ (posedge ethphy_mii_tx_clk or negedge rst_n)

   /* A fifo, storing TX bytes coming from the SMII interface */
   generic_fifo #(9, 64) tx_fifo
     (
      // Outputs
      .psh_full				(tx_fifo_full),
      .pop_q				({tx_fifo_q_err,tx_fifo_q_dat}),
      .pop_empty			(tx_fifo_empty),
      .almost_empty                     (tx_fifo_almost_empty),
      // Inputs
      .async_rst_n			(rst_n),
      .psh_clk				(clk),
      .psh_we				(tx_seqbits_copy),
      .psh_d				({tx_er_seqbit_scratch,tx_data_byte_scratch}),
      .pop_clk				(ethphy_mii_tx_clk),
      .pop_re				(tx_fifo_pop));
   
   
   //assign mcoll = mcrs & mtxen;
   
endmodule // smii_top



/* Generic fifo - this is bad, should probably be done some other way */
module generic_fifo (async_rst_n, psh_clk, psh_we, psh_d, psh_full, pop_clk, pop_re, pop_q, pop_empty, almost_empty);

   parameter dw = 8;
   parameter size = 16;
   parameter size_log_2 = 4;
   
   /* Asynch. reset, active low */
   input async_rst_n;   
   
   /* Push side signals */
   input psh_clk;   
   input psh_we;   
   input [dw-1:0] psh_d;
   output 	  psh_full;
   
   /* Pop side signals */
   input 	  pop_clk;
   input 	  pop_re;
   //output reg [dw-1:0] pop_q;
   output reg [dw-1:0] pop_q;
   output 	       pop_empty;
   output wire	       almost_empty;
  
   
   /* Actual FIFO memory */
   reg [dw-1:0]   fifo_mem [0:size-1];


   /* FIFO position ptr regs */
   reg [size_log_2 - 1 : 0 ]   wr_ptr, rd_ptr, ctr;

   integer     i;
   

   /* FIFO full signal for push side */
   //assign psh_full = (ptr == size-1) ? 1 : 0;
   /* This full logic means we all but one slot in the FIFO */
   assign psh_full = ctr == size;
      
   /* FIFO empty signal for pop side */
   //assign pop_empty = (ptr == 0) ? 1 : 0;
   //assign pop_empty = ctr==0;
   assign pop_empty = rd_ptr == wr_ptr;

   assign almost_empty = ctr < 2;
   
   always @(posedge pop_re or negedge async_rst_n)
     begin
	if (!async_rst_n)
	  rd_ptr <= 0;
	else
	  begin
	     pop_q = fifo_mem[rd_ptr];
	     rd_ptr <= rd_ptr + 1;
	     ctr <= ctr - 1;
	  end
     end

   always @(posedge psh_we or negedge async_rst_n)
     begin
	if (!async_rst_n)
	  begin
	     for (i=0;i<size;i=i+1) fifo_mem[i] <= 0;
	     wr_ptr <= 0;
	     ctr <= 0;
	  end
	else
	  begin
	     fifo_mem[wr_ptr] <= psh_d;
	     wr_ptr <= #1 wr_ptr + 1;
	     ctr <= ctr + 1;
	  end
     end 
   
   		       
endmodule // generic_fifo

   