//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_defines.v                                               ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://opencores.org/project,ethmac                         ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////                                                              ////
////  Modified by:                                                ////
////      - Julius Baxter (julius@opencores.org)                  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001, 2002 Authors                             ////
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



//`define ETH_BIST                    // Bist for usage with Virtual Silicon RAMS

`define ETH_MBIST_CTRL_WIDTH 3        // width of MBIST control bus

// Generic FIFO implementation - hopefully synthesizable with Synplify
`define ETH_FIFO_GENERIC
// Ethernet implemented in Xilinx Chips (uncomment following lines)
// `define ETH_FIFO_XILINX             // Use Xilinx distributed ram for tx and rx fifo
// `define ETH_XILINX_RAMB4            // Selection of the used memory for Buffer descriptors
                                      // Core is going to be implemented in Virtex FPGA and contains Virtex 
                                      // specific elements. 

// Ethernet implemented in Altera Chips (uncomment following lines)
//`define ETH_ALTERA_ALTSYNCRAM

// Ethernet implemented in ASIC with Virtual Silicon RAMs
// `define ETH_VIRTUAL_SILICON_RAM     // Virtual Silicon RAMS used storing buffer decriptors (ASIC implementation)

// Ethernet implemented in ASIC with Artisan RAMs
// `define ETH_ARTISAN_RAM             // Artisan RAMS used storing buffer decriptors (ASIC implementation)

// Uncomment when Avalon bus is used
//`define ETH_AVALON_BUS

`define ETH_MODER_ADR         8'h0    // 0x0 
`define ETH_INT_SOURCE_ADR    8'h1    // 0x4 
`define ETH_INT_MASK_ADR      8'h2    // 0x8 
`define ETH_IPGT_ADR          8'h3    // 0xC 
`define ETH_IPGR1_ADR         8'h4    // 0x10
`define ETH_IPGR2_ADR         8'h5    // 0x14
`define ETH_PACKETLEN_ADR     8'h6    // 0x18
`define ETH_COLLCONF_ADR      8'h7    // 0x1C
`define ETH_TX_BD_NUM_ADR     8'h8    // 0x20
`define ETH_CTRLMODER_ADR     8'h9    // 0x24
`define ETH_MIIMODER_ADR      8'hA    // 0x28
`define ETH_MIICOMMAND_ADR    8'hB    // 0x2C
`define ETH_MIIADDRESS_ADR    8'hC    // 0x30
`define ETH_MIITX_DATA_ADR    8'hD    // 0x34
`define ETH_MIIRX_DATA_ADR    8'hE    // 0x38
`define ETH_MIISTATUS_ADR     8'hF    // 0x3C
`define ETH_MAC_ADDR0_ADR     8'h10   // 0x40
`define ETH_MAC_ADDR1_ADR     8'h11   // 0x44
`define ETH_HASH0_ADR         8'h12   // 0x48
`define ETH_HASH1_ADR         8'h13   // 0x4C
`define ETH_TX_CTRL_ADR       8'h14   // 0x50
`define ETH_RX_CTRL_ADR       8'h15   // 0x54
`define ETH_DBG_ADR           8'h16   // 0x58


`define ETH_MODER_DEF_0         8'h00
`define ETH_MODER_DEF_1         8'hA0
`define ETH_MODER_DEF_2         1'h0
`define ETH_INT_MASK_DEF_0      7'h0
`define ETH_IPGT_DEF_0          7'h12
`define ETH_IPGR1_DEF_0         7'h0C
`define ETH_IPGR2_DEF_0         7'h12
`define ETH_PACKETLEN_DEF_0     8'h00
`define ETH_PACKETLEN_DEF_1     8'h06
`define ETH_PACKETLEN_DEF_2     8'h40
`define ETH_PACKETLEN_DEF_3     8'h00
`define ETH_COLLCONF_DEF_0      6'h3f
`define ETH_COLLCONF_DEF_2      4'hF
`define ETH_TX_BD_NUM_DEF_0     8'h40
`define ETH_CTRLMODER_DEF_0     3'h0
`define ETH_MIIMODER_DEF_0      8'h64
`define ETH_MIIMODER_DEF_1      1'h0
`define ETH_MIIADDRESS_DEF_0    5'h00
`define ETH_MIIADDRESS_DEF_1    5'h00
`define ETH_MIITX_DATA_DEF_0    8'h00
`define ETH_MIITX_DATA_DEF_1    8'h00
`define ETH_MIIRX_DATA_DEF     16'h0000 // not written from WB
`define ETH_MAC_ADDR0_DEF_0     8'h00
`define ETH_MAC_ADDR0_DEF_1     8'h00
`define ETH_MAC_ADDR0_DEF_2     8'h00
`define ETH_MAC_ADDR0_DEF_3     8'h00
`define ETH_MAC_ADDR1_DEF_0     8'h00
`define ETH_MAC_ADDR1_DEF_1     8'h00
`define ETH_HASH0_DEF_0         8'h00
`define ETH_HASH0_DEF_1         8'h00
`define ETH_HASH0_DEF_2         8'h00
`define ETH_HASH0_DEF_3         8'h00
`define ETH_HASH1_DEF_0         8'h00
`define ETH_HASH1_DEF_1         8'h00
`define ETH_HASH1_DEF_2         8'h00
`define ETH_HASH1_DEF_3         8'h00
`define ETH_TX_CTRL_DEF_0       8'h00 //
`define ETH_TX_CTRL_DEF_1       8'h00 //
`define ETH_TX_CTRL_DEF_2       1'h0  //
`define ETH_RX_CTRL_DEF_0       8'h00
`define ETH_RX_CTRL_DEF_1       8'h00


