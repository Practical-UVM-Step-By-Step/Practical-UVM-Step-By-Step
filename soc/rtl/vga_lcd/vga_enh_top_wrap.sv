//synopsys translate_off
`include "timescale.v"
//synopsys translate_on
`include "vga_defines.v"
`include "wb_vga_disp_if.sv"
// 
module vga_enh_top_wrap_if (
	input wb_clk, input wb_rst,  output wb_inta_o,
	wb_master_if mast_if, wb_slave_if slv_if, wb_vga_disp_if disp_if) ;
	//
	// parameters
	//
	parameter ARST_LVL = 1'b0;
	parameter LINE_FIFO_AWIDTH = 7;
/*

	// syscon interface
	input  wb_clk_i;             // wishbone clock input
	input  wb_rst_i;             // synchronous active high reset
	input  rst_i;                // asynchronous reset
	output wb_inta_o;            // interrupt request output




	// slave signals
	input  [11:0] wbs_adr_i;     // addressbus input (only 32bit databus accesses supported)
	input  [31:0] wbs_dat_i;     // Slave databus output
	output [31:0] wbs_dat_o;     // Slave databus input
	input  [ 3:0] wbs_sel_i;     // byte select inputs
	input         wbs_we_i;      // write enabel input
	input         wbs_stb_i;     // strobe/select input
	input         wbs_cyc_i;     // valid bus cycle input
	output        wbs_ack_o;     // bus cycle acknowledge output
	output        wbs_rty_o;     // busy cycle retry output
	output        wbs_err_o;     // bus cycle error output

	// master signals
	output [31:0] wbm_adr_o;     // addressbus output
	input  [31:0] wbm_dat_i;     // Master databus input
	output [ 3:0] wbm_sel_o;     // byte select outputs
	output        wbm_we_o;      // write enable output
	output        wbm_stb_o;     // strobe output
	output        wbm_cyc_o;     // valid bus cycle output
	output [ 2:0] wbm_cti_o;     // cycle type identifier
	output [ 1:0] wbm_bte_o;     // burst type extensions
	input         wbm_ack_i;     // bus cycle acknowledge input
	input         wbm_err_i;     // bus cycle error input

	// VGA signals
	input         clk_p_i;                   // pixel clock
	                                         // in DVI mode this is 2x as high (!!)
*/
vga_enh_top #(1'b1, LINE_FIFO_AWIDTH) u0 (
		.wb_clk_i     ( wb_clk),
		.wb_rst_i     ( wb_rst           ),
		.rst_i        ( wb_rst             ),
		.wb_inta_o    ( wb_inta_o ),

		//-- slave signals
		.wbs_adr_i    ( mast_if.ADR_O[11:0] ),
		.wbs_dat_i    ( mast_if.DAT_O),
		.wbs_dat_o    ( mast_if.DAT_I),
		.wbs_sel_i    ( mast_if.SEL_O),
		.wbs_we_i     ( mast_if.WE_O),
		.wbs_stb_i    ( mast_if.STB_O),
		.wbs_cyc_i    ( mast_if.CYC_O),
		.wbs_ack_o    ( mast_if.ACK_I),
		.wbs_rty_o    ( mast_if.RTY_I),
		.wbs_err_o    ( mast_if.ERR_I),

		//-- master signals
		.wbm_adr_o    ( slv_if.ADR_I[31:0] ),
		.wbm_dat_i    ( slv_if.DAT_O),
		.wbm_sel_o    ( slv_if.SEL_I),
		.wbm_we_o     ( slv_if.WE_I),
		.wbm_stb_o    ( slv_if.STB_I),
		.wbm_cyc_o    ( slv_if.CYC_I),
		.wbm_cti_o    ( ),
		.wbm_bte_o    ( ),
		.wbm_ack_i    ( slv_if.ACK_O),
		.wbm_err_i    ( slv_if.ERR_O),

		//-- VGA signals
		.clk_p_i      ( disp_if.clk_p),
                .hsync_pad_o  ( disp_if.hsync),
		.vsync_pad_o  ( disp_if.vsync           ),
		.csync_pad_o  ( disp_if.csync           ),
		.blank_pad_o  ( disp_if.blank           ),
		.r_pad_o      ( disp_if.red             ),
		.g_pad_o      ( disp_if.green           ),
		.b_pad_o      ( disp_if.blue            )

	);


endmodule


