module exampleSOC_testbench;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [7:0]		b_pad_o;		// From dut of exampleSOC_top.v
wire			blank_pad_o;		// From dut of exampleSOC_top.v
wire			clk_p_o;		// From dut of exampleSOC_top.v
wire			csync_pad_o;		// From dut of exampleSOC_top.v
wire			dbg_tdo_pad_o;		// From dut of exampleSOC_top.v
wire [1:1]		eth_md_pad_io;		// To/From dut of exampleSOC_top.v
wire [1:1]		eth_mdc_pad_o;		// From dut of exampleSOC_top.v
wire [1:1]		eth_sync_pad_o;		// From dut of exampleSOC_top.v
wire [1:1]		eth_tx_pad_o;		// From dut of exampleSOC_top.v
wire [7:0]		g_pad_o;		// From dut of exampleSOC_top.v
wire [7:0]		gpio_a_pad_io;		// To/From dut of exampleSOC_top.v
wire			hsync_pad_o;		// From dut of exampleSOC_top.v
wire			m_ack_pad_o;		// From dut of exampleSOC_top.v
wire [31:0]		m_data_pad_o;		// From dut of exampleSOC_top.v
wire			m_err_pad_o;		// From dut of exampleSOC_top.v
wire			m_rty_pad_o;		// From dut of exampleSOC_top.v
wire [12:0]		mem_adr_pad_o;		// From dut of exampleSOC_top.v
wire [1:0]		mem_ba_pad_o;		// From dut of exampleSOC_top.v
wire			mem_cas_pad_o;		// From dut of exampleSOC_top.v
wire			mem_cke_pad_o;		// From dut of exampleSOC_top.v
wire			mem_cs_pad_o;		// From dut of exampleSOC_top.v
wire [15:0]		mem_dat_pad_io;		// To/From dut of exampleSOC_top.v
wire [1:0]		mem_dqm_pad_o;		// From dut of exampleSOC_top.v
wire			mem_ras_pad_o;		// From dut of exampleSOC_top.v
wire			mem_we_pad_o;		// From dut of exampleSOC_top.v
wire [7:0]		r_pad_o;		// From dut of exampleSOC_top.v
wire			rst_pad_o;		// From dut of exampleSOC_top.v
wire			spi1_mosi_pad_o;	// From dut of exampleSOC_top.v
wire			spi1_sclk_pad_o;	// From dut of exampleSOC_top.v
wire			spi1_ss_pad_o;		// From dut of exampleSOC_top.v
wire			spi_flash_hold_n_pad_o;	// From dut of exampleSOC_top.v
wire			spi_flash_mosi_pad_o;	// From dut of exampleSOC_top.v
wire			spi_flash_sclk_pad_o;	// From dut of exampleSOC_top.v
wire			spi_flash_ss_pad_o;	// From dut of exampleSOC_top.v
wire			spi_flash_w_n_pad_o;	// From dut of exampleSOC_top.v
wire			spi_sd_mosi_pad_o;	// From dut of exampleSOC_top.v
wire			spi_sd_sclk_pad_o;	// From dut of exampleSOC_top.v
wire			spi_sd_ss_pad_o;	// From dut of exampleSOC_top.v
wire			uart0_stx_pad_o;	// From dut of exampleSOC_top.v
wire			vsync_pad_o;		// From dut of exampleSOC_top.v
// End of automatics


