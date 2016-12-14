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

typedef class wb_transaction;
class vga_ral_adapter extends uvm_reg_adapter;

   `uvm_object_utils(vga_ral_adapter)

   function new (string name="");
      super.new(name);
   endfunction
   
   virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
      wb_transaction w_trans;
      w_trans = wb_transaction::type_id::create("w_trans");
      w_trans.address = rw.addr;
      w_trans.sel = 4'hf;
      w_trans.data = rw.data;
      w_trans.kind = (rw.kind == UVM_READ)? wb_transaction::READ:wb_transaction::WRITE;
      return w_trans;
   endfunction

   virtual function void bus2reg (uvm_sequence_item bus_item,
                                  ref uvm_reg_bus_op rw);
      wb_transaction trans;
      if(!$cast(trans,bus_item))
        `uvm_fatal("BUS2REF","Wrong type received");

      rw.addr = trans.address;
      rw.data = trans.data;
      rw.kind = (trans.kind == wb_transaction::READ)?UVM_READ:UVM_WRITE;
      rw.status = UVM_IS_OK;

   endfunction

endclass: vga_ral_adapter
