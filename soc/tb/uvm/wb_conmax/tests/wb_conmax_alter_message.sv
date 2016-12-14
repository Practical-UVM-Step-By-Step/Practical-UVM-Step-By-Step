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

`ifndef WB_CONMAX_ALTER_MESSAGE_TEST_SV
 `define WB_CONMAX_ALTER_MESSAGE_TEST_SV

typedef class wb_conmax_base_test;

   // This class promotes the UVM_INFO to UVM_ERROR
class alter_message_catcher  extends uvm_report_catcher;
   string orig_message;
   string new_message;

   function new(string name="alter_message_catcher");
      super.new(name);
   endfunction

   //This example demotes "MY_ID" errors to an info message
   function action_e catch();
      if(get_severity() == UVM_INFO && get_id() == "SLAVE_DRIVER")
	set_id("SLAVE_DRIVER_CATCHER");
      orig_message = get_message();
      
      new_message = {"Changing message from SLAVE_DRIVER ..",orig_message};


      set_message(new_message);
	set_severity(UVM_ERROR);

      return THROW;
   endfunction
endclass

class wb_conmax_alter_message_test extends wb_conmax_base_test;

   `uvm_component_utils(wb_conmax_alter_message_test)
    wb_conmax_virtual_sequence virt_seq1;

   alter_message_catcher changer = new;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction


   function void end_of_elaboration_phase(uvm_phase phase);
      uvm_report_cb::add(this.env.slave_agent[0].slv_drv, changer);
   endfunction 

   virtual task main_phase(uvm_phase phase);
	phase.raise_objection(this,"Test Main Objection");
	virt_seq1 = wb_conmax_virtual_sequence::type_id::create("wb_conmax_virtual_sequence",this);
	virt_seq1.start(env.wb_conmax_virt_seqr,null);
	virt_seq1.wait_for_sequence_state(UVM_FINISHED);
	phase.drop_objection(this,"Dropping Test Main Objection");
   endtask

endclass :  wb_conmax_alter_message_test

`endif //WB_CONMAX_ALTER_MESSAGE_TEST
