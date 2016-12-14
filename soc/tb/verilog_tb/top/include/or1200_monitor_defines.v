
//
// Top of TB
//
`define TB_TOP orpsoc_testbench

//
// Top of DUT
//
`define DUT_TOP `TB_TOP.dut

//
// Top of OR1200 inside test bench
//
`define OR1200_TOP `DUT_TOP.or1200_top0

//
// Define to enable lookup file generation
//
//`define OR1200_MONITOR_LOOKUP

//
// Define to enable SPR access log file generation
//
//`define OR1200_MONITOR_SPRS

//
// Enable logging of state during execution
//
//`define OR1200_MONITOR_EXEC_STATE

//
// Enable disassembly of instructions in execution state log
//
//`define OR1200_MONITOR_EXEC_LOG_DISASSEMBLY

//
// Enable verbose report l.nops (to both general log file and stdout)
//
`define OR1200_MONITOR_VERBOSE_NOPS

//
// Enable monitoring of control and execution flow (experimental)
//
//`define OR1200_SYSTEM_CHECKER

// Can either individually enable things above, or usually have the scripts
// running the simulation pass the PROCESSOR_MONITOR_ENABLE_LOGS define to
// enable them all.

`ifdef PROCESSOR_MONITOR_ENABLE_LOGS
 `define OR1200_MONITOR_EXEC_STATE
 `define OR1200_MONITOR_SPRS
 `define OR1200_MONITOR_LOOKUP
`endif

//
// Memory coherence checking (double check instruction in fetch stage against
// what is in memory.) Useful for cache controller development.
//
//`define MEM_COHERENCE_CHECK

//
// Top of OR1200 inside test bench
//
`define CPU or1200
`define CPU_cpu or1200_cpu
`define CPU_rf or1200_rf
`define CPU_except or1200_except
`define CPU_ctrl or1200_ctrl
`define CPU_sprs or1200_sprs
`define CPU_immu_top or1200_immu_top
`define CPU_immu_tlb or1200_immu_tlb
`define CPU_CORE_CLK `OR1200_TOP.`CPU_cpu.`CPU_ctrl.clk


`define OR1K_OPCODE_POS 31:26
`define OR1K_J_BR_IMM_POS 25:0
`define OR1K_RD_POS 25:21
`define OR1K_RA_POS 20:16
`define OR1K_RB_POS 15:11
`define OR1K_ALU_OP_POS 3:0
   
`define OR1K_SHROT_OP_POS 7:6
`define OR1K_SHROTI_IMM_POS 5:0
`define OR1K_SF_OP 25:21
   
`define OR1K_XSYNC_OP_POS 25:21  
