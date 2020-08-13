
class wb_env_test_extended extends wb_env_base_test;

   `uvm_component_utils(wb_env_test_extended)

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      wb_transaction::type_id::set_type_override(wb_transaction_extended::get_type());
      uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase", "default_sequence", sequence_0::get_type());
   endfunction

   function new(string name="wb_env_test_extended",uvm_component parent);
      super.new(name,parent);
   endfunction

endclass
