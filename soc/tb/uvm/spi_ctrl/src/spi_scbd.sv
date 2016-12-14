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
// Template for UVM Scoreboard

`ifndef SPI_SCBD__SV
 `define SPI_SCBD__SV

`uvm_analysis_imp_decl(_ingress)
`uvm_analysis_imp_decl(_egress) 

class spi_scbd extends uvm_scoreboard;

   uvm_analysis_imp_ingress #(wb_transaction,spi_scbd) before_export;
   uvm_analysis_imp_egress #(spi_transaction,spi_scbd) after_export;
   // Built in UVM comparator will not be used. User has to define the compare logic

   `uvm_component_utils(spi_scbd)
   extern function new(string name = "spi_scbd",
                       uvm_component parent = null); 
   extern virtual function void build_phase (uvm_phase phase);
   extern virtual function void connect_phase (uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern function void write_ingress(wb_transaction tr);
   extern function void write_egress(spi_transaction tr);

endclass: spi_scbd

function spi_scbd::new(string name = "spi_scbd",
                       uvm_component parent);
   super.new(name,parent);
endfunction: new

function void spi_scbd::build_phase(uvm_phase phase);
   super.build_phase(phase);
   before_export = new("before_export", this);
   after_export  = new("after_export", this);
endfunction:build_phase

function void spi_scbd::connect_phase(uvm_phase phase);
endfunction:connect_phase

task spi_scbd::main_phase(uvm_phase phase);
   super.main_phase(phase);
   phase.raise_objection(this,"scbd..");
   phase.drop_objection(this);
endtask: main_phase 

function void spi_scbd::report_phase(uvm_phase phase);
   super.report_phase(phase);
endfunction:report_phase

function void spi_scbd::write_ingress(wb_transaction tr);
   // User needs to add functionality here 
endfunction

function  void spi_scbd::write_egress(spi_transaction tr);
endfunction
`endif // SPI_SCBD__SV
