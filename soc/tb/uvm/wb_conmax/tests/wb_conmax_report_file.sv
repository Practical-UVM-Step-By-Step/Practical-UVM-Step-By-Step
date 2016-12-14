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

`ifndef WB_CONMAX_REPORT_FILE_SV
 `define WB_CONMAX_REPORT_FILE_SV

typedef class wb_conmax_base_test;

class wb_conmax_report_file_test extends wb_conmax_base_test;

   UVM_FILE file_master;

   `uvm_component_utils(wb_conmax_report_file_test)

   function new(string name, uvm_component parent);
      super.new(name, parent);
      file_master = $fopen("master_output","w");
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction

   virtual function void end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      //env.set_report_default_file_hier("SCOREBOARD_MASTER",UVM_LOG);
      env.set_report_default_file_hier(file_master);
      env.conmax_scbd.set_report_id_file_hier("SCOREBOARD_MASTER",file_master);
      env.conmax_scbd.set_report_id_action("SCOREBOARD_MASTER", UVM_DISPLAY|UVM_LOG);

   endfunction


sequence_1 seq1;


   virtual task main_phase(uvm_phase phase);
	phase.raise_objection(this,"Test Main Objection");
	seq1 = sequence_1::type_id::create("sequence_1",this);
	seq1.start(env.master_agent[00].mast_sqr,null);
	seq1.wait_for_sequence_state(UVM_FINISHED);
	phase.drop_objection(this,"Dropping Test Main Objection");
   endtask

endclass :  wb_conmax_report_file_test

`endif //WB_CONMAX_REPORT_FILE_SV

