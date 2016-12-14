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

`ifndef SPI_IF
 `define SPI_IF
/******************************************
 * SPI Interface
 ******************************************/
interface spi_if  (input bit clk, rst);
   logic           sck;         // serial clock output
   logic           mosi;        // masterout slavein
   logic           miso;        // masterin slaveout
   
   clocking cb @(posedge clk);
      default input #0.5ns output #0.5ns;

      inout 	   sck;  
      inout 	   mosi; 
      inout 	   miso; 
   endclocking

   modport MP (clocking cb);

endinterface: spi_if

`endif
