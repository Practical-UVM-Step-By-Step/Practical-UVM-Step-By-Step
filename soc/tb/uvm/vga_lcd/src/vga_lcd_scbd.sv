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

`ifndef VGA_LCD_SCBD__SV
 `define VGA_LCD_SCBD__SV

`uvm_analysis_imp_decl(_ingress)
`uvm_analysis_imp_decl(_egress) 

class vga_lcd_scbd extends uvm_scoreboard;

   uvm_analysis_imp_ingress #(vga_disp_txn,vga_lcd_scbd) before_export;
   uvm_analysis_imp_egress #(wb_transaction,vga_lcd_scbd) after_export;
   // Built in UVM comparator will not be used. User has to define the compare logic

   `uvm_component_utils(vga_lcd_scbd)
   extern function new(string name = "vga_lcd_scbd",
                       uvm_component parent = null); 
   extern virtual function void build_phase (uvm_phase phase);
   extern virtual function void connect_phase (uvm_phase phase);
   extern virtual task main_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern function void write_ingress(vga_disp_txn tr);
   extern function void write_egress(wb_transaction tr);

endclass: vga_lcd_scbd

function vga_lcd_scbd::new(string name = "vga_lcd_scbd",
			   uvm_component parent);
   super.new(name,parent);
endfunction: new

function void vga_lcd_scbd::build_phase(uvm_phase phase);
   super.build_phase(phase);
   before_export = new("before_export", this);
   after_export  = new("after_export", this);
endfunction:build_phase

function void vga_lcd_scbd::connect_phase(uvm_phase phase);
endfunction:connect_phase

task vga_lcd_scbd::main_phase(uvm_phase phase);
   super.main_phase(phase);
   phase.raise_objection(this,"scbd..");
   phase.drop_objection(this);
endtask: main_phase 

function void vga_lcd_scbd::report_phase(uvm_phase phase);
   super.report_phase(phase);
endfunction:report_phase

function void vga_lcd_scbd::write_ingress(vga_disp_txn tr);
   // User needs to add functionality here 
endfunction

function  void vga_lcd_scbd::write_egress(wb_transaction tr);
endfunction
`endif // VGA_LCD_SCBD__SV
