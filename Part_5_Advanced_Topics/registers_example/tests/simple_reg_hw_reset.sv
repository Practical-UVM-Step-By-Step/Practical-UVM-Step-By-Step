`ifndef TEST__SV1_reg_hw_reset
`define TEST__SV1_reg_hw_reset


class reg_hw_reset_test extends simple_ral_env_test;

  `uvm_component_utils(reg_hw_reset_test)
uvm_reg_data_t value_w;
  uvm_reg_data_t value_r;
    uvm_reg rg;
uvm_status_e status;



  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase) ;
 uvm_reg_hw_reset_seq seq = uvm_reg_hw_reset_seq::type_id::create("ral_uvm_reg_hw_reset_seq",this);
	value_w = 32'h12345678;
        seq.model = env.regmodel;
        seq.start(null);
        seq.wait_for_sequence_state(UVM_FINISHED);

phase.phase_done.set_drain_time(this,2000);
phase.drop_objection(this);
	
endtask

endclass : reg_hw_reset_test


`endif //TEST__SV1

