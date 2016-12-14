/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Top Level Test Bench                                       ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/vga_lcd/   ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Rudolf Usselmann                         ////
////                    rudi@asics.ws                            ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: test_bench_top.v,v 1.10 2003-09-23 13:09:25 markom Exp $
//
//  $Date: 2003-09-23 13:09:25 $
//  $Revision: 1.10 $
//  $Author: markom $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.9  2003/08/22 07:12:31  rherveille
//               Enabled Fifo Underrun test
//
//               Revision 1.8  2003/05/07 14:39:19  rherveille
//               Added DVI tests
//
//               Revision 1.7  2003/05/07 09:45:28  rherveille
//               Numerous updates and added checks
//
//               Revision 1.6  2003/03/19 17:22:19  rherveille
//               Added WISHBONE revB.3 sanity checks
//
//               Revision 1.5  2003/03/19 12:20:53  rherveille
//               Changed timing section in VGA core, changed testbench accordingly.
//               Fixed bug in 'timing check' test.
//
//               Revision 1.4  2002/02/07 05:38:32  rherveille
//               Added wb_ack delay section to testbench
//
//
//
//
//

`timescale 1ns/10ps

module test;

reg		clk;
reg		rst;

parameter	LINE_FIFO_AWIDTH = 7;

wire		int;
wire	[31:0]	wb_addr_o;
wire	[31:0]	wb_data_i;
wire	[31:0]	wb_data_o;
wire	[3:0]	wb_sel_o;
wire		wb_we_o;
wire		wb_stb_o;
wire		wb_cyc_o;
wire	[2:0]	wb_cti_o;
wire	[1:0]	wb_bte_o;
wire		wb_ack_i;
wire		wb_err_i;
wire	[31:0]	wb_addr_i;
wire	[31:0]	wbm_data_i;
wire	[3:0]	wb_sel_i;
wire		wb_we_i;
wire		wb_stb_i;
wire		wb_cyc_i;
wire		wb_ack_o;
wire		wb_rty_o;
wire		wb_err_o;
reg		pclk_i;
wire		pclk;
wire    	hsync;
wire		vsync;
wire    	ihsync;
wire		ivsync;
wire		csync;
wire		blanc;
wire	[7:0]	red;
wire	[7:0]	green;
wire	[7:0]	blue;
wire		dvi_de_o;
`ifdef VGA_12BIT_DVI
wire	[11:0]	dvi_d_o;
`else
wire	[23:0]	dvi_d_o;
`endif

wire vga_stb_i;
wire clut_stb_i;

reg		scen;

// Test Bench Variables
integer		wd_cnt;
integer		error_cnt;

// Misc Variables
reg	[31:0]	data;
reg	[31:0]	pattern;
reg		int_warn;

integer		n;
integer		mode;

reg	[7:0]	thsync, thgdel;
reg	[15:0]	thgate, thlen;
reg	[7:0]	tvsync, tvgdel;
reg	[15:0]	tvgate, tvlen;
reg		hpol;
reg		vpol;
reg		cpol;
reg		bpol;
integer		p, l;
reg	[31:0]	pn;
reg	[31:0]	pra, paa, tmp;
reg	[23:0]	pd;
reg	[1:0]	cd;
reg		pc;
reg	[31:0]	vbase;
reg	[31:0]	cbase;
reg	[31:0]	vbara;
reg	[31:0]	vbarb;
reg	[7:0]	bank;

/////////////////////////////////////////////////////////////////////
//
// Defines
//

`define	CTRL		32'h0000_0000
`define	STAT		32'h0000_0004
`define	HTIM		32'h0000_0008
`define	VTIM		32'h0000_000c
`define	HVLEN		32'h0000_0010
`define	VBARA		32'h0000_0014
`define	VBARB		32'h0000_0018

`define USE_VC		1

parameter	PCLK_C = 30;

/////////////////////////////////////////////////////////////////////
//
// Simulation Initialization and Start up Section
//

initial
   begin
	$timeformat (-9, 1, " ns", 12);
	$display("\n\n");
	$display("******************************************************");
	$display("* WISHBONE VGA/LCD Controller Simulation started ... *");
	$display("******************************************************");
	$display("\n");
`ifdef WAVES
  	$shm_open("waves");
	$shm_probe("AS",test,"AS");
	$display("INFO: Signal dump enabled ...\n\n");
`endif
	scen = 0;
	error_cnt = 0;
   	clk = 0;
	pclk_i = 0;
   	rst = 0;
	int_warn=1;

   	repeat(20)	@(posedge clk);
   	rst = 1;
   	repeat(20)	@(posedge clk);

	// HERE IS WHERE THE TEST CASES GO ...

if(0)	// Full Regression Run
   begin

   end
else
if(1)	// Quick Regression Run
   begin
	reg_test;
	tim_test;

`ifdef VGA_24BIT_DVI
	dvi_pd_test;
`endif
`ifdef VGA_12BIT_DVI
`else
	pd1_test;
	pd2_test;
