module dut(
input clk,
input	MCYC_I,
output [63:0]	MDAT_I,
input	 [63:0] MDAT_O,
output	MRST_I,
output	[15:0] MTGD_I,
input	[15:0] MTGD_O,
	
output	MACK_I,
input	[63:0] MADR_O,
input	MCYC_O,
output	MERR_I,
input	MLOCK_O,
output	MRTY_I,
input	[7:0] MSEL_O,
input	MSTB_O,
input	[15:0]MTGA_O,
	
input	 [15:0]MTGC_O,
input	MWE_O,


output	SCYC_I,
output [63:0]	SDAT_I,
input	 [63:0] SDAT_O,
output	SRST_I,
output	[15:0] STGD_I,
input	[15:0] STGD_O,
	

	
input	SACK_O,
output	[63:0] SADR_I,
input	SERR_O,
output	SLOCK_I,
input	SRTY_O,
output	[7:0] SSEL_I,
output	SSTB_I,
output [15:0]	STGA_I,
output [15:0]	STGC_I,
output	SWE_I );



assign	  MDAT_I = SDAT_O[63:0];
assign	 MTGD_I = STGD_O[15:0];
assign	SADR_I = MADR_O[ 63:0];
assign SDAT_I = MDAT_O[63:0];
assign	SCYC_I = MCYC_O;
assign	SLOCK_I = MLOCK_O;
assign	SSEL_I = MSEL_O[7:0];
assign	SSTB_I = MSTB_O;
assign	 STGA_I =  MTGA_O [15:0];
assign	 STGC_I = MTGC_O[15:0];
assign	SWE_I = MWE_O;
assign	MACK_I = SACK_O;
assign	MERR_I = SERR_O;
assign	MRTY_I = SRTY_O;


endmodule
