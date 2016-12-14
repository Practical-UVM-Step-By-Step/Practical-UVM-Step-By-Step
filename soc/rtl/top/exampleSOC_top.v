//////////////////////////////////////////////////////////////////////
////                                                              ////
////  exampleSOC_top.v                                            ////
////                                                              ////
////                                                              ////
////  This is the top level RTL file for ORPSoCv2                 ////
////                                                              ////
////  Author(s): srivatsa Vasudevan. www.uvmbook.com              ////
////                                                              ////
////  This is a hacked top level for the SOC described in         ////
////  in the UVM Book. It is pattered after the minsoc_top        ////
////  and orpsoc top level modules. Only key difference is        ////
////  that the modules are PERMANENTLY Instantiated and some      ////
////   Other modules needed for the book examples have            ////
//// Been instantiated. In light of the licence i got it with,    ////
//// I am reproducing the license I got below and am passing it   ////
//// on. Please respect the license terms.			  ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008, 2009 Authors                             ////
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


module exampleSOC_top
  (

   // SPI Clock signals
    output 	  spi_sd_sclk_pad_o ,
    output 	  spi_sd_ss_pad_o ,
    input 	  spi_sd_miso_pad_i ,
    output 	  spi_sd_mosi_pad_o ,
   
 // SPI bus signals for flash memory

    output 	  spi_flash_sclk_pad_o ,
    output 	  spi_flash_ss_pad_o ,
    input 	  spi_flash_miso_pad_i ,
    output 	  spi_flash_mosi_pad_o , 
    output 	  spi_flash_w_n_pad_o ,
    output 	  spi_flash_hold_n_pad_o,

   // SDRAM bus signals
    inout [15:0]  mem_dat_pad_io,
    output [12:0] mem_adr_pad_o ,
    output [1:0]  mem_dqm_pad_o ,
    output [1:0]  mem_ba_pad_o ,
    output 	  mem_cs_pad_o ,
    output 	  mem_ras_pad_o ,
    output 	  mem_cas_pad_o ,
    output 	  mem_we_pad_o ,
    output 	  mem_cke_pad_o ,

  
// Ethernet pad outputs

    output [1:1]  eth_sync_pad_o,
    output [1:1]  eth_tx_pad_o,
    input [1:1]   eth_rx_pad_i,
    input 	  eth_clk_pad_i,
    inout [1:1]   eth_md_pad_io,
    output [1:1]  eth_mdc_pad_o, 


    // SPI for Flash I/O

    output 	  spi1_mosi_pad_o,
    input 	  spi1_miso_pad_i,
    output 	  spi1_ss_pad_o ,
    output 	  spi1_sclk_pad_o,

    inout [8-1:0] gpio_a_pad_io,

  // UART I/O
    input 	  uart0_srx_pad_i , 
    output 	  uart0_stx_pad_o ,

  // JTAG Signals
    input 	  dbg_tdi_pad_i,
    input 	  dbg_tck_pad_i,
    input 	  dbg_tms_pad_i, 
    output 	  dbg_tdo_pad_o,

    // Common Clock and other signals.

    input 	  rst_pad_i,
    output 	  rst_pad_o,
    input 	  clk_pad_i,


    // VGA LCD signals 

    output 	  clk_p_o, // VGA pixel clock output
    output 	  hsync_pad_o, // horizontal sync
    output 	  vsync_pad_o, // vertical sync
    output 	  csync_pad_o, // composite sync
    output 	  blank_pad_o, // blanking signal
    output [ 7:0] r_pad_o, g_pad_o, b_pad_o, // RGB color signals

    // Debug port signals
     // Outputs
     output  [31:0]  m_data_pad_o, 
    output m_ack_pad_o, 
    output m_err_pad_o, 
    output m_rty_pad_o,
   // Inputs
    input clk_i, 
    input [31:0] m_data_pad_i, 
    input [31:0] m_addr_pad_i, 
    input m_sel_pad_i, 
    input m_we_pad_i, 
    input m_cyc_pad_i,
    input m_stb_pad_i
   ) ;
 

  // Signal Wires 
   wire 	   wb_rst;
   wire 	   wb_clk, dbg_tck;
   wire 	   pll_lock;
   wire [30:0] 	   pic_ints;
   parameter [31:0] wbm_or12_i_dat_o = 32'h0;

