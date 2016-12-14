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

`ifndef WB_CONMAX_VIRTUAL_SEQUENCE
 `define WB_CONMAX_VIRTUAL_SEQUENCE
typedef class sequence_0;
   typedef class sequence_1;
   typedef class wb_conmax_virtual_sequencer;

class wb_conmax_virtual_sequence extends uvm_sequence;

   `uvm_object_utils(wb_conmax_virtual_sequence)	

   // get a handle to the sequencer
   `uvm_declare_p_sequencer(wb_conmax_virtual_sequencer)

   sequence_0 sequence0;
   sequence_1 sequence1;

   virtual task body();

      `uvm_info("UVM_VIRTUAL_SEQUENCER","Starting a virtual sequence on the virtual sequencer",UVM_MEDIUM);

      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: PART 0",UVM_MEDIUM)
      `uvm_do_on(sequence0,p_sequencer.seqr0);

      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: PART 1",UVM_MEDIUM)
      `uvm_do_on(sequence1,p_sequencer.seqr1);
      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: PART 2",UVM_MEDIUM)
      `uvm_do_on(sequence0,p_sequencer.seqr2);
      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: PART 3",UVM_MEDIUM)
      `uvm_do_on(sequence0,p_sequencer.seqr3);
      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: PART 4",UVM_MEDIUM)
      `uvm_do_on(sequence0,p_sequencer.seqr4);
      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: PART 5",UVM_MEDIUM)
      `uvm_do_on(sequence0,p_sequencer.seqr5);
      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: PART 6",UVM_MEDIUM)
      `uvm_do_on(sequence0,p_sequencer.seqr6);
      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: PART 7",UVM_MEDIUM)
      `uvm_do_on(sequence0,p_sequencer.seqr7);

   endtask

   function new(string name="wb_conmax_virtual_sequencer");
      super.new(name);
      set_automatic_phase_objection(1);
   endfunction

endclass

`endif

