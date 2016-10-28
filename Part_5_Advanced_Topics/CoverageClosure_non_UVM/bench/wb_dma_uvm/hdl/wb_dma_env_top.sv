//
// Template for Top module
//

`ifndef WB_DMA_ENV_TOP__SV
`define WB_DMA_ENV_TOP__SV

module wb_dma_env_top();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 50;

   always 
      begin
         clk = #(sim_cycle/2) ~clk;
      end

   wb_master_if mst_if(clk,rst);
   wb_slave_if slv_if(clk,rst);
   
   wb_dma_env_tb_mod test(); 
   
   // ToDo: Include Dut instance here
  
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

endmodule: wb_dma_env_top

`endif // WB_DMA_ENV_TOP__SV
