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

`ifndef WB_CONMAX_COMMANDLINE_1_TEST_SV
 `define WB_CONMAX_COMMANDLINE_1_TEST_SV

typedef class wb_conmax_base_test;

class wb_conmax_commandline_test_1 extends wb_conmax_base_test;

   `uvm_component_utils(wb_conmax_commandline_test_1)

    wb_conmax_virtual_sequence virt_seq1;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      uvm_config_db #(uvm_object_wrapper)::set(this, "env.wb_conmax_virt_seqr.main_phase", "default_sequence", wb_conmax_virtual_sequence::get_type());
   endfunction

   function void start_of_simulation_phase(uvm_phase phase);
      uvm_cmdline_processor clp;
      string arg_values[$];
      string tool, version;
      clp = uvm_cmdline_processor::get_inst();
      tool = clp.get_tool_name();
      version = clp.get_tool_version();
      void'(clp.get_arg_values("+foo=", arg_values));
   endfunction

   virtual task main_phase(uvm_phase phase);
	phase.raise_objection(this,"Test Main Objection");
	virt_seq1 = wb_conmax_virtual_sequence::type_id::create("wb_conmax_virtual_sequence",this);
	virt_seq1.start(env.wb_conmax_virt_seqr,null);
	virt_seq1.wait_for_sequence_state(UVM_FINISHED);
	phase.drop_objection(this,"Dropping Test Main Objection");
   endtask

endclass :  wb_conmax_commandline_test_1

`endif //WB_CONMAX_ALTER_VERBOSITY_TEST
