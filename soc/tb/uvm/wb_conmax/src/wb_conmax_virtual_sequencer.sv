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

`ifndef WB_CONMAX_VIRT_SEQUENCER
 `define WB_CONMAX_VIRT_SEQUENCER

typedef class wb_master_seqr;

class wb_conmax_virtual_sequencer extends uvm_sequencer;
   `uvm_component_utils(wb_conmax_virtual_sequencer);
   int my_seq_lenght;

   // The seven master agent sequencers are here
   wb_master_seqr seqr0;
   wb_master_seqr seqr1;
   wb_master_seqr seqr2;
   wb_master_seqr seqr3;
   wb_master_seqr seqr4;
   wb_master_seqr seqr5;
   wb_master_seqr seqr6;
   wb_master_seqr seqr7;

   function new(string name = "wb_conmax_virtual_sequencer", input uvm_component parent = null) ;
      super.new(name,parent);
   endfunction

endclass

`endif
