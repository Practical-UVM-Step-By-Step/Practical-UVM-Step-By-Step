`ifndef HOST_RAL_SEQUENCE
 `define HOST_RAL_SEQUENCE

// class host_ral_sequence extends uvm_reg_sequence  #(uvm_sequence #(wb_transaction));
class my_bit_bash_seq extends uvm_reg_single_bit_bash_seq;

   ral_block_oc_ethernet  ral_regmodel;
   uvm_status_e status;
   `uvm_object_utils(my_bit_bash_seq)

   function new(string name = "uvm_ral_sequence");
      super.new(name);
   endfunction


   virtual task body();
      bit [31:0] data;

      if(starting_phase != null) 
	starting_phase.raise_objection(this);
      super.body();
      if(starting_phase != null) 
	starting_phase.drop_objection(this);
   endtask






endclass



`endif