wire uart0_irq;
// Master 0 from OR1k To the conmax BUS

   wire [31:0] 	   wbm_or12_i_adr;
   wire [3:0] 	   wbm_or12_i_sel;
   wire 	   wbm_or12_i_we;
   wire [1:0] 	   wbm_or12_i_bte;
   wire [2:0] 	   wbm_or12_i_cti;
   wire 	   wbm_or12_i_stb;
   wire 	   wbm_or12_i_cyc;
   wire [31:0] 	   wbm_or12_i_dat;
   wire 	   wbm_or12_i_ack;
   wire 	   wbm_or12_i_err;
   wire 	   wbm_or12_i_rty;


   wire [31:0] 	   wbm_or12_debug_dat_o;
   wire [31:0] 	   wbm_or12_debug_adr_o;
   wire [3:0] 	   wbm_or12_debug_sel_o;
   wire 	   wbm_or12_debug_we_o;
   wire [1:0] 	   wbm_or12_debug_bte_o;
   wire [2:0] 	   wbm_or12_debug_cti_o;
   wire 	   wbm_or12_debug_stb_o;
   wire 	   wbm_or12_debug_cyc_o;
   wire [31:0] 	   wbm_or12_debug_dat_i;
   wire 	   wbm_or12_debug_ack_i;
   wire 	   wbm_or12_debug_err_i;
   wire 	   wbm_or12_debug_rty_i;
   wire [31:0] 	   wbm_or12_d_dat_o;
   wire [31:0] 	   wbm_or12_d_adr_o;
   wire [3:0] 	   wbm_or12_d_sel_o;
   wire 	   wbm_or12_d_we_o;
   wire [1:0] 	   wbm_or12_d_bte_o;
   wire [2:0] 	   wbm_or12_d_cti_o;
   wire 	   wbm_or12_d_stb_o;
   wire 	   wbm_or12_d_cyc_o;
   wire [31:0] 	   wbm_or12_d_dat_i;
   wire 	   wbm_or12_d_ack_i;
   wire 	   wbm_or12_d_err_i;
   wire 	   wbm_or12_d_rty_i;
   wire [31:0] 	   wbm_eth1_dat_o;
   wire [31:0] 	   wbm_eth1_adr_o;
   wire [3:0] 	   wbm_eth1_sel_o;
   wire 	   wbm_eth1_we_o;
   wire [1:0] 	   wbm_eth1_bte_o;
   wire [2:0] 	   wbm_eth1_cti_o;
   wire 	   wbm_eth1_stb_o;
   wire 	   wbm_eth1_cyc_o;
   wire [31:0] 	   wbm_eth1_dat_i;
   wire 	   wbm_eth1_ack_i;
   wire 	   wbm_eth1_err_i;
   wire 	   wbm_eth1_rty_i;
   wire [31:0] 	   wbs_eth1_cfg_dat_o;
   wire [31:0] 	   wbs_eth1_cfg_dat_i;
   wire [31:0] 	   wbs_eth1_cfg_adr_i;
   wire [3:0] 	   wbs_eth1_cfg_sel_i;
   wire [1:0] 	   wbs_eth1_cfg_bte_i;
   wire [2:0] 	   wbs_eth1_cfg_cti_i;
   wire 	   wbs_eth1_cfg_stb_i;
   wire 	   wbs_eth1_cfg_cyc_i;
   wire 	   wbs_eth1_cfg_ack_o;
   wire 	   wbs_eth1_cfg_err_o;
   parameter wbs_eth1_cfg_rty_o = 1'b0;
   wire [31:0] 	   wbs_rom_dat_o;
   wire [31:0] 	   wbs_rom_dat_i;
   wire [31:0] 	   wbs_rom_adr_i;
   wire [3:0] 	   wbs_rom_sel_i;
   wire [1:0] 	   wbs_rom_bte_i;
   wire [2:0] 	   wbs_rom_cti_i;
   wire 	   wbs_rom_stb_i;
   wire 	   wbs_rom_cyc_i;
   wire 	   wbs_rom_ack_o;
   parameter wbs_rom_err_o = 1'b0;
   parameter wbs_rom_rty_o = 1'b0;
   wire [31:0] 	   wbs_mc_m_dat_o;
   wire [31:0] 	   wbs_mc_m_dat_i;
   wire [31:0] 	   wbs_mc_m_adr_i;
   wire [3:0] 	   wbs_mc_m_sel_i;
   wire [1:0] 	   wbs_mc_m_bte_i;
   wire [2:0] 	   wbs_mc_m_cti_i;
   wire 	   wbs_mc_m_stb_i;
   wire 	   wbs_mc_m_cyc_i;
   wire 	   wbs_mc_m_ack_o;
   parameter wbs_mc_m_rty_o = 1'b0;
   wire [31:0] 	   wbs_spi_flash_dat_o;
   wire [31:0] 	   wbs_spi_flash_dat_i;
   wire [31:0] 	   wbs_spi_flash_adr_i;
   wire [3:0] 	   wbs_spi_flash_sel_i;
   wire [1:0] 	   wbs_spi_flash_bte_i;
   wire [2:0] 	   wbs_spi_flash_cti_i;
   wire 	   wbs_spi_flash_stb_i;
   wire 	   wbs_spi_flash_cyc_i;
   wire 	   wbs_spi_flash_ack_o;
   parameter wbs_spi_flash_err_o = 1'b0;
   parameter wbs_spi_flash_rty_o = 1'b0;
   wire [31:0] 	   wbs_uart0_dat_o;
   wire [31:0] 	   wbs_uart0_dat_i;
   wire [31:0] 	   wbs_uart0_adr_i;
   wire [3:0] 	   wbs_uart0_sel_i;
   wire [1:0] 	   wbs_uart0_bte_i;
   wire [2:0] 	   wbs_uart0_cti_i;
   wire 	   wbs_uart0_stb_i;
   wire 	   wbs_uart0_cyc_i;
   wire 	   wbs_uart0_ack_o;
   parameter wbs_uart0_err_o = 1'b0;
   parameter wbs_uart0_rty_o = 1'b0;
   wire [31:0] 	   wbs_ds1_dat_o;
   wire [31:0] 	   wbs_ds1_dat_i;
   wire [31:0] 	   wbs_ds1_adr_i;
   wire [3:0] 	   wbs_ds1_sel_i;
   wire [1:0] 	   wbs_ds1_bte_i;
   wire [2:0] 	   wbs_ds1_cti_i;
   wire 	   wbs_ds1_stb_i;
   wire 	   wbs_ds1_cyc_i;
   wire 	   wbs_ds1_ack_o;
   parameter wbs_ds1_err_o = 1'b0;
   parameter wbs_ds1_rty_o = 1'b0;
   wire [31:0] 	   wbs_ds2_dat_o;
   wire [31:0] 	   wbs_ds2_dat_i;
   wire [31:0] 	   wbs_ds2_adr_i;
   wire [3:0] 	   wbs_ds2_sel_i;
   wire [1:0] 	   wbs_ds2_bte_i;
   wire [2:0] 	   wbs_ds2_cti_i;
   wire 	   wbs_ds2_stb_i;
   wire 	   wbs_ds2_cyc_i;
   wire 	   wbs_ds2_ack_o;
   parameter wbs_ds2_err_o = 1'b0;
   parameter wbs_ds2_rty_o = 1'b0;
   wire [31:0] 	   wbs_ds3_dat_o;
   wire [31:0] 	   wbs_ds3_dat_i;
   wire [31:0] 	   wbs_ds3_adr_i;
   wire [3:0] 	   wbs_ds3_sel_i;
   wire [1:0] 	   wbs_ds3_bte_i;
   wire [2:0] 	   wbs_ds3_cti_i;
   wire 	   wbs_ds3_stb_i;
   wire 	   wbs_ds3_cyc_i;
   wire 	   wbs_ds3_ack_o;
   parameter wbs_ds3_err_o = 1'b0;
   parameter wbs_ds3_rty_o = 1'b0;

   wire 	   eth_clk;
   wire [1:1] 	   eth_int;

