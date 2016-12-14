`ifndef SPI_TOP_WRAP
`define SPI_TOP_WRAP

module spi_wrap_top(wb_slave_if wb_slv_if, spi_if  spi_intf, output bit interrupt);

simple_spi_top dut(

    .clk_i(wb_slv_if.clk),       
    .rst_i(wb_slv_if.rst),       
    .cyc_i(wb_slv_if.CYC_I),       
    .stb_i(wb_slv_if.STB_I),       
    .adr_i(wb_slv_if.ADR_I),       
    .we_i(wb_slv_if.WE_I),        
    .dat_i(wb_slv_if.DAT_I),       
    .dat_o(wb_slv_if.DAT_O),       
    .ack_o(wb_slv_if.ACK_O),       
    .inta_o(interrupt),      
    
    // SPI port
    .sck_o(spi_intf.sck),       
    .mosi_o(spi_intf.mosi),      
    .miso_i(spi_intf.miso)       

);

endmodule
`endif
