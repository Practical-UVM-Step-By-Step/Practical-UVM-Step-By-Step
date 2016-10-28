//
// Template for UVM-compliant testcase

`ifndef TEST__SV
`define TEST__SV

typedef class simpleenv;

class simple_ral_test2 extends uvm_test;

  `uvm_component_utils(simple_ral_test2)

  simpleenv env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = simpleenv::type_id::create("env", this);
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.mast_seqr.main_phase",
                    "default_sequence", simple_seq::get_type());
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase",
                    "default_sequence", simple_seq::get_type()); 
  endfunction

endclass : simple_ral_test2

`endif //TEST__SV

