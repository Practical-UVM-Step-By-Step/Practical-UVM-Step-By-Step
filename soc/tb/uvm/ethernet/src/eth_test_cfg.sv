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

`ifndef ETH_TEST_CFG__SV
 `define ETH_TEST_CFG__SV

class eth_test_cfg extends uvm_object; 

   // Define test configuration parameters (e.g. how long to run)
   rand int num_tx_pkts;
   rand int num_rx_pkts;
   rand bit enable_coll_on_tx;
   rand bit enable_coll_on_rx;
   bit [47:0] mac_eth_addr;
   bit [47:0] tb_eth_addr;

   constraint cst_num_tx_default {
      num_tx_pkts inside {[1:7]};
   }

   constraint cst_num_rx_default {
      num_rx_pkts inside {[1:7]};
   }
   constraint  cst_enable_coll_on_tx {
      enable_coll_on_tx == 0;
   }

   `uvm_object_utils_begin(eth_test_cfg)
      `uvm_field_int(num_tx_pkts,UVM_ALL_ON) 
      `uvm_field_int(num_rx_pkts,UVM_ALL_ON)
      `uvm_field_int(enable_coll_on_tx,UVM_ALL_ON)
      `uvm_field_int(enable_coll_on_rx,UVM_ALL_ON)
      `uvm_field_int(mac_eth_addr,UVM_ALL_ON)
      `uvm_field_int(tb_eth_addr,UVM_ALL_ON)
   `uvm_object_utils_end

   extern function new(string name = "");
   
endclass: eth_test_cfg

function eth_test_cfg::new(string name = "");
   super.new(name);
endfunction: new

`endif // ETH_TEST_CFG__SV
