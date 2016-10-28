`ifndef TEST_FACTORY_SV
`define TEST_FACTORY_SV

class simple_reg_access_test_factory extends simple_ral_env_test;

  `uvm_component_utils(simple_reg_access_test_factory)
uvm_reg_data_t value_w;
  uvm_reg_data_t value_r;
    uvm_reg rg;
uvm_status_e status;
uvm_reg_single_all_access_seq_resdb m_reg_access_seq;


	uvm_coreservice_t cs = uvm_coreservice_t::get();
	uvm_factory f = cs.get_factory();

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	f.set_type_override_by_type(ral_reg_simple_ral_env_r_RW_register::get_type(),simple_WR_extension::get_type(),1);
	
  endfunction

  task main_phase(uvm_phase phase) ;
	value_w = 32'h12345678;
    phase.raise_objection(this);

	uvm_resource_db #(string)::set("reg_seq","regname_string","r_RW_register",this);
	m_reg_access_seq = new("m_reg_access_seq");
	m_reg_access_seq.regmodel = env.regmodel;
	m_reg_access_seq.start(null);
        m_reg_access_seq.wait_for_sequence_state(UVM_FINISHED);

phase.phase_done.set_drain_time(this,2000);
phase.drop_objection(this);
	
endtask

endclass : simple_reg_access_test_factory

`endif //TEST_FACTORY_SV

