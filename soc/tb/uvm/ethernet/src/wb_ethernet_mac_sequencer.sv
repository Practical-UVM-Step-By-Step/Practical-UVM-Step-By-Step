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

`ifndef WB_ETHERNET_MAC_SEQUENCER__SV
 `define WB_ETHERNET_MAC_SEQUENCER__SV
// This is the main class that is pretty much used as the main transmit sequencer

class wb_ethernet_mac_sequencer extends uvm_sequencer ;

   uvm_analysis_port #(mac_transaction) mac_seqr_analysis_port; // Analysis port to dump transaction to Scoreboard

   `uvm_component_utils(wb_ethernet_mac_sequencer)
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
   endfunction:new 

endclass:wb_ethernet_mac_sequencer

`endif // WB_ETHERNET_MAC_SEQUENCER__SV
