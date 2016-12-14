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

`ifndef VGA_LCD_VGA_LCD_REG_ACCESS
 `define VGA_LCD_VGA_LCD_REG_ACCESS

class vga_lcd_reg_access_test extends vga_lcd_env_base_test;

   `uvm_component_utils(vga_lcd_reg_access_test)

   ral_block_vga_lcd ral_regmodel;
   uvm_status_e status;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   task run_phase(uvm_phase phase);
	
      uvm_reg rg;
      uvm_reg_access_seq seq = uvm_reg_access_seq::type_id::create("ral_uvm_reg_access_seq",this);
       phase.raise_objection(this,"");
      seq.model = env.ral_regmodel;
	rg = env.ral_regmodel.HTIM;
      seq.start(null);
      seq.wait_for_sequence_state(UVM_FINISHED);
      phase.drop_objection(this);
   endtask : run_phase

endclass : vga_lcd_reg_access_test

`endif
