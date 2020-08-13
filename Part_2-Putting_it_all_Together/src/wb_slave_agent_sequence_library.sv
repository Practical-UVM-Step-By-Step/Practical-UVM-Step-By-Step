//
// Template for UVM-compliant sequence library
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
      uvm_phase phase_ = get_starting_phase();
      if (phase_ != null)
	phase_.raise_objection(this);
   endtask:pre_body
   virtual task post_body();
      uvm_phase phase_ = get_starting_phase();
      if (phase_ != null)
	phase_.drop_objection(this);
   endtask:post_body
endclass

class ram_sequence extends uvm_sequence #(wb_transaction);
   `uvm_object_utils(ram_sequence)
   `uvm_declare_p_sequencer(wb_slave_seqr)
   `uvm_add_to_seq_lib(ram_sequence,wb_slave_seqr_sequence_library)
   function new(string name = "seq_0");
      super.new(name);
   endfunction:new
   virtual task body();
      wb_transaction tr;
      forever begin
	 p_sequencer.wait_for_req(this, tr);
	 `uvm_info(get_full_name(),$sformatf("In SLAVE SEQUENCER, Transaction address = %h   kind = %s",tr.address,tr.kind.name()),UVM_LOW)
	 case (tr.kind)
	   wb_transaction::WRITE: p_sequencer.write(tr.address, tr.data);
	   wb_transaction::READ: tr.data = p_sequencer.read(tr.address);
	 endcase
	 tr.status = wb_transaction::ACK;
	 `uvm_info(get_full_name(),$sformatf("SLAVE SEQUENCER OUTPUT, Transaction address = %h   kind = %s data = %h",tr.address,tr.kind.name(), tr.data),UVM_LOW)
	 p_sequencer.send_rsp(this, tr);
      end
   endtask

endclass

