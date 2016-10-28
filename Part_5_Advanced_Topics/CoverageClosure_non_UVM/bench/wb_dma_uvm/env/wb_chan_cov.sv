`ifndef WB_CHAN_COV__SV
`define WB_CHAN_COV__SV

class wb_chan_cov extends uvm_component;
   event cov_event;
   wb_transaction tr;
   uvm_analysis_imp #(wb_transaction, wb_chan_cov) cov_export;
   `uvm_component_utils(wb_chan_cov)
 
   covergroup cg_trans @(cov_event);
      coverpoint tr.kind;
      // ToDo: Add required coverpoints, coverbins
   endgroup: cg_trans


   function new(string name, uvm_component parent);
      super.new(name,parent);
      cg_trans = new;
      cov_export = new("Coverage Analysis",this);
   endfunction: new

   virtual function write(wb_transaction tr);
      this.tr = tr;
      -> cov_event;
   endfunction: write

endclass: wb_chan_cov

`endif // WB_CHAN_COV__SV

