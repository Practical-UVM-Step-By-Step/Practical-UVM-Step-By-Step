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

`ifndef WB_CONMAX_RAL_ADAPTER
 `define WB_CONMAX_RAL_ADAPTER
typedef class wb_master_txn;

class wb_conmax_ral_adapter extends uvm_reg_adapter;

   function new (string name="");
      super.new(name);
   endfunction
   
   
   virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
      wb_master_txn tr;
      tr = wb_master_txn::type_id::create("tr"); 
      tr.kind = (rw.kind == UVM_READ) ? wb_master_txn::READ : wb_master_txn::WRITE; 
      tr.address = rw.addr;
      tr.data = rw.data;
      return tr;
   endfunction

   virtual function void bus2reg (uvm_sequence_item bus_item,
                                  ref uvm_reg_bus_op rw);
      wb_master_txn tr;
      if (!$cast(tr, bus_item))
	`uvm_fatal("NOT_HOST_REG_TYPE", "bus_item is not correct type");
      rw.kind = tr.kind ? UVM_READ : UVM_WRITE;
      rw.addr = tr.address;
      rw.data = tr.data;
      rw.status = UVM_IS_OK;
   endfunction

endclass: wb_conmax_ral_adapter
`endif