// WB Conmax Instantiation

	// IO Prototypes
	wire	[31:0]	m2_data_i;
	wire	[31:0]	m2_data_o;
	wire	[31:0]	m2_addr_i;
	wire	[3:0]	m2_sel_i;
	wire		m2_we_i;
	wire		m2_cyc_i;
	wire		m2_stb_i;
	wire		m2_ack_o;
	wire		m2_err_o;
	wire		m2_rty_o;
	wire	[31:0]	m3_data_i;
	wire	[31:0]	m3_data_o;
	wire	[31:0]	m3_addr_i;
	wire	[3:0]	m3_sel_i;
	wire		m3_we_i;
	wire		m3_cyc_i;
	wire		m3_stb_i;
	wire		m3_ack_o;
	wire		m3_err_o;
	wire		m3_rty_o;
	wire	[31:0]	m4_data_i;
	wire	[31:0]	m4_data_o;
	wire	[31:0]	m4_addr_i;
	wire	[3:0]	m4_sel_i;
	wire		m4_we_i;
	wire		m4_cyc_i;
	wire		m4_stb_i;
	wire		m4_ack_o;
	wire		m4_err_o;
	wire		m4_rty_o;
	wire	[31:0]	m5_data_i;
	wire	[31:0]	m5_data_o;
	wire	[31:0]	m5_addr_i;
	wire	[3:0]	m5_sel_i;
	wire		m5_we_i;
	wire		m5_cyc_i;
	wire		m5_stb_i;
	wire		m5_ack_o;
	wire		m5_err_o;
	wire		m5_rty_o;
	wire	[31:0]	m6_data_i;
	wire	[31:0]	m6_data_o;
	wire	[31:0]	m6_addr_i;
	wire	[3:0]	m6_sel_i;
	wire		m6_we_i;
	wire		m6_cyc_i;
	wire		m6_stb_i;
	wire		m6_ack_o;
	wire		m6_err_o;
	wire		m6_rty_o;
	wire	[31:0]	m7_data_i;
	wire	[31:0]	m7_data_o;
	wire	[31:0]	m7_addr_i;
	wire	[3:0]	m7_sel_i;
	wire		m7_we_i;
	wire		m7_cyc_i;
	wire		m7_stb_i;
	wire		m7_ack_o;
	wire		m7_err_o;
	wire		m7_rty_o;
	wire	[31:0]	s0_data_i;
	wire	[31:0]	s0_data_o;
	wire	[31:0]	s0_addr_o;
	wire	[3:0]	s0_sel_o;
	wire		s0_we_o;
	wire		s0_cyc_o;
	wire		s0_stb_o;
	wire		s0_ack_i;
	wire		s0_err_i;
	wire		s0_rty_i;
	wire	[31:0]	s1_data_i;
	wire	[31:0]	s1_data_o;
	wire	[31:0]	s1_addr_o;
	wire	[3:0]	s1_sel_o;
	wire		s1_we_o;
	wire		s1_cyc_o;
	wire		s1_stb_o;
	wire		s1_ack_i;
	wire		s1_err_i;
	wire		s1_rty_i;
	wire	[31:0]	s2_data_i;
	wire	[31:0]	s2_data_o;
	wire	[31:0]	s2_addr_o;
	wire	[3:0]	s2_sel_o;
	wire		s2_we_o;
	wire		s2_cyc_o;
	wire		s2_stb_o;
	wire		s2_ack_i;
	wire		s2_err_i;
	wire		s2_rty_i;
	wire	[31:0]	s3_data_i;
	wire	[31:0]	s3_data_o;
	wire	[31:0]	s3_addr_o;
	wire	[3:0]	s3_sel_o;
	wire		s3_we_o;
	wire		s3_cyc_o;
	wire		s3_stb_o;
	wire		s3_ack_i;
	wire		s3_err_i;
	wire		s3_rty_i;
	wire	[31:0]	s4_data_i;
	wire	[31:0]	s4_data_o;
	wire	[31:0]	s4_addr_o;
	wire	[3:0]	s4_sel_o;
	wire		s4_we_o;
	wire		s4_cyc_o;
	wire		s4_stb_o;
	wire		s4_ack_i;
	wire		s4_err_i;
	wire		s4_rty_i;
	wire	[31:0]	s5_data_i;
	wire	[31:0]	s5_data_o;
	wire	[31:0]	s5_addr_o;
	wire	[3:0]	s5_sel_o;
	wire		s5_we_o;
	wire		s5_cyc_o;
	wire		s5_stb_o;
	wire		s5_ack_i;
	wire		s5_err_i;
	wire		s5_rty_i;
	wire	[31:0]	s6_data_i;
	wire	[31:0]	s6_data_o;
	wire	[31:0]	s6_addr_o;
	wire	[3:0]	s6_sel_o;
	wire		s6_we_o;
	wire		s6_cyc_o;
	wire		s6_stb_o;
	wire		s6_ack_i;
	wire		s6_err_i;
	wire		s6_rty_i;
	wire	[31:0]	s7_data_i;
	wire	[31:0]	s7_data_o;
	wire	[31:0]	s7_addr_o;
	wire	[3:0]	s7_sel_o;
	wire		s7_we_o;
	wire		s7_cyc_o;
	wire		s7_stb_o;
	wire		s7_ack_i;
	wire		s7_err_i;
	wire		s7_rty_i;
	wire	[31:0]	s8_data_i;
	wire	[31:0]	s8_data_o;
	wire	[31:0]	s8_addr_o;
	wire	[3:0]	s8_sel_o;
	wire		s8_we_o;
	wire		s8_cyc_o;
	wire		s8_stb_o;
	wire		s8_ack_i;
	wire		s8_err_i;
	wire		s8_rty_i;
	wire	[31:0]	s9_data_i;
	wire	[31:0]	s9_data_o;
	wire	[31:0]	s9_addr_o;
	wire	[3:0]	s9_sel_o;
	wire		s9_we_o;
	wire		s9_cyc_o;
	wire		s9_stb_o;
	wire		s9_ack_i;
	wire		s9_err_i;
	wire		s9_rty_i;
	wire	[31:0]	s10_data_i;
	wire	[31:0]	s10_data_o;
	wire	[31:0]	s10_addr_o;
	wire	[3:0]	s10_sel_o;
	wire		s10_we_o;
	wire		s10_cyc_o;
	wire		s10_stb_o;
	wire		s10_ack_i;
	wire		s10_err_i;
	wire		s10_rty_i;
	wire	[31:0]	s11_data_i;
	wire	[31:0]	s11_data_o;
	wire	[31:0]	s11_addr_o;
	wire	[3:0]	s11_sel_o;
	wire		s11_we_o;
	wire		s11_cyc_o;
	wire		s11_stb_o;
	wire		s11_ack_i;
	wire		s11_err_i;
	wire		s11_rty_i;
	wire	[31:0]	s12_data_i;
	wire	[31:0]	s12_data_o;
	wire	[31:0]	s12_addr_o;
	wire	[3:0]	s12_sel_o;
	wire		s12_we_o;
	wire		s12_cyc_o;
	wire		s12_stb_o;
	wire		s12_ack_i;
	wire		s12_err_i;
	wire		s12_rty_i;
	wire	[31:0]	s13_data_i;
	wire	[31:0]	s13_data_o;
	wire	[31:0]	s13_addr_o;
	wire	[3:0]	s13_sel_o;
	wire		s13_we_o;
	wire		s13_cyc_o;
	wire		s13_stb_o;
	wire		s13_ack_i;
	wire		s13_err_i;
	wire		s13_rty_i;
	wire	[31:0]	s14_data_i;
	wire	[31:0]	s14_data_o;
	wire	[31:0]	s14_addr_o;
	wire	[3:0]	s14_sel_o;
	wire		s14_we_o;
	wire		s14_cyc_o;
	wire		s14_stb_o;
	wire		s14_ack_i;
	wire		s14_err_i;
	wire		s14_rty_i;
	wire	[31:0]	s15_data_i;
	wire	[31:0]	s15_data_o;
	wire	[31:0]	s15_addr_o;
	wire	[3:0]	s15_sel_o;
	wire		s15_we_o;
	wire		s15_cyc_o;
	wire		s15_stb_o;
	wire		s15_ack_i;
	wire		s15_err_i;
	wire		s15_rty_i;
	

//
// WISHBONE Inter Connect
//

