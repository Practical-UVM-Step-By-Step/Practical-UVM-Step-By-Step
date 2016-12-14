//////////////////////////////////////////////////////////////////////
////                                                              ////
////  OR1200's simulation monitor                                 ////
////                                                              ////
////  This file is part of the OpenRISC 1200 project              ////
////  http://www.opencores.org/cores/or1k/                        ////
////                                                              ////
////  Description                                                 ////
////  Simulation monitor                                          ////
////                                                              ////
////  To Do:                                                      ////
////   - move it to bench                                         ////
////                                                              ////
////  Author(s):                                                  ////
////      - Damjan Lampret, lampret@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: or1200_monitor.v,v $
// Revision 1.4  2004/04/05 08:46:06  lampret
// Merged branch_qmem into main tree.
//
// Revision 1.3  2003/04/07 01:32:53  lampret
// Added get_gpr support for OR1200_RFRAM_GENERIC
//
// Revision 1.2  2002/08/12 05:38:11  lampret
// Added more WISHBONE protocol checks. Removed nop.log. Added general.log and lookup.log.
//
// Revision 1.1  2002/03/28 19:59:55  lampret
// Added bench directory
//
// Revision 1.9  2002/02/01 19:56:54  lampret
// Fixed combinational loops.
//
// Revision 1.8  2002/01/28 01:25:22  lampret
// Fixed display of new 'void' nop insns.
//
// Revision 1.7  2002/01/19 14:10:39  lampret
// Fixed OR1200_XILINX_RAM32X1D.
//
// Revision 1.6  2002/01/18 07:57:56  lampret
// Added support for reading XILINX_RAM32X1D register file.
//
// Revision 1.5  2002/01/14 06:19:35  lampret
// Added debug model for testing du. Updated or1200_monitor.
//
// Revision 1.4  2002/01/03 08:40:15  lampret
// Added second clock as RISC main clock. Updated or120_monitor.
//
// Revision 1.3  2001/11/23 08:50:35  lampret
// Typos.
//
// Revision 1.2  2001/11/10 04:22:55  lampret
// Modified monitor tu support exceptions.
//
// Revision 1.1.1.1  2001/11/04 18:51:07  lampret
// First import.
//
// Revision 1.1  2001/08/20 18:17:52  damjan
// Initial revision
//
// Revision 1.1  2001/08/13 03:37:07  lampret
// Added monitor.v and timescale.v
//
// Revision 1.1  2001/07/20 00:46:03  lampret
// Development version of RTL. Libraries are missing.
//
//

`include "timescale.v"
`include "or1200_defines.v"

//
// Top of OR1200 inside test bench
//
`ifndef OR1200_TOP
 `define OR1200_TOP orpsoc_testbench.dut.i_or1k.i_or1200_top
 `include "orpsoc_testbench_defines.v"
`else
 `include `TESTBENCH_DEFINES
`endif
//
// Enable display_arch_state task
//
//`define OR1200_DISPLAY_ARCH_STATE

module or1200_monitor;

   integer fexe;
   reg [23:0] ref;
   integer    fspr;
   integer    fgeneral;
   integer    flookup;
   integer    r3;
   integer    insns;

   //
   // Initialization
   //
   initial begin
      ref = 0;
      fexe = $fopen({`TEST_RESULTS_DIR,`TEST_NAME_STRING,"-executed.log"});
      $timeformat (-9, 2, " ns", 12);
      fspr = $fopen({`TEST_RESULTS_DIR,`TEST_NAME_STRING,"-sprs.log"});
      fgeneral = $fopen({`TEST_RESULTS_DIR,`TEST_NAME_STRING,"-general.log"});
      flookup = $fopen({`TEST_RESULTS_DIR,`TEST_NAME_STRING,"-lookup.log"});
      insns = 0;

   end

   //
   // Get GPR
   //
   task get_gpr;
      input	[4:0]	gpr_no;
      output [31:0] 	gpr;
      integer 		j;
      begin
