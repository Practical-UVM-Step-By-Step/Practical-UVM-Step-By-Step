/***********************************************
 *                                              *
 * Examples for the book Practical UVM          *
 *                                              *
 * Copyright Srivatsa Vasudevan 2010-2016       *
 * All rights reserved                          *
 *                                              *
 * Permission is granted to use this work       * 
 * provided this notice and attached license.txt*
 * are not removed/altered while redistributing *
 * See license.txt for details                  *
 *                                              *
 ************************************************/

`include "wb_master_if.sv"
`include "wb_slave_if.sv"
`include "common_if.sv"

module eth_wrap_top(wb_slave_if  wb_slv_if, wb_master_if  wb_mstr_if, mii_if eth_if, eth_rst_intr_if interrupt_if, input bit tx_clk, input bit rx_clk ,input bit rst, input bit wb_clk);

   eth_top dut(
	       .wb_cyc_i(wb_mstr_if.CYC_O),
	       .wb_adr_i(wb_mstr_if.ADR_O),
	       .wb_sel_i(wb_mstr_if.SEL_O),
	       .wb_we_i(wb_mstr_if.WE_O),
	       .wb_stb_i(wb_mstr_if.STB_O),
	       .wb_dat_o(wb_mstr_if.DAT_I),
	       .wb_ack_o(wb_mstr_if.ACK_I),
	       .wb_err_o(wb_mstr_if.ERR_I),
	       // TBD eth_top doesn't have this: .wb_inta_o(wb_mstr_if.inta_o),
	       .m_wb_adr_o(wb_slv_if.ADR_I),
	       .m_wb_sel_o(wb_slv_if.SEL_I),
	       .m_wb_we_o(wb_slv_if.WE_I),
	       .m_wb_dat_i(wb_slv_if.DAT_O),
	       .m_wb_dat_o(wb_slv_if.DAT_I),
	       .m_wb_cyc_o(wb_slv_if.CYC_I),
	       .m_wb_stb_o(wb_slv_if.STB_I),
	       .m_wb_ack_i(wb_slv_if.ACK_O),
	       .m_wb_err_i(wb_slv_if.ERR_O),
	       .mtx_clk_pad_i(eth_if.tx_clk),
	       .mtxd_pad_o(),
	       .mtxen_pad_o(),
	       .mtxerr_pad_o(),
	       .mrx_clk_pad_i(eth_if.rx_clk),
	       .mrxd_pad_i(4'b0),
	       .mrxdv_pad_i(1'b0),
	       .mrxerr_pad_i(1'b0),
	       .mcoll_pad_i(1'b0),
	       .mcrs_pad_i(1'b0),
	       .md_pad_i(1'b0),
	       .mdc_pad_o(),
	       .md_pad_o(),
	       .md_padoe_o(1'b0),
	       .wb_rst_i(wb_mstr_if.rst),
	       .wb_clk_i(wb_mstr_if.clk),
	       .int_o(interrupt_if.intr)
	       );

endmodule

