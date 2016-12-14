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

`ifndef WB_ETH_VIRT_SEQR__SV
 `define WB_ETH_VIRT_SEQR__SV
typedef class wb_master_seqr;
class wb_eth_virt_seqr extends uvm_sequencer ;

   // wb_ethernet_mac_sequencer wb_ethernet_mac_sqr;
   wb_master_seqr seqr1;

   `uvm_component_utils(wb_eth_virt_seqr)
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
   endfunction:new 
endclass:wb_eth_virt_seqr

`endif // WB_ETH_VIRT_SEQR__SV
