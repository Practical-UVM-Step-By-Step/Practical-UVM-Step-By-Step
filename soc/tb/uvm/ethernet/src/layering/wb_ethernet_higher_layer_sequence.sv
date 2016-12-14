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

`ifndef WB_ETHERNET_HIGHER_LAYER_SEQUENCE__SV
 `define WB_ETHERNET_HIGHER_LAYER_SEQUENCE__SV

typedef class mac_transaction;

class wb_ethernet_higher_layer_sequence extends uvm_sequence_library # (mac_transaction);
   
   `uvm_object_utils(wb_ethernet_higher_layer_sequence)
   `uvm_sequence_library_utils(wb_ethernet_higher_layer_sequence)

   function new(string name = "simple_seq_lib");
      super.new(name);
      init_sequence_library();
   endfunction

endclass  

class base_sequence extends uvm_sequence #(mac_transaction);
   `uvm_object_utils(base_sequence)

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

class sequence_0 extends base_sequence;
   `uvm_object_utils(sequence_0)
   `uvm_add_to_seq_lib(sequence_0,wb_ethernet_higher_layer_sequence)
   function new(string name = "seq_0");
      super.new(name);
   endfunction:new
   virtual task body();
      repeat(10) begin
	 `uvm_do(req);
      end
   endtask
endclass

class sequence_1 extends base_sequence;
   byte sa;
   `uvm_object_utils(sequence_1)
   `uvm_add_to_seq_lib(sequence_1, wb_ethernet_higher_layer_sequence)
   function new(string name = "seq_1");
      super.new(name);
   endfunction:new
   virtual task body();
      repeat(10) begin
	 `uvm_do_with(req, { sa == 3; } );
	 // ToDo: User can add implementation here
      end
   endtask
endclass

`endif // WB_ETHERNET_HIGHER_LAYER_SEQUENCE__SV
