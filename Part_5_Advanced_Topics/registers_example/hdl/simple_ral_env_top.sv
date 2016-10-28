`timescale 1ns/1ps
`ifndef SIMPLE_RAL_ENV_TOP__SV
`define SIMPLE_RAL_ENV_TOP__SV
`define SIMPLE_RAL_ENV_TOP_PATH  simple_ral_env_top.dut
`include "wb_slave_behavioral.v"
module simple_ral_env_top();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 50;

initial
      begin
         clk = 0;
         forever clk = #(sim_cycle/2) ~clk;
      end


   wb_master_if mst_if(clk,rst);
   
   simple_ral_env_tb_mod test(); 
   
   // ToDo: Include Dut instance here
  
   //Driver reset depending on rst_delay
	   //Driver reset depending on rst_delay
   initial
      begin
         clk = 0;
         rst = 0;
      #150 rst = 1;
         repeat (rst_delay) @(clk);
         rst = 1'b0;
         @(clk);
         #100000000000 $finish;

   end



wb_dut dut
(
    .CLK_I(clk),
    .RST_I(rst),
    .ACK_O(mst_if.ACK_I),
    .ADR_I(mst_if.ADR_O),
    .CYC_I(mst_if.CYC_O),
    .DAT_O(mst_if.DAT_I),
    .DAT_I(mst_if.DAT_O),
    .ERR_O(eth_ma_wb_err_i),
    .RTY_O(),      // NOT USED for now!
    .SEL_I(mst_if.SEL_O),
    .STB_I(mst_if.STB_O),
    .WE_I (mst_if.WE_O),
    .CAB_I(1'b0)
);


endmodule: simple_ral_env_top

`endif // SIMPLE_RAL_ENV_TOP__SV