`ifdef OR1200_RFRAM_GENERIC
	 for(j = 0; j < 32; j = j + 1) begin
	    gpr[j] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.mem[gpr_no*32+j];
	 end
`else
 `ifdef OR1200_XILINX_RAM32X1D
	 gpr[0] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_0.ram32x1d_0.mem[gpr_no];
	 gpr[1] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_0.ram32x1d_1.mem[gpr_no];
	 gpr[2] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_0.ram32x1d_2.mem[gpr_no];
	 gpr[3] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_0.ram32x1d_3.mem[gpr_no];
	 gpr[4] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_0.ram32x1d_4.mem[gpr_no];
	 gpr[5] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_0.ram32x1d_5.mem[gpr_no];
	 gpr[6] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_0.ram32x1d_6.mem[gpr_no];
	 gpr[7] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_0.ram32x1d_7.mem[gpr_no];
	 gpr[8] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_1.ram32x1d_0.mem[gpr_no];
gpr[9] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_1.ram32x1d_1.mem[gpr_no];
	 gpr[10] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_1.ram32x1d_2.mem[gpr_no];
gpr[11] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_1.ram32x1d_3.mem[gpr_no];
	 gpr[12] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_1.ram32x1d_4.mem[gpr_no];
gpr[13] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_1.ram32x1d_5.mem[gpr_no];
	 gpr[14] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_1.ram32x1d_6.mem[gpr_no];
gpr[15] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_1.ram32x1d_7.mem[gpr_no];
	 gpr[16] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_2.ram32x1d_0.mem[gpr_no];
gpr[17] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_2.ram32x1d_1.mem[gpr_no];
gpr[18] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_2.ram32x1d_2.mem[gpr_no];
gpr[19] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_2.ram32x1d_3.mem[gpr_no];
gpr[20] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_2.ram32x1d_4.mem[gpr_no];
gpr[21] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_2.ram32x1d_5.mem[gpr_no];
gpr[22] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_2.ram32x1d_6.mem[gpr_no];
gpr[23] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_2.ram32x1d_7.mem[gpr_no];
gpr[24] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_3.ram32x1d_0.mem[gpr_no];
gpr[25] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_3.ram32x1d_1.mem[gpr_no];
gpr[26] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_3.ram32x1d_2.mem[gpr_no];
gpr[27] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_3.ram32x1d_3.mem[gpr_no];
gpr[28] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_3.ram32x1d_4.mem[gpr_no];
gpr[29] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_3.ram32x1d_5.mem[gpr_no];
gpr[30] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_3.ram32x1d_6.mem[gpr_no];
gpr[31] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.xcv_ram32x8d_3.ram32x1d_7.mem[gpr_no];
 `else
  `ifdef OR1200_XILINX_RAMB4
	 for(j = 0; j < 16; j = j + 1) begin
	    gpr[j] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.ramb4_s16_0.mem[gpr_no*16+j];
	 end
	 for(j = 0; j < 16; j = j + 1) begin
	    gpr[j+16] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.ramb4_s16_1.mem[gpr_no*16+j];
	 end
  `else
   `ifdef OR1200_ARTISAN_SDP
   `else
    `ifdef OR1200_XILINX_RAMB16
     `ifdef legacy_model
	 for(j = 0; j < 32; j = j + 1) begin
	    gpr[j] = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.ramb16_s36_s36.mem[gpr_no*32+j];
	 end
     `else
	 gpr = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.ramb16_s36_s36.mem[gpr_no];
     `endif
    `else
	 gpr = `OR1200_TOP.or1200_cpu.or1200_rf.rf_a.mem[gpr_no];
    `endif
   `endif
  `endif
`endif
`endif
	 end
 endtask

   //
   // Write state of the OR1200 registers into a file
   //
   // Limitation: only a small subset of register file RAMs
   // are supported
   //
   task display_arch_state;
      reg [5:0] i;
      reg [31:0] r;
      integer 	 j;
      begin
`ifdef OR1200_DISPLAY_ARCH_STATE
	 ref = ref + 1;
	 $fdisplay(flookup, "Instruction %d: %t", insns, $time);
	 $fwrite(fexe, "\nEXECUTED(%d): %h:  %h", insns, `OR1200_TOP.or1200_cpu.or1200_except.wb_pc, `OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn);
	 for(i = 0; i < 32; i = i + 1) begin
	    if (i % 4 == 0)
	      $fdisplay(fexe);
	    get_gpr(i, r);
	    $fwrite(fexe, "GPR%d: %h  ", i, r);
	 end
	 $fdisplay(fexe);
	 r = `OR1200_TOP.or1200_cpu.or1200_sprs.sr;
	 $fwrite(fexe, "SR   : %h  ", r);
	 r = `OR1200_TOP.or1200_cpu.or1200_sprs.epcr;
	 $fwrite(fexe, "EPCR0: %h  ", r);
	 r = `OR1200_TOP.or1200_cpu.or1200_sprs.eear;
	 $fwrite(fexe, "EEAR0: %h  ", r);
	 r = `OR1200_TOP.or1200_cpu.or1200_sprs.esr;
	 $fdisplay(fexe, "ESR0 : %h", r);
         insns = insns + 1;
