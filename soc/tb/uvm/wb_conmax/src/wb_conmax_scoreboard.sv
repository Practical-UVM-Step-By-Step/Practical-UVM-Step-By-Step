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
`ifndef WB_CONMAX_SCOREBOARD__SV
 `define WB_CONMAX_SCOREBOARD__SV

`uvm_analysis_imp_decl(_master)
`uvm_analysis_imp_decl(_slave) 

typedef class wb_transaction;
class wb_conmax_scoreboard extends uvm_scoreboard;

 `include "wb_conmax_env_defines.svh"
   uvm_analysis_imp_master #(wb_transaction,wb_conmax_scoreboard) master_export[8];
   uvm_analysis_imp_slave #(wb_transaction,wb_conmax_scoreboard) slave_export[16];

   uvm_tlm_analysis_fifo #(wb_transaction) master_fifo[8];

   uvm_in_order_class_comparator #(wb_transaction) comparator[16];

   // Built in UVM comparator will not be used. User has to define the compare logic

   `uvm_component_utils(wb_conmax_scoreboard);
   extern function new(string name = "wb_conmax_scoreboard",
                       uvm_component parent = null); 
   extern virtual function void build_phase (uvm_phase phase);
   extern virtual function void connect_phase (uvm_phase phase);
   extern virtual function void end_of_elaboration_phase (uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern function void write_master(wb_transaction tr);
   extern function void write_slave(wb_transaction tr);
   extern function void report();
   extern function int get_addr(ref wb_transaction tr);
   extern function bit report_info_hook(input id, string message, int verbosity, string filename, int line) ;

endclass: wb_conmax_scoreboard

   function bit wb_conmax_scoreboard::report_info_hook(input id, string message, int verbosity, string filename, int line) ;
      $display("called report hook, %d",$time);
      return 1;
   endfunction: report_info_hook

   function wb_conmax_scoreboard::new(string name = "wb_conmax_scoreboard",
				      uvm_component parent);
      super.new(name,parent);
   endfunction: new

   function void wb_conmax_scoreboard::build_phase(uvm_phase phase);
      super.build_phase(phase);
      for(int i = 0; i < 8; i = i+1) begin
    	 master_export[i] = new($sformatf("master_export%d",i) , this);
      end
      for(int i = 0; i < 16; i = i+1) begin
    	 slave_export[i] = new($sformatf("slave_export%d",i) , this);
	 comparator[i]    = new($sformatf("comparator%d",i), this);
      end

   endfunction:build_phase

   function void wb_conmax_scoreboard::connect_phase(uvm_phase phase);

      foreach (comparator[i]) begin
	 //  master_export[i].connect(master_fifo[i].analysis_export);
      end

   endfunction:connect_phase

   task wb_conmax_scoreboard::main_phase(uvm_phase phase);
      super.main_phase(phase);
      phase.raise_objection(this,"scbd..");
      phase.drop_objection(this);
   endtask: main_phase 

   function void wb_conmax_scoreboard::report_phase(uvm_phase phase);
      super.report_phase(phase);
   endfunction:report_phase

   // Master ingress functions

   function void wb_conmax_scoreboard::write_master(wb_transaction tr);
      integer master_id;
      master_id = get_addr(tr);
      `uvm_info("SCOREBOARD_MASTER",tr.sprint(),UVM_HIGH)
      comparator[get_addr(tr)].before_export.write(tr);
   endfunction
   
   function  void wb_conmax_scoreboard::write_slave(wb_transaction tr);
      `uvm_info("SCOREBOARD_SLAVE",tr.sprint(),UVM_HIGH)
      comparator[get_addr(tr)].after_export.write(tr);
   endfunction

   function void wb_conmax_scoreboard::report();

      foreach (comparator[i]) begin
	 `uvm_info("Scoreboard Report",
		   $sformatf("Comparator[%0d] Matches = %0d, Mismatches = %0d",
			     i, comparator[i].m_matches, comparator[i].m_mismatches), UVM_MEDIUM);
      end
   endfunction

   function void wb_conmax_scoreboard::end_of_elaboration_phase(uvm_phase phase);
      set_report_severity_action(UVM_INFO,  UVM_DISPLAY|UVM_CALL_HOOK);
   endfunction

   function int wb_conmax_scoreboard::get_addr(ref wb_transaction tr);
      bit [31:0] addr;
      case(addr) inside
	[`SLAVE0_MIN :`SLAVE0_MAX] :  get_addr = 0;
        [`SLAVE1_MIN :`SLAVE1_MAX] :  get_addr = 1;
        [`SLAVE2_MIN :`SLAVE2_MAX] :  get_addr = 2;
        [`SLAVE3_MIN :`SLAVE3_MAX] :  get_addr = 3;
        [`SLAVE4_MIN :`SLAVE4_MAX] :  get_addr = 4;
        [`SLAVE5_MIN :`SLAVE5_MAX] :  get_addr = 5;
        [`SLAVE6_MIN :`SLAVE6_MAX] :  get_addr = 6;
        [`SLAVE7_MIN :`SLAVE7_MAX] :  get_addr = 7;
        [`SLAVE8_MIN :`SLAVE8_MAX] :  get_addr = 8;
        [`SLAVE9_MIN :`SLAVE9_MAX] :  get_addr = 9;
        [`SLAVE10_MIN :`SLAVE10_MAX] :  get_addr = 10;
        [`SLAVE11_MIN :`SLAVE11_MAX] :  get_addr = 11;
        [`SLAVE12_MIN :`SLAVE12_MAX] :  get_addr = 12;
        [`SLAVE13_MIN :`SLAVE13_MAX] :  get_addr = 13;
        [`SLAVE14_MIN :`SLAVE14_MAX] :  get_addr = 14;
        [`SLAVE15_MIN :`SLAVE15_MAX] :  get_addr = 15;
      endcase

   endfunction

`endif // WB_CONMAX_SCOREBOARD__SV
