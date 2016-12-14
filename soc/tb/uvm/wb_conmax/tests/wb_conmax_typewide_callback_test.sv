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

`ifndef WB_CONMAX_TYPEWIDE_CALLBACK_TEST_SV
 `define WB_CONMAX_TYPEWIDE_CALLBACK_TEST_SV

typedef class wb_conmax_base_test;
   typedef class wb_transaction;

/*
    class wb_master_driver_new_cb extends wb_master_callbacks;

    function new(string name="bus_driver_cb_inst");
    super.new();
    endfunction

    // Called after a transaction has been executed
    virtual task post_tx( wb_master xactor, wb_transaction tr);
    `uvm_info(this.get_full_name(),     "Triggerring POST Callback in User Code ",UVM_LOW)
    `uvm_info(this.get_full_name(),      tr.sprint(),UVM_LOW)
   endtask: post_tx

endclass
    */
class wb_conmax_typewide_callback_test extends wb_conmax_base_test;

   `uvm_component_utils(wb_conmax_typewide_callback_test)

   wb_master_driver_new_cb new_cb1 = new("New Callback #1");
   wb_master_driver_new_cb new_cb2 = new("New Callback #2");

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      uvm_callbacks #(wb_master,wb_master_driver_new_cb)::add(null,new_cb1);
      // Set the default sequencer in all the master agents

   endfunction

wb_conmax_virtual_sequence virt_seq1;
   virtual task main_phase(uvm_phase phase);
	phase.raise_objection(this,"Test Main Objection");
	virt_seq1 = wb_conmax_virtual_sequence::type_id::create("wb_conmax_virtual_sequence",this);
	virt_seq1.start(env.wb_conmax_virt_seqr,null);
	virt_seq1.wait_for_sequence_state(UVM_FINISHED);
	phase.drop_objection(this,"Dropping Test Main Objection");
   endtask

endclass :  wb_conmax_typewide_callback_test

`endif //WB_CONMAX_CALLBACK_VERBOSITY_TEST

