// synopsys translate_off
`include "timescale.v"
// synopsys translate_on

`include "or1k_top.h"
`include "or1200_defines.v"

module or1k_top (
  // System
  clk_i, rst_i, pic_ints_i,

  // Instruction WISHBONE INTERFACE
  iwb_clk_i, iwb_rst_i, iwb_ack_i, iwb_err_i, iwb_rty_i, iwb_dat_i,
  iwb_cyc_o, iwb_adr_o, iwb_stb_o, iwb_we_o, iwb_sel_o,
  iwb_cti_o, iwb_bte_o,
  // Data WISHBONE INTERFACE
  dwb_clk_i, dwb_rst_i, dwb_ack_i, dwb_err_i, dwb_rty_i, dwb_dat_i,
  dwb_cyc_o, dwb_adr_o, dwb_stb_o, dwb_we_o, dwb_sel_o, dwb_dat_o,
  dwb_cti_o, dwb_bte_o,
  // Data WISHBONE INTERFACE
  dbgwb_clk_i, dbgwb_rst_i, dbgwb_ack_i, dbgwb_err_i, dbgwb_dat_i,
  dbgwb_cyc_o, dbgwb_adr_o, dbgwb_stb_o, dbgwb_we_o, dbgwb_sel_o, dbgwb_dat_o,
  dbgwb_cti_o, dbgwb_bte_o,
  
    // JTAG I/O pads
    tms_pad_i               , // JTAG Test Mode Select pad                    
    tck_pad_i               , // JTAG Test ClocK pad                          
    tdi_pad_i               , // JTAG Test Data Input pad                     
    tdo_pad_o               , // JTAG Test Data Output pad                    
    tdo_padoe_o
);

// System
input clk_i;
input rst_i;
input [`OR1200_PIC_INTS-1:0] pic_ints_i;
// Instruction WB
input iwb_clk_i;
input iwb_rst_i;
input iwb_ack_i;
input iwb_err_i;
input iwb_rty_i;
input [31:0] iwb_dat_i;
output iwb_cyc_o;
output [31:0] iwb_adr_o;
output iwb_stb_o;
output iwb_we_o;
output [3:0] iwb_sel_o;
output [2:0] iwb_cti_o;
output [1:0] iwb_bte_o;
// Data WB
input dwb_clk_i;
input dwb_rst_i;
input dwb_ack_i;
input dwb_err_i;
input dwb_rty_i;
input [31:0] dwb_dat_i;
output dwb_cyc_o;
output [31:0] dwb_adr_o;
output dwb_stb_o;
output dwb_we_o;
output [3:0] dwb_sel_o;
output [31:0] dwb_dat_o;
output [2:0] dwb_cti_o;
output [1:0] dwb_bte_o;
// Debug WB
input dbgwb_clk_i;
input dbgwb_rst_i;
input dbgwb_ack_i;
input dbgwb_err_i;
input [31:0] dbgwb_dat_i;
output dbgwb_cyc_o;
output [31:0] dbgwb_adr_o;
output dbgwb_stb_o;
output dbgwb_we_o;
output [3:0] dbgwb_sel_o;
output [31:0] dbgwb_dat_o;
output [2:0] dbgwb_cti_o;
output [1:0] dbgwb_bte_o;
// JTAG
input     tck_pad_i;
input     tms_pad_i;
input     tdi_pad_i;
output    tdo_pad_o;
output    tdo_padoe_o;
//signals
wire    capture_dr_o;
wire    shift_dr_o;
wire    pause_dr_o;
wire    update_dr_o;
wire    extest_select_o;
wire    sample_preload_select_o;
wire    debug_select_o;
wire    mbist_select_o;
wire    tdo_o;
wire    debug_tdi_o;

//-------------------------------------------------------
//OR1200 other RISC Architecture 1 32-bit processor
//-------------------------------------------------------
//Debug interface
wire    dbg_stall_i;
wire    dbg_bp_o;
wire    dbg_stb_i;
wire    dbg_we_i;
wire[31:0]  cpu0_addr_o;
wire[31:0]  cpu0_data_o1, cpu0_data_o2;
wire[31:0]  dbg_dat_i;
wire    dbg_ack_o;
wire    cpu0_stall_o;
wire    cpu0_stb_o;
wire    cpu0_we_o;
wire    dwb_stb_o_tmp;

