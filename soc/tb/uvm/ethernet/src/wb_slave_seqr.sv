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

typedef class wb_transaction;
class wb_slave_seqr extends uvm_sequencer # (wb_transaction);

   uvm_blocking_get_port #(wb_transaction) addr_ph_port;

   local bit [63:0] ram [*];
   `uvm_component_utils(wb_slave_seqr)
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
      addr_ph_port = new("slave_get_port",this);
      set_arbitration(UVM_SEQ_ARB_STRICT_FIFO);

   endfunction:new 

   task wait_for_req(uvm_sequence_base seq, output wb_transaction req);
      wait_for_grant(seq);
      addr_ph_port.get(req);
      req.print();
   endtask

   task send_rsp(uvm_sequence_base seq, wb_transaction rsp);
      rsp.set_item_context(seq);
      seq.finish_item(rsp);
   endtask

   function bit [63:0] read(bit [63:0] addr);
      read = (this.ram.exists(addr)) ? this.ram[addr] : 64'bx;
   endfunction: read

   function void write(bit [63:0] addr,
                       bit [63:0] data);
      this.ram[addr] = data;
   endfunction: write

endclass:wb_slave_seqr
