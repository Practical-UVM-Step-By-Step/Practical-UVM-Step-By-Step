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

`ifndef WB_SPI_ENV_TB_MOD__SV
 `define WB_SPI_ENV_TB_MOD__SV
 `include "timescale.v"
 `include "mstr_slv_intfs.incl"
module wb_spi_env_tb_mod;

   import uvm_pkg::*;

 `include "wb_spi_env_ral_env.sv"
 `include "wb_spi_env_test.sv"  //ToDo: Change this name to the testcase file-name

   // ToDo: Include all other test list here
   typedef virtual wb_master_if v_if1;
   typedef virtual wb_slave_if v_if2;
   typedef virtual spi_if v_if3;
   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",wb_spi_env_top.mst_if); 
      uvm_config_db #(v_if3)::set(null,"","spi_if",wb_spi_env_top.spi_if);
      uvm_config_db #(v_if2)::set(null,"","slv_if",wb_spi_env_top.slv_if);
      run_test();
   end

endmodule: wb_spi_env_tb_mod

`endif // WB_SPI_ENV_TB_MOD__SV

