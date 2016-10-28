//
// Template for UVM-compliant testcase

`ifndef TEST__SV
`define TEST__SV

typedef class wb_env_env;

class wb_env_slave_test extends uvm_test;
bit test_pass = 1;

  `uvm_component_utils(wb_env_slave_test)

  wb_env_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = wb_env_env::type_id::create("env", this);
begin: configure
    // uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase", "default_sequence", wb_master_seqr_sequence_library::get_type()); 
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase", "default_sequence", sequence_1::get_type()); 
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.slave_agent.slv_seqr.main_phase", "default_sequence", ram_sequence::get_type()); 
   
    uvm_config_db #(int)::set(this, "env.slave_agent.slv_agent_cfg", "max_n_wss", 10); 
    uvm_config_db #(int)::set(this, "env.master_agent.mstr_agent_cfg", "max_n_wss", 10); 

    uvm_config_db #(int)::set(this, "env.slave_agent.slv_agent_cfg", "min_addr", 0); 
    uvm_config_db #(int)::set(this, "env.slave_agent.slv_agent_cfg", "max_addr", 100000); 
    uvm_config_db #(int)::set(this, "env.master_agent.mstr_agent_cfg", "min_addr", 0); 
    uvm_config_db #(int)::set(this, "env.master_agent.mstr_agent_cfg", "max_addr", 10000000); 
/*
    uvm_config_db #(int)::set(this, "", "min_addr", 0); 
    uvm_config_db #(int)::set(this, "", "max_addr", 100000); 
    uvm_config_db #(int)::set(this, "", "min_addr", 0); 
    uvm_config_db #(int)::set(this, "", "max_addr", 10000000); 
*/
end 
  endfunction
 task run_phase(uvm_phase phase);
    //set a drain-time for the environment if desired
    phase.phase_done.set_drain_time(this, 50);
  endtask : run_phase

  function void extract_phase(uvm_phase phase);

  endfunction 

  function void report_phase(uvm_phase phase);
    if(test_pass) begin
      `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
    end
    else begin
      `uvm_error(get_type_name(), "** UVM TEST FAIL **")
    end
  endfunction


endclass : wb_env_slave_test

`endif //TEST__SV

