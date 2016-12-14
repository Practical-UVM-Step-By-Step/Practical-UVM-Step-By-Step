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

`ifndef WB_HIGHER_LAYER_SEQUENCER__SV
 `define WB_HIGHER_LAYER_SEQUENCER__SV

typedef class one_to_many_eth_transmit_pkt;
class wb_higher_layer_sequencer extends uvm_sequencer # (one_to_many_eth_transmit_pkt);

   `uvm_component_utils(wb_higher_layer_sequencer)
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
   endfunction:new 
endclass:wb_higher_layer_sequencer

`endif // WB_HIGHER_LAYER_SEQUENCER__SV
