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

typedef class wb_transaction;

class wb_master_seqr_sequence_library extends uvm_sequence_library #(wb_transaction);
   `uvm_sequence_library_utils(wb_master_seqr_sequence_library)

   function new(string name = "simple_seq_lib");
      super.new(name);
      init_sequence_library();
   endfunction

endclass  

class base_sequence extends uvm_sequence #(wb_transaction);
   `uvm_object_utils(base_sequence)

   `uvm_declare_p_sequencer(wb_master_seqr)

   function new(string name = "base_seq");
      super.new(name);
   endfunction:new
   virtual task pre_body();
      uvm_phase phase_=get_starting_phase();
      if(phase_ != null) begin
	 `uvm_info(get_type_name(),
                   $sformatf("%s pre_body() raising %s objection",
                             get_sequence_path(),
                             phase_.get_name()), UVM_MEDIUM);
	 phase_.raise_objection(this);
      end
   endtask:pre_body
   virtual task post_body(); 
      uvm_phase phase_=get_starting_phase();
      if (phase_ !=null) begin
	 `uvm_info(get_type_name(),
                   $sformatf("%s post_body() dropping %s objection",
                             get_sequence_path(),
                             phase_.get_name()), UVM_MEDIUM);
	 phase_.drop_objection(this);

      end

   endtask:post_body
endclass

class sequence_0 extends base_sequence;
   `uvm_object_utils(sequence_0)
   `uvm_add_to_seq_lib(sequence_0,wb_master_seqr_sequence_library)
   function new(string name = "seq_0");
      super.new(name);
   endfunction:new
   virtual task body();
      
      `uvm_info(get_full_name(),"Starting Sequence sequence_0 ",UVM_MEDIUM)
      repeat(1) begin
	 `uvm_do_with(req, {address == 3; kind == wb_transaction::WRITE; data == 32'hdeadbeef;} )
	 `uvm_do_with(req, {address == 3; kind == wb_transaction::READ ;} )
      end
   endtask

endclass

class sequence_1 extends base_sequence;
   `uvm_object_utils(sequence_1)
   `uvm_add_to_seq_lib(sequence_1, wb_master_seqr_sequence_library)
   function new(string name = "seq_1");
      super.new(name);
   endfunction:new
   virtual task body();
      `uvm_info(get_full_name(),"Starting Sequence sequence_1 ",UVM_MEDIUM)
      
      `uvm_do_with(req, { address == 3; } );
      `uvm_do_with(req,{address == 4; kind == wb_transaction::WRITE; data == 32'hbeefdead;} )
      `uvm_do_with(req, {address == 5; kind == wb_transaction::WRITE; data == 32'h0123456678;} )

      `uvm_do_with(req, {address == 4; kind == wb_transaction::READ;} )
      `uvm_do_with(req, {address == 5; kind == wb_transaction::READ;} ) 
   endtask
endclass

class sequence_2 extends base_sequence;
   integer seq_len;
   `uvm_object_utils(sequence_2)
   `uvm_add_to_seq_lib(sequence_2, wb_master_seqr_sequence_library)
   function new(string name = "seq_1");
      super.new(name);
   endfunction:new
   virtual task body();
      uvm_config_db#(int)::get(this.get_sequencer(), "", "my_seq_lenght", seq_len) ;
      `uvm_info(get_full_name(),$sformatf("Sequence lenght is %d\n",seq_len),UVM_MEDIUM)

      repeat(p_sequencer.my_seq_lenght) begin
	 `uvm_do_with(req, {address == 5; kind == wb_transaction::WRITE; data == 32'h0123456678;} )
      end

   endtask
endclass

class parallel_sequence extends base_sequence;
   `uvm_object_utils(parallel_sequence)
   `uvm_add_to_seq_lib(parallel_sequence, wb_master_seqr_sequence_library)
   sequence_0 sequence0;
   sequence_1 sequence1;

   function new(string name = "parallel_sequence");
      super.new(name);
   endfunction:new
   virtual task body();

      `uvm_info(get_full_name(),"Starting Sequence parallel",UVM_MEDIUM)
      fork	
	 `uvm_do(sequence0)
	 `uvm_do(sequence1)
      join

   endtask
endclass
