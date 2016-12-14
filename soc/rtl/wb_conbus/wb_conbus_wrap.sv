
module tb();
  logic clk;
  wb_m0_intf      wb_m0_if(.clk(clk)); 
  wb_m1_intf      wb_m1_if(.clk(clk)); 
  wb_m2_intf      wb_m2_if(.clk(clk)); 
  wb_m3_intf      wb_m3_if(.clk(clk)); 
  wb_m4_intf      wb_m4_if(.clk(clk)); 
  wb_m5_intf      wb_m5_if(.clk(clk)); 
  wb_m6_intf      wb_m6_if(.clk(clk)); 
  wb_m7_intf      wb_m7_if(.clk(clk)); 
  wb_s0_intf      wb_s0_if(.clk(clk)); 
  wb_s1_intf      wb_s1_if(.clk(clk)); 
  wb_s2_intf      wb_s2_if(.clk(clk)); 
  wb_s3_intf      wb_s3_if(.clk(clk)); 
  wb_s4_intf      wb_s4_if(.clk(clk)); 
  wb_s5_intf      wb_s5_if(.clk(clk)); 
  wb_s6_intf      wb_s6_if(.clk(clk)); 
  wb_s7_intf      wb_s7_if(.clk(clk)); 

  wb_conbus_wrap wrap_inst(.wb_m0_if(wb_m0_if), .wb_m1_if(wb_m1_if), .wb_m2_if(wb_m2_if), .wb_m3_if(wb_m3_if), .wb_m4_if(wb_m4_if), .wb_m5_if(wb_m5_if), .wb_m6_if(wb_m6_if), .wb_m7_if(wb_m7_if), .wb_s0_if(wb_s0_if),  .wb_s1_if(wb_s1_if), .wb_s2_if(wb_s2_if), .wb_s3_if(wb_s3_if), .wb_s4_if(wb_s4_if), .wb_s5_if(wb_s5_if), .wb_s6_if(wb_s6_if), .wb_s7_if(wb_s7_if));
endmodule

module wb_conbus_wrap(wb_m0_intf wb_m0_if, wb_m1_intf wb_m1_if, wb_m2_intf wb_m2_if, wb_m3_intf wb_m3_if, wb_m4_intf wb_m4_if, wb_m5_intf wb_m5_if, wb_m6_intf wb_m6_if, wb_m7_intf wb_m7_if, wb_s0_intf wb_s0_if,  wb_s1_intf wb_s1_if, wb_s2_intf wb_s2_if, wb_s3_intf wb_s3_if, wb_s4_intf wb_s4_if, wb_s5_intf wb_s5_if, wb_s6_intf wb_s6_if, wb_s7_intf wb_s7_if);

