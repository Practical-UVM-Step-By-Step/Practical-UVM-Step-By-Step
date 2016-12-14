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

`ifndef ONE_TO_MANY_LAYERED
 `define ONE_TO_MANY_LAYERED

class one_to_many_eth_transmit_pkt extends uvm_sequence_item;

   rand int transmit_data[];
   rand int transmit_size;

   constraint valid_transmit_size {
      transmit_size > 0;
   };

   constraint valid_transmit_size_max {
      transmit_size < 1024 * 2;
   };

   constraint data_size {
      transmit_data.size() == transmit_size;
   };

   function new(string name="one_to_many_eth_transmit_pkt");
      super.new(name);
   endfunction

   `uvm_object_utils_begin(one_to_many_eth_transmit_pkt)
      `uvm_field_int(transmit_size,UVM_ALL_ON)
      `uvm_field_array_int(transmit_data,UVM_ALL_ON)
   `uvm_object_utils_end

endclass
`endif