wb_conmax_top	#(32,
		32,
		4'hf,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2,
		2'd2
		) conmax(
			// Common Signals
		.clk_i(		clk		),
		.rst_i(		rst		),
		// Master 0 Or1200 I Bus
		.m0_data_i(	32'b0 		),
		.m0_data_o(	wbm_or12_i_dat  ),
		.m0_addr_i(	wbm_or12_i_adr	),
		.m0_sel_i(	wbm_or12_i_sel  ),
		.m0_we_i(	wbm_or12_i_we   ),
		.m0_cyc_i(	wbm_or12_i_cyc   ),
		.m0_stb_i(	wbm_or12_i_stb   ),
		.m0_ack_o(	wbm_or12_i_ack   ),
		.m0_err_o(	wbm_or12_i_err   ),
		.m0_rty_o(	wbm_or12_i_rty   ),
		// Master 1 Or1200 D Bus
		.m1_data_i(	wbm_or12_d_dat_o  ),
		.m1_data_o(	wbm_or12_d_dat_i ),
		.m1_addr_i(	wbm_or12_d_adr   ),
		.m1_sel_i(	wbm_or12_d_sel  ),
		.m1_we_i(	wbm_or12_d_we  ),
		.m1_cyc_i(	wbm_or12_d_cyc  ),
		.m1_stb_i(	wbm_or12_d_stb  ),
		.m1_ack_o(	wbm_or12_d_ack  ),
		.m1_err_o(	wbm_or12_d_err  ),
		.m1_rty_o(	wbm_or12_d_rty  ),
		// Master 2 : empty for now
		.m2_data_i(	m2_data_i	),
		.m2_data_o(	m2_data_o	),
		.m2_addr_i(	m2_addr_i	),
		.m2_sel_i(	m2_sel_i	),
		.m2_we_i(	m2_we_i		),
		.m2_cyc_i(	m2_cyc_i	),
		.m2_stb_i(	m2_stb_i	),
		.m2_ack_o(	m2_ack_o	),
		.m2_err_o(	m2_err_o	),
		.m2_rty_o(	m2_rty_o	),
		// Master 3 : empty for now

		.m3_data_i(	m3_data_i	),
		.m3_data_o(	m3_data_o	),
		.m3_addr_i(	m3_addr_i	),
		.m3_sel_i(	m3_sel_i	),
		.m3_we_i(	m3_we_i		),
		.m3_cyc_i(	m3_cyc_i	),
		.m3_stb_i(	m3_stb_i	),
		.m3_ack_o(	m3_ack_o	),
		.m3_err_o(	m3_err_o	),
		.m3_rty_o(	m3_rty_o	),
		// Master 4 : empty for now
		.m4_data_i(	m4_data_i	),
		.m4_data_o(	m4_data_o	),
		.m4_addr_i(	m4_addr_i	),
		.m4_sel_i(	m4_sel_i	),
		.m4_we_i(	m4_we_i		),
		.m4_cyc_i(	m4_cyc_i	),
		.m4_stb_i(	m4_stb_i	),
		.m4_ack_o(	m4_ack_o	),
		.m4_err_o(	m4_err_o	),
		.m4_rty_o(	m4_rty_o	),
		// Master 5 : empty for now
		.m5_data_i(	m5_data_i	),
		.m5_data_o(	m5_data_o	),
		.m5_addr_i(	m5_addr_i	),
		.m5_sel_i(	m5_sel_i	),
		.m5_we_i(	m5_we_i		),
		.m5_cyc_i(	m5_cyc_i	),
		.m5_stb_i(	m5_stb_i	),
		.m5_ack_o(	m5_ack_o	),
		.m5_err_o(	m5_err_o	),
		.m5_rty_o(	m5_rty_o	),
		// Master 6 : empty for now
		.m6_data_i(	m6_data_i	),
		.m6_data_o(	m6_data_o	),
		.m6_addr_i(	m6_addr_i	),
		.m6_sel_i(	m6_sel_i	),
		.m6_we_i(	m6_we_i		),
		.m6_cyc_i(	m6_cyc_i	),
		.m6_stb_i(	m6_stb_i	),
		.m6_ack_o(	m6_ack_o	),
		.m6_err_o(	m6_err_o	),
		.m6_rty_o(	m6_rty_o	),
		// Master 7 : Debug master from outside Chip
		.m7_data_i(	m7_data_i	),
		.m7_data_o(	m7_data_o	),
		.m7_addr_i(	m7_addr_i	),
		.m7_sel_i(	m7_sel_i	),
		.m7_we_i(	m7_we_i		),
		.m7_cyc_i(	m7_cyc_i	),
		.m7_stb_i(	m7_stb_i	),
		.m7_ack_o(	m7_ack_o	),
		.m7_err_o(	m7_err_o	),
		.m7_rty_o(	m7_rty_o	),
		// Slave 0 : Memory 
		.s0_data_i(	s0_data_i	),
		.s0_data_o(	s0_data_o	),
		.s0_addr_o(	s0_addr_o	),
		.s0_sel_o(	s0_sel_o	),
		.s0_we_o(	s0_we_o		),
		.s0_cyc_o(	s0_cyc_o	),
		.s0_stb_o(	s0_stb_o	),
		.s0_ack_i(	s0_ack_i	),
		.s0_err_i(	s0_err_i	),
		.s0_rty_i(	s0_rty_i	),
		// Slave 1:  empty for now.
		.s1_data_i(	s1_data_i	),
		.s1_data_o(	s1_data_o	),
		.s1_addr_o(	s1_addr_o	),
		.s1_sel_o(	s1_sel_o	),
		.s1_we_o(	s1_we_o		),
		.s1_cyc_o(	s1_cyc_o	),
		.s1_stb_o(	s1_stb_o	),
		.s1_ack_i(	s1_ack_i	),
		.s1_err_i(	s1_err_i	),
		.s1_rty_i(	s1_rty_i	),
		// Slave 2: empty for now.
		.s2_data_i(	s2_data_i	),
		.s2_data_o(	s2_data_o	),
		.s2_addr_o(	s2_addr_o	),
		.s2_sel_o(	s2_sel_o	),
		.s2_we_o(	s2_we_o		),
		.s2_cyc_o(	s2_cyc_o	),
		.s2_stb_o(	s2_stb_o	),
		.s2_ack_i(	s2_ack_i	),
		.s2_err_i(	s2_err_i	),
		.s2_rty_i(	s2_rty_i	),
		// Slave 2: empty for now.
		.s3_data_i(	s3_data_i	),
		.s3_data_o(	s3_data_o	),
		.s3_addr_o(	s3_addr_o	),
		.s3_sel_o(	s3_sel_o	),
		.s3_we_o(	s3_we_o		),
		.s3_cyc_o(	s3_cyc_o	),
		.s3_stb_o(	s3_stb_o	),
		.s3_ack_i(	s3_ack_i	),
		.s3_err_i(	s3_err_i	),
		.s3_rty_i(	s3_rty_i	),
		// Slave 2: empty for now.
		.s4_data_i(	s4_data_i	),
		.s4_data_o(	s4_data_o	),
		.s4_addr_o(	s4_addr_o	),
		.s4_sel_o(	s4_sel_o	),
		.s4_we_o(	s4_we_o		),
		.s4_cyc_o(	s4_cyc_o	),
		.s4_stb_o(	s4_stb_o	),
		.s4_ack_i(	s4_ack_i	),
		.s4_err_i(	s4_err_i	),
		.s4_rty_i(	s4_rty_i	),
		// Slave 2: empty for now.
		.s5_data_i(	s5_data_i	),
		.s5_data_o(	s5_data_o	),
		.s5_addr_o(	s5_addr_o	),
		.s5_sel_o(	s5_sel_o	),
		.s5_we_o(	s5_we_o		),
		.s5_cyc_o(	s5_cyc_o	),
		.s5_stb_o(	s5_stb_o	),
		.s5_ack_i(	s5_ack_i	),
		.s5_err_i(	s5_err_i	),
		.s5_rty_i(	s5_rty_i	),
		// Slave 2: empty for now.
		.s6_data_i(	s6_data_i	),
		.s6_data_o(	s6_data_o	),
		.s6_addr_o(	s6_addr_o	),
		.s6_sel_o(	s6_sel_o	),
		.s6_we_o(	s6_we_o		),
		.s6_cyc_o(	s6_cyc_o	),
		.s6_stb_o(	s6_stb_o	),
		.s6_ack_i(	s6_ack_i	),
		.s6_err_i(	s6_err_i	),
		.s6_rty_i(	s6_rty_i	),
		// Slave 2: empty for now.
		.s7_data_i(	s7_data_i	),
		.s7_data_o(	s7_data_o	),
		.s7_addr_o(	s7_addr_o	),
		.s7_sel_o(	s7_sel_o	),
		.s7_we_o(	s7_we_o		),
		.s7_cyc_o(	s7_cyc_o	),
		.s7_stb_o(	s7_stb_o	),
		.s7_ack_i(	s7_ack_i	),
		.s7_err_i(	s7_err_i	),
		.s7_rty_i(	s7_rty_i	),
		// Slave 2: empty for now.
		.s8_data_i(	s8_data_i	),
		.s8_data_o(	s8_data_o	),
		.s8_addr_o(	s8_addr_o	),
		.s8_sel_o(	s8_sel_o	),
		.s8_we_o(	s8_we_o		),
		.s8_cyc_o(	s8_cyc_o	),
		.s8_stb_o(	s8_stb_o	),
		.s8_ack_i(	s8_ack_i	),
		.s8_err_i(	s8_err_i	),
		.s8_rty_i(	s8_rty_i	),
		// Slave 2: empty for now.
		.s9_data_i(	s9_data_i	),
		.s9_data_o(	s9_data_o	),
		.s9_addr_o(	s9_addr_o	),
		.s9_sel_o(	s9_sel_o	),
		.s9_we_o(	s9_we_o		),
		.s9_cyc_o(	s9_cyc_o	),
		.s9_stb_o(	s9_stb_o	),
		.s9_ack_i(	s9_ack_i	),
		.s9_err_i(	s9_err_i	),
		.s9_rty_i(	s9_rty_i	),
		// Slave 2: empty for now.
		.s10_data_i(	s10_data_i	),
		.s10_data_o(	s10_data_o	),
		.s10_addr_o(	s10_addr_o	),
		.s10_sel_o(	s10_sel_o	),
		.s10_we_o(	s10_we_o	),
		.s10_cyc_o(	s10_cyc_o	),
		.s10_stb_o(	s10_stb_o	),
		.s10_ack_i(	s10_ack_i	),
		.s10_err_i(	s10_err_i	),
		.s10_rty_i(	s10_rty_i	),
		// Slave 11: SPI controlller
		.s11_data_i(	s11_data_i	),
		.s11_data_o(	s11_data_o	),
		.s11_addr_o(	s11_addr_o	),
		.s11_sel_o(	s11_sel_o	),
		.s11_we_o(	s11_we_o	),
		.s11_cyc_o(	s11_cyc_o	),
		.s11_stb_o(	s11_stb_o	),
		.s11_ack_i(	s11_ack_i	),
		.s11_err_i(	s11_err_i	),
		.s11_rty_i(	s11_rty_i	),
		// Slave 12: empty for now.
		.s12_data_i(	s12_data_i	),
		.s12_data_o(	s12_data_o	),
		.s12_addr_o(	s12_addr_o	),
		.s12_sel_o(	s12_sel_o	),
		.s12_we_o(	s12_we_o	),
		.s12_cyc_o(	s12_cyc_o	),
		.s12_stb_o(	s12_stb_o	),
		.s12_ack_i(	s12_ack_i	),
		.s12_err_i(	s12_err_i	),
		.s12_rty_i(	s12_rty_i	),
		// Slave 13: empty for now.
		.s13_data_i(	s13_data_i	),
		.s13_data_o(	s13_data_o	),
		.s13_addr_o(	s13_addr_o	),
		.s13_sel_o(	s13_sel_o	),
		.s13_we_o(	s13_we_o	),
		.s13_cyc_o(	s13_cyc_o	),
		.s13_stb_o(	s13_stb_o	),
		.s13_ack_i(	s13_ack_i	),
		.s13_err_i(	s13_err_i	),
		.s13_rty_i(	s13_rty_i	),
		// Slave 14: empty for now.
		.s14_data_i(	s14_data_i	),
		.s14_data_o(	s14_data_o	),
		.s14_addr_o(	s14_addr_o	),
		.s14_sel_o(	s14_sel_o	),
		.s14_we_o(	s14_we_o	),
		.s14_cyc_o(	s14_cyc_o	),
		.s14_stb_o(	s14_stb_o	),
		.s14_ack_i(	s14_ack_i	),
		.s14_err_i(	s14_err_i	),
		.s14_rty_i(	s14_rty_i	),
		// Slave 15: empty for now.
		.s15_data_i(	s15_data_i	),
		.s15_data_o(	s15_data_o	),
		.s15_addr_o(	s15_addr_o	),
		.s15_sel_o(	s15_sel_o	),
		.s15_we_o(	s15_we_o	),
		.s15_cyc_o(	s15_cyc_o	),
		.s15_stb_o(	s15_stb_o	),
		.s15_ack_i(	s15_ack_i	),
		.s15_err_i(	s15_err_i	),
		.s15_rty_i(	s15_rty_i	)
		);


/*
   wb_conbus_top
     #(.s0_addr_w(4), .s0_addr(4'h0), // MC
       .s1_addr_w(4), .s1_addr(4'hf), // ROM
       .s27_addr_w(8), 
       .s2_addr(8'h92),              // ETH Slave
       .s3_addr(8'hb0),              // SPI
       .s4_addr(8'h90),              // UART
       .s5_addr(8'hc0),              // DS1
       .s6_addr(8'hd0),              // DS2
       .s7_addr(8'he0))              // DS3       
*/

   // Tie all cycle type identifiers (CTI) and burst type extension (BTE) signals low
   // Not supported by this arbiter.
   assign wbs_eth1_cfg_bte_i = 0;
   assign wbs_eth1_cfg_cti_i = 0;
   assign wbs_rom_bte_i = 0;
   assign wbs_rom_cti_i = 0;
   assign wbs_spi_flash_bte_i = 0;
   assign wbs_spi_flash_cti_i = 0;
   assign wbs_mc_m_bte_i = 0;
   assign wbs_mc_m_cti_i = 0;
   assign wbs_uart0_bte_i = 0;
   assign wbs_uart0_cti_i = 0;
   assign wbs_ds1_bte_i = 0;
   assign wbs_ds1_cti_i = 0;
   assign wbs_ds2_bte_i = 0;
   assign wbs_ds2_cti_i = 0;
   assign wbs_ds3_bte_i = 0;
   assign wbs_ds3_cti_i = 0;   

   wire wbm_or12_i_cti;
   wire wbm_or12_i_bte;

   // Programmable interrupt controller lines (aka. IRQ lines)
   assign 	 pic_ints[30] = 1'b0;
   assign 	 pic_ints[29] = 1'b0;
   assign 	 pic_ints[28] = 1'b0;
   assign 	 pic_ints[27] = 1'b0;
   assign 	 pic_ints[26] = 1'b0;
   assign 	 pic_ints[25] = 1'b0;
   assign 	 pic_ints[24] = 1'b0;
   assign 	 pic_ints[23] = 1'b0;
   assign 	 pic_ints[22] = 1'b0;
   assign 	 pic_ints[21] = 1'b0;
   assign 	 pic_ints[20] = 1'b0;
   assign 	 pic_ints[19] = 1'b0;
   assign 	 pic_ints[18] = 1'b0;
   assign 	 pic_ints[17] = 1'b0;
   assign 	 pic_ints[16] = 1'b0;
   assign 	 pic_ints[15] = 1'b0;
   assign 	 pic_ints[14] = 1'b0;
   assign 	 pic_ints[13] = 1'b0;
   assign 	 pic_ints[12] = 1'b0;
   assign 	 pic_ints[11] = 1'b0;
   assign 	 pic_ints[10] = 1'b0;
   assign 	 pic_ints[9]  = 1'b0;
   assign 	 pic_ints[8]  = 1'b0;
   assign 	 pic_ints[7] = 1'b0;
   assign 	 pic_ints[6] = 1'b0;
   assign 	 pic_ints[5] = 1'b0;
   assign 	 pic_ints[4] = eth_int[1]; /* IRQ4, just like in Linux. Added jb 090716 */
   assign 	 pic_ints[3] = 1'b0;
   assign 	 pic_ints[2] = uart0_irq;
   assign 	 pic_ints[1] = 1'b0;
   assign 	 pic_ints[0] = 1'b0;
   
   or1k_top i_or1k
     (
      .clk_i      (wb_clk),
      .rst_i      (wb_rst), 
      .pic_ints_i (pic_ints[19:0]),
      .iwb_clk_i  (wb_clk), 
      .iwb_rst_i  (wb_rst), 
      // Ibus
      .iwb_ack_i  (wbm_or12_i_ack), 
      .iwb_err_i  (wbm_or12_i_err), 
      .iwb_rty_i  (wbm_or12_i_rty), 
      .iwb_dat_i  (wbm_or12_i_dat),
      .iwb_cyc_o  (wbm_or12_i_cyc), 
      .iwb_adr_o  (wbm_or12_i_adr), 
      .iwb_stb_o  (wbm_or12_i_stb), 
      .iwb_we_o   (wbm_or12_i_we ), 
      .iwb_sel_o  (wbm_or12_i_sel), 
      .iwb_cti_o  (wbm_or12_i_cti), 
      .iwb_bte_o  (wbm_or12_i_bte),
      // Dbus
      .dwb_clk_i  (wb_clk), 
      .dwb_rst_i  (wb_rst), 
      .dwb_ack_i  (wbm_or12_d_ack), 
      .dwb_err_i  (wbm_or12_d_err), 
      .dwb_rty_i  (wbm_or12_d_rty), 
      .dwb_dat_i  (wbm_or12_d_dat_i),
      .dwb_cyc_o  (wbm_or12_d_cyc), 
      .dwb_adr_o  (wbm_or12_d_adr), 
      .dwb_stb_o  (wbm_or12_d_stb), 
      .dwb_we_o   (wbm_or12_d_we), 
      .dwb_sel_o  (wbm_or12_d_sel), 
      .dwb_dat_o  (wbm_or12_d_dat_o),
      .dwb_cti_o  (wbm_or12_d_cti), 
      .dwb_bte_o  (wbm_or12_d_bte),
      .dbgwb_clk_i (wb_clk), 
      .dbgwb_rst_i (wb_rst), 
      .dbgwb_ack_i (wbm_or12_debug_ack_i), 
      .dbgwb_err_i (wbm_or12_debug_err_i), 
      .dbgwb_dat_i (wbm_or12_debug_dat_i),
      .dbgwb_cyc_o (wbm_or12_debug_cyc_o), 
      .dbgwb_adr_o (wbm_or12_debug_adr_o), 
      .dbgwb_stb_o (wbm_or12_debug_stb_o), 
      .dbgwb_we_o  (wbm_or12_debug_we_o), 
      .dbgwb_sel_o (wbm_or12_debug_sel_o), 
      .dbgwb_dat_o (wbm_or12_debug_dat_o),
      .dbgwb_cti_o (wbm_or12_debug_cti_o), 
      .dbgwb_bte_o (wbm_or12_debug_bte_o),  
      .tms_pad_i   (dbg_tms_pad_i), 
      .tck_pad_i   (dbg_tck),
      .tdi_pad_i   (dbg_tdi_pad_i),
      .tdo_pad_o   (dbg_tdo_pad_o),
      .tdo_padoe_o (             )             
      );



   OR1K_startup OR1K_startup0
     (
      .wb_adr_i(wbs_rom_adr_i[6:2]),
      .wb_stb_i(wbs_rom_stb_i),
      .wb_cyc_i(wbs_rom_cyc_i),
      .wb_dat_o(wbs_rom_dat_o),
      .wb_ack_o(wbs_rom_ack_o),
      .wb_clk(wb_clk),
      .wb_rst(wb_rst)
      );

      // SPI For FLASH Instantiation
   wire 	   spi_flash_mosi, spi_flash_miso, spi_flash_sclk;
   wire [1:0] 	   spi_flash_ss;


   spi_flash_top # ( .divider(0), .divider_len(2)) spi_flash_top0 (
      .wb_clk_i(wb_clk), 
      .wb_rst_i(wb_rst),
      .wb_adr_i(wbs_spi_flash_adr_i[4:2]),
      .wb_dat_i(wbs_spi_flash_dat_i), 
      .wb_dat_o(wbs_spi_flash_dat_o),
      .wb_sel_i(wbs_spi_flash_sel_i),
      .wb_we_i(wbs_spi_flash_we_i),
      .wb_stb_i(wbs_spi_flash_stb_i), 
      .wb_cyc_i(wbs_spi_flash_cyc_i),
      .wb_ack_o(wbs_spi_flash_ack_o), 
      .mosi_pad_o(spi_flash_mosi),
      .miso_pad_i(spi_flash_miso),
      .sclk_pad_o(spi_flash_sclk),
      .ss_pad_o(spi_flash_ss)
      );


