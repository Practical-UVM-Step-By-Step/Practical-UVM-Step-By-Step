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

   typedef class send_tx_packet2;
   typedef class tx_interrupt_seq;

class wb_virtual_seq extends uvm_sequence;

   `uvm_object_utils(wb_virtual_seq);
   `uvm_declare_p_sequencer(wb_eth_virt_seqr)
   // eth_sequence_0 eth_sequence0;
   // mii_sequence_1 mii_sequence1;
   send_tx_packet2 send_tx_packet_2;
   tx_interrupt_seq  interrupt_seq1;
   

   virtual task body(); 
      uvm_phase phase_=get_starting_phase();
      phase_.raise_objection(this);
      send_tx_packet_2 = new("sending_packet" );
      interrupt_seq1 = new("interrupt sequence");

      `uvm_info("VIRT_SEQQ","Starting Virtual Sequence: 1 Packets",UVM_MEDIUM)
	send_tx_packet_2.start(p_sequencer.seqr1);
	send_tx_packet_2.wait_for_sequence_state(UVM_FINISHED);
	interrupt_seq1.start(p_sequencer.seqr1);
	interrupt_seq1.wait_for_sequence_state(UVM_FINISHED);

      phase_.drop_objection(this);
   endtask

   function new(string name="vir_sequence");
      super.new(name);
   endfunction
endclass
