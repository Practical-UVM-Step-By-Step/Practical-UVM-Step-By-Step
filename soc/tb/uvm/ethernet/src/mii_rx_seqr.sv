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

`ifndef MII_RX_SEQR__SV
 `define MII_RX_SEQR__SV

typedef class mii_transaction;
class mii_rx_seqr extends uvm_sequencer # (mii_transaction);

   `uvm_component_utils(mii_rx_seqr)
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
   endfunction:new 
endclass:mii_rx_seqr

`endif // MII_RX_SEQR__SV