`endif
end
   endtask // display_arch_state

   //
   // Write state of the OR1200 registers into a file; version for exception
   //
   task display_arch_state_except;
      reg [5:0] i;
      reg [31:0] r;
      integer 	 j;
      begin
`ifdef OR1200_DISPLAY_ARCH_STATE
	 ref = ref + 1;
	 $fdisplay(flookup, "Instruction %d: %t", insns, $time);
	 $fwrite(fexe, "\nEXECUTED(%d): %h:  %h  (exception)", insns, `OR1200_TOP.or1200_cpu.or1200_except.ex_pc, `OR1200_TOP.or1200_cpu.or1200_ctrl.ex_insn);
	 for(i = 0; i < 32; i = i + 1) begin
	    if (i % 4 == 0)
	      $fdisplay(fexe);
	    get_gpr(i, r);
	    $fwrite(fexe, "GPR%d: %h  ", i, r);
	 end
	 $fdisplay(fexe);
	 r = `OR1200_TOP.or1200_cpu.or1200_sprs.sr;
	 $fwrite(fexe, "SR   : %h  ", r);
	 r = `OR1200_TOP.or1200_cpu.or1200_sprs.epcr;
	 $fwrite(fexe, "EPCR0: %h  ", r);
	 r = `OR1200_TOP.or1200_cpu.or1200_sprs.eear;
	 $fwrite(fexe, "EEAR0: %h  ", r);
	 r = `OR1200_TOP.or1200_cpu.or1200_sprs.esr;
	 $fdisplay(fexe, "ESR0 : %h", r);
         insns = insns + 1;
