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

// Provided as an example to allow you to do factory replacements and 
// constraints

`ifndef WB_MASTER_TXN__SV
 `define WB_MASTER_TXN__SV

class wb_master_txn extends wb_transaction;

   `uvm_object_utils(wb_master_txn) 

   extern function new(string name = "Trans");
endclass: wb_master_txn

function wb_master_txn::new(string name = "Trans");
   super.new(name);
endfunction: new

`endif // WB_MASTER_TXN__SV
