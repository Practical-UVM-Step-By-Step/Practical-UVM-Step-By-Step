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

`ifndef MII_IF__SV
 `define MII_IF__SV

interface mii_if(input tx_clk,input rx_clk,input rst);

   logic [3:0] txd;
   logic       tx_en;
   logic       tx_err;
   logic [3:0] rxd;
   logic       rx_dv;
   logic       rx_err;
   logic       crs;
   logic       col;
   logic       intr;
   wire [1:20] tx_error_flags;
   bit 	       mii_FullDuplex = 0;

   clocking tx_cb @(posedge tx_clk);
      output   txd, tx_en, tx_err;
   endclocking

   clocking rx_cb @(posedge rx_clk);
      input    rxd, rx_dv, rx_err;
   endclocking

   modport mac_layer (clocking tx_cb,
                      clocking rx_cb,
                      input crs,
                      input col);

   modport mon_cb (clocking tx_cb,
                   clocking rx_cb,
                   input crs,
                   input col);
endinterface: mii_if

`endif
