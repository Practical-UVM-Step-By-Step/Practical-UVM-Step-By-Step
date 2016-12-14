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

`ifndef VGA_LCD_ENV_COV__SV
 `define VGA_LCD_ENV_COV__SV

class vga_lcd_env_cov extends uvm_component;
   event cov_event;
   vga_disp_txn tr;
   uvm_analysis_imp #(vga_disp_txn, vga_lcd_env_cov) cov_export;
   `uvm_component_utils(vga_lcd_env_cov)
   
   covergroup cg_trans @(cov_event);
      coverpoint tr.kind;
      // ToDo: Add required coverpoints, coverbins
   endgroup: cg_trans

     function new(string name, uvm_component parent);
	super.new(name,parent);
	cg_trans = new;
	cov_export = new("Coverage Analysis",this);
     endfunction: new

   virtual function write(vga_disp_txn tr);
      this.tr = tr;
      -> cov_event;
   endfunction: write

endclass: vga_lcd_env_cov

`endif // VGA_LCD_ENV_COV__SV

