
`ifndef SIMPLE_RAL_ENV_TB_MOD__SV
`define SIMPLE_RAL_ENV_TB_MOD__SV

`include "timescale.v"
`include "mstr_slv_intfs.incl"
module simple_ral_env_tb_mod;

import uvm_pkg::*;

`include "simple_ral_env.sv"
`include "simple_ral_env_test.sv"  //ToDo: Change this name to the testcase file-name
// `include "simple_reg_access_test.sv"
 `include "simple_reg_access_test_resdb.sv"
`include "simple_reg_access_test_factory.sv"
`include "simple_reg_access_test_callback.sv"
// `include "simple_reg_backdoor.sv"

`include "simple_reg_hw_reset.sv"
`include "simple_RC_register.sv"
//`include "simple_uvm_reg_bit_bash_seq.sv"

   typedef virtual wb_master_if v_if1;
   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",simple_ral_env_top.mst_if); 
     uvm_reg::include_coverage("*",UVM_NO_COVERAGE);

      run_test();
   end

endmodule: simple_ral_env_tb_mod

`endif // SIMPLE_RAL_ENV_TB_MOD__SV