wb_conbus_top dut(
   // Master 0 Interface
   .m0_dat_i(wb_m0_if.m0_dat_i),
   .m0_dat_o(wb_m0_if.m0_dat_o),
   .m0_adr_i(wb_m0_if.m0_adr_i),
   .m0_sel_i(wb_m0_if.m0_sel_i),
   .m0_we_i(wb_m0_if.m0_we_i),
   .m0_cyc_i(wb_m0_if.m0_cyc_i),
   .m0_stb_i(wb_m0_if.m0_stb_i),
   .m0_cab_i(wb_m0_if.m0_cab_i),
   .m0_ack_o(wb_m0_if.m0_ack_o),
   .m0_err_o(wb_m0_if.m0_err_o),
   .m0_rty_o(wb_m0_if.m0_rty_o),
   // Master 1 Interface
   .m1_dat_i(wb_m1_if.m1_dat_i),
   .m1_dat_o(wb_m1_if.m1_dat_o),
   .m1_adr_i(wb_m1_if.m1_adr_i),
   .m1_sel_i(wb_m1_if.m1_sel_i),
   .m1_we_i(wb_m1_if.m1_we_i),
   .m1_cyc_i(wb_m1_if.m1_cyc_i),
   .m1_stb_i(wb_m1_if.m1_stb_i),
   .m1_cab_i(wb_m1_if.m1_cab_i),
   .m1_ack_o(wb_m1_if.m1_ack_o),
   .m1_err_o(wb_m1_if.m1_err_o),
   .m1_rty_o(wb_m1_if.m1_rty_o),
   // Master 2 Interface
   .m2_dat_i(wb_m2_if.m2_dat_i),
   .m2_dat_o(wb_m2_if.m2_dat_o),
   .m2_adr_i(wb_m2_if.m2_adr_i),
   .m2_sel_i(wb_m2_if.m2_sel_i),
   .m2_we_i(wb_m2_if.m2_we_i),
   .m2_cyc_i(wb_m2_if.m2_cyc_i),
   .m2_stb_i(wb_m2_if.m2_stb_i),
   .m2_cab_i(wb_m2_if.m2_cab_i),
   .m2_ack_o(wb_m2_if.m2_ack_o),
   .m2_err_o(wb_m2_if.m2_err_o),
   .m2_rty_o(wb_m2_if.m2_rty_o),
   // Master 3 Interface
   .m3_dat_i(wb_m3_if.m3_dat_i),
   .m3_dat_o(wb_m3_if.m3_dat_o),
   .m3_adr_i(wb_m3_if.m3_adr_i),
   .m3_sel_i(wb_m3_if.m3_sel_i),
   .m3_we_i(wb_m3_if.m3_we_i),
   .m3_cyc_i(wb_m3_if.m3_cyc_i),
   .m3_stb_i(wb_m3_if.m3_stb_i),
   .m3_cab_i(wb_m3_if.m3_cab_i),
   .m3_ack_o(wb_m3_if.m3_ack_o),
   .m3_err_o(wb_m3_if.m3_err_o),
   .m3_rty_o(wb_m3_if.m3_rty_o),
   // Master 4 Interface
   .m4_dat_i(wb_m4_if.m4_dat_i),
   .m4_dat_o(wb_m4_if.m4_dat_o),
   .m4_adr_i(wb_m4_if.m4_adr_i),
   .m4_sel_i(wb_m4_if.m4_sel_i),
   .m4_we_i(wb_m4_if.m4_we_i),
   .m4_cyc_i(wb_m4_if.m4_cyc_i),
   .m4_stb_i(wb_m4_if.m4_stb_i),
   .m4_cab_i(wb_m4_if.m4_cab_i),
   .m4_ack_o(wb_m4_if.m4_ack_o),
   .m4_err_o(wb_m4_if.m4_err_o),
   .m4_rty_o(wb_m4_if.m4_rty_o),
   // Master 5 Interface
   .m5_dat_i(wb_m5_if.m5_dat_i),
   .m5_dat_o(wb_m5_if.m5_dat_o),
   .m5_adr_i(wb_m5_if.m5_adr_i),
   .m5_sel_i(wb_m5_if.m5_sel_i),
   .m5_we_i(wb_m5_if.m5_we_i),
   .m5_cyc_i(wb_m5_if.m5_cyc_i),
   .m5_stb_i(wb_m5_if.m5_stb_i),
   .m5_cab_i(wb_m5_if.m5_cab_i),
   .m5_ack_o(wb_m5_if.m5_ack_o),
   .m5_err_o(wb_m5_if.m5_err_o),
   .m5_rty_o(wb_m5_if.m5_rty_o),
   // Master 6 Interface
   .m6_dat_i(wb_m6_if.m6_dat_i),
   .m6_dat_o(wb_m6_if.m6_dat_o),
   .m6_adr_i(wb_m6_if.m6_adr_i),
   .m6_sel_i(wb_m6_if.m6_sel_i),
   .m6_we_i(wb_m6_if.m6_we_i),
   .m6_cyc_i(wb_m6_if.m6_cyc_i),
   .m6_stb_i(wb_m6_if.m6_stb_i),
   .m6_cab_i(wb_m6_if.m6_cab_i),
   .m6_ack_o(wb_m6_if.m6_ack_o),
   .m6_err_o(wb_m6_if.m6_err_o),
   .m6_rty_o(wb_m6_if.m6_rty_o),
   // Master 7 Interface
   .m7_dat_i(wb_m7_if.m7_dat_i),
   .m7_dat_o(wb_m7_if.m7_dat_o),
   .m7_adr_i(wb_m7_if.m7_adr_i),
   .m7_sel_i(wb_m7_if.m7_sel_i),
   .m7_we_i(wb_m7_if.m7_we_i),
   .m7_cyc_i(wb_m7_if.m7_cyc_i),
   .m7_stb_i(wb_m7_if.m7_stb_i),
   .m7_cab_i(wb_m7_if.m7_cab_i),
   .m7_ack_o(wb_m7_if.m7_ack_o),
   .m7_err_o(wb_m7_if.m7_err_o),
   .m7_rty_o(wb_m7_if.m7_rty_o),
   // Slave 0 Interface
   .s0_dat_i(wb_s0_if.s0_dat_i),
   .s0_dat_o(wb_s0_if.s0_dat_o),
   .s0_adr_o(wb_s0_if.s0_adr_o),
   .s0_sel_o(wb_s0_if.s0_sel_o),
   .s0_we_o(wb_s0_if.s0_we_o),
   .s0_cyc_o(wb_s0_if.s0_cyc_o),
   .s0_stb_o(wb_s0_if.s0_stb_o),
   .s0_cab_o(wb_s0_if.s0_cab_o),
   .s0_ack_i(wb_s0_if.s0_ack_i),
   .s0_err_i(wb_s0_if.s0_err_i),
   .s0_rty_i(wb_s0_if.s0_rty_i),
   // Slave 1 Interface
   .s1_dat_i(wb_s1_if.s1_dat_i),
   .s1_dat_o(wb_s1_if.s1_dat_o),
   .s1_adr_o(wb_s1_if.s1_adr_o),
   .s1_sel_o(wb_s1_if.s1_sel_o),
   .s1_we_o(wb_s1_if.s1_we_o),
   .s1_cyc_o(wb_s1_if.s1_cyc_o),
   .s1_stb_o(wb_s1_if.s1_stb_o),
   .s1_cab_o(wb_s1_if.s1_cab_o),
   .s1_ack_i(wb_s1_if.s1_ack_i),
   .s1_err_i(wb_s1_if.s1_err_i),
   .s1_rty_i(wb_s1_if.s1_rty_i),
   // Slave 2 Interface
   .s2_dat_i(wb_s2_if.s2_dat_i),
   .s2_dat_o(wb_s2_if.s2_dat_o),
   .s2_adr_o(wb_s2_if.s2_adr_o),
   .s2_sel_o(wb_s2_if.s2_sel_o),
   .s2_we_o(wb_s2_if.s2_we_o),
   .s2_cyc_o(wb_s2_if.s2_cyc_o),
   .s2_stb_o(wb_s2_if.s2_stb_o),
   .s2_cab_o(wb_s2_if.s2_cab_o),
   .s2_ack_i(wb_s2_if.s2_ack_i),
   .s2_err_i(wb_s2_if.s2_err_i),
   .s2_rty_i(wb_s2_if.s2_rty_i),
   // Slave 3 Interface
   .s3_dat_i(wb_s3_if.s3_dat_i),
   .s3_dat_o(wb_s3_if.s3_dat_o),
   .s3_adr_o(wb_s3_if.s3_adr_o),
   .s3_sel_o(wb_s3_if.s3_sel_o),
   .s3_we_o(wb_s3_if.s3_we_o),
   .s3_cyc_o(wb_s3_if.s3_cyc_o),
   .s3_stb_o(wb_s3_if.s3_stb_o),
   .s3_cab_o(wb_s3_if.s3_cab_o),
   .s3_ack_i(wb_s3_if.s3_ack_i),
   .s3_err_i(wb_s3_if.s3_err_i),
   .s3_rty_i(wb_s3_if.s3_rty_i),
   // Slave 4 Interface
   .s4_dat_i(wb_s4_if.s4_dat_i),
   .s4_dat_o(wb_s4_if.s4_dat_o),
   .s4_adr_o(wb_s4_if.s4_adr_o),
   .s4_sel_o(wb_s4_if.s4_sel_o),
   .s4_we_o(wb_s4_if.s4_we_o),
   .s4_cyc_o(wb_s4_if.s4_cyc_o),
   .s4_stb_o(wb_s4_if.s4_stb_o),
   .s4_cab_o(wb_s4_if.s4_cab_o),
   .s4_ack_i(wb_s4_if.s4_ack_i),
   .s4_err_i(wb_s4_if.s4_err_i),
   .s4_rty_i(wb_s4_if.s4_rty_i),
   // Slave 5 Interface
   .s5_dat_i(wb_s5_if.s5_dat_i),
   .s5_dat_o(wb_s5_if.s5_dat_o),
   .s5_adr_o(wb_s5_if.s5_adr_o),
   .s5_sel_o(wb_s5_if.s5_sel_o),
   .s5_we_o(wb_s5_if.s5_we_o),
   .s5_cyc_o(wb_s5_if.s5_cyc_o),
   .s5_stb_o(wb_s5_if.s5_stb_o),
   .s5_cab_o(wb_s5_if.s5_cab_o),
   .s5_ack_i(wb_s5_if.s5_ack_i),
   .s5_err_i(wb_s5_if.s5_err_i),
   .s5_rty_i(wb_s5_if.s5_rty_i),
   // Slave 6 Interface
   .s6_dat_i(wb_s6_if.s6_dat_i),
   .s6_dat_o(wb_s6_if.s6_dat_o),
   .s6_adr_o(wb_s6_if.s6_adr_o),
   .s6_sel_o(wb_s6_if.s6_sel_o),
   .s6_we_o(wb_s6_if.s6_we_o),
   .s6_cyc_o(wb_s6_if.s6_cyc_o),
   .s6_stb_o(wb_s6_if.s6_stb_o),
   .s6_cab_o(wb_s6_if.s6_cab_o),
   .s6_ack_i(wb_s6_if.s6_ack_i),
   .s6_err_i(wb_s6_if.s6_err_i),
   .s6_rty_i(wb_s6_if.s6_rty_i),
   // Slave 7 Interface
   .s7_dat_i(wb_s7_if.s7_dat_i),
   .s7_dat_o(wb_s7_if.s7_dat_o),
   .s7_adr_o(wb_s7_if.s7_adr_o),
   .s7_sel_o(wb_s7_if.s7_sel_o),
   .s7_we_o(wb_s7_if.s7_we_o),
   .s7_cyc_o(wb_s7_if.s7_cyc_o),
   .s7_stb_o(wb_s7_if.s7_stb_o),
   .s7_cab_o(wb_s7_if.s7_cab_o),
   .s7_ack_i(wb_s7_if.s7_ack_i),
   .s7_err_i(wb_s7_if.s7_err_i),
   .s7_rty_i(wb_s7_if.s7_rty_i)


);

endmodule
