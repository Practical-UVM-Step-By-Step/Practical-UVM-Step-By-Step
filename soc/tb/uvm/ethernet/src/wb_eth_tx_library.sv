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

//
//

`ifndef WB_ETH_TX_LIBRARY__SV
 `define WB_ETH_TX_LIBRARY__SV

// This class creates the basic sequence library for the transmit side

class wb_eth_tx_sequence_library extends uvm_sequence_library;

   `uvm_object_utils(wb_eth_tx_sequence_library)
   `uvm_sequence_library_utils(wb_eth_sequence_library)

   function new(string name = "wb_eth_tx_sequence_library");
      super.new(name);
      init_sequence_library();
   endfunction

endclass

// This class is the base sequence that is used with other classes

// This is the interrupt class.

class interrupt_sequence extends uvm_sequence;

   `uvm_object_utils(interrupt_sequence)
   `uvm_add_to_sequence_lib(interrupt_sequence,wb_eth_tx_sequence_library);
   `uvm_declare_p_sequencer(wb_eth_virt_seqr)

   function new(string name = "");
      super.new(name);
   endfunction

   uvm_status_e 	status

     virtual task body();
	grab();
	//	write_reg(p_sequencer.ralmodel.MODER,status,
	ungrab();

     endtask

endclass

class init_sequence extends uvm_sequence;

   `uvm_object_utils(init_sequence)
   `uvm_add_to_sequence_lib(init_sequence,wb_eth_tx_sequence_library);
   `uvm_declare_p_sequencer(wb_eth_virt_seqr)

   function new(string name = "");
      super.new(name);
   endfunction

   uvm_status_e 	status

     virtual task body();
	grab();
	write_reg(p_sequencer.ralmodel.MODER,status,32'h0);  // Switch off RESET
	write_reg(p_sequencer.ralmodel.MAC_ADDR,status,32'h0002);  // Switch off RESET
	// Other registers need to go in here.

	ungrab(); // release the sequencer
     endtask

   
endclass

`endif // WB_ETH_TX_LIBRARY__SV
