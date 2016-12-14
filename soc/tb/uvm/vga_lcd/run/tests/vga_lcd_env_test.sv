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

`ifndef TEST__SV
 `define TEST__SV

typedef class vga_lcd_env;

class vga_lcd_env_test extends uvm_test;

   `uvm_component_utils(vga_lcd_env_test)

   vga_lcd_env env;

   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env = vga_lcd_env::type_id::create("env", this);
      //    uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase",
      //                   "default_sequence", vga_dvi_sqr_sequence_library::get_type()); 
   endfunction

endclass : vga_lcd_env_test

`endif //TEST__SV

