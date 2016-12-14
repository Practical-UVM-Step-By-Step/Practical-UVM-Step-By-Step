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

`ifndef VGA_DISP_TXN__SV
 `define VGA_DISP_TXN__SV

class vga_disp_txn extends uvm_sequence_item;

   typedef enum {READ, WRITE } kinds_e;
   rand kinds_e kind;
   typedef enum {IS_OK, ERROR} status_e;
   rand status_e status;

   // ToDo: Add constraint blocks to prevent error injection
   // ToDo: Add relevant class properties to define all transactions
   // ToDo: Modify/add symbolic transaction identifiers to match

   constraint vga_disp_txn_valid {
      // ToDo: Define constraint to make descriptor valid
      status == IS_OK;
   }
   `uvm_object_utils_begin(vga_disp_txn) 

      // ToDo: add properties using macros here
      
      `uvm_field_enum(kinds_e,kind,UVM_ALL_ON)
      `uvm_field_enum(status_e,status, UVM_ALL_ON)
   `uvm_object_utils_end
   
   extern function new(string name = "Trans");
endclass: vga_disp_txn

function vga_disp_txn::new(string name = "Trans");
   super.new(name);
endfunction: new

`endif // VGA_DISP_TXN__SV
