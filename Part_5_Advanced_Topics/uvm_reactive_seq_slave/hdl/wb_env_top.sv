//
// Template for Top module
//

`ifndef WB_ENV_TOP__SV
`define WB_ENV_TOP__SV

module wb_env_top_mod();

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

   wb_master_if mast_if(clk,rst);
   wb_slave_if slave_if(clk,rst);

   wb_env_tb_mod test(); 
   
/*
dut dut(
	.clk(clk),
	.MCYC_I(mast_if.clk),
	.MDAT_I(mast_if.DAT_I),
	.MDAT_O(mast_if.DAT_O),
	.MRST_I(mast_if.RST_I),
	.MTGD_I(mast_if.TGD_I[15:0]),
	.MTGD_O(mast_if.TGD_O[15:0]),
	
	.MACK_I(mast_if.ACK_I),
	.MADR_O(mast_if.ADR_O[63:0]),
	.MCYC_O(mast_if.CYC_O),
	.MERR_I(mast_if.ERR_I),
	.MLOCK_O(mast_if.LOCK_O),
	.MRTY_I(mast_if.RTY_I),
	.MSEL_O(mast_if.SEL_O[7:0]),
	.MSTB_O(mast_if.STB_O),
	.MTGA_O(mast_if.TGA_O[15:0]),
	
	.MTGC_O(mast_if.TGC_O[15:0]),
	.MWE_O(mast_if.WE_O),


	.SCYC_I(slave_if.CYC_I),
 	.SDAT_I(slave_if.DAT_I[63:0]),
	.SDAT_O(slave_if.DAT_O[63:0]),
	.SRST_I(slave_if.RST_I),
	.STGD_I(slave_if.TGD_I[15:0]),
	.STGD_O(slave_if.TGD_O[15:0]),
	
	.SACK_O(slave_if.ACK_O),
	.SADR_I(slave_if.ADR_I),
	.SERR_O(slave_if.ERR_O),
	.SLOCK_I(slave_if.LOCK_I),
	.SRTY_O(slave_if.RTY_O),
	.SSEL_I(slave_if.SEL_I[7:0]),
	.SSTB_I(slave_if.STB_I),
 	.STGA_I(slave_if.TGA_I[15:0]),
 	.STGC_I(slave_if.TGC_I[15:0]),
	.SWE_I(slave_if.WE_I ));
*/

dut dut(mast_if,slave_if);

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

endmodule: wb_env_top_mod

`endif // WB_ENV_TOP__SV
