class grab_sequence extends base_sequence;
  byte sa;
  `uvm_object_utils(grab_sequence)
  `uvm_add_to_seq_lib(grab_sequence, wb_master_seqr_sequence_library)
  function new(string name = "int_seq");
    super.new(name);
  endfunction:new
  virtual task body();
`uvm_info(get_type_name(),"STARTING INTERRUPT SEQUENCE",UVM_LOW)		
grab();
      `uvm_do_with(req, {address == 15; kind == wb_transaction::READ ;} )
       `uvm_do_with(req,{address == 14; kind == wb_transaction::WRITE; data == 63'hbeefdead;} )
      `uvm_do_with(req, {address == 13; kind == wb_transaction::READ;} ) 
ungrab();
  endtask
endclass
