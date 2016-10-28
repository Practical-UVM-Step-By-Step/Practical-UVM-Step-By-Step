`include "wb_master_if.sv"
`include "wb_slave_if.sv"

module dut(wb_master_if mast_if, wb_slave_if slave_if);

 assign slave_if.CYC_I = mast_if.CYC_O;

 assign slave_if.DAT_I = mast_if.DAT_O;
 assign mast_if.DAT_I = slave_if.DAT_O;

 assign mast_if.DAT_I = slave_if.DAT_O;
 assign slave_if.TGD_I = mast_if.TGD_O;
 assign mast_if.TGD_I = slave_if.TGD_O;

 assign mast_if.ACK_I = slave_if.ACK_O;
 

 assign slave_if.ADR_I = mast_if.ADR_O;
 assign mast_if.ERR_I = slave_if.ERR_O;
 assign slave_if.LOCK_I = mast_if.LOCK_O;
 assign slave_if.SEL_I = mast_if.SEL_O;
 assign slave_if.STB_I = mast_if.STB_O;
 assign slave_if.TGA_I = mast_if.TGA_O;
 assign slave_if.TGC_I = mast_if.TGC_O;
 assign slave_if.WE_I = mast_if.WE_O;
 assign mast_if.RTY_I = slave_if.RTY_O;
 assign mast_if.RST_I = 1;
 assign slave_if.RST_I = 1;


endmodule
