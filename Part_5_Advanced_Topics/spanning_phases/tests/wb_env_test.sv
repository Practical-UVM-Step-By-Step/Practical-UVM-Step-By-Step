`ifndef WB_ENV_TEST
 `define WB_ENV_TEST
typedef class wb_env_env;

class wb_env_test extends uvm_test;
   bit test_pass = 1;
   wb_config master_config;
   wb_config slave_config;
   int slave_adr_max ;
   int slave_adr_min;



   `uvm_component_utils(wb_env_test)

   wb_env_env env;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      slave_adr_min = 32'h0;
      slave_adr_max = 32'h0fffffe;

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


endclass : wb_env_test

`endif //TEST__SV

