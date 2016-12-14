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

`ifndef ETH_ENV_TOP__SV
 `define ETH_ENV_TOP__SV
 `include "tb_eth_defines.v"
 `include "eth_phy_defines.v"
 `include "wb_slave_behavioral.v"
 `include "eth_phy.v"
module eth_env_top();

   logic wb_clk;
   logic rst;
   wire  mtx_clk,mrx_clk;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 20;

   initial 
     begin
        wb_clk = 0;
        forever wb_clk = #(sim_cycle/2) ~wb_clk;
     end
   
   /*
    // Generating mtx_clk clock
    initial
    begin
    mtx_clk=0;
    #3 forever #20 mtx_clk = ~mtx_clk;   // 2*20 ns -> 25 MHz
end

    // Generating mrx_clk clock
    initial
    begin
    mrx_clk=0;
    #16 forever #20 mrx_clk = ~mrx_clk;   // 2*20 ns -> 25 MHz
end
    */

   wire          mtx_clk;  // This goes to PHY
   wire          mrx_clk;  // This goes to PHY

   wire [3:0] 	 MTxD;
   wire          MTxEn;
   wire          MTxErr;

   wire [3:0] 	 MRxD;     // This goes to PHY
   wire          MRxDV;    // This goes to PHY
   wire          MRxErr;   // This goes to PHY
   wire          MColl;    // This goes to PHY
   wire          MCrs;     // This goes to PHY

   wire          Mdi_I;
   wire          Mdo_O;
   wire          Mdo_OE;
   tri           Mdio_IO;
   wire          Mdc_O;
   // Ethernet Master Interface signals
   wire [31:0] 	 eth_ma_wb_adr_o, eth_ma_wb_dat_i, eth_ma_wb_dat_o;
   wire [3:0] 	 eth_ma_wb_sel_o;
   wire 	 eth_ma_wb_we_o, eth_ma_wb_cyc_o, eth_ma_wb_stb_o, eth_ma_wb_ack_i, eth_ma_wb_err_i;

   // Connecting Ethernet PHY Module
   assign Mdio_IO = Mdo_OE ? Mdo_O : 1'bz ;
   assign Mdi_I   = Mdio_IO;
   integer 	 phy_log_file_desc;
   wire 	 intr_w;

   wb_master_if mast_if(wb_clk,rst);
   wb_slave_if slv_if(wb_clk,rst);
   mii_if      mii_if_b(mtx_clk,mrx_clk,rst);
   eth_rst_intr_if intr_if(rst,intr_w);
   // UVM testbench 
   eth_blk_env_tb_mod test(); 

   // Ethernet instance
   WB_SLAVE_BEHAVIORAL wb_slave
     (
      .CLK_I(wb_clk),
      .RST_I(rst),
      .ACK_O(eth_ma_wb_ack_i),
      .ADR_I(eth_ma_wb_adr_o),
      .CYC_I(eth_ma_wb_cyc_o),
      .DAT_O(eth_ma_wb_dat_i),
      .DAT_I(eth_ma_wb_dat_o),
      .ERR_O(eth_ma_wb_err_i),
      .RTY_O(),      // NOT USED for now!
      .SEL_I(eth_ma_wb_sel_o),
      .STB_I(eth_ma_wb_stb_o),
      .WE_I (eth_ma_wb_we_o),
      .CAB_I(1'b0)
      );

   eth_top dut(
	       .wb_cyc_i(mast_if.CYC_O),
	       .wb_adr_i(mast_if.ADR_O[11:2]),
	       .wb_sel_i(mast_if.SEL_O),
	       .wb_we_i(mast_if.WE_O),
	       .wb_stb_i(mast_if.STB_O),
	       .wb_dat_o(mast_if.DAT_I),
	       .wb_dat_i(mast_if.DAT_O),
	       .wb_ack_o(mast_if.ACK_I),
	       .wb_err_o(mast_if.ERR_I),
	       // TBD eth_top doesn't have this: .wb_inta_o(mast_if.inta_o),
	       // WISHBONE master
	       /*.m_wb_adr_o(eth_ma_wb_adr_o),     .m_wb_sel_o(eth_ma_wb_sel_o), .m_wb_we_o(eth_ma_wb_we_o),
		.m_wb_dat_i(eth_ma_wb_dat_i),     .m_wb_dat_o(eth_ma_wb_dat_o), .m_wb_cyc_o(eth_ma_wb_cyc_o),
		.m_wb_stb_o(eth_ma_wb_stb_o),     .m_wb_ack_i(eth_ma_wb_ack_i), .m_wb_err_i(eth_ma_wb_err_i),
		*/
	       .m_wb_adr_o(slv_if.ADR_I),
	       .m_wb_sel_o(slv_if.SEL_I),
	       .m_wb_we_o(slv_if.WE_I),
	       .m_wb_dat_i(slv_if.DAT_O),
	       .m_wb_dat_o(slv_if.DAT_I),
	       .m_wb_cyc_o(slv_if.CYC_I),
	       .m_wb_stb_o(slv_if.STB_I),
	       .m_wb_ack_i(slv_if.ACK_O),
	       .m_wb_err_i(slv_if.ERR_O),

	       //TX
	       .mtx_clk_pad_i(mtx_clk), .mtxd_pad_o(MTxD), .mtxen_pad_o(MTxEn), .mtxerr_pad_o(MTxErr),
	       //RX
	       .mrx_clk_pad_i(mrx_clk), .mrxd_pad_i(MRxD), .mrxdv_pad_i(MRxDV), .mrxerr_pad_i(MRxErr), 
	       .mcoll_pad_i(MColl),    .mcrs_pad_i(MCrs), 
      
	       // MIIM
	       .mdc_pad_o(Mdc_O), .md_pad_i(Mdi_I), .md_pad_o(Mdo_O), .md_padoe_o(Mdo_OE),
      
	       .wb_rst_i(mast_if.rst),
	       .wb_clk_i(mast_if.clk),
	       .int_o(intr_w)
	       );

   

   eth_phy eth_phy
     (
      // WISHBONE reset
      .m_rst_n_i(!rst),

      // MAC TX
      .mtx_clk_o(mtx_clk),    .mtxd_i(MTxD),    .mtxen_i(MTxEn),    .mtxerr_i(MTxErr),

      // MAC RX
      .mrx_clk_o(mrx_clk),    .mrxd_o(MRxD),    .mrxdv_o(MRxDV),    .mrxerr_o(MRxErr),
      .mcoll_o(MColl),        .mcrs_o(MCrs),

      // MIIM
      .mdc_i(Mdc_O),          .md_io(Mdio_IO),

      // SYSTEM
      .phy_log(phy_log_file_desc)
      );

   //Driver reset depending on rst_delay
   initial
     begin
        wb_clk = 0;
        rst = 0;
	#150 rst = 1;
        repeat (rst_delay) @(wb_clk);
        rst = 1'b0;
        @(wb_clk);
	//#10000000 $finish;

     end

   initial begin
      phy_log_file_desc = $fopen("../log/eth_tb_phy.log");
      if (phy_log_file_desc < 2)
	begin
	   $display("*E Could not open/create eth_tb_phy.log file in ../log/ directory!");
	   $finish;
	end
      $fdisplay(phy_log_file_desc, "================ PHY Module  Testbench access log ================");
      $fdisplay(phy_log_file_desc, " ");
   end

endmodule: eth_env_top

`endif // ETH_ENV_TOP__SV
