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

`ifndef VGA_DVI_SQR_SEQUENCE_LIBRARY__SV
 `define VGA_DVI_SQR_SEQUENCE_LIBRARY__SV

typedef class vga_disp_txn;

class vga_dvi_sqr_sequence_library extends uvm_sequence_library # (vga_disp_txn);
   
   `uvm_object_utils(vga_dvi_sqr_sequence_library)
   `uvm_sequence_library_utils(vga_dvi_sqr_sequence_library)

   function new(string name = "simple_seq_lib");
      super.new(name);
      init_sequence_library();
   endfunction

endclass  

class vga_base_sequence extends uvm_sequence #(vga_disp_txn);
   `uvm_object_utils(vga_base_sequence)

   function new(string name = "base_seq");
      super.new(name);
   endfunction:new
   virtual task pre_body();
      if (starting_phase != null)
	starting_phase.raise_objection(this);
   endtask:pre_body
   virtual task post_body();
      if (starting_phase != null)
	starting_phase.drop_objection(this);
   endtask:post_body
endclass

class vga_sequence_0 extends vga_base_sequence;
   `uvm_object_utils(vga_sequence_0)
   `uvm_add_to_seq_lib(vga_sequence_0,vga_dvi_sqr_sequence_library)
   function new(string name = "seq_0");
      super.new(name);
   endfunction:new
   virtual task body();
      // This was a basic sequence.
      // You can add your stuff in here.
   endtask
endclass

`endif // VGA_DVI_SQR_SEQUENCE_LIBRARY__SV
