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

class eth_blk_adapter extends uvm_reg_adapter;

   function new (string name="");
      super.new(name);
   endfunction
   
   
   virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
      wb_transaction tr;
      tr = wb_transaction::type_id::create("tr"); 
      tr.kind = (rw.kind == UVM_READ) ? wb_transaction::READ : wb_transaction::WRITE; 
      tr.address = rw.addr;
      tr.data = rw.data;
      tr.sel = 15;
      return tr;
   endfunction

   virtual function void bus2reg (uvm_sequence_item bus_item,
                                  ref uvm_reg_bus_op rw);
      wb_transaction tr;
      if (!$cast(tr, bus_item))
	`uvm_fatal("NOT_HOST_REG_TYPE", "bus_item is not correct type");
      rw.kind = tr.kind ? UVM_READ : UVM_WRITE;
      rw.addr = tr.address;
      rw.data = tr.data;
      rw.status = UVM_IS_OK;
   endfunction

endclass: eth_blk_adapter
