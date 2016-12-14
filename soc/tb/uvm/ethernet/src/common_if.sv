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

`ifndef ETHERNET_RST_INTF
 `define ETHERNET_RST_INTF
interface eth_rst_intr_if (input rst,intr);

   task wait_for_reset_assert;
      @(posedge rst);
   endtask

   task wait_for_reset_deassert;
      @(negedge rst);
   endtask

   task wait_for_intr_pos;
      @(posedge intr);
   endtask
   task wait_for_intr_neg;
      @(negedge intr);
   endtask

endinterface
typedef virtual eth_rst_intr_if interrupt_eth_if;
`endif
