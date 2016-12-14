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

`ifndef MII_SCBD__SV
 `define MII_SCBD__SV

class mii_scbd extends uvm_scoreboard;

   uvm_analysis_export #(mii_transaction) before_export, after_export;
   uvm_in_order_class_comparator #(mii_transaction) comparator;

   `uvm_component_utils(mii_scbd)
   extern function new(string name = "mii_scbd",
                       uvm_component parent = null); 
   extern virtual function void build_phase (uvm_phase phase);
   extern virtual function void connect_phase (uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);

endclass: mii_scbd

function mii_scbd::new(string name = "mii_scbd",
                       uvm_component parent);
   super.new(name,parent);
endfunction: new

function void mii_scbd::build_phase(uvm_phase phase);
   super.build_phase(phase);
   before_export = new("before_export", this);
   after_export  = new("after_export", this);
   comparator    = new("comparator", this);
endfunction:build_phase

function void mii_scbd::connect_phase(uvm_phase phase);
   before_export.connect(comparator.before_export);
   after_export.connect(comparator.after_export);
endfunction:connect_phase

task mii_scbd::main_phase(uvm_phase phase);
   super.main_phase(phase);
   phase.raise_objection(this,"scbd..");
   comparator.run();
   phase.drop_objection(this);
endtask: main_phase 

function void mii_scbd::report_phase(uvm_phase phase);
   super.report_phase(phase);
   `uvm_info("SBRPT", $sformatf("Matches = %0d, Mismatches = %0d",
				comparator.m_matches, comparator.m_mismatches),
             UVM_MEDIUM);
endfunction:report_phase

`endif // MII_SCBD__SV
