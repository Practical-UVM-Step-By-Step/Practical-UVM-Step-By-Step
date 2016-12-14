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

`ifndef WB_SPI_ENV_CFG__SV
 `define WB_SPI_ENV_CFG__SV

class wb_spi_env_cfg extends uvm_object; 

   // Define test configuration parameters (e.g. how long to run)
   rand int num_trans;
   rand int num_scen;
   // ToDo: Add other environment configuration varaibles

   constraint cst_num_trans_default {
      num_trans inside {[1:7]};
   }
   constraint cst_num_scen_default {
      num_scen inside {[1:2]};
   }
   // ToDo: Add constraint blocks to prevent error injection

   extern function new(string name = "");
   `uvm_object_utils(wb_spi_env_cfg)
   extern virtual function void do_print(uvm_printer printer);
   extern virtual function void do_copy(uvm_object rhs = null);
   
endclass: wb_spi_env_cfg

function wb_spi_env_cfg::new(string name = "");
   super.new(name);
endfunction: new

function void wb_spi_env_cfg::do_print(uvm_printer printer);
   super.do_print(printer);
   printer.print_string ("PRINT",{ $sformatf("\t************** wb_spi_env_cfg ***************\n"),
				   $sformatf("\tnum_trans  : %0d\n", num_trans),
				   $sformatf("\t**********************************\n")
				   },".");
   //ToDo: Add another class properties to do_print if added later.

endfunction: do_print

function void wb_spi_env_cfg::do_copy(uvm_object rhs = null);
   wb_transaction to;
   super.do_copy(rhs);
   $cast(to,rhs);

   // ToDo: Copy additional class properties

endfunction: do_copy

`endif // WB_SPI_ENV_CFG__SV
