`ifndef WB_ENV_TOP__SV
 `define WB_ENV_TOP__SV

module wb_env_top_mod();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 10;
   initial begin 
      clk  = 0;
      #10;
      forever clk = #(sim_cycle/2) ~clk;
      #10000 $finish;
   end 

   wb_master_if mast_if(clk,rst);
   wb_slave_if slave_if(clk,rst);
   wb_env_tb_mod test(); 
   

   dut dut(mast_if,slave_if);

   //Driver reset depending on rst_delay
   initial
     begin
        clk = 0;
        rst = 0;
	#5 rst = 1;
        repeat (rst_delay) @(clk);
        rst = 1'b0;
        @(clk);
     end

endmodule: wb_env_top_mod

`endif // WB_ENV_TOP__SV
