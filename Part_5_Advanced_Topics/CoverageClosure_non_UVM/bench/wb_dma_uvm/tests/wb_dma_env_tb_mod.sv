//
// Template for UVM-compliant Program block

`ifndef WB_DMA_ENV_TB_MOD__SV
`define WB_DMA_ENV_TB_MOD__SV

`include "mstr_slv_intfs.incl"
module wb_dma_env_tb_mod;

import uvm_pkg::*;

`include "wb_dma_env_ral_env.sv"
`include "wb_dma_env_test.sv"  //ToDo: Change this name to the testcase file-name
uvm_active_passive_enum is_active = UVM_PASSIVE;
   typedef virtual wb_master_if v_if1;
   typedef virtual wb_slave_if v_if2;
   initial begin

      uvm_config_db #(v_if2)::set(null,"uvm_test_top.env.slave_agent0","slv_if",test.wb_slv_if0); 
      uvm_config_db #(v_if2)::set(null,"uvm_test_top.env.slave_agent1","slv_if",test.wb_slv_if1); 

      uvm_config_db #(v_if1)::set(null,"uvm_test_top.env.master_agent0","mst_if",test.wb_mstr_if0); 
      uvm_config_db #(v_if1)::set(null,"uvm_test_top.env.master_agent1","mst_if",test.wb_mstr_if1); 

    uvm_config_db #(uvm_active_passive_enum)::set(null,"uvm_test_top.env.master_agent0","is_active",UVM_PASSIVE);
    uvm_config_db #(uvm_active_passive_enum)::set(null,"uvm_test_top.env.master_agent1","is_active",UVM_PASSIVE);
    uvm_config_db #(uvm_active_passive_enum)::set(null,"uvm_test_top.env.slave_agent0","is_active",UVM_PASSIVE);
    uvm_config_db #(uvm_active_passive_enum)::set(null,"uvm_test_top.env.slave_agent1","is_active",UVM_PASSIVE);
      run_test();
   end

endmodule: wb_dma_env_tb_mod

`endif // WB_DMA_ENV_TB_MOD__SV

