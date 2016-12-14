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

class wb_slave_seqr_sequence_library extends uvm_sequence_library # (wb_transaction);
   `uvm_sequence_library_utils(wb_slave_seqr_sequence_library)

   function new(string name = "slave_seq_lib");
      super.new(name);
      init_sequence_library();
   endfunction

endclass  

class slv_base_sequence extends uvm_sequence #(wb_transaction);

   `uvm_object_utils(slv_base_sequence)

   `uvm_declare_p_sequencer(wb_slave_seqr)

   function new(string name = "base_seq");
      super.new(name);
   endfunction:new
   virtual task pre_body();
      if (starting_phase != null)
	starting_phase.raise_objection(this);
   endtask:pre_body
   virtual task post_body();
      if (starting_phase != null)
	starting_phase.drop_objection(this);
   endtask:post_body
endclass

class ram_sequence extends slv_base_sequence;
   `uvm_object_utils(ram_sequence)
   `uvm_add_to_seq_lib(ram_sequence,wb_slave_seqr_sequence_library)
   function new(string name = "seq_0");
      super.new(name);
   endfunction:new
   virtual task body();
      wb_transaction tr;
      forever begin
	 $display("Now beginning the Ram Sequence");
	 p_sequencer.wait_for_req(this, tr);
	 $display("Now Got transaction from Ram Sequence");
	 $display("In SLAVE SEQUENCER, Transaction adderss = %h   kind = %s",tr.address,tr.kind.name());
	 tr.print();
	 
	 case (tr.kind)
	   wb_transaction::WRITE: p_sequencer.write(tr.address, tr.data);
	   wb_transaction::READ: tr.data = p_sequencer.read(tr.address);
	 endcase
	 p_sequencer.send_rsp(this, tr);
      end
   endtask
   virtual task pre_body();
      if (starting_phase!=null) begin
	 `uvm_info(get_type_name(),
                   $sformatf("%s pre_body() raising %s objection",
                             get_sequence_path(),
                             starting_phase.get_name()), UVM_MEDIUM);
	 starting_phase.raise_objection(this);
      end
   endtask

   // Drop the objection in the post_body so the objection is removed when
   // the root sequence is complete. 
   virtual task post_body();
      if (starting_phase!=null) begin
	 `uvm_info(get_type_name(),
                   $sformatf("%s post_body() dropping %s objection",
                             get_sequence_path(),
                             starting_phase.get_name()), UVM_MEDIUM);
	 starting_phase.drop_objection(this);
      end
   endtask

endclass

