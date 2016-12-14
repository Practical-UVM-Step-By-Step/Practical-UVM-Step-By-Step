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

`ifndef VGA_DRV_MON_2COV_CONNECT
 `define VGA_DRV_MON_2COV_CONNECT
class vga_drv_mon_2cov_connect extends uvm_component;
   vga_lcd_env_cov cov;
   uvm_analysis_export # (vga_disp_txn) an_exp;
   `uvm_component_utils(vga_drv_mon_2cov_connect)
   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction: new

   virtual function void write(vga_disp_txn tr);
      cov.tr = tr;
      -> cov.cov_event;
   endfunction:write 
endclass: vga_drv_mon_2cov_connect

`endif // VGA_DRV_MON_2COV_CONNECT
