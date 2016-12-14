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

`ifndef WB_CONMAX_FACTORY_INSTANCE_OVERRIDE_UNDO_SV
 `define WB_CONMAX_FACTORY_INSTANCE_OVERRIDE_UNDO_SV

typedef class wb_conmax_base_test;

class wb_conmax_factory_instance_override_undo_test extends wb_conmax_base_test;

   `uvm_component_utils(wb_conmax_factory_instance_override_undo_test)

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      string my_full_path;
      string my_full_path_agent;
      string my_full_path_agent_undo;
      uvm_coreservice_t cs;
      uvm_root r;
      uvm_factory fact;

      cs = uvm_coreservice_t::get();
      r = cs.get_root();
      fact = cs.get_factory();
      my_full_path = get_full_name();
      my_full_path_agent = $sformatf("%s.env.master_agent[00]",get_full_name());
      my_full_path_agent = $sformatf("%s.env.master_agent[00]",get_full_name());

      fact.set_inst_override_by_type(wb_master_agent::get_type(),wb_master_agent_n::get_type(),my_full_path_agent);
      fact.print();
      fact.set_inst_override_by_type(wb_master_agent_n::get_type(),wb_master_agent::get_type(),my_full_path_agent);
      fact.print();
      super.build_phase(phase);

      // Set the default sequencer in all the master agents
      //uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent[00].mast_sqr.main_phase", "default_sequence", sequence_1::get_type()); 
      r.enable_print_topology=1;
      r.print_topology();

   endfunction


sequence_1 seq1;


   virtual task main_phase(uvm_phase phase);
	phase.raise_objection(this,"Test Main Objection");
	seq1 = sequence_1::type_id::create("sequence_1",this);
	seq1.start(env.master_agent[00].mast_sqr,null);
	seq1.wait_for_sequence_state(UVM_FINISHED);
	phase.drop_objection(this,"Dropping Test Main Objection");
   endtask

endclass :  wb_conmax_factory_instance_override_undo_test

`endif //WB_CONMAX_FACTORY_INSTANCE_OVERRIDE_UNDO_SV

