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
// Template for Top module
//

`ifndef WB_SPI_ENV_TOP__SV
 `define WB_SPI_ENV_TOP__SV
 `include "wb_master_if.sv"
 `include "wb_slave_if.sv"
 `include "spi_if.sv"
 `include "timescale.v"
module wb_spi_env_top();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 50;
   

   initial begin
      clk = 0;
      forever clk = #(sim_cycle/2) ~clk;
   end

   wb_master_if mst_if(clk,rst);
   wb_slave_if slv_if(clk,rst);
   spi_if spi_if(clk,rst);
   
   wb_spi_env_tb_mod test(); 
   // Dut Instance Wrapper 
   spi_wrap_top wrap_inst(slv_if, spi_if);
   
   //Driver reset depending on rst_delay
   initial
     begin
        clk = 0;
        rst = 0;
	#1 rst = 1;
        repeat (rst_delay) @(clk);
        rst = 1'b0;
        @(clk);
     end

endmodule

`endif // WB_SPI_ENV_TOP__SV
