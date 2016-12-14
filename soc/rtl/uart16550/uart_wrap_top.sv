module tb();
  logic clk;
  wb_slv_intf   wb_slv_if(.clk(clk));
  uart_intf     uart_if(.clk(clk));
  uart_wrap_top wrap_inst(.wb_slv_if(wb_slv_if), .uart_if(uart_if));
endmodule

module uart_wrap_top(wb_slv_intf  wb_slv_if, uart_intf  uart_if);

uart_top dut(
   .wb_clk_i(wb_slv_if.clk),
    
     // WISHBONE interface
   .wb_rst_i(wb_slv_if.rst),
   .wb_adr_i(wb_slv_if.wb_adr_i),
   .wb_dat_i(wb_slv_if.wb_dat_i),
   .wb_dat_o(wb_slv_if.wb_dat_o),
   .wb_we_i(wb_slv_if.wb_we_i),
   .wb_stb_i(wb_slv_if.wb_stb_i),
   .wb_cyc_i(wb_slv_if.wb_cyc_i),
   .wb_sel_i(wb_slv_if.wb_sel_i),
   .wb_ack_o(wb_slv_if.wb_ack_o),
   .int_o(wb_slv_if.int_o),
    
    // UART  signals
   .srx_pad_i(uart_if.srx_pad_i),
   .stx_pad_o(uart_if.stx_pad_o),
   .rts_pad_o(uart_if.rts_pad_o),
   .cts_pad_i(uart_if.cts_pad_i),
   .dtr_pad_o(uart_if.dtr_pad_o),
   .dsr_pad_i(uart_if.dsr_pad_i),
   .ri_pad_i(uart_if.ri_pad_i),
   .dcd_pad_i(uart_if.dcd_pad_i),

   // optional baudrate output
   `ifdef UART_HAS_BAUDRATE_OUTPUT
    .baud_o(uart_if.baud_o),
   `endif
   .dcd_pad_i(uart_if.dcd_pad_i)

);

endmodule

