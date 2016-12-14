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

`ifndef SPI_SEQR__SV
 `define SPI_SEQR__SV

typedef class spi_transaction;
class spi_seqr extends uvm_sequencer # (spi_transaction);

   `uvm_component_utils(spi_seqr)
   function new (string name,
                 uvm_component parent);
      super.new(name,parent);
   endfunction:new 
endclass:spi_seqr

`endif // SPI_SEQR__SV
