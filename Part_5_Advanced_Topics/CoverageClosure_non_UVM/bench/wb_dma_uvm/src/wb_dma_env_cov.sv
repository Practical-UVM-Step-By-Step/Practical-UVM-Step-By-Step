//
// Template for UVM-compliant Coverage Class
//

`ifndef WB_DMA_ENV_COV__SV
`define WB_DMA_ENV_COV__SV
typedef class wb_transaction;
// class wb_dma_env_cov extends uvm_component;
class wb_dma_env_cov extends uvm_component;
   event cov_event;
   wb_transaction tr;
   uvm_analysis_imp #(wb_transaction, wb_dma_env_cov) cov_export;
   `uvm_component_utils(wb_dma_env_cov)
 
   covergroup cg_trans @(cov_event);
      coverpoint tr.kind;
      coverpoint tr.address {
       bins lo =   {[0:100]};
       bins med =   {[101:200]};
       bins hi = {[300:$]};
	}
     tga: coverpoint tr.tga {
	bins sane = {[0:255]};
	ignore_bins hi = {[256:$]};
    }
     // tgc: coverpoint tr.tgc ;
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

endclass: wb_dma_env_cov

`endif // WB_DMA_ENV_COV__SV

