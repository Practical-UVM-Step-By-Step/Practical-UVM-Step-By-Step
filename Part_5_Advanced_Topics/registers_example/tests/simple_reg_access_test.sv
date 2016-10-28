//
// Template for UVM-compliant testcase

`ifndef TEST__SV1
`define TEST__SV1
typedef class uvm_reg_single_all_access_seq;

class simple_reg_access_test extends simple_ral_env_test;

  `uvm_component_utils(simple_reg_access_test)
uvm_reg_data_t value_w;
  uvm_reg_data_t value_r;
    uvm_reg rg;
uvm_status_e status;
uvm_reg_single_all_access_seq reg_access_seq;



  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase) ;
	value_w = 32'h12345678;
    phase.raise_objection(this);
  	reg_access_seq = new("reg_access_seq");
	reg_access_seq.regmodel = env.regmodel;
	reg_access_seq.write_val = value_w;
	reg_access_seq.set_val = 32'h00234567;
	reg_access_seq.poke_val = 32'h1200567;
 
	reg_access_seq.regname_string = "r_RO_register";
	reg_access_seq.start(null);
        reg_access_seq.wait_for_sequence_state(UVM_FINISHED);

phase.phase_done.set_drain_time(this,2000);
phase.drop_objection(this);
	
endtask

endclass : simple_reg_access_test

`endif //TEST__SV1

