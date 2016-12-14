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
   typedef class wb_config;
   typedef class ral_block_ethernet_blk;
class wb_master_seqr extends uvm_sequencer # (wb_transaction);

   wb_config cfg;
   int my_seq_lenght;
   ral_block_ethernet_blk regmodel;   
   interrupt_eth_if int_if;

   `uvm_component_utils_begin(wb_master_seqr)
      `uvm_field_int(my_seq_lenght,UVM_ALL_ON);
   `uvm_component_utils_end
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
   endfunction:new 

   function void build_phase(uvm_phase phase) ;
      super.build_phase(phase);
      if (!uvm_config_db#(interrupt_eth_if)::get(null, this.get_full_name(), "ethernet_int_if", int_if)) begin
         `uvm_fatal("SEQUENCER/NOVIF", "No virtual interface specified for this Sequencer instance %m. Cannot get the interrupt handle")
      end
   endfunction
endclass:wb_master_seqr
