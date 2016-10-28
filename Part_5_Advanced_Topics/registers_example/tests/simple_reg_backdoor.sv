`ifndef TEST_BKDOOR_SV1
`define TEST_BKDOOR_SV1

class simple_backdoor_test extends simple_ral_env_test;

  `uvm_component_utils(simple_backdoor_test)
uvm_reg_data_t value_w;
  uvm_reg_data_t value_r;
    uvm_reg rg;
uvm_status_e status;
 uvm_reg_single_access_seq reg_access_seq;



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
	reg_access_seq.rg = env.regmodel.;
	reg_access_seq.write_val = value_w;
	reg_access_seq.set_val = 32'h00234567;
	reg_access_seq.poke_val = 32'h1200567;
 
	reg_access_seq.regname_string = "r_RO_register";
	reg_access_seq.start(null);
        reg_access_seq.wait_for_sequence_state(UVM_FINISHED);

phase.phase_done.set_drain_time(this,2000);
phase.drop_objection(this);
	
endtask

endclass : simple_backdoor_test

`endif //TEST_BKDOOR_SV1

