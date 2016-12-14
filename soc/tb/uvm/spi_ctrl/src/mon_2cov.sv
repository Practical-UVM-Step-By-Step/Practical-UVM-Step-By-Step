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


`ifndef MSTR_MON_2COV_CONNECT
 `define MSTR_MON_2COV_CONNECT
class mstr_mon_2cov_connect extends uvm_component;
   wb_spi_env_cov cov;
   uvm_analysis_export # (wb_transaction) an_exp;
   `uvm_component_utils(mstr_mon_2cov_connect)
   function new(string name="", uvm_component parent=null);
      super.new(name, parent);
   endfunction: new

   virtual function void write(wb_transaction tr);
      cov.tr = tr;
      -> cov.cov_event;
   endfunction:write 
endclass: mstr_mon_2cov_connect

`endif // MSTR_MON_2COV_CONNECT
