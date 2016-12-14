module tb();
  logic clk;
  wb_mstr_intf   wb_if(.clk(clk)); 
  ram_intf       ram_if(.clk(clk));
  ram_wrap ram_inst(.wb_if(wb_if), .ram_if(ram_if));
endmodule

module ram_wrap(wb_mstr_intf wb_if, ram_intf ram_if);

ram_wb dut(

	// WISHBONE Interface
    .dat_i(wb_if.dat_i),   
    .dat_o(wb_if.dat_o),
    .adr_i(wb_if.adr_i),
    .we_i(wb_if.we_i),
    .sel_i(wb_if.sel_i),
    .cyc_i(wb_if.cyc_i),
    .stb_i(wb_if.stb_i),
    .ack_o(wb_if.ack_o),
    .cti_i(wb_if.cti_i),

	// RAM Interface
    .clk_i(ram_if.clk),
    .rst_i(ram_if.rst)


);

endmodule

