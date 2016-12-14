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

`ifndef WB_MII_SEQUENCE_LIBRARY__SV
 `define WB_MII_SEQUENCE_LIBRARY__SV

typedef class mii_transaction;

class wb_mii_sequence_library extends uvm_sequence_library # (mii_transaction);
   
   `uvm_object_utils(wb_mii_sequence_library)
   `uvm_sequence_library_utils(wb_mii_sequence_library)

   function new(string name = "simple_seq_lib");
      super.new(name);
      init_sequence_library();
   endfunction

endclass  

class base_sequence extends uvm_sequence #(mii_transaction);
   `uvm_object_utils(base_sequence)

   function new(string name = "base_seq");
      super.new(name);
   endfunction:new
   virtual task pre_body(); uvm_phase phase_=get_starting_phase();

      if (get_starting_phase()!= null)
	phase_.raise_objection(this);
   endtask:pre_body
   virtual task post_body(); uvm_phase phase_=get_starting_phase();

      if (get_starting_phase()!= null)
	phase_.drop_objection(this);
   endtask:post_body
endclass

class mii_sequence_0 extends base_sequence;
   `uvm_object_utils(mii_sequence_0)
   `uvm_add_to_seq_lib(mii_sequence_0,wb_mii_sequence_library)
   function new(string name = "seq_0");
      super.new(name);
   endfunction:new
   virtual task body();
      repeat(10) begin
	 `uvm_do(req);
      end
   endtask
endclass

class mii_sequence_1 extends base_sequence;
   byte sa;
   `uvm_object_utils(mii_sequence_1)
   `uvm_add_to_seq_lib(mii_sequence_1, wb_mii_sequence_library)
   function new(string name = "seq_1");
      super.new(name);
   endfunction:new
   virtual task body();
      repeat(10) begin
	 `uvm_do_with(req, { sa == 3; } );
      end
   endtask
endclass

`endif // WB_MII_SEQUENCE_LIBRARY__SV