`define ETH_MODER_WIDTH_0       8
`define ETH_MODER_WIDTH_1       8
`define ETH_MODER_WIDTH_2       1
`define ETH_INT_SOURCE_WIDTH_0  7
`define ETH_INT_MASK_WIDTH_0    7
`define ETH_IPGT_WIDTH_0        7
`define ETH_IPGR1_WIDTH_0       7
`define ETH_IPGR2_WIDTH_0       7
`define ETH_PACKETLEN_WIDTH_0   8
`define ETH_PACKETLEN_WIDTH_1   8
`define ETH_PACKETLEN_WIDTH_2   8
`define ETH_PACKETLEN_WIDTH_3   8
`define ETH_COLLCONF_WIDTH_0    6
`define ETH_COLLCONF_WIDTH_2    4
`define ETH_TX_BD_NUM_WIDTH_0   8
`define ETH_CTRLMODER_WIDTH_0   3
`define ETH_MIIMODER_WIDTH_0    8
`define ETH_MIIMODER_WIDTH_1    1
`define ETH_MIICOMMAND_WIDTH_0  3
`define ETH_MIIADDRESS_WIDTH_0  5
`define ETH_MIIADDRESS_WIDTH_1  5
`define ETH_MIITX_DATA_WIDTH_0  8
`define ETH_MIITX_DATA_WIDTH_1  8
`define ETH_MIIRX_DATA_WIDTH    16 // not written from WB
`define ETH_MIISTATUS_WIDTH     3 // not written from WB
`define ETH_MAC_ADDR0_WIDTH_0   8
`define ETH_MAC_ADDR0_WIDTH_1   8
`define ETH_MAC_ADDR0_WIDTH_2   8
`define ETH_MAC_ADDR0_WIDTH_3   8
`define ETH_MAC_ADDR1_WIDTH_0   8
`define ETH_MAC_ADDR1_WIDTH_1   8
`define ETH_HASH0_WIDTH_0       8
`define ETH_HASH0_WIDTH_1       8
`define ETH_HASH0_WIDTH_2       8
`define ETH_HASH0_WIDTH_3       8
`define ETH_HASH1_WIDTH_0       8
`define ETH_HASH1_WIDTH_1       8
`define ETH_HASH1_WIDTH_2       8
`define ETH_HASH1_WIDTH_3       8
`define ETH_TX_CTRL_WIDTH_0     8
`define ETH_TX_CTRL_WIDTH_1     8
`define ETH_TX_CTRL_WIDTH_2     1
`define ETH_RX_CTRL_WIDTH_0     8
`define ETH_RX_CTRL_WIDTH_1     8


