//
// Template for UVM-compliant Program block

`ifndef WB_ENV_TB_MOD__SV
`define WB_ENV_TB_MOD__SV

`include "mstr_slv_intfs.incl"
module wb_env_tb_mod;

import uvm_pkg::*;

`include "wb_env_env.sv"
`include "wb_env_slave_test.sv"  //ToDo: Change this name to the testcase file-name

// ToDo: Include all other test list here
   typedef virtual wb_master_if v_if1;
   typedef virtual wb_slave_if v_if2;
   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",wb_env_top_mod.mast_if); 
      uvm_config_db #(v_if2)::set(null,"","slv_if",wb_env_top_mod.slave_if);
     uvm_config_db #(int)::set(null, "", "max_n_wss", 10);
    uvm_config_db #(int)::set(null, "", "min_addr", 0); 
    uvm_config_db #(int)::set(null, "", "max_addr", 10000000); 
   uvm_config_db #(bit) :: set(null,"env.slave_agent","is_active",1);
   uvm_config_db #(bit) :: set(null,"env.master_agent","is_active",1);



      run_test();
   end

endmodule: wb_env_tb_mod

`endif // WB_ENV_TB_MOD__SV

