`ifndef WB_RAL_SEQUENCER__SV
`define WB_RAL_SEQUENCER__SV

typedef class ral_block_simple_ral_env;
class wb_ral_sequencer extends wb_master_seqr;

 ral_block_simple_ral_env regmodel;

   `uvm_component_utils(wb_ral_sequencer)
   function new (string name, uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:wb_ral_sequencer

`endif // WB_RAL_SEQUENCER__SV
