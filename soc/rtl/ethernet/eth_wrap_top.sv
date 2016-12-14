
`include "wb_master_if.sv"
`include "wb_slave_if.sv"

module eth_wrap_top(wb_slave_if  wb_slv_if, wb_master_if  wb_mstr_if, mii_if eth_if , input bit mtx_clk, input bit mrx_clk);

eth_top dut(
  .wb_cyc_i(wb_slv_if.CYC_I),
  .wb_adr_i(wb_slv_if.ADR_I),
  .wb_sel_i(wb_slv_if.SEL_I),
  .wb_we_i(wb_slv_if.WE_I),
  .wb_stb_i(wb_slv_if.STB_I),
  .wb_dat_o(wb_slv_if.DAT_O),
  .wb_ack_o(wb_slv_if.ACK_O),
  .wb_err_o(wb_slv_if.ERR_O),
  // TBD eth_top doesn't have this: .wb_inta_o(wb_slv_if.inta_o),
  .m_wb_adr_o(wb_mstr_if.ADR_O),
  .m_wb_sel_o(wb_mstr_if.SEL_O),
  .m_wb_we_o(wb_mstr_if.WE_O),
  .m_wb_dat_i(wb_mstr_if.DAT_I),
  .m_wb_dat_o(wb_mstr_if.DAT_O),
  .m_wb_cyc_o(wb_mstr_if.CYC_O),
  .m_wb_stb_o(wb_mstr_if.STB_O),
  .m_wb_ack_i(wb_mstr_if.ACK_I),
  .m_wb_err_i(wb_mstr_if.ERR_I),
  .mtx_clk_pad_i(mtx_clk),
  .mtxd_pad_o(eth_if.txd),
  .mtxen_pad_o(eth_if.tx_en),
  .mtxerr_pad_o(eth_if.tx_err),
  .mrx_clk_pad_i(eth_if.mrx_clk),
  .mrxd_pad_i(eth_if.rxd),
  .mrxdv_pad_i(eth_if.rx_dv),
  .mrxerr_pad_i(eth_if.rx_err),
  .mcoll_pad_i(eth_if.col),
  .mcrs_pad_i(eth_if.crs),
  .md_pad_i(),
  .mdc_pad_o(),
  .md_pad_o(),
  .md_padoe_o(),
  .int_o(eth_if.intr)
);

endmodule

