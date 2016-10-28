//
// Template for UVM-compliant sequencer class
//

typedef class wb_transaction;
typedef class wb_config;
class wb_master_seqr extends uvm_sequencer # (wb_transaction);

wb_config cfg;

   `uvm_component_utils(wb_master_seqr)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:wb_master_seqr
