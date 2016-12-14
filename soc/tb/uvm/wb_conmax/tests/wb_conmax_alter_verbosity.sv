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

`ifndef WB_CONMAX_ALTER_VERBOSITY_TEST_SV
 `define WB_CONMAX_ALTER_VERBOSITY_TEST_SV

typedef class wb_conmax_base_test;

   // This class promotes the UVM_INFO to UVM_ERROR
class message_changer  extends uvm_report_catcher;
   function new(string name="message_changer");
      super.new(name);
   endfunction

   //This example demotes "MY_ID" errors to an info message
   function action_e catch();
      if(get_severity() == UVM_INFO && get_id() == "SLAVE_DRIVER")
	set_severity(UVM_ERROR);
      return THROW;
   endfunction
endclass

class message_killer extends uvm_report_catcher;
   function new(string name="message_killer");
      super.new(name);
   endfunction
   //This example Kills all UVM_INFO messages from a component 
   function action_e catch();
      if(get_severity() == UVM_INFO)
	return CAUGHT;
	else 
	return  THROW;
	 
   endfunction
endclass

class wb_conmax_alter_verbosity_test extends wb_conmax_base_test;

   `uvm_component_utils(wb_conmax_alter_verbosity_test)
wb_conmax_virtual_sequence virt_seq1;

   message_changer changer = new;
   message_killer msg_killer = new;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Set the default sequencer in all the master agents
      uvm_config_db #(uvm_object_wrapper)::set(this, "env.wb_conmax_virt_seqr.main_phase", "default_sequence",                  wb_conmax_virtual_sequence::get_type());
      

   endfunction

   function void end_of_elaboration_phase(uvm_phase phase);
      // These two only affect specific components
      uvm_report_cb::add(this.env.slave_agent[0].slv_drv, changer);
      uvm_report_cb::add(this.env.master_agent[0].mast_drv, msg_killer);
      // This kills everything. 
      uvm_report_cb::add(null, msg_killer);
   endfunction 

  virtual task main_phase(uvm_phase phase);
        phase.raise_objection(this,"Test Main Objection");
        virt_seq1 = wb_conmax_virtual_sequence::type_id::create("wb_conmax_virtual_sequence",this);
        virt_seq1.start(env.wb_conmax_virt_seqr,null);
        virt_seq1.wait_for_sequence_state(UVM_FINISHED);
        phase.drop_objection(this,"Dropping Test Main Objection");
   endtask



endclass :  wb_conmax_alter_verbosity_test

`endif //WB_CONMAX_ALTER_VERBOSITY_TEST
