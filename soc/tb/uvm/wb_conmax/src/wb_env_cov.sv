/***********************************************
 *                                              *
 * Examples for the book Practical UVM          *
 *                                              *
 * Copyright Srivatsa Vasudevan 2010-2016       *
 * All rights reserved                          *
 *                                              *
 * Permission is granted to use this work       * 
 * provided this notice and attached license.txt*
 * are not removed/altered while redistributing *
 * See license.txt for details                  *
 *                                              *
 ************************************************/

//
//

`ifndef WB_ENV_COV__SV
 `define WB_ENV_COV__SV

class wb_env_cov extends uvm_component;
   event cov_event;
   wb_transaction tr;
   uvm_analysis_imp #(wb_transaction, wb_env_cov) cov_export;
   `uvm_component_utils(wb_env_cov)
   
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

endclass: wb_env_cov

`endif // WB_ENV_COV__SV

