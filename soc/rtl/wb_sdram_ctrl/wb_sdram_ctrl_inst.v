wb_sdram_ctrl wb_sdram_ctrl0
  (
   // wishbone i/f
    .wb_dat_i(wbs_mc_m_dat_i),
    .wb_dat_o(wbs_mc_m_dat_o),
    .wb_sel_i(wbs_mc_m_sel_i),
    .wb_adr_i(wbs_mc_m_adr_i),
    .wb_we_i (wbs_mc_m_we_i),
    .wb_cti_i(wbs_mc_m_cti_i),
    .wb_stb_i(wbs_mc_m_stb_i),
    .wb_cyc_i(wbs_mc_m_cyc_i),
    .wb_ack_o(wbs_mc_m_ack_o),
   // SDRAM IO
    .sdr_cke_o(mem_cke_pad_o),   
    .sdr_cs_n_o(mem_cs_pad_o),  
    .sdr_ras_n_o(mem_ras_pad_o), 
    .sdr_cas_n_o(mem_cas_pad_o), 
    .sdr_we_n_o(mem_we_pad_o),  
    .sdr_a_o(mem_a_pad_o),     
    .sdr_dq_io(mem_dat_pad_io),
    .sdr_dqm_o(mem_dqm_pad_o),
   // system
    sdram_clk(sdram_clk),
    wb_clk(wb_clk),
    wb_rst(wb_rst)
   );
assign wbs_mc_m_err_o = 1'b0;

