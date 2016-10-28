`ifndef TEST__SV2
`define TEST__SV2

class simple_reg_access_test_resdb extends simple_ral_env_test;

  `uvm_component_utils(simple_reg_access_test_resdb)
uvm_reg_data_t value_w;
  uvm_reg_data_t value_r;
    uvm_reg rg;
uvm_status_e status;
uvm_reg_single_all_access_seq_resdb m_reg_access_seq;
string m_paths[$];

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task main_phase(uvm_phase phase) ;
	value_w = 32'h12345678;
    phase.raise_objection(this);

	uvm_resource_db #(string)::set("reg_seq","regname_string","r_WC_register",this);
	m_reg_access_seq = new("m_reg_access_seq");
	m_reg_access_seq.regmodel = env.regmodel;
	env.regmodel.print();
	env.regmodel.get_hdl_path(m_paths,"");
	$display("This path is %s %d",m_paths.pop_front(),m_paths.size());
	m_reg_access_seq.start(null);
        m_reg_access_seq.wait_for_sequence_state(UVM_FINISHED);

phase.phase_done.set_drain_time(this,2000);
phase.drop_objection(this);
	
endtask

endclass : simple_reg_access_test_resdb

`endif //TEST__SV2

