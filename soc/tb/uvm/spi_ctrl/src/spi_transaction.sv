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


`ifndef SPI_TRANSACTION__SV
 `define SPI_TRANSACTION__SV

class spi_transaction extends uvm_sequence_item;

   typedef enum {READ, WRITE } kinds_e;
   rand kinds_e kind;
   typedef enum {IS_OK, ERROR} status_e;
   rand status_e status;

   // ToDo: Add constraint blocks to prevent error injection
   // ToDo: Add relevant class properties to define all transactions
   // ToDo: Modify/add symbolic transaction identifiers to match

   constraint spi_transaction_valid {
      // ToDo: Define constraint to make descriptor valid
      status == IS_OK;
   }
   
   extern function new(string name = "Trans");
   `uvm_object_utils(spi_transaction)
   extern virtual function void do_print(uvm_printer printer = null);
   extern virtual function void do_copy(uvm_object rhs = null);
   extern virtual function bit do_compare(uvm_object rhs,
					  uvm_comparer comparer = null);
   extern virtual function void do_pack(input uvm_packer packer = null );
   extern virtual function void do_unpack(input uvm_packer packer = null );

endclass: spi_transaction

function spi_transaction::new(string name = "Trans");
   super.new(name);
endfunction: new

function void spi_transaction::do_print(uvm_printer printer);
   super.do_print(printer); 

   //ToDo: Implement this method here

endfunction: do_print

function void spi_transaction::do_copy(uvm_object rhs = null);
   spi_transaction to;
   super.do_copy(rhs);
   $cast(to,rhs);
   to.kind = this.kind;

   // ToDo: Copy additional class properties

endfunction: do_copy

function bit spi_transaction::do_compare(uvm_object rhs,
					 uvm_comparer comparer); //use of uvm comparer is optional
   spi_transaction tr;
   do_compare = super.do_compare(rhs,comparer); 
   if (rhs == null) begin 
      `uvm_fatal("COMPARE", "Cannot compare to NULL instance");
      return 0;
   end

   if (!$cast(tr,rhs)) begin 
      `uvm_fatal("COMPARE", "Attempting to compare to a non spi_transaction instance");
      return 0;
   end

   if (this.kind != tr.kind) begin
      return 0;
   end
   // ToDo: Compare additional class properties
   else
     return 1;
endfunction: do_compare

function void spi_transaction::do_pack ( input uvm_packer packer);
   super.do_pack(packer);

   // ToDo: Implement this method here
   
endfunction: do_pack

function void spi_transaction::do_unpack( input uvm_packer packer); //use of uvm packer is optional
   super.do_unpack(packer);

   // ToDo: Implement this method here

endfunction: do_unpack

`endif // SPI_TRANSACTION__SV