`ifdef USE_SDRAM
   wb_sdram_ctrl wb_sdram_ctrl0
     (
      .wb_dat_i(wbs_mc_m_dat_i),
      .wb_dat_o(wbs_mc_m_dat_o),
      .wb_sel_i(wbs_mc_m_sel_i),
      .wb_adr_i(wbs_mc_m_adr_i[24:2]),
      .wb_we_i (wbs_mc_m_we_i),
      .wb_cti_i(wbs_mc_m_cti_i),
      .wb_stb_i(wbs_mc_m_stb_i),
      .wb_cyc_i(wbs_mc_m_cyc_i),
      .wb_ack_o(wbs_mc_m_ack_o),
      .sdr_cke_o(mem_cke_pad_o),   
      .sdr_cs_n_o(mem_cs_pad_o),  
      .sdr_ras_n_o(mem_ras_pad_o), 
      .sdr_cas_n_o(mem_cas_pad_o), 
      .sdr_we_n_o(mem_we_pad_o),  
      .sdr_a_o(mem_adr_pad_o),
      .sdr_ba_o(mem_ba_pad_o),
      .sdr_dq_io(mem_dat_pad_io),
      .sdr_dqm_o(mem_dqm_pad_o),
      .sdram_clk(wb_clk),
      .wb_clk(wb_clk),
      .wb_rst(wb_rst)
      );

   // SPI flash memory signals
   assign spi_flash_mosi_pad_o = !spi_flash_ss[0] ? spi_flash_mosi : 1'b1;
   assign spi_flash_sclk_pad_o = !spi_flash_ss[0] ? spi_flash_sclk : 1'b1;
   assign spi_flash_ss_pad_o   =  spi_flash_ss[0];
   assign spi_flash_w_n_pad_o    = 1'b1;
   assign spi_flash_hold_n_pad_o = 1'b1;
   assign spi_sd_mosi_pad_o = !spi_flash_ss[1] ? spi_flash_mosi : 1'b1;
   assign spi_sd_sclk_pad_o = !spi_flash_ss[1] ? spi_flash_sclk : 1'b1;
   assign spi_sd_ss_pad_o   =  spi_flash_ss[1];
   assign spi_flash_miso = !spi_flash_ss[0] ? spi_flash_miso_pad_i :
			   !spi_flash_ss[1] ? spi_sd_miso_pad_i :
			   1'b0;
   
`else // !`ifdef USE_SDRAM
   
   parameter ram_wb_dat_width = 32;
   parameter ram_wb_adr_width = 25;
   //parameter ram_wb_mem_size  = 2097152; // 8MB
   parameter ram_wb_mem_size  = 8388608; // 32MB -- for linux test

 ram_wb_b3 ram_wb_b3_0
      (
	            // Outputs
	.wb_ack_o                         (wbs_ram_ack_o),
	.wb_err_o                         (wbs_ram_err_o),
	.wb_rty_o                         (wbs_ram_rty_o),
	.wb_dat_o                         (wbs_ram_dat_o),
	// Inputs
	.wb_adr_i                         (wbs_ram_adr_i),
	.wb_bte_i                         (wbs_ram_bte_i),
	.wb_cti_i                         (wbs_ram_cti_i),
	.wb_cyc_i                         (wbs_ram_cyc_i),
	.wb_dat_i                         (wbs_ram_dat_i),
	.wb_sel_i                         (wbs_ram_sel_i),
	.wb_stb_i                         (wbs_ram_stb_i),
	.wb_we_i                          (wbs_ram_we_i),
	.wb_clk_i                         (wb_clk_i),
	.wb_rst_i                         (wb_rst_i));


