//
// Template for UVM-compliant sequencer class
//

typedef class wb_transaction;
typedef class wb_config;
typedef class ral_block_simple_ral_env;
class wb_master_seqr extends uvm_sequencer # (wb_transaction);

ral_block_simple_ral_env regmodel;

wb_config cfg;
int my_seq_lenght;

   `uvm_component_utils_begin(wb_master_seqr)
	`uvm_field_int(my_seq_lenght,UVM_ALL_ON);
   `uvm_component_utils_end
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:wb_master_seqr
