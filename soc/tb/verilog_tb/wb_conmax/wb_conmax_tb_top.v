//
// Template for Top module
//

`ifndef WB_ENV_TB_TOP
`define WB_ENV_TB_TOP

module wb_conmax_tb_top();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 5;
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

module wb_conmax_wrap(mast_if0,mast_if1,mast_if2,mast_if3,
	              mast_if4,mast_if5,mast_if6,mast_if7,
		      slave_if0,slave_if1,slave_if2,slave_if3,
		      slave_if4,slave_if5,slave_if6,slave_if7,
		      slave_if8,slave_if1,slave_if2,slave_if11,
		      slave_if12,slave_if13,slave_if14,slave_if15);


   wb_env_tb_top_mod test(); 
   
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

endmodule: wb_conmax_tb_top

`endif // WB_ENV_TB_TOP