`endif // !`ifdef USE_SDRAM


   // UART INSTANTIATION

   uart_top 
     #( 32, 5) 
   i_uart_0_top
     (
      .wb_dat_o   (wbs_uart0_dat_o),
      .wb_dat_i   (wbs_uart0_dat_i),
      .wb_sel_i   (wbs_uart0_sel_i),
      .wb_adr_i   (wbs_uart0_adr_i[4:0]),
      .wb_we_i    (wbs_uart0_we_i),
      .wb_stb_i   (wbs_uart0_stb_i),
      .wb_cyc_i   (wbs_uart0_cyc_i),
      .wb_ack_o   (wbs_uart0_ack_o),
      .wb_clk_i   (wb_clk),
      .wb_rst_i   (wb_rst),
      .int_o      (uart0_irq),
      .srx_pad_i  (uart0_srx_pad_i),
      .stx_pad_o  (uart0_stx_pad_o),
      .cts_pad_i  (1'b0),
      .rts_pad_o  ( ),
      .dtr_pad_o  ( ),
      .dcd_pad_i  (1'b0),
      .dsr_pad_i  (1'b0),
      .ri_pad_i   (1'b0)
      );
   assign gpio_a_pad_io[7:0] = 8'hfe;

   // ETHERNET Instantiation

   wire 	   m1tx_clk;
   wire [3:0] 	   m1txd;
   wire 	   m1txen;
   wire 	   m1txerr;
   wire 	   m1rx_clk;
   wire [3:0] 	   m1rxd;
   wire 	   m1rxdv;
   wire 	   m1rxerr;
   wire 	   m1coll;
   wire 	   m1crs;   
   wire [10:1] 	   state;
   wire 	   sync;
   wire [1:1] 	   rx, tx;
   wire [1:1] 	   mdc_o, md_i, md_o, md_oe;

   eth_top eth_top1
     (
      .wb_clk_i(wb_clk),
      .wb_rst_i(wb_rst),
      .wb_dat_i(wbs_eth1_cfg_dat_i),
      .wb_dat_o(wbs_eth1_cfg_dat_o),
      .wb_adr_i(wbs_eth1_cfg_adr_i[11:2]),
      .wb_sel_i(wbs_eth1_cfg_sel_i),
      .wb_we_i(wbs_eth1_cfg_we_i),
      .wb_cyc_i(wbs_eth1_cfg_cyc_i),
      .wb_stb_i(wbs_eth1_cfg_stb_i),
      .wb_ack_o(wbs_eth1_cfg_ack_o),
      .wb_err_o(wbs_eth1_cfg_err_o),
      .m_wb_adr_o(wbm_eth1_adr_o),
      .m_wb_sel_o(wbm_eth1_sel_o),
      .m_wb_we_o(wbm_eth1_we_o),
      .m_wb_dat_o(wbm_eth1_dat_o),
      .m_wb_dat_i(wbm_eth1_dat_i),
      .m_wb_cyc_o(wbm_eth1_cyc_o),
      .m_wb_stb_o(wbm_eth1_stb_o),
      .m_wb_ack_i(wbm_eth1_ack_i),
      .m_wb_err_i(wbm_eth1_err_i),
      .m_wb_cti_o(wbm_eth1_cti_o),
      .m_wb_bte_o(wbm_eth1_bte_o),
      .mtx_clk_pad_i(m1tx_clk),
      .mtxd_pad_o(m1txd),
      .mtxen_pad_o(m1txen),
      .mtxerr_pad_o(m1txerr),
      .mrx_clk_pad_i(m1rx_clk),
      .mrxd_pad_i(m1rxd),
      .mrxdv_pad_i(m1rxdv),
      .mrxerr_pad_i(m1rxerr),
      .mcoll_pad_i(m1coll),
      .mcrs_pad_i(m1crs),
      .mdc_pad_o(mdc_o[1]),
      .md_pad_i(md_i[1]),
      .md_pad_o(md_o[1]),
      .md_padoe_o(md_oe[1]),
      .int_o(eth_int)
      );


   dummy_slave
     # ( .value(32'hc0000000))
   ds1 
     ( 
       .dat_o(wbs_ds1_dat_o), 
       .stb_i(wbs_ds1_stb_i), 
       .cyc_i(wbs_ds1_cyc_i), 
       .ack_o(wbs_ds1_ack_o), 
       .clk(wb_clk), 
       .rst(wb_rst) 
       );
   dummy_slave 
     # ( .value(32'hd0000000))
   ds2
     ( 
       .dat_o(wbs_ds2_dat_o), 
       .stb_i(wbs_ds2_stb_i), 
       .cyc_i(wbs_ds2_cyc_i), 
       .ack_o(wbs_ds2_ack_o), 
       .clk(wb_clk), 
       .rst(wb_rst) 
       );
   dummy_slave 
     # ( .value(32'he0000000))
   ds3
     ( 
       .dat_o(wbs_ds3_dat_o), 
       .stb_i(wbs_ds3_stb_i), 
       .cyc_i(wbs_ds3_cyc_i), 
       .ack_o(wbs_ds3_ack_o), 
       .clk(wb_clk), 
       .rst(wb_rst) 
       );

   assign rst_pad_o = pll_lock;
   assign wb_rst = ~(pll_lock & rst_pad_i);
   assign dbg_tck = dbg_tck_pad_i;
   assign eth_clk = eth_clk_pad_i;

   
wire [31:0] wb_dat_o,wb_adr_i;
   rom rom1(
	    // Outputs
	    .wb_dat_o			(wb_dat_o[31:0]),
	    .wb_ack_o			(wb_ack_o),
	    // Inputs
	    .wb_adr_i			(wb_adr_i[31:2]),
	    .wb_stb_i			(wb_stb_i),
	    .wb_cyc_i			(wb_cyc_i),
	    // .wb_cti_i			(wb_cti_i[2:0]),
	    // .wb_bte_i			(wb_bte_i[1:0]),
	    .wb_clk			(wb_clk),
	    .wb_rst			(wb_rst));

   debug_master_port debug_port(
				// Outputs
				.m_data_o	(m_data_pad_o[31:0]),
				.m_ack_o	(m_ack_pad_o),
				.m_err_o	(m_err_pad_o),
				.m_rty_o	(m_rty_pad_o),
				// Inputs
				.clk_i		(clk_i),
				.rst_i		(rst_i),
				.m_data_i	(m_data_pad_i[31:0]),
				.m_addr_i	(m_addr_pad_i[31:0]),
				.m_sel_i	(m_sel_pad_i[3:0]),
				.m_we_i		(m_we_pad_i),
				.m_cyc_i	(m_cyc_pad_i),
				.m_stb_i	(m_stb_pad_i));
   
   
   
wire		int;
wire	[31:0]	wb_addr_o;
wire	[31:0]	wb_data_i;
wire	[31:0]	wb_data_o;
wire	[3:0]	wb_sel_o;
wire		wb_we_o;
wire		wb_stb_o;
wire		wb_cyc_o;
wire	[2:0]	wb_cti_o;
wire	[1:0]	wb_bte_o;
wire		wb_ack_i;
wire		wb_err_i;
wire	[31:0]	wb_addr_i;
wire	[31:0]	wbm_data_i;
wire	[3:0]	wb_sel_i;
wire		wb_we_i;
wire		wb_stb_i;
wire		wb_cyc_i;
wire		wb_ack_o;
wire		wb_rty_o;
wire		wb_err_o;
reg		pclk_i;
wire		pclk;
wire    	hsync;
wire		vsync;
wire    	ihsync;
wire		ivsync;
wire		csync;
wire		blanc;
wire	[7:0]	red;
wire	[7:0]	green;
wire	[7:0]	blue;
wire		dvi_de_o;
wire	[11:0]	dvi_d_o;

wire vga_stb_i;
wire clut_stb_i;

vga_enh_top #(1'b0, 7) u0 (
		.wb_clk_i     ( wb_clk             ),
		.wb_rst_i     ( 1'b0            ),
		.rst_i        ( wb_rst             ),
		.wb_inta_o    ( vga_int             ),

		//-- slave signals
		.wbs_adr_i    ( wb_addr_i[11:0] ),
		.wbs_dat_i    ( wb_data_i       ),
		.wbs_dat_o    ( wb_data_o       ),
		.wbs_sel_i    ( wb_sel_i        ),
		.wbs_we_i     ( wb_we_i         ),
		.wbs_stb_i    ( wb_stb_i        ),
		.wbs_cyc_i    ( wb_cyc_i        ),
		.wbs_ack_o    ( wb_ack_o        ),
		.wbs_rty_o    ( wb_rty_o        ),
		.wbs_err_o    ( wb_err_o        ),

		//-- master signals
		.wbm_adr_o    ( wb_addr_o[31:0] ),
		.wbm_dat_i    ( wbm_data_i      ),
		.wbm_sel_o    ( wb_sel_o        ),
		.wbm_we_o     ( wb_we_o         ),
		.wbm_stb_o    ( wb_stb_o        ),
		.wbm_cyc_o    ( wb_cyc_o        ),
		.wbm_cti_o    ( wb_cti_o        ),
		.wbm_bte_o    ( wb_bte_o        ),
		.wbm_ack_i    ( wb_ack_i        ),
		.wbm_err_i    ( wb_err_i        ),

		//-- VGA signals
		.clk_p_i      ( pclk_i          )
	      , .dvi_hsync_o  ( ihsync          ),
		.dvi_vsync_o  ( ivsync          ),
	        .dvi_de_o     ( dvi_de_o        ),
		.dvi_d_o      ( dvi_d_o         )
              , .hsync_pad_o  ( hsync           ),
		.vsync_pad_o  ( vsync           ),
		.csync_pad_o  ( csync           ),
		.blank_pad_o  ( blanc           ),
		.r_pad_o      ( red             ),
		.g_pad_o      ( green           ),
		.b_pad_o      ( blue            )

	);

endmodule
