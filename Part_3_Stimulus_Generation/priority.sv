class sequence_3 extends base_sequence;
sequence_0 sequence0;
sequence_1 sequence1;
sequence_2 sequence2;

`uvm_declare_p_sequencer(wb_master_seqr)
  `uvm_object_utils(sequence_3)
  `uvm_add_to_seq_lib(sequence_3,wb_master_seqr_sequence_library)


  function new(string name = "seq_2");
    super.new(name);
  endfunction:new
  virtual task body();
   sequence0 = sequence_0::type_id::create("Sequence0");
   sequence1 = sequence_1::type_id::create("Sequence1");
   sequence2 = sequence_2::type_id::create("Sequence2");
   p_sequencer.set_arbitration(UVM_SEQ_ARB_WEIGHTED);

`uvm_info(get_full_name(),"Running UVM SEQUENCE_3",UVM_LOW)	

fork 
	begin
	for(int i = 0; i < 10; i++) begin
		sequence0.start(p_sequencer,this,200,0); 
	end
	end

	begin
	for(int i = 0; i < 10; i++) begin
		sequence2.start(p_sequencer,this,400,0); 
	end
	end
	begin
		sequence1.start(p_sequencer,this,200,0); 
	end
join
  endtask
endclass
