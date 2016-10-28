
`ifndef WB_ENV_TB_MOD__SV
`define WB_ENV_TB_MOD__SV

`include "mstr_slv_intfs.incl"
module wb_env_tb_mod;

import uvm_pkg::*;

`include "wb_env_env.sv"
`include "wb_env_test.sv"  
  typedef virtual wb_master_if mst_if ;
 typedef virtual wb_slave_if slv_if ;

   initial begin
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent","mst_if",wb_env_top_mod.mast_if); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent","slv_if",wb_env_top_mod.slave_if);
      run_test();
   end

endmodule: wb_env_tb_mod

`endif // WB_ENV_TB_MOD__SV

