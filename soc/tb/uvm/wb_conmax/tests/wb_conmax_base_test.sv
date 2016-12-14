/***********************************************
 *                                              *
 * Examples for the book Practical UVM          *
 *                                              *
 * Copyright Srivatsa Vasudevan 2010-2016       *
 * All rights reserved                          *
 *                                              *
 * Permission is granted to use this work       * 
 * provided this notice and attached license.txt*
 * are not removed/altered while redistributing *
 * See license.txt for details                  *
 *                                              *
 ************************************************/

`ifndef WB_CONMAX_BASE_TEST
 `define WB_CONMAX_BASE_TEST

typedef class wb_conmax_env;

class wb_conmax_base_test extends uvm_test;

   wb_config master_configs[8];
   wb_config slave_configs[16];

   int slave_adr_max ;
   int slave_adr_min;

   `uvm_component_utils(wb_conmax_base_test)

   wb_conmax_env env;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      uvm_coreservice_t cs = uvm_coreservice_t::get();
      uvm_root r = cs.get_root();
      uvm_factory fact = cs.get_factory();
      slave_adr_max = 32'h0fffffe;
      super.build_phase(phase);

      // create the configurations
      // Master config
      for(int i = 0; i < 8; i++) begin
	 master_configs[i] = wb_config::type_id::create($psprintf("master_configuration[%02d]",i));
	 master_configs[i].randomize with {min_addr == 0; max_addr == slave_adr_max; max_n_wss == 5; };
	 //master_configs[i].print();
      end

      // create the configurations
      // Slave config
      for(int i = 0; i < 16; i++) begin
	 slave_adr_min = 0;
	 slave_configs[i] = wb_config::type_id::create($psprintf("slave_configuration[%02d]",i));
	 slave_configs[i].randomize with {min_addr == slave_adr_min; max_addr == slave_adr_max; max_n_wss == 2; };
	 slave_adr_min =slave_adr_max + 1;
	 slave_adr_max = slave_adr_max + 1 + 32'h00fffffe;
	 //slave_configs[i].print();
      end

      

      // Set the default sequencer in all the master agents
      for(int i = 0; i < 8; i++) begin
	 uvm_config_db #(uvm_object_wrapper)::set(this, $sformatf("env.master_agent[%02d].mast_sqr.main_phase",i), "default_sequence", null);
	 uvm_config_db #(wb_config)::set(null,$sformatf("uvm_test_top.env.master_agent[%02d]",i),"mstr_agent_cfg",master_configs[i] );
      end
      

      // Slave configuration
      for(int i = 0; i < 16; i++) begin
	 uvm_config_db #(wb_config)::set(null,$sformatf("uvm_test_top.env.slave_agent[%02d]",i),"slv_agent_cfg",slave_configs[i] );
      end

      env = wb_conmax_env::type_id::create("env", this);

      fact.print();
   endfunction

endclass : wb_conmax_base_test

`endif //WB_CONMAX_BASE_TEST

