
module tb();
     logic clk;
     usb_misc_intf   usb_misc_if(.clk(clk));
     usb_phy_intf    usb_phy_if(.clk(clk));
     usb_intr_intf   usb_intr_if(.clk(clk));
     usb_vend_intf   usb_vend_if(.clk(clk));
     usb_sta_intf    usb_sta_if(.clk(clk));
     usb_ep1_intf    usb_ep1_if(.clk(clk));
     usb_ep2_intf    usb_ep2_if(.clk(clk));
     usb_ep3_intf    usb_ep3_if(.clk(clk));
     usb_ep4_intf    usb_ep4_if(.clk(clk));
     usb_ep5_intf    usb_ep5_if(.clk(clk));
     usb_ep6_intf    usb_ep6_if(.clk(clk));
     usb_ep7_intf    usb_ep7_if(.clk(clk));
   
    usb_wrap_top usb_inst( .usb_misc_if(usb_misc_if), .usb_phy_if(usb_phy_if), .usb_intr_if(usb_intr_if), .usb_vend_if(usb_vend_if), .usb_sta_if(usb_sta_if), .usb_ep1_if(usb_ep1_if), .usb_ep2_if(usb_ep2_if), .usb_ep3_if(usb_ep3_if), .usb_ep4_if(usb_ep4_if), .usb_ep5_if(usb_ep5_if), .usb_ep6_if(usb_ep6_if), .usb_ep7_if(usb_ep7_if));
endmodule

module usb_wrap_top ( usb_misc_intf  usb_misc_if, usb_phy_intf usb_phy_if, usb_intr_intf usb_intr_if, usb_vend_intf usb_vend_if, usb_sta_intf usb_sta_if, usb_ep1_intf usb_ep1_if, usb_ep2_intf usb_ep2_if, usb_ep3_intf usb_ep3_if, usb_ep4_intf usb_ep4_if, usb_ep5_intf usb_ep5_if, usb_ep6_intf usb_ep6_if, usb_ep7_intf usb_ep7_if);


usb1_core dut (
       .clk_i(usb_misc_if.clk),
       .rst_i(usb_misc_if.rst),

	   // USB PHY Interface
	   .tx_dp(usb_phy_if.tx_dp),
       .tx_dn(usb_phy_if.tx_dn), 
       .tx_oe(usb_phy_if.tx_oe),
	   .rx_d(usb_phy_if.rx_d), 
       .rx_dp(usb_phy_if.rx_dp), 
       .rx_dn(usb_phy_if.rx_dn),

	   // USB Misc
	   .phy_tx_mode(usb_misc_if.phy_tx_mode), 
       .usb_rst(usb_misc_if.usb_rst), 

	   // Interrupts
	   .dropped_frame(usb_intr_if.dropped_frame), 
       .misaligned_frame(usb_intr_if.misaligned_frame),
	   .crc16_err(usb_intr_if.crc16_err),

	   // Vendor Features
	   .v_set_int(usb_vend_if.v_set_int), 
       .v_set_feature(usb_vend_if.v_set_feature), 
       .wValue(usb_vend_if.wValue),
	   .wIndex(usb_vend_if.wIndex), 
       .vendor_data(usb_vend_if.vendor_data),

	   // USB Status
	   .usb_busy(usb_sta_if.usb_busy), 
       .ep_sel(usb_sta_if.ep_sel),

	   // Endpoint Interface
	   .ep1_cfg(usb_ep1_if.ep1_cfg),
	   .ep1_din(usb_ep1_if.ep1_din),  
       .ep1_we(usb_ep1_if.ep1_we), 
       .ep1_full(usb_ep1_if.ep1_full),
	   .ep1_dout(usb_ep1_if.ep1_dout), 
       .ep1_re(usb_ep1_if.ep1_re), 
       .ep1_empty(usb_ep1_if.ep1_empty),
	   .ep1_bf_en(usb_ep1_if.ep1_bf_en), 
       .ep1_bf_size(usb_ep1_if.ep1_bf_size),

	   .ep2_cfg(usb_ep2_if.ep2_cfg),
	   .ep2_din(usb_ep2_if.ep2_din),  
       .ep2_we(usb_ep2_if.ep2_we), 
       .ep2_full(usb_ep2_if.ep2_full),
	   .ep2_dout(usb_ep2_if.ep2_dout), 
       .ep2_re(usb_ep2_if.ep2_re), 
       .ep2_empty(usb_ep2_if.ep2_empty),
	   .ep2_bf_en(usb_ep2_if.ep2_bf_en), 
       .ep2_bf_size(usb_ep2_if.ep2_bf_size),

	   .ep3_cfg(usb_ep3_if.ep3_cfg),
	   .ep3_din(usb_ep3_if.ep3_din),  
       .ep3_we(usb_ep3_if.ep3_we), 
       .ep3_full(usb_ep3_if.ep3_full),
	   .ep3_dout(usb_ep3_if.ep3_dout), 
       .ep3_re(usb_ep3_if.ep3_re), 
       .ep3_empty(usb_ep3_if.ep3_empty),
	   .ep3_bf_en(usb_ep3_if.ep3_bf_en), 
       .ep3_bf_size(usb_ep3_if.ep3_bf_size),

	   .ep4_cfg(usb_ep4_if.ep4_cfg),
	   .ep4_din(usb_ep4_if.ep4_din),  
       .ep4_we(usb_ep4_if.ep4_we), 
       .ep4_full(usb_ep4_if.ep4_full),
	   .ep4_dout(usb_ep4_if.ep4_dout), 
       .ep4_re(usb_ep4_if.ep4_re), 
       .ep4_empty(usb_ep4_if.ep4_empty),
	   .ep4_bf_en(usb_ep4_if.ep4_bf_en), 
       .ep4_bf_size(usb_ep4_if.ep4_bf_size),

	   .ep5_cfg(usb_ep5_if.ep5_cfg),
	   .ep5_din(usb_ep5_if.ep5_din),  
       .ep5_we(usb_ep5_if.ep5_we), 
       .ep5_full(usb_ep5_if.ep5_full),
	   .ep5_dout(usb_ep5_if.ep5_dout), 
       .ep5_re(usb_ep5_if.ep5_re), 
       .ep5_empty(usb_ep5_if.ep5_empty),
	   .ep5_bf_en(usb_ep5_if.ep5_bf_en), 
       .ep5_bf_size(usb_ep5_if.ep5_bf_size),

	   .ep6_cfg(usb_ep6_if.ep6_cfg),
	   .ep6_din(usb_ep6_if.ep6_din),  
       .ep6_we(usb_ep6_if.ep6_we), 
       .ep6_full(usb_ep6_if.ep6_full),
	   .ep6_dout(usb_ep6_if.ep6_dout), 
       .ep6_re(usb_ep6_if.ep6_re), 
       .ep6_empty(usb_ep6_if.ep6_empty),
	   .ep6_bf_en(usb_ep6_if.ep6_bf_en), 
       .ep6_bf_size(usb_ep6_if.ep6_bf_size),

	   .ep7_cfg(usb_ep7_if.ep7_cfg),
	   .ep7_din(usb_ep7_if.ep7_din),  
       .ep7_we(usb_ep7_if.ep7_we), 
       .ep7_full(usb_ep7_if.ep7_full),
	   .ep7_dout(usb_ep7_if.ep7_dout), 
       .ep7_re(usb_ep7_if.ep7_re), 
       .ep7_empty(usb_ep7_if.ep7_empty),
	   .ep7_bf_en(usb_ep7_if.ep7_bf_en), 
       .ep7_bf_size(usb_ep7_if.ep7_bf_size)

		);

endmodule        