// Outputs are registered (uncomment when needed)
`define ETH_REGISTERED_OUTPUTS

// Settings for TX FIFO
`define ETH_TX_FIFO_DATA_WIDTH 32

// Defines for ethernet TX fifo size - impacts FPGA resource usage
//`define ETH_TX_FULL_PACKET_FIFO  // Full 1500 byte TX buffer - uncomment this
//`define ETH_TX_256BYTE_FIFO  // 256 byte TX buffer - uncomment this
//`define ETH_TX_512BYTE_FIFO  // 512 byte TX buffer - uncomment this
`define ETH_TX_1KBYTE_FIFO     // 1024 byte TX buffer - uncomment this

`ifdef  ETH_TX_FULL_PACKET_FIFO
 `define ETH_TX_FIFO_CNT_WIDTH  9
 `define ETH_TX_FIFO_DEPTH      375
`else
 `ifdef ETH_TX_1KBYTE_FIFO
  `define ETH_TX_FIFO_CNT_WIDTH  8
  `define ETH_TX_FIFO_DEPTH      256
 `else
  `ifdef ETH_TX_512BYTE_FIFO
   `define ETH_TX_FIFO_CNT_WIDTH  7
   `define ETH_TX_FIFO_DEPTH      128
  `else
   `ifdef ETH_TX_256BYTE_FIFO
    `define ETH_TX_FIFO_CNT_WIDTH  6
    `define ETH_TX_FIFO_DEPTH      64
   `else
// Default is 64 bytes
    `define ETH_TX_FIFO_CNT_WIDTH  4
    `define ETH_TX_FIFO_DEPTH      16
   `endif
  `endif
 `endif // !`ifdef ETH_TX_512BYTE_FIFO
`endif // !`ifdef ETH_TX_FULL_PACKET_FIFO



// Settings for RX FIFO
`define ETH_RX_FIFO_CNT_WIDTH  8
`define ETH_RX_FIFO_DEPTH      256
//`define ETH_RX_FIFO_CNT_WIDTH  7
//`define ETH_RX_FIFO_DEPTH      128
//`define ETH_RX_FIFO_CNT_WIDTH  6
//`define ETH_RX_FIFO_DEPTH      64
//`define ETH_RX_FIFO_CNT_WIDTH  5
//`define ETH_RX_FIFO_DEPTH      32
//`define ETH_RX_FIFO_CNT_WIDTH  4
//`define ETH_RX_FIFO_DEPTH      16

`define ETH_RX_FIFO_DATA_WIDTH 32

// Burst length
`define BURST_4BEAT
`ifdef BURST_4BEAT
 `define ETH_BURST_LENGTH       4    // Change also ETH_BURST_CNT_WIDTH
 `define ETH_BURST_CNT_WIDTH    3    // The counter must be width enough to count to ETH_BURST_LENGTH
`endif

//`define ETH_BURST_LENGTH      32    // Change also ETH_BURST_CNT_WIDTH
//`define ETH_BURST_CNT_WIDTH    7    // The counter must be width enough to count to ETH_BURST_LENGTH

// Undefine this to enable bursting for RX (writing to memory)
`define ETH_RX_BURST_EN


// WISHBONE interface is Revision B3 compliant (uncomment when needed)
`define ETH_WISHBONE_B3

// Hack where the transmit logic polls each of the TX buffers instead of having to keep track of what's going on
//`define TXBD_POLL

// Define this to allow reading of the Wishbone control state machine on reg
// address 0x58
`define WISHBONE_DEBUG