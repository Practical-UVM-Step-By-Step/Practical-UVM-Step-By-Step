module tb();
  logic clk;
  wb_intf      wb_if(.clk(clk)); 
  gpio_intf    gpio_if(.clk(clk));
  gpio_wrap wrap_inst(.wb_if(wb_if), .gpio_if(gpio_if));
endmodule

module gpio_wrap(wb_intf wb_if, gpio_intf gpio_if);

gpio_top dut(
	// WISHBONE Interface
	.wb_clk_i(wb_if.clk),
	.wb_rst_i(wb_if.rst),
	.wb_cyc_i(wb_if.cyc_i),
	.wb_adr_i(wb_if.adr_i),
	.wb_dat_i(wb_if.dat_i),
	.wb_sel_i(wb_if.sel_i),
	.wb_we_i(wb_if.we_i),
	.wb_stb_i(wb_if.stb_i),
	.wb_dat_o(wb_if.dat_o),
	.wb_ack_o(wb_if.ack_o),
	.wb_err_o(wb_if.err_o),
	.wb_inta_o(wb_if.inta_o),

	// Auxiliary inputs interface
`ifdef GPIO_AUX_IMPLEMENT
	.aux_i(gpio_if.aux_i),
`endif //  GPIO_AUX_IMPLEMENT

	// External GPIO Interface
	.ext_pad_i(gpio_if.ext_pad_i),

`ifdef GPIO_CLKPAD
	.clk_pad_i(gpio_if.clk),
`endif // GPIO_CLKPAD
	.ext_pad_o(gpio_if.ext_pad_o),
	.ext_padoe_o(gpio_if.ext_padoe_o)
);

endmodule

