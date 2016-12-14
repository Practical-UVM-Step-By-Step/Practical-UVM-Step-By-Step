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

//

`ifndef WB_CONMAX_SIMPLE_CMDLINE_PROC_TEST
 `define WB_CONMAX_SIMPLE_CMDLINE_PROC_TEST

typedef class wb_conmax_env;

class wb_conmax_simple_cmdline_proc extends uvm_test;

   wb_config master_configs[8];
   wb_config slave_configs[16];

   int slave_adr_max ;
   int slave_adr_min;

   `uvm_component_utils(wb_conmax_simple_cmdline_proc)

   wb_conmax_env env;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);

      uvm_cmdline_processor clp;
      string arg_values[$];
      clp = uvm_cmdline_processor::get_inst();
      void'(clp.get_arg_values("+slave_adr_max=", arg_values));
      slave_adr_max = arg_values[0].atoi();
	$display("SLAVE ADR = %h",slave_adr_max);

      // slave_adr_max = 32'h0fffffe;
      super.build_phase(phase);
      env = wb_conmax_env::type_id::create("env", this);

      // create the configurations
      // Master config
      for(int i = 0; i < 8; i++) begin
	 master_configs[i] = wb_config::type_id::create($sformatf("master_configuration[%02d]",i));
	 master_configs[i].randomize with {min_addr == 0; max_addr == slave_adr_max; max_n_wss == 5; };
	 master_configs[i].print();
      end

      // create the configurations
      // Slave config
      for(int i = 0; i < 16; i++) begin
	 slave_adr_min = 0;

	 slave_configs[i] = wb_config::type_id::create($sformatf("slave_configuration[%02d]",i));
	 slave_configs[i].randomize with {min_addr == slave_adr_min; max_addr == slave_adr_max; max_n_wss == 2; };
	 slave_adr_min =slave_adr_max + 1;
	 slave_adr_max = slave_adr_max + 1 + 32'h00fffffe;
	 slave_configs[i].print();

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

      `uvm_info(get_full_name(),$sformatf("Value of Slave Adr max is %h",slave_adr_max),UVM_LOW)
   endfunction


wb_conmax_virtual_sequence virt_seq1;
   	virtual task main_phase(uvm_phase phase);
	phase.raise_objection(this,"Test Main Objection");
	virt_seq1 = wb_conmax_virtual_sequence::type_id::create("wb_conmax_virtual_sequence",this);
	virt_seq1.start(env.wb_conmax_virt_seqr,null);
	virt_seq1.wait_for_sequence_state(UVM_FINISHED);
	phase.drop_objection(this,"Dropping Test Main Objection");
   endtask

endclass : wb_conmax_simple_cmdline_proc

`endif //WB_CONMAX_SIMPLE_CMDLINE_PROC_TEST

