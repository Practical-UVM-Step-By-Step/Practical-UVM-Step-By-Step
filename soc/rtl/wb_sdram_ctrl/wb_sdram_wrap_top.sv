module tb();
  logic clk;
  wb_mstr_intf  wb_mstr_if(.clk(clk));
  sdram_intf    sdram_if(.clk(clk));
  sdram_wrap_top wrap_inst(.wb_mstr_if(wb_mstr_if), .sdram_if(sdram_if));
endmodule

module sdram_wrap_top(wb_mstr_intf  wb_mstr_if, sdram_intf  sdram_if);


`MODULE_NAME dut (
    .wb_dat_i(wb_if.wb_dat_i),
    .wb_dat_o(wb_if.wb_dat_o),
    .wb_sel_i(wb_if.wb_sel_i),
    .wb_adr_i(wb_if.wb_adr_i),
    .wb_we_i(wb_if.wb_we_i),
    .wb_cti_i(wb_if.wb_ct_i),
    .wb_stb_i(wb_if.wb_stb_i),
    .wb_cyc_i(wb_if.wb_cyc_i),
    .wb_ack_o(wb_if.wb_ack_o),
    .sdr_cke_o(sdram_if.sdr_cke_o),   
    .sdr_cs_n_o(sdram_if.sdr_cs_n_o),  
    .sdr_ras_n_o(sdram_if.sdr_ras_n_o), 
    .sdr_cas_n_o(sdram_if.sdr_cas_n_o), 
    .sdr_we_n_o(sdram_if.sdr_we_n_o),  
    .sdr_a_o(sdram_if.sdr_a_o),
    .sdr_ba_o(sdram_if.sdr_ba_o),
    .sdr_dq_io(sdram_if.sdr_dq_io),
    .sdr_dqm_o(sdram_if.sdr_dqm_o),
    .sdram_clk(sdram_if.sdram_clk),
    .wb_clk(sdram_if.clk),
    .wb_rst(sdram_if.rst)
   );