`endif
      end      
   endtask // display_arch_state_except
   
   /* Keep a trace buffer of the last lot of instructions and addresses 
    * "executed",as read from the writeback stage, and cause a $finish if we hit
    * an instruction that is invalid, such as all zeros.
    * Currently, only breaks on an all zero instruction, but should probably be 
    * made to break for anything with an X in it too. And of course ideally this
    * shouldn't be needed - but is handy if someone changes something and stops
    * the test continuing forever.
    */
   integer num_nul_inst;
   initial num_nul_inst = 0;
      
   task monitor_for_crash;
      `define OR1200_MONITOR_CRASH_TRACE_SIZE 32
      reg [31:0] insn_trace [0:`OR1200_MONITOR_CRASH_TRACE_SIZE-1]; //Trace buffer of 32 instructions
      reg [31:0] addr_trace [0:`OR1200_MONITOR_CRASH_TRACE_SIZE-1]; //Trace buffer of the addresses of those instructions
      integer i;
      
     begin
	if (`OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn == 32'h00000000)
	  num_nul_inst = num_nul_inst + 1;

	if (num_nul_inst == 1000) // Sat a loop a bit too long...
	  begin
	     $fdisplay(fgeneral, "ERROR - no instruction at PC %h", `OR1200_TOP.or1200_cpu.or1200_except.wb_pc);
	     $fdisplay(fgeneral, "Crash trace: Last %d instructions: ",`OR1200_MONITOR_CRASH_TRACE_SIZE);

	     $fdisplay(fgeneral, "PC\t\tINSTR");
	     for(i=`OR1200_MONITOR_CRASH_TRACE_SIZE-1;i>=0;i=i-1) begin
		$fdisplay(fgeneral, "%h\t%h",addr_trace[i], insn_trace[i]);
	     end
	     #100 $finish;
	  end
	else
	  begin
	     for(i=`OR1200_MONITOR_CRASH_TRACE_SIZE-1;i>0;i=i-1) begin
		insn_trace[i] = insn_trace[i-1];
		addr_trace[i] = addr_trace[i-1];
	     end
	     insn_trace[0] = `OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn;
	     addr_trace[0] = `OR1200_TOP.or1200_cpu.or1200_except.wb_pc;
	  end
	
     end
   endtask // monitor_for_crash

   integer iwb_progress;
   reg [31:0] iwb_progress_addr;
   //
   // WISHBONE bus checker
   //
   always @(posedge `OR1200_TOP.iwb_clk_i)
     if (`OR1200_TOP.iwb_rst_i) begin
	iwb_progress = 0;
	iwb_progress_addr = `OR1200_TOP.iwb_adr_o;
     end
     else begin
	if (`OR1200_TOP.iwb_cyc_o && (iwb_progress != 2)) begin
	   iwb_progress = 1;
	end
	if (`OR1200_TOP.iwb_stb_o) begin
	   if (iwb_progress >= 1) begin
	      if (iwb_progress == 1)
		iwb_progress_addr = `OR1200_TOP.iwb_adr_o; 
	      iwb_progress = 2;
	   end
	   else begin
	      $fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.iwb_stb_o raised without `OR1200_TOP.iwb_cyc_o, at %t\n", $time);
	      #100 $finish;
	   end
	end
	if (`OR1200_TOP.iwb_ack_i & `OR1200_TOP.iwb_err_i) begin
	   $fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.iwb_ack_i and `OR1200_TOP.iwb_err_i raised at the same time, at %t\n", $time);
	end
	if ((iwb_progress == 2) && (iwb_progress_addr != `OR1200_TOP.iwb_adr_o)) begin
	   $fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.iwb_adr_o changed while waiting for `OR1200_TOP.iwb_err_i/`OR1200_TOP.iwb_ack_i, at %t\n", $time);
	   #100 $finish;
	end
	if (`OR1200_TOP.iwb_ack_i | `OR1200_TOP.iwb_err_i)
	  if (iwb_progress == 2) begin
	     iwb_progress = 0;
	     iwb_progress_addr = `OR1200_TOP.iwb_adr_o;
	  end
	  else begin
	     $fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.iwb_ack_i/`OR1200_TOP.iwb_err_i raised without `OR1200_TOP.iwb_cyc_i/`OR1200_TOP.iwb_stb_i, at %t\n", $time);
	     #100 $finish;
	  end
	if ((iwb_progress == 2) && !`OR1200_TOP.iwb_stb_o) begin
	   $fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.iwb_stb_o lowered without `OR1200_TOP.iwb_err_i/`OR1200_TOP.iwb_ack_i, at %t\n", $time);
	   /*			#100 $finish;*/
	end
     end

   integer dwb_progress;
reg [31:0] dwb_progress_addr;
//
// WISHBONE bus checker
//
always @(posedge `OR1200_TOP.dwb_clk_i)
  if (`OR1200_TOP.dwb_rst_i)
    dwb_progress = 0;
  else begin
     if (`OR1200_TOP.dwb_cyc_o && (dwb_progress != 2))
       dwb_progress = 1;
     if (`OR1200_TOP.dwb_stb_o)
       if (dwb_progress >= 1) begin
	  if (dwb_progress == 1)
	    dwb_progress_addr = `OR1200_TOP.dwb_adr_o; 
	  dwb_progress = 2;
       end
       else begin
	  $fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.dwb_stb_o raised without `OR1200_TOP.dwb_cyc_o, at %t\n", $time);
	  #100 $finish;
       end
     if (`OR1200_TOP.dwb_ack_i & `OR1200_TOP.dwb_err_i) begin
	$fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.dwb_ack_i and `OR1200_TOP.dwb_err_i raised at the same time, at %t\n", $time);
     end
     if ((dwb_progress == 2) && (dwb_progress_addr != `OR1200_TOP.dwb_adr_o)) begin
	$fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.dwb_adr_o changed while waiting for `OR1200_TOP.dwb_err_i/`OR1200_TOP.dwb_ack_i, at %t\n", $time);
	#100 $finish;
     end
     if (`OR1200_TOP.dwb_ack_i | `OR1200_TOP.dwb_err_i)
       if (dwb_progress == 2) begin
	  dwb_progress = 0;
	  dwb_progress_addr = `OR1200_TOP.dwb_adr_o;
       end
       else begin
	  $fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.dwb_ack_i/`OR1200_TOP.dwb_err_i raised without `OR1200_TOP.dwb_cyc_i/`OR1200_TOP.dwb_stb_i, at %t\n", $time);
	  #100 $finish;
       end
     if ((dwb_progress == 2) && !`OR1200_TOP.dwb_stb_o) begin
	$fdisplay(fgeneral, "WISHBONE protocol violation: `OR1200_TOP.dwb_stb_o lowered without `OR1200_TOP.dwb_err_i/`OR1200_TOP.dwb_ack_i, at %t\n", $time);
	#100 $finish;
     end
       end

//
// Hooks for:
// - displaying registers
// - end of simulation
// - access to SPRs
//
   always @(posedge `OR1200_TOP.or1200_cpu.or1200_ctrl.clk)
     if (!`OR1200_TOP.or1200_cpu.or1200_ctrl.wb_freeze) begin
	#2;
	if (((`OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn[31:26] != `OR1200_OR32_NOP) || !`OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn[16])
	    && !(`OR1200_TOP.or1200_cpu.or1200_except.except_flushpipe && `OR1200_TOP.or1200_cpu.or1200_except.ex_dslot))
	  begin
	     display_arch_state;
	     monitor_for_crash;
	  end
	else
	  if (`OR1200_TOP.or1200_cpu.or1200_except.except_flushpipe)
	    display_arch_state_except;
	if (`OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn == 32'h1500_0001) begin // small hack to stop simulation (l.nop 1)
	   get_gpr(3, r3);
	   $fdisplay(fgeneral, "%t: l.nop exit (%h)", $time, r3);
	   $finish;
	end
	if (`OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn == 32'h1500_000a) begin // debug if test (l.nop 10)
	   $fdisplay(fgeneral, "%t: l.nop dbg_if_test", $time);
`ifdef DBG_IF_MODEL
	   xess_top.i_xess_fpga.dbg_if_model.dbg_if_test_go = 1;
`endif
	end
if (`OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn == 32'h1500_0002) begin // simulation reports (l.nop 2)
   get_gpr(3, r3);
   $fdisplay(fgeneral, "%t: l.nop report (%h)", $time, r3);
end
	if (`OR1200_TOP.or1200_cpu.or1200_ctrl.wb_insn == 32'h1500_0003) begin // simulation printfs (l.nop 3)
	   get_gpr(3, r3);
	   $fdisplay(fgeneral, "%t: l.nop printf (%h)", $time, r3);
	end
	if (`OR1200_TOP.or1200_cpu.or1200_sprs.sprs_op == `OR1200_ALUOP_MTSR)  // l.mtspr
	  $fdisplay(fspr, "%t: Write to SPR : [%h] <- %h", $time,
		    `OR1200_TOP.or1200_cpu.or1200_sprs.spr_addr, `OR1200_TOP.or1200_cpu.or1200_sprs.spr_dat_o);
	if (`OR1200_TOP.or1200_cpu.or1200_sprs.sprs_op == `OR1200_ALUOP_MFSR)  // l.mfspr
	  $fdisplay(fspr, "%t: Read from SPR: [%h] -> %h", $time,
		    `OR1200_TOP.or1200_cpu.or1200_sprs.spr_addr, `OR1200_TOP.or1200_cpu.or1200_sprs.to_wbmux);
     end

endmodule
