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

`timescale 1ns/1ps
`ifndef ETH_BLK_ENV_TB_MOD__SV
 `define ETH_BLK_ENV_TB_MOD__SV

 `include "mstr_slv_intfs.incl"

module eth_blk_env_tb_mod;
   import uvm_pkg::*;
   typedef virtual mii_if mii_intf;
   typedef virtual wb_master_if mast_if;
   typedef virtual wb_slave_if slv_if;
   typedef virtual eth_rst_intr_if  eth_rst_intr_if;
 `include "eth_blk_env.sv"
 `include "eth_blk_env_test.sv"  
 `include "eth_transmit.sv"  
 `include "eth_transmit_barrier.sv"  
 `include "eth_transmit_virt_sequence_test.sv"  
 `include "eth_transmit_event_sync.sv"

   initial begin
      uvm_config_db #(mast_if)::set(null,"","mst_if",eth_env_top.mast_if); 
      uvm_config_db #(slv_if)::set(null,"","slv_if",eth_env_top.slv_if);
      uvm_config_db #(mii_intf)::set(null,"","mii_if",eth_env_top.mii_if_b);
      uvm_config_db #(eth_rst_intr_if)::set(null,"","ethernet_int_if",eth_env_top.intr_if);

      run_test();
   end

endmodule

`endif // ETH_BLK_ENV_TB_MOD__SV

