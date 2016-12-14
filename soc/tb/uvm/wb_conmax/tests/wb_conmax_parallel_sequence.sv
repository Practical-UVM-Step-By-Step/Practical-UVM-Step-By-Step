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

`ifndef WB_CONMAX_PARALLEL_SEQ_SV
 `define WB_CONMAX_PARALLEL_SEQ_SV

typedef class wb_conmax_base_test;

class wb_conmax_parallel_seq_test extends wb_conmax_base_test;

   `uvm_component_utils(wb_conmax_parallel_seq_test)

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      // Set the default sequencer in all the master agents
      // uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent[00].mast_sqr.main_phase", "default_sequence", parallel_sequence::get_type()); 

   endfunction


parallel_sequence seq1;


   virtual task main_phase(uvm_phase phase);
	phase.raise_objection(this,"Test Main Objection");
	seq1 = parallel_sequence::type_id::create("sequence_1",this);
	seq1.start(env.master_agent[00].mast_sqr,null);
	seq1.wait_for_sequence_state(UVM_FINISHED);
	phase.drop_objection(this,"Dropping Test Main Objection");
   endtask

endclass :  wb_conmax_parallel_seq_test

`endif //WB_CONMAX_PARALLEL_SEQ_SV

