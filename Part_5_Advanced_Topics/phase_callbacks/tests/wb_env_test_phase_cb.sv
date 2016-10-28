`ifndef WB_ENV_PHASE_CB_TEST
 `define WB_ENV_PHASE_CB_TEST
typedef class wb_env_env;


class my_uvm_phase_cb extends uvm_phase_cb;
   `uvm_object_utils(my_uvm_phase_cb)

   function void phase_state_change( uvm_phase phase, uvm_phase_state_change change);
      uvm_phase_state old_state = change.get_prev_state();
      uvm_phase_state new_state = change.get_state();

      `uvm_info("PHASE STATE_CHANGE ", $psprintf("phase name: %s , OLD STATE %s, NEW STATE : %s\n",phase.get_name(),old_state.name(),new_state.name()),UVM_LOW)

   endfunction

   function new(string name="my_phase_cb");
      super.new(name);
   endfunction

endclass

class wb_env_phase_cb_test extends uvm_test;
   bit test_pass = 1;
   wb_config master_config;
   wb_config slave_config;
   int slave_adr_max ;
   int slave_adr_min;
   my_uvm_phase_cb my_phase_cb;


   `uvm_component_utils(wb_env_phase_cb_test)

   wb_env_env env;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      slave_adr_min = 32'h0;
      slave_adr_max = 32'h0fffffe;
      my_phase_cb = new("my simple phase callback");
      
      uvm_phase_cb_pool::add(null,my_phase_cb);

      // Create and Build the configuration
      master_config = wb_config::type_id::create("master_configuration");
      slave_config = wb_config::type_id::create("slave_configuration");
      // Randomize the configuration
      slave_config.randomize with {min_addr == slave_adr_min; max_addr == slave_adr_max; max_n_wss == 2; };
      master_config.randomize with {min_addr == slave_adr_min; max_addr == slave_adr_max; max_n_wss == 2; };
      // Set in Config DB
      uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.master_agent","mstr_agent_cfg",master_config);
      uvm_config_db #(wb_config)::set(null,"uvm_test_top.env.slave_agent","slave_agent_cfg",slave_config);
      env = wb_env_env::type_id::create("env", this);

      uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase", "default_sequence", sequence_1::get_type()); 
   endfunction

   function void report_phase(uvm_phase phase);
      if(test_pass) begin
	 `uvm_info(get_type_name(), "** UVM TEST PASSED **", UVM_NONE)
      end
      else begin
	 `uvm_error(get_type_name(), "** UVM TEST FAIL **")
      end
   endfunction


endclass : wb_env_phase_cb_test

`endif //TEST__SV

