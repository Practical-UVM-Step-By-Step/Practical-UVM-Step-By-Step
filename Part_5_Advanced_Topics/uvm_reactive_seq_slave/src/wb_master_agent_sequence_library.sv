//
// Template for UVM-compliant sequence library
//

typedef class wb_transaction;

class wb_master_seqr_sequence_library extends uvm_sequence_library # (wb_transaction);
  `uvm_sequence_library_utils(wb_master_seqr_sequence_library)

  function new(string name = "simple_seq_lib");
    super.new(name);
    init_sequence_library();
  endfunction

endclass  

class base_sequence extends uvm_sequence #(wb_transaction);
  `uvm_object_utils(base_sequence)

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

class sequence_0 extends base_sequence;
  `uvm_object_utils(sequence_0)
  `uvm_add_to_seq_lib(sequence_0,wb_master_seqr_sequence_library)
  function new(string name = "seq_0");
    super.new(name);
  endfunction:new
  virtual task body();
	
    repeat(2) begin
     `uvm_do(req);
    end
   start_item(req);
   finish_item(req);
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

class sequence_1 extends base_sequence;
  byte sa;
  `uvm_object_utils(sequence_1)
  `uvm_add_to_seq_lib(sequence_1, wb_master_seqr_sequence_library)
  function new(string name = "seq_1");
    super.new(name);
  endfunction:new
  virtual task body();
	
      // `uvm_do_with(req, { sa == 3; } );
      `uvm_do_with(req, {address == 3; kind == wb_transaction::WRITE; data == 63'hdeadbeef;} )
       `uvm_do_with(req,{address == 4; kind == wb_transaction::WRITE; data == 63'hbeefdead;} )
      `uvm_do_with(req, {address == 5; kind == wb_transaction::WRITE; data == 63'h0123456678;} )

      `uvm_do_with(req, {address == 3; kind == wb_transaction::READ ;} )
      `uvm_do_with(req, {address == 4; kind == wb_transaction::READ;} )
      `uvm_do_with(req, {address == 5; kind == wb_transaction::READ;} ) 
    // ToDo: User can add implementation here
  endtask
endclass

class repeated_read_sequence extends base_sequence;
	`uvm_object_utils(repeated_read_sequence)
	`uvm_add_to_seq_lib(repeated_read_sequence,wb_master_seqr_sequence_library)

	function new(string name="my_repeated_read_sequence");
	super.new(name);
	endfunction

	virtual task body();
      	`uvm_do_with(req, {address == 0; kind == wb_transaction::READ; } )
      	`uvm_do_with(req, {address == 1; kind == wb_transaction::READ; } )
      	`uvm_do_with(req, {address == 2; kind == wb_transaction::READ; } )
      	`uvm_do_with(req, {address == 3; kind == wb_transaction::READ; } )
	endtask

endclass
	
