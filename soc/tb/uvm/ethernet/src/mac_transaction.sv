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

`ifndef MAC_TRANSACTION__SV
 `define MAC_TRANSACTION__SV

class mac_transaction extends eth_base_pkt;
   bit [47:0] start_address;
   bit [47:0] dest_address;

   `uvm_object_utils_begin(mac_transaction) 
      `uvm_field_int(start_address,UVM_ALL_ON)
      `uvm_field_int(dest_address,UVM_ALL_ON)
   `uvm_object_utils_end
   

   function new (string name = "mac transaction");
      super.new(name);
   endfunction: new

   virtual    function void do_pack(uvm_packer packer); 
      packer.pack_field_int(

			    endfunction

			    endclass: mac_transaction
`endif // MAC_TRANSACTION__SV
