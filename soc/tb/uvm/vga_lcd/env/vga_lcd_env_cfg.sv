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

`ifndef VGA_LCD_ENV_CFG__SV
 `define VGA_LCD_ENV_CFG__SV

class vga_lcd_env_cfg extends uvm_object; 

   // Define test configuration parameters (e.g. how long to run)
   rand int num_trans;
   rand int num_scen;
   // ToDo: Add other environment configuration varaibles

   constraint cst_num_trans_default {
      num_trans inside {[1:7]};
   }
   constraint cst_num_scen_default {
      num_scen inside {[1:2]};
   }

   `uvm_object_utils_begin(vga_lcd_env_cfg)
      `uvm_field_int(num_trans,UVM_ALL_ON) 
      `uvm_field_int(num_scen,UVM_ALL_ON)
      // ToDo: add properties using macros here

   `uvm_object_utils_end

   extern function new(string name );
   
endclass: vga_lcd_env_cfg

function vga_lcd_env_cfg::new(string name );
   super.new(name);
endfunction: new

`endif // VGA_LCD_ENV_CFG__SV