`endif

	ur_test;
   end
else
   begin

	//
	// TEST DEVELOPMENT AREA
	//
$display("\n\n");
$display("*****************************************************");
$display("*** XXX Test                                 ***");
$display("*****************************************************\n");

	s0.fill_mem(1);

	repeat(10) @(posedge clk);

	vbara = 32'h0000_0000;
	vbarb = 32'h0001_0000;

	m0.wb_wr1( `VBARA, 4'hf, vbara );
	m0.wb_wr1( `VBARB, 4'hf, vbarb );

	thsync = 0;
	thgdel = 0;
	thgate = 340;
	thlen = 345;

	tvsync = 0;
	tvgdel = 0;
	tvgate = 240;
	tvlen = 245;

/*
	thsync = 0;
	thgdel = 0;
	thgate = 63;
	thlen = 70;

	tvsync = 0;
	tvgdel = 0;
	tvgate = 32;
	tvlen = 36;
*/

	hpol = 0;
	vpol = 0;
	cpol = 0;
	bpol = 0;

	m0.wb_wr1( `HTIM,  4'hf, {thsync, thgdel, thgate} );
	m0.wb_wr1( `VTIM,  4'hf, {tvsync, tvgdel, tvgate} );
	m0.wb_wr1( `HVLEN, 4'hf, {thlen, tvlen} );

mode = 2;

//for(mode=0;mode<1;mode=mode+1)
for(bank=0;bank<3;bank=bank + 1)
   begin
	case(mode)
	   0:
	     begin
		cd = 2'h2;
		pc = 1'b0;
	     end
	   1:
	     begin
		cd = 2'h0;
		pc = 1'b0;
	     end
	   2:
	     begin
		cd = 2'h0;
		pc = 1'b1;
	     end
	   3:
	     begin
		cd = 2'h1;
		pc = 1'b0;
	     end
	endcase

	m0.wb_wr1( `CTRL,  4'hf, {
				16'h0,	// Reserved
				bpol, cpol,
				vpol, hpol,
				pc,	// 1'b0,	// PC
				cd,	// 2'h2,	// CD
				2'h0,	// VBL
				1'b0,	// Reserved
				1'b1,	// CBSWE
				1'b1,	// VBSWE
				1'b0,	// BSIE
				1'b0,	// HIE
				1'b0,	// VIE
				1'b1	// Video Enable
				});

	$display("Mode: %0d Screen: %0d", mode, bank);
	//repeat(2) @(posedge vsync);
	@(posedge vsync);

	// For Each Line
	for(l=0;l<tvgate+1;l=l+1)
	// For each Pixel
	for(p=0;p<thgate+1;p=p+1)
	   begin
		while(blanc)	@(posedge pclk);  // wait for viewable data

		//$display("pixel=%0d, line=%0d, (%0t)",p,l,$time);

		if(bank[0])	vbase = vbarb[31:2];
		else		vbase = vbara[31:2];
		if(bank[0])	cbase = 32'h0000_0c00;
		else		cbase = 32'h0000_0800;

		// Depending on Mode, determine pixel data
		// pixel number = line * (thgate + 1) + p
		pn = l * (thgate + 1) + p;

		case(mode)
		   0:	// 24 bit/pixel mode
		   begin
			pra = pn[31:2] * 3;	// Pixel relative Address
			paa = pra + vbase;		// Pixel Absolute Address

			// Pixel Data
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				pd = tmp[31:8];
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd[23:16] = tmp[7:0];
				tmp = s0.mem[paa+1];
				pd[15:0] = tmp[31:16];
			     end
			   2:
			     begin
				tmp = s0.mem[paa+1];
				pd[23:8] = tmp[15:0];
				tmp = s0.mem[paa+2];
				pd[7:0] = tmp[31:24];
			     end
			   3:
			     begin
				tmp = s0.mem[paa+2];
				pd = tmp[23:0];
			     end
			endcase
		   end

		   1:	// 8 bit/pixel grayscale mode
		   begin
			pra = pn[31:2];		// Pixel relative Address
			paa = pra + vbase;	// Pixel Absolute Address
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[31:24], tmp[31:24], tmp[31:24] };
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[23:16], tmp[23:16], tmp[23:16] };
			     end
			   2:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[15:8], tmp[15:8], tmp[15:8] };
			     end
			   3:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[7:0], tmp[7:0], tmp[7:0] };
			     end
			endcase
		   end

		   2:	// 8 bit/pixel Pseudo Color mode
		   begin
			pra = pn[31:2];		// Pixel relative Address
			paa = pra + vbase;	// Pixel Absolute Address
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbase[31:2] + tmp[31:24]];
				pd = tmp[23:0];
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbase[31:2] + tmp[23:16]];
				pd = tmp[23:0];
			     end
			   2:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbase[31:2] + tmp[15:8]];
				pd = tmp[23:0];
			     end
			   3:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbase[31:2] + tmp[7:0]];
				pd = tmp[23:0];
			     end
			endcase
		   end

		   3:	// 16 bit/pixel mode
		   begin
			pra = pn[31:1];		// Pixel relative Address
			paa = pra + vbase;	// Pixel Absolute Address
			case(pn[0])
			   0:
			     begin
				tmp = s0.mem[paa];
				tmp[15:0] = tmp[31:16];
				pd = {tmp[15:11], 3'h0, tmp[10:5], 2'h0, tmp[4:0], 3'h0};
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd = {tmp[15:11], 3'h0, tmp[10:5], 2'h0, tmp[4:0], 3'h0};
			     end
			endcase
		   end

		endcase

		if(pd !== {red, green, blue} )
		   begin
			$display("ERROR: Pixel Data Mismatch: Expected: %h, Got: %h %h %h",
				pd, red, green, blue);
			$display("       pixel=%0d, line=%0d, (%0t)",p,l,$time);
			error_cnt = error_cnt + 1;
		   end

		@(posedge pclk);

	   end
   end

show_errors;
$display("*****************************************************");
$display("*** Test DONE ...                                 ***");
$display("*****************************************************\n\n");


   end

   	repeat(10)	@(posedge clk);
   	$finish;
   end

/////////////////////////////////////////////////////////////////////
//
// Sync Monitor
//

`ifdef VGA_12BIT_DVI
sync_check #(PCLK_C) ucheck(
`else
sync_check #(PCLK_C) ucheck(
`endif
		.pclk(		pclk		),
		.rst(		rst		),
		.enable(	scen		),
		.hsync(		hsync		),
		.vsync(		vsync		),
		.csync(		csync		),
		.blanc(		blanc		),
		.hpol(		hpol		),
		.vpol(		vpol		),
		.cpol(		cpol		),
		.bpol(		bpol		),
		.thsync(	thsync		),
		.thgdel(	thgdel		),
		.thgate(	thgate		),
		.thlen(		thlen		),
		.tvsync(	tvsync		),
		.tvgdel(	tvgdel		),
		.tvgate(	tvgate		),
		.tvlen(		tvlen		) );

/////////////////////////////////////////////////////////////////////
//
// Video Data Monitor
//

/////////////////////////////////////////////////////////////////////
//
// WISHBONE revB.3 checker
//

wb_b3_check u_wb_check (
	.clk_i ( clk      ),
	.cyc_i ( wb_cyc_o ),
	.stb_i ( wb_stb_o ),
	.cti_i ( wb_cti_o ),
	.bte_i ( wb_bte_o ),
	.we_i  ( wb_we_o  ),
	.ack_i ( wb_ack_i ),
	.err_i ( wb_err_i ),
	.rty_i ( 1'b0     ) );


/////////////////////////////////////////////////////////////////////
//
// Watchdog Counter
//

always @(posedge clk)
	if(wb_cyc_i | wb_cyc_o | wb_ack_i | wb_ack_o | hsync)
	  wd_cnt <= #1 0;
	else
	  wd_cnt <= #1 wd_cnt + 1;


always @(wd_cnt)
	if(wd_cnt>9000)
	   begin
		$display("\n\n*************************************\n");
		$display("ERROR: Watch Dog Counter Expired\n");
		$display("*************************************\n\n\n");
		$finish;
	   end


always @(posedge int)
  if(int_warn)
   begin
	$display("\n\n*************************************\n");
	$display("WARNING: Recieved Interrupt (%0t)", $time);
	$display("*************************************\n\n\n");
   end

always #2.4 clk = ~clk;
always #(PCLK_C/2) pclk_i = ~pclk_i;

/////////////////////////////////////////////////////////////////////
//
// WISHBONE VGA/LCD IP Core
//


// Module Prototype

`ifdef VGA_12BIT_DVI
vga_dvi_top #(1'b0, LINE_FIFO_AWIDTH) u0 (
`else
vga_enh_top #(1'b0, LINE_FIFO_AWIDTH) u0 (
`endif
		.wb_clk_i     ( clk             ),
		.wb_rst_i     ( 1'b0            ),
		.rst_i        ( rst             ),
		.wb_inta_o    ( int             ),

		//-- slave signals
		.wbs_adr_i    ( wb_addr_i[11:0] ),
		.wbs_dat_i    ( wb_data_i       ),
		.wbs_dat_o    ( wb_data_o       ),
		.wbs_sel_i    ( wb_sel_i        ),
		.wbs_we_i     ( wb_we_i         ),
		.wbs_stb_i    ( wb_stb_i        ),
		.wbs_cyc_i    ( wb_cyc_i        ),
		.wbs_ack_o    ( wb_ack_o        ),
		.wbs_rty_o    ( wb_rty_o        ),
		.wbs_err_o    ( wb_err_o        ),

		//-- master signals
		.wbm_adr_o    ( wb_addr_o[31:0] ),
		.wbm_dat_i    ( wbm_data_i      ),
		.wbm_sel_o    ( wb_sel_o        ),
		.wbm_we_o     ( wb_we_o         ),
		.wbm_stb_o    ( wb_stb_o        ),
		.wbm_cyc_o    ( wb_cyc_o        ),
		.wbm_cti_o    ( wb_cti_o        ),
		.wbm_bte_o    ( wb_bte_o        ),
		.wbm_ack_i    ( wb_ack_i        ),
		.wbm_err_i    ( wb_err_i        ),

		//-- VGA signals
		.clk_p_i      ( pclk_i          )
	`ifdef VGA_24BIT_DVI
	      , .dvi_hsync_o  ( ihsync          ),
		.dvi_vsync_o  ( ivsync          ),
	        .dvi_de_o     ( dvi_de_o        ),
		.dvi_d_o      ( dvi_d_o         )
	`endif
        `ifdef VGA_12BIT_DVI
        `else
              , .hsync_pad_o  ( hsync           ),
		.vsync_pad_o  ( vsync           ),
		.csync_pad_o  ( csync           ),
		.blank_pad_o  ( blanc           ),
		.r_pad_o      ( red             ),
		.g_pad_o      ( green           ),
		.b_pad_o      ( blue            )
        `endif

        `ifdef VGA_BIST
                /* BIST signals */
              , .scanb_rst(1'b1),
                .scanb_clk(1'b0),
                .scanb_si (1'b0),
                .scanb_en (1'b0),
                .scanb_so ()
        `endif
	);

assign pclk = pclk_i;

`ifdef VGA_12BIT_DVI
assign hsync = !ihsync;
assign vsync = !ivsync;
`endif

wb_mast	m0(	.clk(		clk		),
		.rst(		rst		),
		.adr(		wb_addr_i	),
		.din(		wb_data_o	),
		.dout(		wb_data_i	),
		.cyc(		wb_cyc_i	),
		.stb(		wb_stb_i	),
		.sel(		wb_sel_i	),
		.we(		wb_we_i		),
		.ack(		wb_ack_o	),
		.err(		wb_err_o	),
		.rty(		1'b0		)
		);

wb_slv #(24) s0(.clk(		clk		),
		.rst(		rst		),
		.adr(		{1'b0, wb_addr_o[30:0]}	),
		.din(		32'h0		),
		.dout(		wbm_data_i	),
		.cyc(		wb_cyc_o	),
		.stb(		wb_stb_o	),
		.sel(		wb_sel_o	),
		.we(		wb_we_o		),
		.ack(		wb_ack_i	),
		.err(		wb_err_i	),
		.rty(				)
		);

// `include "tests.v"

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Tests Library                                              ////
////                                                             ////
////                                                             ////
////  Authors: Rudolf Usselmann, Richard Herveille               ////
////           rudi@asics.ws,    richard@asics.ws                ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/vga_lcd/   ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Rudolf Usselmann                         ////
////                    rudi@asics.ws                            ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: tests.v,v 1.10 2003-09-23 13:09:25 markom Exp $
//
//  $Date: 2003-09-23 13:09:25 $
//  $Revision: 1.10 $
//  $Author: markom $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.9  2003/08/22 07:17:21  rherveille
//               Removed ctrl register's clut and vide bank switch from the register test. As they get reset automatically. This may result to erroneous errors.
//
//               Revision 1.8  2003/05/07 14:39:19  rherveille
//               Added DVI tests
//
//               Revision 1.7  2003/05/07 09:45:28  rherveille
//               Numerous updates and added checks
//
//               Revision 1.6  2003/03/19 12:20:53  rherveille
//               Changed timing section in VGA core, changed testbench accordingly.
//               Fixed bug in 'timing check' test.
//
//               Revision 1.5  2002/04/20 09:57:55  rherveille
//               Changed testbench to reflect modified VGA timing generator.
//
//
//
//
//


task show_errors;

begin

$display("\n");
$display("     +--------------------+");
$display("     |  Total ERRORS: %0d   |", error_cnt);
$display("     +--------------------+");

end
endtask


task reg_test;

reg	[31:0]	data;
reg	[31:0]	pattern;
integer		n;

begin
$display("\n\n");
$display("*****************************************************");
$display("*** Register Test                                 ***");
$display("*****************************************************\n");

	// Check reset Values
	$display("Testing Reset Values ...");
	check( `CTRL,  0, 32'h0000_ffff, "CTRL ");
	check( `STAT,  0, 32'h0000_0073, "STAT ");
	check( `HTIM,  0, 32'hffff_ffff, "HTIM ");
	check( `VTIM,  0, 32'hffff_ffff, "VTIM ");
	check( `HVLEN, 0, 32'hffff_ffff, "HVLEN");
	check( `VBARA, 0, 32'hffff_ffff, "VBARA");
	check( `VBARB, 0, 32'hffff_ffff, "VBARB");

	$display("Testing Pattern R/W ...");
for(n=0;n<6;n=n+1)
	begin
		case(n)
	 	  0: pattern = 32'h0000_0000;
	 	  1: pattern = 32'hffff_ffff;
	 	  2: pattern = 32'haaaa_aaaa;
	 	  3: pattern = 32'h5555_5555;
	 	  4: pattern = 32'hcccc_cccc;
	 	  5: pattern = 32'h3333_3333;
		endcase

		m0.wb_wr1( `CTRL, 4'hf, pattern );
		check( `CTRL,  pattern, 32'hffff_ff9f, "CTRL ");

		m0.wb_wr1( `HTIM, 4'hf, pattern );
		check( `HTIM,  pattern, 32'hffff_ffff, "HTIM ");

		m0.wb_wr1( `VTIM, 4'hf, pattern );
		check( `VTIM,  pattern, 32'hffff_ffff, "VTIM ");

		m0.wb_wr1( `HVLEN, 4'hf, pattern );
		check( `HVLEN, pattern, 32'hffff_ffff, "HVLEN");

		m0.wb_wr1( `VBARA, 4'hf, pattern );
		check( `VBARA, pattern, 32'hffff_fffc, "VBARA");

		m0.wb_wr1( `VBARB, 4'hf, pattern );
		check( `VBARB, pattern, 32'hffff_fffc, "VBARB");

	end

repeat(10)	@(posedge clk);

show_errors;
$display("*****************************************************");
$display("*** Test DONE ...                                 ***");
$display("*****************************************************\n\n");

end
endtask



task check;
input	[31:0]	addr;
input	[31:0]	edata;
input	[31:0]	mask;
input	[39:0]	name;

reg	[31:0]	data;
begin

m0.wb_rd1( addr, 4'hf, data );
if(( (data & mask) != (edata & mask)) | ((^data) === 1'bx) )
   begin
	$display("ERROR: %s Reg: Value Mismatch. Expected %h, Got %h (%0t)",
		name, edata & mask, data, $time);
	error_cnt = error_cnt + 1;
   end

end
endtask




task tim_test;

integer		mode;

begin
$display("\n\n");
$display("*****************************************************");
$display("*** Timing Test                                   ***");
$display("*****************************************************\n");

	s0.fill_mem(0);

   	repeat(10)	@(posedge clk);

	m0.wb_wr1( `VBARA, 4'hf, 0 );
	m0.wb_wr1( `VBARB, 4'hf, 0 );

mode = 2;
for(mode=0;mode<6;mode=mode+1)
   begin
	
	// reset core
	scen = 0;
	m0.wb_wr1( `CTRL,  4'hf, 32'h0000_0000);
	repeat(10)	@(posedge clk);

	$display("Mode: %0d", mode);

	case(mode)
		0:
		begin
			thsync = 0;
			thgdel = 0;
			thgate = 319; // gate = 320
			thlen = 345;

			tvsync = 0;
			tvgdel = 0;
			tvgate = 239; // vgate = 240
			tvlen = 245;

			hpol = 0;
			vpol = 0;
			cpol = 0;
			bpol = 0;
		end

		1:
		begin
			thsync = 18;
			thgdel = 18;
			thgate = 319; // gate = 320
			thlen = 390;

			tvsync = 18;
			tvgdel = 18;
			tvgate = 239; // vgate = 240
			tvlen = 290;

			hpol = 1;
			vpol = 0;
			cpol = 0;
			bpol = 0;
		end

		2:
		begin
			thsync = 1;
			thgdel = 1;
			thgate = 639; // hgate = 640
			thlen = 644;

			tvsync = 1;
			tvgdel = 1;
			tvgate = 479; // vgate = 480
			tvlen = 484;

			hpol = 0;
			vpol = 1;
			cpol = 0;
			bpol = 0;
		end

		3:
		begin
			thsync = 0;
			thgdel = 2;
			thgate = 799; // hgate = 800
			thlen = 804;

			tvsync = 0;
			tvgdel = 2;
			tvgate = 599; // vgate = 600
			tvlen = 604;

			hpol = 0;
			vpol = 0;
			cpol = 1;
			bpol = 0;
		end

		4:
		begin
			thsync = 3;
			thgdel = 2;
			thgate = 799; // hgate = 800
			thlen = 807;

			tvsync = 2;
			tvgdel = 2;
			tvgate = 599; // vgate = 600
			tvlen = 606;

			hpol = 0;
			vpol = 0;
			cpol = 0;
			bpol = 1;
		end

		5:
		begin
			thsync = 6;
			thgdel = 2;
			thgate = 799; // hgate = 800
			thlen = 810;

			tvsync = 4;
			tvgdel = 2;
			tvgate = 599; // vgate = 600
			tvlen = 608;

			hpol = 1;
			vpol = 1;
			cpol = 1;
			bpol = 1;
		end
	endcase

/*
	thsync = 0;
	thgdel = 0;
	thgate = 64;
	thlen = 70;

	tvsync = 0;
	tvgdel = 0;
	tvgate = 64;
	tvlen = 70;

	hpol = 0;
	vpol = 0;
	cpol = 0;
	bpol = 0;
*/


	m0.wb_wr1( `HTIM,  4'hf, {thsync, thgdel, thgate} );
	m0.wb_wr1( `VTIM,  4'hf, {tvsync, tvgdel, tvgate} );
	m0.wb_wr1( `HVLEN, 4'hf, {thlen, tvlen} );
	m0.wb_wr1( `CTRL,  4'hf, {
				16'h0,
				bpol, cpol,
				vpol, hpol,
				1'b0,	// PC
				2'h0,	// CD
				2'h0,	// VBL
				2'h0,	// Reserved
				5'h01	// Bank Switch, INT, VideoEn
				});

	repeat(2) @(posedge vsync);
	scen = 1;
	repeat(4) @(posedge vsync);
   end

scen = 0;
repeat(10)	@(posedge clk);

show_errors;
$display("*****************************************************");
$display("*** Test DONE ...                                 ***");
$display("*****************************************************\n\n");

end
endtask




task pd1_test;

integer		mode;
integer		n, p, l;
reg	[31:0]	pn;
reg	[31:0]	pra, paa, tmp;
reg	[23:0]	pd;
reg	[ 1:0]	cd;
reg		pc;
reg	[31:0]	data;
reg	[31:0]	cbar;
reg	[ 7:0]	vbl;
reg	[ 5:0]	delay;

begin

$display("\n\n");
$display("*****************************************************");
$display("*** Pixel Data Test 1                             ***");
$display("*****************************************************\n");

	m0.wb_wr1( `VBARA, 4'hf, 0 );
	m0.wb_wr1( `VBARB, 4'hf, 123456 );

	cbar = 32'h0000_0800;

	thsync = 0;
	thgdel = 0;
	thgate = 320;
	thlen = 345;

	tvsync = 0;
	tvgdel = 0;
	tvgate = 240;
	tvlen = 245;

	thsync = 39;
	thgdel = 124;
	thgate = 646;
	thlen = 832;

	tvsync = 2;
	tvgdel = 25;
	tvgate = 484;
	tvlen = 520;

	thsync = 6;
	thgdel = 20;
	thgate = 319;
	thlen = 390;

	tvsync = 1;
	tvgdel = 8;
	tvgate = 239;
	tvlen = 280;

/*
	thsync = 0;
	thgdel = 0;
	thgate = 63;
	thlen = 70;

	tvsync = 0;
	tvgdel = 0;
	tvgate = 32;
	tvlen = 36;

	thsync = 119;
	thgdel = 61;
	thgate = 805;
	thlen  = 1038;

	tvsync = 5;
	tvgdel = 20;
	tvgate = 600;
	tvlen  = 665;

*/

	hpol = 0;
	vpol = 0;
	cpol = 0;
	bpol = 0;

	m0.wb_wr1( `HTIM,  4'hf, {thsync, thgdel, thgate} );
	m0.wb_wr1( `VTIM,  4'hf, {tvsync, tvgdel, tvgate} );
	m0.wb_wr1( `HVLEN, 4'hf, {thlen, tvlen} );

mode  = 3;
vbl   = 1;
delay = 1;

for(delay=0;delay<6;delay=delay+1)
   begin
	s0.set_delay(delay);
for(vbl=0;vbl<4;vbl=vbl+1)
for(mode=0;mode<4;mode=mode+1)
   begin
	// -------------------------------
	// Turn Off VGA before Mode Change

	m0.wb_wr1( `CTRL,  4'hf, {
				16'h0,	// Reserved
				bpol, cpol,
				vpol, hpol,
				pc,	// 1'b0,	// PC
				cd,	// 2'h2,	// CD
				2'h0,	// VBL
				1'b0,	// CBSWE
				1'b0,	// VBSWE
				1'b0, // CBSIE
				1'b0,	// VBSIE
				1'b0,	// HIE
				1'b0,	// VIE
				1'b0	// Video Enable
				});

	s0.fill_mem(1);

	`ifdef USE_VC
	// Fill internal Color Lookup Table
	repeat(10)	@(posedge clk);
	for(n=0;n<512;n=n+1)
	   begin
	       //m0.wb_rd1( 32'h0002_0000 + (n*4), 4'hf, data );
	       data = s0.mem[ cbar[31:2] + n];
	       m0.wb_wr1( 32'h0000_0800 + (n*4), 4'hf, data );
	   end
	repeat(10)	@(posedge clk);
	`endif

	case(mode)
	   0:
	     begin
		cd = 2'h2;
		pc = 1'b0;
	     end
	   1:
	     begin
		cd = 2'h0;
		pc = 1'b0;
	     end
	   2:
	     begin
		cd = 2'h0;
		pc = 1'b1;
	     end
	   3:
	     begin
		cd = 2'h1;
		pc = 1'b0;
	     end
	endcase

	//repeat(50) @(posedge clk);

	// -------------------------------
	// Turn VGA back On ...
	m0.wb_wr1( `CTRL,  4'hf, {
				16'h0,	// Reserved
				bpol, cpol,
				vpol, hpol,
				pc,	// 1'b0,	// PC
				cd,	// 2'h2,	// CD
				vbl[1:0],	// VBL
				1'b0,	// Reserved
				1'b0,	// CBSWE
				1'b0,	// VBSWE
				1'b0,	// BSIE
				1'b0,	// HIE
				1'b0,	// VIE
				1'b1	// Video Enable
				});

	$display("VBL: %0d, Mode: %0d", vbl, mode);
	repeat(2) @(posedge vsync);

	// For Each Line
	for(l=0;l<tvgate;l=l+1)
	// For each Pixel
	for(p=0;p<thgate+1;p=p+1)
	   begin
		while(blanc)	@(posedge pclk);  // wait for viewable data

		//$display("pixel=%0d, line=%0d, (%0t)",p,l,$time);

		// Depending on Mode, determine pixel data
		// pixel number = line * (thgate + 1) + p
		pn = l * (thgate + 1) + p;

		case(mode)
		   0:	// 24 bit/pixel mode
		   begin
			pra = pn[31:2] * 3;	// Pixel relative Address
			paa = pra + 0;		// Pixel Absolute Address

			// Pixel Data
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				pd = tmp[31:8];
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd[23:16] = tmp[7:0];
				tmp = s0.mem[paa+1];
				pd[15:0] = tmp[31:16];
			     end
			   2:
			     begin
				tmp = s0.mem[paa+1];
				pd[23:8] = tmp[15:0];
				tmp = s0.mem[paa+2];
				pd[7:0] = tmp[31:24];
			     end
			   3:
			     begin
				tmp = s0.mem[paa+2];
				pd = tmp[23:0];
			     end
			endcase
		   end

		   1:	// 8 bit/pixel grayscale mode
		   begin
			pra = pn[31:2];		// Pixel relative Address
			paa = pra + 0;		// Pixel Absolute Address
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[31:24], tmp[31:24], tmp[31:24] };
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[23:16], tmp[23:16], tmp[23:16] };
			     end
			   2:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[15:8], tmp[15:8], tmp[15:8] };
			     end
			   3:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[7:0], tmp[7:0], tmp[7:0] };
			     end
			endcase
		   end

		   2:	// 8 bit/pixel Pseudo Color mode
		   begin
			pra = pn[31:2];		// Pixel relative Address
			paa = pra + 0;		// Pixel Absolute Address
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbar[31:2] + tmp[31:24]];
				pd = tmp[23:0];
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbar[31:2] + tmp[23:16]];
				pd = tmp[23:0];
			     end
			   2:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbar[31:2] + tmp[15:8]];
				pd = tmp[23:0];
			     end
			   3:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbar[31:2] + tmp[7:0]];
				pd = tmp[23:0];
			     end
			endcase
		   end

		   3:	// 16 bit/pixel mode
		   begin
			pra = pn[31:1];		// Pixel relative Address
			paa = pra + 0;		// Pixel Absolute Address
			case(pn[0])
			   0:
			     begin
				tmp = s0.mem[paa];
				tmp[15:0] = tmp[31:16];
				pd = {tmp[15:11], 3'h0, tmp[10:5], 2'h0, tmp[4:0], 3'h0};
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd = {tmp[15:11], 3'h0, tmp[10:5], 2'h0, tmp[4:0], 3'h0};
			     end
			endcase
		   end

		endcase

		if(pd !== {red, green, blue} )
		   begin
			$display("ERROR: Pixel Data Mismatch: Expected: %h, Got: %h %h %h",
				pd, red, green, blue);
			$display("       pixel=%0d, line=%0d, (%0t)",p,l,$time);
			error_cnt = error_cnt + 1;
			if(error_cnt > 10)	$stop;
		   end

		@(posedge pclk);

	   end
   end end

show_errors;
$display("*****************************************************");
$display("*** Test DONE ...                                 ***");
$display("*****************************************************\n\n");

end
endtask



task pd2_test;

integer		mode;
integer		p, l;
reg	[31:0]	pn;
reg	[31:0]	pra, paa, tmp;
reg	[23:0]	pd;
reg	[ 1:0]	cd;
reg		pc;
reg	[31:0]	cbar;
reg	[31:0]	vbase;
reg	[31:0]	cbase;
reg	[31:0]	vbara;
reg	[31:0]	vbarb;
reg	[ 7:0]	bank, vbl;
reg	[ 5:0]	delay;

begin

$display("\n\n");
$display("*****************************************************");
$display("*** Pixel Data Test 2                             ***");
$display("*****************************************************\n");

	s0.fill_mem(1);

   	repeat(10)	@(posedge clk);

	vbara = 32'h0000_0000;
	vbarb = 32'h0040_0000;
	cbar  = 32'h0000_0800;

	m0.wb_wr1( `VBARA, 4'hf, vbara );
	m0.wb_wr1( `VBARB, 4'hf, vbarb );

	thsync = 6;
	thgdel = 20;
	thgate = 319;
	thlen = 390;

	tvsync = 1;
	tvgdel = 8;
	tvgate = 239;
//	tvgate = 240;
	tvlen = 280;

/*
	thsync = 0;
	thgdel = 0;
	thgate = 63;
	thlen = 70;

	tvsync = 0;
	tvgdel = 0;
	tvgate = 32;
	tvlen = 36;

*/

/*
	thsync = 39;
	thgdel = 124;
	thgate = 645;
	thlen = 832;

	tvsync = 2;
	tvgdel = 25;
	tvgate = 483;
	tvlen = 520;
*/

	hpol = 0;
	vpol = 0;
	cpol = 0;
	bpol = 0;

	m0.wb_wr1( `HTIM,  4'hf, {thsync, thgdel, thgate} );
	m0.wb_wr1( `VTIM,  4'hf, {tvsync, tvgdel, tvgate} );
	m0.wb_wr1( `HVLEN, 4'hf, {thlen, tvlen} );


`ifdef USE_VC
// Fill internal Color Lookup Table
repeat(10)	@(posedge clk);
for(n=0;n<512;n=n+1)
   begin
	//m0.wb_rd1( 32'h0002_0000 + (n*4), 4'hf, data );
	data = s0.mem[ cbar[31:2] + n];
	m0.wb_wr1( 32'h0000_0800 + (n*4), 4'hf, data );
   end
repeat(10)	@(posedge clk);
`endif


vbl   = 3;
mode  = 3;
delay = 2;

for(delay=0;delay<6;delay=delay+1)
   begin
	s0.set_delay(delay);
for(vbl=0;vbl<4;vbl=vbl+1)
for(mode=0;mode<=4;mode=mode+1)
   begin

	m0.wb_wr1( `CTRL,  4'hf, 32'h0);
	repeat(100) @(posedge clk);

		case(mode)
		0:
		begin
			cd = 2'h2;
			pc = 1'b0;
		end

		1:
		begin
			cd = 2'h0;
			pc = 1'b0;
		end

		2:
		begin
			cd = 2'h0;
			pc = 1'b1;
		end

		3:
		begin
			cd = 2'h1;
			pc = 1'b0;
		end

		4:
		begin
			cd = 2'h3;
			pc = 1'b0;
		end
	endcase

	m0.wb_wr1( `CTRL,  4'hf, {
				16'h0,	// Reserved
				bpol, cpol,
				vpol, hpol,
				pc,	// 1'b0,	// PC
				cd,	// 2'h2,	// CD
				vbl[1:0],// VBL
				1'b1,	// CBSWE
				1'b1,	// VBSWE
				1'b0, // CBSIE
				1'b0,	// VBSIE
				1'b0,	// HIE
				1'b0,	// VIE
				1'b1	// Video Enable
				}
	);

bank = 0;

//for(bank=0;bank<3;bank=bank+1)
for(bank=0;bank<2;bank=bank+1)
   begin

	$display("VBL: %0d, Mode: %0d Screen: %0d", vbl, mode, bank);
	@(posedge vsync);

	error_cnt=0;
	// For Each Line
	for(l=0; l<tvgate;l=l+1)
	// For each Pixel
	for(p=0;p<thgate+1;p=p+1)
	   begin
		while(blanc)	@(posedge pclk);  // wait for viewable data

		//$display("pixel=%0d, line=%0d, (%0t)",p,l,$time);

		if(bank[0])	vbase = vbarb[31:2];
		else		vbase = vbara[31:2];
		if(bank[0])	cbase = cbar | 32'h0000_0400;
		else		cbase = cbar;

		// Depending on Mode, determine pixel data
		// pixel number = line * (thgate + 1) + p
		pn = l * (thgate + 1) + p;

		case(mode)
			0:	// 24 bit/pixel mode
			begin
				pra = pn[31:2] * 3;	// Pixel relative Address
				paa = pra + vbase;	// Pixel Absolute Address

				// Pixel Data
				case(pn[1:0])
					0:
					begin
						tmp = s0.mem[paa];
						pd = tmp[31:8];
					end

					1:
					begin
						tmp = s0.mem[paa];
						pd[23:16] = tmp[7:0];
						tmp = s0.mem[paa+1];
						pd[15:0] = tmp[31:16];
					end

					2:
					begin
						tmp = s0.mem[paa+1];
						pd[23:8] = tmp[15:0];
						tmp = s0.mem[paa+2];
						pd[7:0] = tmp[31:24];
					end

					3:
					begin
						tmp = s0.mem[paa+2];
						pd = tmp[23:0];
					end
				endcase
			end

			1:	// 8 bit/pixel grayscale mode
			begin
				pra = pn[31:2];		// Pixel relative Address
				paa = pra + vbase;	// Pixel Absolute Address

				case(pn[1:0])
					0:
					begin
						tmp = s0.mem[paa];
						pd = { tmp[31:24], tmp[31:24], tmp[31:24] };
					end

					1:
					begin
						tmp = s0.mem[paa];
						pd = { tmp[23:16], tmp[23:16], tmp[23:16] };
					end

					2:
					begin
						tmp = s0.mem[paa];
						pd = { tmp[15:8], tmp[15:8], tmp[15:8] };
					end

					3:
					begin
						tmp = s0.mem[paa];
						pd = { tmp[7:0], tmp[7:0], tmp[7:0] };
					end
				endcase
			end

			2:	// 8 bit/pixel Pseudo Color mode
			begin
				pra = pn[31:2];		// Pixel relative Address
				paa = pra + vbase;	// Pixel Absolute Address

				case(pn[1:0])
					0:
					begin
						tmp = s0.mem[paa];
						tmp = s0.mem[cbase[31:2] + tmp[31:24]];
						pd = tmp[23:0];
					end

					1:
					begin
						tmp = s0.mem[paa];
						tmp = s0.mem[cbase[31:2] + tmp[23:16]];
						pd = tmp[23:0];
					end

					2:
					begin
						tmp = s0.mem[paa];
						tmp = s0.mem[cbase[31:2] + tmp[15:8]];
						pd = tmp[23:0];
					end

					3:
					begin
						tmp = s0.mem[paa];
						tmp = s0.mem[cbase[31:2] + tmp[7:0]];
						pd = tmp[23:0];
					end
				endcase
			end

			3:	// 16 bit/pixel mode
			begin
				pra = pn[31:1];		// Pixel relative Address
				paa = pra + vbase;	// Pixel Absolute Address

				case(pn[0])
					0:
					begin
						tmp = s0.mem[paa];
						tmp[15:0] = tmp[31:16];
						pd = {tmp[15:11], 3'h0, tmp[10:5], 2'h0, tmp[4:0], 3'h0};
					end

					1:
					begin
						tmp = s0.mem[paa];
						pd = {tmp[15:11], 3'h0, tmp[10:5], 2'h0, tmp[4:0], 3'h0};
					end
				endcase
			end

			4:	// 32 bit/pixel mode
			begin
				pra = pn[31:0];		// Pixel relative Address
				paa = pra + vbase;	// Pixel Absolute Address

				tmp = s0.mem[paa];
				pd = tmp[23:0];
			end

		endcase

		if(pd !== {red, green, blue} )
		   begin
			$display("ERROR: Pixel Data Mismatch: Expected: %h, Got: %h %h %h",
				pd, red, green, blue);
			$display("       pixel=%0d, line=%0d, (%0t)",p,l,$time);
			error_cnt = error_cnt + 1;
			if(error_cnt > 10)	$stop;
		   end

		@(posedge pclk);

	   end
   end
end end

show_errors;
$display("*****************************************************");
$display("*** Test DONE ...                                 ***");
$display("*****************************************************\n\n");

end
endtask



task ur_test;

integer		mode;
integer		n, p, l;
reg	[31:0]	pn;
reg	[31:0]	pra, paa, tmp;
reg	[23:0]	pd;
reg	[1:0]	cd;
reg		pc;
reg	[31:0]	cbar;
reg	[31:0]	data;
reg	[7:0]	vbl;

begin

$display("\n\n");
$display("*****************************************************");
$display("*** FIFO Underrun Test 1                          ***");
$display("*****************************************************\n");

	s0.delay=15;
	int_warn = 0;

	m0.wb_wr1( `VBARA, 4'hf, 0 );
	m0.wb_wr1( `VBARB, 4'hf, 123456 );

	cbar = 32'h0000_0800;

	thsync = 6;
	thgdel = 20;
	thgate = 319;
	thlen = 390;

	tvsync = 1;
	tvgdel = 8;
	tvgate = 239;
	tvlen = 280;

	hpol = 0;
	vpol = 0;
	cpol = 0;
	bpol = 0;

	m0.wb_wr1( `HTIM,  4'hf, {thsync, thgdel, thgate} );
	m0.wb_wr1( `VTIM,  4'hf, {tvsync, tvgdel, tvgate} );
	m0.wb_wr1( `HVLEN, 4'hf, {thlen, tvlen} );

	mode = 0;

	// -------------------------------
	// Turn Off VGA before Mode Change

	m0.wb_wr1( `CTRL,  4'hf, 32'h0000_0000);

	s0.fill_mem(1);

`ifdef USE_VC
// Fill internal Color Lookup Table
repeat(10)	@(posedge clk);
for(n=0;n<512;n=n+1)
   begin
	//m0.wb_rd1( 32'h0002_0000 + (n*4), 4'hf, data );
	data = s0.mem[ cbar[31:2] + n];
	m0.wb_wr1( 32'h0000_0800 + (n*4), 4'hf, data );
   end
repeat(10)	@(posedge clk);
`endif

	case(mode)
	   0:
	     begin
		cd = 2'h2;
		pc = 1'b0;
	     end
	   1:
	     begin
		cd = 2'h0;
		pc = 1'b0;
	     end
	   2:
	     begin
		cd = 2'h0;
		pc = 1'b1;
	     end
	   3:
	     begin
		cd = 2'h1;
		pc = 1'b0;
	     end
	endcase

	// -------------------------------
	// Turn VGA back On ...
	m0.wb_wr1( `CTRL,  4'hf, {
				16'h0,	// Reserved
				bpol, cpol,
				vpol, hpol,
				pc,	// 1'b0,	// PC
				cd,	// 2'h2,	// CD
				2'b00,	// VBL
				1'b0,	// Reserved
				1'b0,	// CBSWE
				1'b0,	// VBSWE
				1'b0,	// BSIE
				1'b0,	// HIE
				1'b0,	// VIE
				1'b1	// Video Enable
				});

	while(!int)	@(posedge clk);
	m0.wb_rd1( `STAT,  4'hf, data);
	if(data[1] !== 1'b1)
	   begin
		$display("ERROR: Did not get Line FIFO Interrupt. (%0t)",
			$time);
	   end

show_errors;
$display("*****************************************************");
$display("*** Test DONE ...                                 ***");
$display("*****************************************************\n\n");

m0.wb_wr1( `CTRL,  4'hf, 32'h0000_0000);
int_warn = 1;
s0.delay=1;
repeat(10) @(posedge clk);

end
endtask


//////////////////////////////////////
//
// DVI test section
//


task dvi_pd_test;

integer		mode;
integer		n, p, l;
reg	[ 2:0]	dvi_odf;
reg	[31:0]	pn;
reg	[31:0]	pra, paa, tmp;
reg	[23:0]	pd;
reg	[11:0]	pda, pdb;
reg	[ 1:0]	cd;
reg		pc;
reg	[31:0]	data;
reg	[31:0]	cbar;
reg	[ 7:0]	vbl;
reg	[ 5:0]	delay;

begin

$display("\n\n");
$display("*****************************************************");
$display("*** DVI Pixel Data Test                           ***");
$display("*****************************************************\n");

	m0.wb_wr1( `VBARA, 4'hf, 0 );
	m0.wb_wr1( `VBARB, 4'hf, 123456 );

	cbar = 32'h0000_0800;

	thsync = 0;
	thgdel = 0;
	thgate = 320;
	thlen = 345;

	tvsync = 0;
	tvgdel = 0;
	tvgate = 240;
	tvlen = 245;

	thsync = 39;
	thgdel = 124;
	thgate = 646;
	thlen = 832;

	tvsync = 2;
	tvgdel = 25;
	tvgate = 484;
	tvlen = 520;

	thsync = 6;
	thgdel = 20;
	thgate = 319;
	thlen = 390;

	tvsync = 1;
	tvgdel = 8;
	tvgate = 239;
	tvlen = 280;

	hpol = 0;
	vpol = 0;
	cpol = 0;
	bpol = 0;

	m0.wb_wr1( `HTIM,  4'hf, {thsync, thgdel, thgate} );
	m0.wb_wr1( `VTIM,  4'hf, {tvsync, tvgdel, tvgate} );
	m0.wb_wr1( `HVLEN, 4'hf, {thlen, tvlen} );

// Choose mode, vbl, and delay
// These should have been tested & verified by previous tests
mode  = 3;
vbl   = 4;
delay = 0;
s0.set_delay(delay);

for(dvi_odf=0; dvi_odf<4;dvi_odf=dvi_odf +1)
   begin
	// -------------------------------
	// Turn Off VGA before Mode Change

	m0.wb_wr1( `CTRL,  4'hf, {
				2'h0,	// Reserved
				dvi_odf[1:0],
				12'h0,	// Reserved
				bpol,
				cpol,
				vpol,
				hpol,
				pc,	// PC
				cd,	// CD
				2'h0,	// VBL
				1'b0,	// CBSWE
				1'b0,	// VBSWE
				1'b0,	// CBSIE
				1'b0,	// VBSIE
				1'b0,	// HIE
				1'b0,	// VIE
				1'b0	// Video Enable
				});

	s0.fill_mem(1);

	`ifdef USE_VC
	// Fill internal Color Lookup Table
	repeat(10)	@(posedge clk);
	for(n=0;n<512;n=n+1)
	   begin
	       //m0.wb_rd1( 32'h0002_0000 + (n*4), 4'hf, data );
	       data = s0.mem[ cbar[31:2] + n];
	       m0.wb_wr1( 32'h0000_0800 + (n*4), 4'hf, data );
	   end
	repeat(10)	@(posedge clk);
	`endif

	case(mode)
	   0:
	     begin
		cd = 2'h2;
		pc = 1'b0;
	     end
	   1:
	     begin
		cd = 2'h0;
		pc = 1'b0;
	     end
	   2:
	     begin
		cd = 2'h0;
		pc = 1'b1;
	     end
	   3:
	     begin
		cd = 2'h1;
		pc = 1'b0;
	     end
	endcase

	//repeat(50) @(posedge clk);

	// -------------------------------
	// Turn VGA back On ...
	m0.wb_wr1( `CTRL,  4'hf, {
				2'h0,	// Reserved
				dvi_odf[1:0],
				12'h0,	// Reserved
				bpol,
				cpol,
				vpol,
				hpol,
				pc,	// PC
				cd,	// CD
				2'h0,	// VBL
				1'b0,	// CBSWE
				1'b0,	// VBSWE
				1'b0,	// CBSIE
				1'b0,	// VBSIE
				1'b0,	// HIE
				1'b0,	// VIE
				1'b1	// Video Enable
				});

	$display("DVI output data format: %0h", dvi_odf);
	repeat(2) @(posedge vsync);

	// For Each Line
	for(l=0;l<tvgate;l=l+1)
	// For each Pixel
	for(p=0;p<thgate+1;p=p+1)
	   begin
		while(dvi_de_o == 1'b0) @(pclk);  // wait for viewable data

		//$display("pixel=%0d, line=%0d, (%0t)",p,l,$time);

		// Depending on Mode, determine pixel data
		// pixel number = line * (thgate + 1) + p
		pn = l * (thgate + 1) + p;

		//
		// Get the correct pixel data
		case(mode)
		   0:	// 24 bit/pixel mode
		   begin
			pra = pn[31:2] * 3;	// Pixel relative Address
			paa = pra + 0;		// Pixel Absolute Address

			// Pixel Data
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				pd = tmp[31:8];
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd[23:16] = tmp[7:0];
				tmp = s0.mem[paa+1];
				pd[15:0] = tmp[31:16];
			     end
			   2:
			     begin
				tmp = s0.mem[paa+1];
				pd[23:8] = tmp[15:0];
				tmp = s0.mem[paa+2];
				pd[7:0] = tmp[31:24];
			     end
			   3:
			     begin
				tmp = s0.mem[paa+2];
				pd = tmp[23:0];
			     end
			endcase
		   end

		   1:	// 8 bit/pixel grayscale mode
		   begin
			pra = pn[31:2];		// Pixel relative Address
			paa = pra + 0;		// Pixel Absolute Address
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[31:24], tmp[31:24], tmp[31:24] };
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[23:16], tmp[23:16], tmp[23:16] };
			     end
			   2:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[15:8], tmp[15:8], tmp[15:8] };
			     end
			   3:
			     begin
				tmp = s0.mem[paa];
				pd = { tmp[7:0], tmp[7:0], tmp[7:0] };
			     end
			endcase
		   end

		   2:	// 8 bit/pixel Pseudo Color mode
		   begin
			pra = pn[31:2];		// Pixel relative Address
			paa = pra + 0;		// Pixel Absolute Address
			case(pn[1:0])
			   0:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbar[31:2] + tmp[31:24]];
				pd = tmp[23:0];
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbar[31:2] + tmp[23:16]];
				pd = tmp[23:0];
			     end
			   2:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbar[31:2] + tmp[15:8]];
				pd = tmp[23:0];
			     end
			   3:
			     begin
				tmp = s0.mem[paa];
				tmp = s0.mem[cbar[31:2] + tmp[7:0]];
				pd = tmp[23:0];
			     end
			endcase
		   end

		   3:	// 16 bit/pixel mode
		   begin
			pra = pn[31:1];		// Pixel relative Address
			paa = pra + 0;		// Pixel Absolute Address
			case(pn[0])
			   0:
			     begin
				tmp = s0.mem[paa];
				tmp[15:0] = tmp[31:16];
				pd = {tmp[15:11], 3'h0, tmp[10:5], 2'h0, tmp[4:0], 3'h0};
			     end
			   1:
			     begin
				tmp = s0.mem[paa];
				pd = {tmp[15:11], 3'h0, tmp[10:5], 2'h0, tmp[4:0], 3'h0};
			     end
			endcase
		   end

		endcase

		//
		// convert pixel data in DVI output format
		case (dvi_odf)
		   2'b00:
		      begin
			  pda = pd[11:0];
			  pdb = pd[23:12];
		      end

		   2'b01:
		      begin
			  pda = {pd[12:10],pd[7:3],pd[8],pd[2:0]};
			  pdb = {pd[23:19],pd[15:13],pd[18:16],pd[9]};
		      end

		   2'b10:
		      begin
			  pda = {pd[12:10],pd[7:3],4'h0};
			  pdb = {pd[23:19],pd[15:13],4'h0};
		      end

		   2'b11:
		      begin
			  pda = {pd[13:11],pd[7:3],4'h0};
			  pdb = {1'b0,pd[23:19],pd[15:14],4'h0};
		      end
		endcase

		//
		// verify pixel data

`ifdef VGA_12BIT_DVI

		// rising edge data
		if (pda !== dvi_d_o)
		   begin
			$display("ERROR: Pixel Data Mismatch: Expected: %h, Got: %h",
				pda, dvi_d_o);
			$display("       pixel=%0d, line=%0d, (%0t)",p,l,$time);
			error_cnt = error_cnt + 1;
			if(error_cnt > 10) $stop;
		   end

		@(negedge pclk_i);

		// falling edge data
		if (pdb !== dvi_d_o)
		   begin
			$display("ERROR: Pixel Data Mismatch: Expected: %h, Got: %h",
				pdb, dvi_d_o);
			$display("       pixel=%0d, line=%0d, (%0t)",p,l,$time);
			error_cnt = error_cnt + 1;
			if(error_cnt > 10) $stop;
		   end
		@(posedge pclk_i);
`else

		// compare data
		if ({pdb, pda} !== dvi_d_o)
		   begin
			$display("ERROR: Pixel Data Mismatch: Expected: %h, Got: %h",
				{pdb, pda}, dvi_d_o);
			$display("       pixel=%0d, line=%0d, (%0t)",p,l,$time);
			error_cnt = error_cnt + 1;
			if(error_cnt > 10) $stop;
		   end

		@(negedge pclk_i);
		@(posedge pclk_i);
`endif
	   end
   end

show_errors;
$display("*****************************************************");
$display("*** Test DONE ...                                 ***");
$display("*****************************************************\n\n");

end
endtask

endmodule
