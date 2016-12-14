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

//

`ifndef WB_CONMAX_ENV_TB_MOD__SV
 `define WB_CONMAX_ENV_TB_MOD__SV
 `include "mstr_slv_intfs.incl"
 `timescale 1ns/1ps

module wb_conmax_env_tb_mod;

   import uvm_pkg::*;

 `include "wb_conmax_env_inc.sv"
 `include "wb_conmax_base_test.sv"
 `include "wb_conmax_alter_verbosity.sv"
 `include "wb_conmax_env_tb_mod.sv"
 `include "wb_conmax_factory_instance_override.sv"
 `include "wb_conmax_factory_type_override.sv"
 `include "wb_conmax_flat_sequence.sv"
 `include "wb_conmax_instance_callback_test.sv"
 `include "wb_conmax_parallel_sequence.sv"
 `include "wb_conmax_typewide_callback_test.sv"
 `include "wb_conmax_commandline_test_1.sv"
 `include "wb_conmax_simple_cmdline_proc.sv"
 `include "wb_conmax_factory_instance_override_cmdline.sv"
 `include "wb_conmax_report_file.sv"
 `include "wb_conmax_alter_message.sv"
   typedef virtual wb_master_if mst_if ;
   typedef virtual wb_slave_if slv_if ;

   initial begin
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent[00]","mst_if",wb_conmax_tb_top.mast_if0); 
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent[01]","mst_if",wb_conmax_tb_top.mast_if1); 
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent[02]","mst_if",wb_conmax_tb_top.mast_if2); 
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent[03]","mst_if",wb_conmax_tb_top.mast_if3); 
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent[04]","mst_if",wb_conmax_tb_top.mast_if4); 
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent[05]","mst_if",wb_conmax_tb_top.mast_if5); 
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent[06]","mst_if",wb_conmax_tb_top.mast_if6); 
      uvm_config_db #(mst_if)::set(null,"uvm_test_top.env.master_agent[07]","mst_if",wb_conmax_tb_top.mast_if7); 

      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[00]","slv_if",wb_conmax_tb_top.slave_if0); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[01]","slv_if",wb_conmax_tb_top.slave_if1); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[02]","slv_if",wb_conmax_tb_top.slave_if2); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[03]","slv_if",wb_conmax_tb_top.slave_if3); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[04]","slv_if",wb_conmax_tb_top.slave_if4); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[05]","slv_if",wb_conmax_tb_top.slave_if5); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[06]","slv_if",wb_conmax_tb_top.slave_if6); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[07]","slv_if",wb_conmax_tb_top.slave_if7); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[08]","slv_if",wb_conmax_tb_top.slave_if8); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[09]","slv_if",wb_conmax_tb_top.slave_if9); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[10]","slv_if",wb_conmax_tb_top.slave_if10); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[11]","slv_if",wb_conmax_tb_top.slave_if11); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[12]","slv_if",wb_conmax_tb_top.slave_if12); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[13]","slv_if",wb_conmax_tb_top.slave_if13); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[14]","slv_if",wb_conmax_tb_top.slave_if14); 
      uvm_config_db #(slv_if)::set(null,"uvm_test_top.env.slave_agent[15]","slv_if",wb_conmax_tb_top.slave_if15); 

      run_test();
   end

endmodule: wb_conmax_env_tb_mod

`endif // WB_CONMAX_ENV_TB_MOD__SV