assign dwb_stb_o = (dwb_cyc_o == 1'b1) ? dwb_stb_o_tmp : 1'b0;


`ifndef USE_OR1200_OTHER			// use OR1200r2 processor IP

//=============================================================================
//
// OR1200r2 RISC Architecture 32-bit processor instantation
//
//=============================================================================
or1200_top i_or1200_top(
  // System
  .clk_i        ( clk_i       ),
  .rst_i        ( rst_i       ),
  .pic_ints_i   ( pic_ints_i  ),
  .clmode_i     ( 2'b0        ),
  
  // Instruction WISHBONE INTERFACE  
  .iwb_clk_i    ( iwb_clk_i   ),
  .iwb_rst_i    ( iwb_rst_i   ),

  .iwb_cyc_o    ( iwb_cyc_o   ),
  .iwb_adr_o    ( iwb_adr_o   ),
  .iwb_stb_o    ( iwb_stb_o   ),
  .iwb_we_o     ( iwb_we_o    ),
  .iwb_sel_o    ( iwb_sel_o   ),
  .iwb_dat_o    (             ),
  .iwb_cti_o    ( iwb_cti_o   ), 
  .iwb_bte_o    ( iwb_bte_o   ),
  .iwb_ack_i    ( iwb_ack_i   ),
  .iwb_err_i    ( iwb_err_i   ),
  .iwb_rty_i    ( iwb_rty_i   ),
  .iwb_dat_i    ( iwb_dat_i   ),
  
  // Data WISHBONE INTERFACE
  .dwb_clk_i    ( dwb_clk_i   ),
  .dwb_rst_i    ( dwb_rst_i   ),
  
  .dwb_cyc_o    ( dwb_cyc_o   ),
  .dwb_adr_o    ( dwb_adr_o   ),
  .dwb_stb_o    ( dwb_stb_o_tmp ),
  .dwb_we_o     ( dwb_we_o    ),
  .dwb_sel_o    ( dwb_sel_o   ),
  .dwb_dat_o    ( dwb_dat_o   ),
  .dwb_cti_o    ( dwb_cti_o   ), 
  .dwb_bte_o    ( dwb_bte_o   ),
  .dwb_ack_i    ( dwb_ack_i   ),
  .dwb_err_i    ( dwb_err_i   ),
  .dwb_rty_i    ( dwb_rty_i   ),
  .dwb_dat_i    ( dwb_dat_i   ),

  // External Debug Interface
  .dbg_stall_i  ( cpu0_stall_o  ),
  .dbg_ewt_i    ( 1'b0 ),
  .dbg_lss_o    (     ),
  .dbg_is_o     (     ),
  .dbg_wp_o     (     ),
  .dbg_bp_o     ( dbg_bp_o     ),
  .dbg_stb_i    ( cpu0_stb_o   ),
  .dbg_we_i     ( cpu0_we_o    ),
  .dbg_adr_i    ( cpu0_addr_o  ),
  .dbg_dat_o    ( cpu0_data_o1 ),
  .dbg_dat_i    ( cpu0_data_o2 ),
  .dbg_ack_o    ( dbg_ack_o    ),

  // Power Management
  .pm_cpustall_i  ( 1'b0  ),
  .pm_clksd_o     (   ),
  .pm_dc_gate_o   (   ),
  .pm_ic_gate_o   (   ),
  .pm_dmmu_gate_o (   ),
  .pm_immu_gate_o (   ),
  .pm_tt_gate_o   (   ),
  .pm_cpu_gate_o  (   ),
  .pm_wakeup_o    (   ),
  .pm_lvolt_o     (   )
);

`else		// use other OR1200 version processor IP

//=============================================================================
//
// OR1200 other RISC Architecture 32-bit processor instantation
//
//=============================================================================
or1200_other_top i_or1200_top(
  // System
  .clk_i      ( clk_i     ),
  .rst_i      ( rst_i     ),
  .pic_ints_i ( pic_ints_i      ),
  .clmode_i   ( 2'b0      ),

  // Instruction WISHBONE INTERFACE
  .iwb_clk_i    ( iwb_clk_i   ),
  .iwb_rst_i    ( iwb_rst_i   ),
  
  .iwb_cyc_o    ( iwb_cyc_o   ),
  .iwb_adr_o    ( iwb_adr_o   ),
  .iwb_stb_o    ( iwb_stb_o   ),
  .iwb_we_o     ( iwb_we_o    ),
  .iwb_sel_o    ( iwb_sel_o   ),
  .iwb_dat_o    (             ),
  .iwb_cti_o    ( iwb_cti_o   ), 
  .iwb_bte_o    ( iwb_bte_o   ),
  .iwb_ack_i    ( iwb_ack_i   ),
  .iwb_err_i    ( iwb_err_i   ),
  .iwb_rty_i    ( iwb_rty_i   ),
  .iwb_dat_i    ( iwb_dat_i   ),
  
  // Data WISHBONE INTERFACE
  .dwb_clk_i    ( dwb_clk_i   ),
  .dwb_rst_i    ( dwb_rst_i     ),
  
  .dwb_cyc_o    ( dwb_cyc_o   ),
  .dwb_adr_o    ( dwb_adr_o   ),
  .dwb_stb_o    ( dwb_stb_o_tmp   ),
  .dwb_we_o     ( dwb_we_o    ),
  .dwb_sel_o    ( dwb_sel_o   ),
  .dwb_dat_o    ( dwb_dat_o   ),
  .dwb_cti_o    ( dwb_cti_o   ), 
  .dwb_bte_o    ( dwb_bte_o   ),
  .dwb_ack_i    ( dwb_ack_i   ),
  .dwb_err_i    ( dwb_err_i   ),
  .dwb_rty_i    ( dwb_rty_i   ),
  .dwb_dat_i    ( dwb_dat_i   ),

  // External Debug Interface
  .dbg_stall_i  ( cpu0_stall_o  ),
  .dbg_ewt_i    ( 1'b0 ),
  .dbg_lss_o    (     ),
  .dbg_is_o     (     ),
  .dbg_wp_o     (     ),
  .dbg_bp_o     ( dbg_bp_o    ),
  .dbg_stb_i    ( cpu0_stb_o    ),
  .dbg_we_i     ( cpu0_we_o       ),
  .dbg_adr_i    ( cpu0_addr_o   ),
  .dbg_dat_o    ( cpu0_data_o1    ),
  .dbg_dat_i    ( cpu0_data_o2    ),
  .dbg_ack_o    ( dbg_ack_o   ),

  // Power Management
  .pm_cpustall_i  ( 1'b0  ),
  .pm_clksd_o     (   ),
  .pm_dc_gate_o   (   ),
  .pm_ic_gate_o   (   ),
  .pm_dmmu_gate_o (   ),
  .pm_immu_gate_o (   ),
  .pm_tt_gate_o   (   ),
  .pm_cpu_gate_o  (   ),
  .pm_wakeup_o    (   ),
  .pm_lvolt_o     (   )
);
`endif

//=============================================================================
//
// DEBUG InterFace instantiation 
//
//=============================================================================
dbg_top i_dbg_top(
                // JTAG signals
                .tck_i (tck_pad_i),
                .tdi_i (tdo_o),
                .tdo_o (debug_tdi_o),
                .rst_i (rst_i),

                // TAP states
                .shift_dr_i   (shift_dr_o ),
                .pause_dr_i   (pause_dr_o ),
                .update_dr_i  (update_dr_o),

                // Instructions
                .debug_select_i (debug_select_o),

                // WISHBONE common signals
                .wb_clk_i (clk_i),                                                                                
                // WISHBONE master interface
                .wb_adr_o (dbgwb_adr_o),
                .wb_dat_o (dbgwb_dat_o),
                .wb_dat_i (dbgwb_dat_i),
                .wb_cyc_o (dbgwb_cyc_o),
                .wb_stb_o (dbgwb_stb_o),
                .wb_sel_o (dbgwb_sel_o),
                .wb_we_o  (dbgwb_we_o),
                .wb_ack_i (dbgwb_ack_i),
                .wb_cab_o ( ),
                .wb_err_i (dbgwb_err_i),
                .wb_cti_o (dbgwb_cti_o),
                .wb_bte_o (dbgwb_bte_o),

                // CPU signals
                .cpu0_clk_i   (clk_i), 
                .cpu0_addr_o  (cpu0_addr_o), 
                .cpu0_data_i  (cpu0_data_o1), 
                .cpu0_data_o  (cpu0_data_o2),
                .cpu0_bp_i    (dbg_bp_o),
                .cpu0_stall_o (cpu0_stall_o),
                .cpu0_stb_o   (cpu0_stb_o),
                .cpu0_we_o    (cpu0_we_o),
                .cpu0_ack_i   (dbg_ack_o),
                .cpu0_rst_o   ( )
);

//=============================================================================
//
// JTAG TAP controller instantiation 
//
//=============================================================================
tap_top i_tap_top( 
  // JTAG I/O pads
  .tms_pad_i        ( tms_pad_i   ),
  .tck_pad_i        ( tck_pad_i   ),
  .trst_pad_i       ( rst_i ),
  .tdi_pad_i        ( tdi_pad_i   ),
  .tdo_pad_o        ( tdo_pad_o   ),
  .tdo_padoe_o      ( tdo_padoe_o ),

  //TAP states
  .shift_dr_o     ( shift_dr_o    ),
  .pause_dr_o     ( pause_dr_o    ),
  .update_dr_o    ( update_dr_o   ),
  .capture_dr_o   ( capture_dr_o  ),

  // external TAP registers select signals 
  .extest_select_o          ( ),
  .sample_preload_select_o  ( ),
  .debug_select_o           ( debug_select_o    ),
  .mbist_select_o           ( ),

  // TDO signal for external TAP resgisters 
  .tdo_o      ( tdo_o     ),

   // TDI signals from external TAP resgisters 
  .bs_chain_tdi_i ( 1'b0      ),
  .debug_tdi_i    ( debug_tdi_o   ),
  .mbist_tdi_i    ( 1'b0      )
);

endmodule
