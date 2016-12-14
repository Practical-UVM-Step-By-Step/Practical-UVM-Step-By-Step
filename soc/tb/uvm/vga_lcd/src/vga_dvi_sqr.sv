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

`ifndef VGA_DVI_SQR__SV
 `define VGA_DVI_SQR__SV

typedef class vga_disp_txn;
class vga_dvi_sqr extends uvm_sequencer # (vga_disp_txn);

   `uvm_component_utils(vga_dvi_sqr)
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
   endfunction:new 
endclass:vga_dvi_sqr

`endif // VGA_DVI_SQR__SV
