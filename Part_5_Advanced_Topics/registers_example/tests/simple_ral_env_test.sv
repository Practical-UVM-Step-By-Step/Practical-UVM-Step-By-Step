`ifndef TEST__SV
`define TEST__SV
`include "simple_ral_env.sv"
typedef class simple_ral_env;

class simple_ral_env_test extends uvm_test;

  `uvm_component_utils(simple_ral_env_test)

  simple_ral_env env;
  wb_config master_config;


  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      uvm_top.enable_print_topology= 1;
 
    env = simple_ral_env::type_id::create("env", this);
      master_config = wb_config::type_id::create("WB_MASTERConf");
      master_config.randomize with {min_addr == 0; max_addr == 32'h0ffffffe; max_n_wss == 2;};
      uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.master_agent","mstr_agent_cfg",master_config);
      wb_master_seqr::type_id::set_type_override(wb_ral_sequencer::get_type());

  endfunction

endclass : simple_ral_env_test

`endif //TEST__SV

