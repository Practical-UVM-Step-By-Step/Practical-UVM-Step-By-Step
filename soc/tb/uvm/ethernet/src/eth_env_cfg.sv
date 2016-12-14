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

`ifndef ETH_ENV_CFG__SV
 `define ETH_ENV_CFG__SV

class eth_env_cfg extends uvm_object; 

   // Define test configuration parameters (e.g. how long to run)
   rand int num_trans;

   rand int mac_wb_start_addr;
   rand  bit [47:0] mac_eth_addr;
   rand  bit [47:0] testbench_eth_addr;
   rand int unsigned slave_mem_start_addr;
   rand int unsigned slave_mem_end_addr;

   rand bit ReceiveControlFrameMask;
   rand bit TransmitControlFrameMask;
   rand bit BusyMask;
   rand bit ReceiveErrorMask;
   rand bit ReceivedFrameMask;
   rand bit TransmitBufferMask;

   constraint cst_num_trans_default {
      num_trans inside {[1:7]};
   }

   constraint valid_mem_start_addr {
      slave_mem_start_addr == 32'h0;
   }
   constraint valid_mem_end_addr {
      slave_mem_end_addr == 32'heFFFFFFF;
   }

   `uvm_object_utils_begin(eth_env_cfg)
      `uvm_field_int(num_trans,UVM_ALL_ON) 
      `uvm_field_int(mac_wb_start_addr,UVM_ALL_ON)
      `uvm_field_int(mac_eth_addr,UVM_ALL_ON)
      `uvm_field_int(testbench_eth_addr,UVM_ALL_ON)
      `uvm_field_int(slave_mem_start_addr,UVM_ALL_ON)
      `uvm_field_int(slave_mem_end_addr,UVM_ALL_ON)

      `uvm_field_int(ReceiveControlFrameMask,UVM_ALL_ON)
      `uvm_field_int(TransmitControlFrameMask,UVM_ALL_ON)
      `uvm_field_int(BusyMask,UVM_ALL_ON)
      `uvm_field_int(ReceiveErrorMask,UVM_ALL_ON)
      `uvm_field_int(ReceivedFrameMask,UVM_ALL_ON)
      `uvm_field_int(TransmitBufferMask,UVM_ALL_ON)
   `uvm_object_utils_end

   constraint reasonableMasks {
      ReceiveControlFrameMask == 1;
      TransmitControlFrameMask ==1 ;
      BusyMask == 1;
      ReceiveErrorMask == 1;
      ReceivedFrameMask ==1;
      TransmitBufferMask ==1;
   };
   function new(string name = "eth_env_cfg");
      super.new(name);
   endfunction
   
endclass: eth_env_cfg

`endif // ETH_ENV_CFG__SV
