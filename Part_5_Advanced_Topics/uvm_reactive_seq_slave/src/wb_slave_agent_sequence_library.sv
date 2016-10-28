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
    if (starting_phase != null)
      starting_phase.raise_objection(this);
  endtask:pre_body
  virtual task post_body();
    if (starting_phase != null)
      starting_phase.drop_objection(this);
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
			$display("In SLAVE SEQUENCER, Transaction adderss = %h   kind = %s",tr.address,tr.kind.name());
				$display("Now Got transaction from Ram Sequence");
			case (tr.kind)
				wb_transaction::WRITE: p_sequencer.write(tr.address, tr.data);
				wb_transaction::READ: tr.data = p_sequencer.read(tr.address);
			endcase
			tr.print();
			tr.status = wb_transaction::ACK;
			p_sequencer.send_rsp(this, tr);
		end
  endtask

endclass

