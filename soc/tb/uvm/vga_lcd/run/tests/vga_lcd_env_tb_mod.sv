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

`ifndef VGA_LCD_ENV_TB_MOD__SV
 `define VGA_LCD_ENV_TB_MOD__SV

 `include "mstr_slv_intfs.incl"
  `include "vga_lcd_test_pkg.sv"
module vga_lcd_env_tb_mod;

   import uvm_pkg::*;
  `include "vga_lcd_env.sv"

   import vga_lcd_test_pkg::*;

   typedef virtual wb_master_if v_if1;
   typedef virtual wb_slave_if v_if2;
   typedef virtual wb_vga_disp_if v_if3;

   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",vga_lcd_env_top.mast_if); 
      uvm_config_db #(v_if2)::set(null,"","slv_if",vga_lcd_env_top.slv_if);
      uvm_config_db #(v_if3)::set(null,"","disp_if",vga_lcd_env_top.disp_if);
      uvm_reg::include_coverage("*",UVM_CVR_ALL);

      run_test();
   end

endmodule: vga_lcd_env_tb_mod

`endif // VGA_LCD_ENV_TB_MOD__SV

