`ifndef HOST_RAL_SEQUENCE
 `define HOST_RAL_SEQUENCE

// class host_ral_sequence extends uvm_reg_sequence  #(uvm_sequence #(wb_transaction));
class host_ral_sequence extends uvm_reg_sequence;

   ral_block_oc_ethernet  ral_regmodel;
   uvm_status_e status;
   `uvm_object_utils(host_ral_sequence)

   function new(string name = "uvm_ral_sequence");
      super.new(name);
   endfunction


   virtual task body();
      bit [31:0] data;

      if(starting_phase != null) 
	starting_phase.raise_objection(this);

      `uvm_info("WB_RAL_SEQUENCE", "reading from to poert lock register",UVM_LOW)
      ral_regmodel.MODER.read(.status(status),.value(data), .path(UVM_FRONTDOOR), .parent(this));

      `uvm_info("WB_RAL_SEQUENCE", "writing to poert lock register",UVM_LOW)

      ral_regmodel.IPGT.write(.status(status), .value('1), .path(UVM_FRONTDOOR), .parent(this));

      `uvm_info("WB_RAL_SEQUENCE", "reading again from port lock register",UVM_LOW)

      ral_regmodel.IPGT.read(.status(status), .value(data), .path(UVM_FRONTDOOR), .parent(this));

      if(starting_phase != null) 
	starting_phase.drop_objection(this);
   endtask






endclass



`endif