exampleSOC_top dut(/*AUTOINST*/
		   // Outputs
		   .spi_sd_sclk_pad_o	(spi_sd_sclk_pad_o),
		   .spi_sd_ss_pad_o	(spi_sd_ss_pad_o),
		   .spi_sd_mosi_pad_o	(spi_sd_mosi_pad_o),
		   .spi_flash_sclk_pad_o(spi_flash_sclk_pad_o),
		   .spi_flash_ss_pad_o	(spi_flash_ss_pad_o),
		   .spi_flash_mosi_pad_o(spi_flash_mosi_pad_o),
		   .spi_flash_w_n_pad_o	(spi_flash_w_n_pad_o),
		   .spi_flash_hold_n_pad_o(spi_flash_hold_n_pad_o),
		   .mem_adr_pad_o	(mem_adr_pad_o[12:0]),
		   .mem_dqm_pad_o	(mem_dqm_pad_o[1:0]),
		   .mem_ba_pad_o	(mem_ba_pad_o[1:0]),
		   .mem_cs_pad_o	(mem_cs_pad_o),
		   .mem_ras_pad_o	(mem_ras_pad_o),
		   .mem_cas_pad_o	(mem_cas_pad_o),
		   .mem_we_pad_o	(mem_we_pad_o),
		   .mem_cke_pad_o	(mem_cke_pad_o),
		   .eth_sync_pad_o	(eth_sync_pad_o[1:1]),
		   .eth_tx_pad_o	(eth_tx_pad_o[1:1]),
		   .eth_mdc_pad_o	(eth_mdc_pad_o[1:1]),
		   .spi1_mosi_pad_o	(spi1_mosi_pad_o),
		   .spi1_ss_pad_o	(spi1_ss_pad_o),
		   .spi1_sclk_pad_o	(spi1_sclk_pad_o),
		   .uart0_stx_pad_o	(uart0_stx_pad_o),
		   .dbg_tdo_pad_o	(dbg_tdo_pad_o),
		   .rst_pad_o		(rst_pad_o),
		   .clk_p_o		(clk_p_o),
		   .hsync_pad_o		(hsync_pad_o),
		   .vsync_pad_o		(vsync_pad_o),
		   .csync_pad_o		(csync_pad_o),
		   .blank_pad_o		(blank_pad_o),
		   .r_pad_o		(r_pad_o[7:0]),
		   .g_pad_o		(g_pad_o[7:0]),
		   .b_pad_o		(b_pad_o[7:0]),
		   .m_data_pad_o	(m_data_pad_o[31:0]),
		   .m_ack_pad_o		(m_ack_pad_o),
		   .m_err_pad_o		(m_err_pad_o),
		   .m_rty_pad_o		(m_rty_pad_o),
		   // Inouts
		   .mem_dat_pad_io	(mem_dat_pad_io[15:0]),
		   .eth_md_pad_io	(eth_md_pad_io[1:1]),
		   .gpio_a_pad_io	(gpio_a_pad_io[8-1:0]),
		   // Inputs
		   .spi_sd_miso_pad_i	(spi_sd_miso_pad_i),
		   .spi_flash_miso_pad_i(spi_flash_miso_pad_i),
		   .eth_rx_pad_i	(eth_rx_pad_i[1:1]),
		   .eth_clk_pad_i	(eth_clk_pad_i),
		   .spi1_miso_pad_i	(spi1_miso_pad_i),
		   .uart0_srx_pad_i	(uart0_srx_pad_i),
		   .dbg_tdi_pad_i	(dbg_tdi_pad_i),
		   .dbg_tck_pad_i	(dbg_tck_pad_i),
		   .dbg_tms_pad_i	(dbg_tms_pad_i),
		   .rst_pad_i		(rst_pad_i),
		   .clk_pad_i		(clk_pad_i),
		   .clk_i		(clk_i),
		   .m_data_pad_i	(m_data_pad_i[31:0]),
		   .m_addr_pad_i	(m_addr_pad_i[31:0]),
		   .m_sel_pad_i		(m_sel_pad_i),
		   .m_we_pad_i		(m_we_pad_i),
		   .m_cyc_pad_i		(m_cyc_pad_i),
		   .m_stb_pad_i		(m_stb_pad_i));

`ifdef JTAG_DEBUG
 `ifdef VPI_DEBUG
   // Debugging interface
   vpi_debug_module vpi_dbg
     (
      .tms(tms_pad_i),
      .tck(tck_pad_i),
      .tdi(tdi_pad_i),
      .tdo(tdo_pad_o)
      );
 `else  
   // If no VPI debugging, tie off JTAG inputs
   assign tdi_pad_i = 1;
   assign tck_pad_i = 0;
   assign tms_pad_i = 1;
 `endif // !`ifdef VPI_DEBUG_ENABLE
`endif //  `ifdef JTAG_DEBUG



`ifdef UART0
   //
   // UART0 decoder
   //
   uart_decoder
     #(
        .uart_baudrate_period_ns(8680) // 115200 baud = period 8.68uS
        )
   uart0_decoder
     (
      .clk(clk),
      .uart_tx(uart0_stx_pad_o)
      );

   // UART0 stimulus
   /*
   uart_stim
     #(
        .uart_baudrate_period_ns(8680) // 115200 baud = period 8.68uS
        )
   uart0_stim
     (
      .clk(clk),
      .uart_rx(uart0_srx_pad_i)
      );
    */
   // UART0 is looped back for now
   assign uart0_srx_pad_i = uart0_stx_pad_o;

`endif //  `ifdef UART0

endmodule
