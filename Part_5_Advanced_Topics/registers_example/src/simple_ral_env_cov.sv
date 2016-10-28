//
// Template for UVM-compliant Coverage Class
//

`ifndef SIMPLE_RAL_ENV_COV__SV
`define SIMPLE_RAL_ENV_COV__SV

class simple_ral_env_cov extends uvm_component;
   event cov_event;
   wb_transaction tr;
   uvm_analysis_imp #(wb_transaction, simple_ral_env_cov) cov_export;
   `uvm_component_utils(simple_ral_env_cov)
 
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

endclass: simple_ral_env_cov

`endif // SIMPLE_RAL_ENV_COV__SV

