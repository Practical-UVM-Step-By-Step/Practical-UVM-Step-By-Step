`ifndef WB_ENV_COV__SV
 `define WB_ENV_COV__SV
typedef class wb_transaction;

class wb_env_cov  extends uvm_subscriber #(wb_transaction);
   event cov_event;
   wb_transaction tr;
   `uvm_component_utils(wb_env_cov)
   
   covergroup cg_trans @(cov_event);
      coverpoint tr.kind;
      coverpoint tr.address {
         bins low = {[0:10]};
         bins mid = {[10:100]};
         bins high = {[100:$]};
      }
      coverpoint tr.lock ;
      coverpoint tr.status;
      coverpoint tr.num_wait_states {
         bins legal[] = {[0:15]};
         illegal_bins ib = {[16:$]};

      }

   endgroup: cg_trans


   function new(string name, uvm_component parent);
      super.new(name,parent);
      cg_trans = new;
   endfunction: new

   virtual function void write(wb_transaction t);
      this.tr = t;
      -> cov_event;
   endfunction: write

endclass: wb_env_cov

`endif // WB_ENV_COV__SV

