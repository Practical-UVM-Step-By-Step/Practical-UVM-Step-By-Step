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

`ifndef WB_ENV_TB_TOP
 `define WB_ENV_TB_TOP
 `include "wb_conmax_env_defines.svh"
 `timescale 1ns/1ps
module wb_conmax_tb_top();

   import uvm_pkg::*;

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 10;
   initial begin 
      clk  = 0;
      forever clk = #(sim_cycle/2) ~clk;
      #10000 $finish;
   end 

   wb_master_if mast_if0(clk,rst);
   wb_master_if mast_if1(clk,rst);
   wb_master_if mast_if2(clk,rst);
   wb_master_if mast_if3(clk,rst);
   wb_master_if mast_if4(clk,rst);
   wb_master_if mast_if5(clk,rst);
   wb_master_if mast_if6(clk,rst);
   wb_master_if mast_if7(clk,rst);
   wb_slave_if slave_if0(clk,rst);
   wb_slave_if slave_if1(clk,rst);
   wb_slave_if slave_if2(clk,rst);
   wb_slave_if slave_if3(clk,rst);
   wb_slave_if slave_if4(clk,rst);
   wb_slave_if slave_if5(clk,rst);
   wb_slave_if slave_if6(clk,rst);
   wb_slave_if slave_if7(clk,rst);
   wb_slave_if slave_if8(clk,rst);
   wb_slave_if slave_if9(clk,rst);
   wb_slave_if slave_if10(clk,rst);
   wb_slave_if slave_if11(clk,rst);
   wb_slave_if slave_if12(clk,rst);
   wb_slave_if slave_if13(clk,rst);
   wb_slave_if slave_if14(clk,rst);
   wb_slave_if slave_if15(clk,rst);

   wb_conmax_wrap conmax_wrap(mast_if0,mast_if1,mast_if2,mast_if3,
			      mast_if4,mast_if5,mast_if6,mast_if7,
			      slave_if0,slave_if1,slave_if2,slave_if3,
			      slave_if4,slave_if5,slave_if6,slave_if7,
			      slave_if8,slave_if1,slave_if2,slave_if11,
			      slave_if12,slave_if13,slave_if14,slave_if15,clk,rst);

   wb_conmax_env_tb_mod test(); 
   
   //Driver reset depending on rst_delay
   initial
     begin

        clk = 0;
        rst = 0;
	#150 rst = 1;
        repeat (rst_delay) @(clk);
        rst = 1'b0;
        @(clk);
     end

   // Shorts for signals  not supported by the conmax that are present in the interface

   assign  slave_if0.TGA_I = 7'b0;
   assign  slave_if0.TGC_I = 7'b0;
   assign  slave_if0.TGD_I = 7'b0;
   assign  slave_if0.LOCK_I = 1'b0;

   
   assign  slave_if1.TGA_I = 7'b0;
   assign  slave_if1.TGC_I = 7'b0;
   assign  slave_if1.TGD_I = 7'b0;
   assign  slave_if1.LOCK_I = 1'b0;

   
   assign  slave_if2.TGA_I = 7'b0;
   assign  slave_if2.TGC_I = 7'b0;
   assign  slave_if2.TGD_I = 7'b0;
   assign  slave_if2.LOCK_I = 1'b0;

   
   assign  slave_if3.TGA_I = 7'b0;
   assign  slave_if3.TGC_I = 7'b0;
   assign  slave_if3.TGD_I = 7'b0;
   assign  slave_if3.LOCK_I = 1'b0;

   
   assign  slave_if4.TGA_I = 7'b0;
   assign  slave_if4.TGC_I = 7'b0;
   assign  slave_if4.TGD_I = 7'b0;
   assign  slave_if4.LOCK_I = 1'b0;

   
   assign  slave_if5.TGA_I = 7'b0;
   assign  slave_if5.TGC_I = 7'b0;
   assign  slave_if5.TGD_I = 7'b0;
   assign  slave_if5.LOCK_I = 1'b0;

   
   assign  slave_if6.TGA_I = 7'b0;
   assign  slave_if6.TGC_I = 7'b0;
   assign  slave_if6.TGD_I = 7'b0;
   assign  slave_if6.LOCK_I = 1'b0;

   
   assign  slave_if7.TGA_I = 7'b0;
   assign  slave_if7.TGC_I = 7'b0;
   assign  slave_if7.TGD_I = 7'b0;
   assign  slave_if7.LOCK_I = 1'b0;

   
   assign  slave_if8.TGA_I = 7'b0;
   assign  slave_if8.TGC_I = 7'b0;
   assign  slave_if8.TGD_I = 7'b0;
   assign  slave_if8.LOCK_I = 1'b0;

   
   assign  slave_if9.TGA_I = 7'b0;
   assign  slave_if9.TGC_I = 7'b0;
   assign  slave_if9.TGD_I = 7'b0;
   assign  slave_if9.LOCK_I = 1'b0;

   
   assign  slave_if10.TGA_I = 7'b0;
   assign  slave_if10.TGC_I = 7'b0;
   assign  slave_if10.TGD_I = 7'b0;
   assign  slave_if10.LOCK_I = 1'b0;

   
   assign  slave_if11.TGA_I = 7'b0;
   assign  slave_if11.TGC_I = 7'b0;
   assign  slave_if11.TGD_I = 7'b0;
   assign  slave_if11.LOCK_I = 1'b0;

   
   assign  slave_if12.TGA_I = 7'b0;
   assign  slave_if12.TGC_I = 7'b0;
   assign  slave_if12.TGD_I = 7'b0;
   assign  slave_if12.LOCK_I = 1'b0;

   
   assign  slave_if13.TGA_I = 7'b0;
   assign  slave_if13.TGC_I = 7'b0;
   assign  slave_if13.TGD_I = 7'b0;
   assign  slave_if13.LOCK_I = 1'b0;

   
   assign  slave_if14.TGA_I = 7'b0;
   assign  slave_if14.TGC_I = 7'b0;
   assign  slave_if14.TGD_I = 7'b0;
   assign  slave_if14.LOCK_I = 1'b0;

   
   assign  slave_if15.TGA_I = 7'b0;
   assign  slave_if15.TGC_I = 7'b0;
   assign  slave_if15.TGD_I = 7'b0;
   assign  slave_if15.LOCK_I = 1'b0;

endmodule: wb_conmax_tb_top

`endif //WB_ENV_TB_TOP
