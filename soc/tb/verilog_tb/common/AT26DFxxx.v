//--------------------------------------------------------------------------
// This is the property of PERFTRENDS TECHNOLOGIES PRIVATE LIMITED and
// possession or use of file has to be with the written LICENCE AGGREMENT
// from PERFTRENDS TECHNOLOGIES PRIVATE LIMITED.
//
//--------------------------------------------------------------------------
//
// Project : ATMEL Data Flash Device
//--------------------------------------------------------------------------
// File 	: $RCSfile: AT26DFxxx.v,v $
// Path 	: $Source: /home/cvs/atmel_flash_dev/design_26x/AT26DFxxx.v,v $
// Author 	: $ Devi Vasumathy N $
// Created on 	: $ 13-03-07 $
// Revision 	: $Revision: 1.8 $
// Last modified by : $Author: devivasumathy $
// Last modified on : $Date: 2007/05/10 05:15:51 $
//--------------------------------------------------------------------------
// Module 		: AT26DFxxx.v
// Description 		: BFM for devices AT25DF041A, AT26DF081A, 
//			  AT26DF161A, AT26DF321
//
//--------------------------------------------------------------------------
//
// Design hierarchy : _top.v/top_1.v/top_2.v/...
// Instantiated Modules : top_1.v, top_2.v
//--------------------------------------------------------------------------
// Revision history :
// $Log: AT26DFxxx.v,v $
// Revision 1.8  2007/05/10 05:15:51  devivasumathy
// Card Memory preload
//
// Revision 1.7  2007/04/27 09:09:40  devivasumathy
// *** empty log message ***
//
// Revision 1.6  2007/04/17 10:50:59  devivasumathy
// Timing verified
//
// Revision 1.5  2007/04/16 06:24:44  devivasumathy
// *** empty log message ***
//
// Revision 1.4  2007/04/10 09:37:36  devivasumathy
// *** empty log message ***
//
// Revision 1.3  2007/04/09 12:06:09  devivasumathy
// *** empty log message ***
//
// Revision 1.2  2007/04/05 14:45:12  devivasumathy
// *** empty log message ***
//
// Revision 1.1  2007/04/05 11:32:18  devivasumathy
// AT26DFx data flash model
//
//--------------------------------------------------------------------------

`timescale 1ns/10ps      //ME added

`define def_321 1        //ME added


module AT26DFxxx (
		CSB,
		SCK,
		SI,
		WPB,
`ifdef def_321
`else
		HOLDB,
`endif
		SO);

// ******************************************************************** //
//			Port Declaration:
// ******************************************************************** //

input 	CSB;		// Chip Select!
input	SCK;		// Serial Clock
input	SI;		// Serial Input
input	WPB;		// Write Protect!
`ifdef def_321
`else
input	HOLDB;		// Hold!
`endif
output	SO;		// Serial Output

`ifdef def_321
	wire  HOLDB;
`endif

parameter DEVICE = "AT25DF041A";	// Device selected
parameter PRELOAD = 1;			// preload memory with content in MEMORY_FILE
parameter MEMORY_FILE = "flash.in";	// Memory pre-load

// ********************************************************************* //
//Timing Parameters :
// ******************************************************************** //

// Fixed parameters
parameter fRDLF   = 33;		// SCK Frequency for read Array (Low freq - 03h opcode)
//representation in ns
parameter tDIS    = 6;		// Output Disable time
parameter tV      = 6;		// Output Valid time
parameter tOH     = 0 ;		// Output Hold time

parameter tHLQZ   = 6 ;		// HOLD! Low to Output High-z
parameter tHHQX   = 6 ;		// HOLD! High to Output Low-z

parameter tSECP   = 20;		// Sector Protect Time
parameter tSECUP  = 20;		// Sector Unprotect Time

parameter tEDPD   = 3000;	// Chip Select high to Deep Power-down (3 us)
parameter tRDPD   = 3000;	// Chip Select high to Stand-by Mode
parameter tWRSR   = 200;	// Write Status Register Time
parameter tPP     = 5000000;	// Page Program Time
parameter tBLKE4  = 200000000;	// Block Erase Time 4-kB
parameter tBLKE32 = 600000000;	// Block Erase Time 32-kB
parameter tCHPEn  = 1000000000; // local chip erase time

// variable parameters
// ******************************************************************** //
//parameter tBP     = 7000;		// Byte Program Time
//parameter tBLKE64 = 950000000;	// Block Erase Time 64-kB
//parameter tCHPE   = 3000000000;	// Chip Erase Time // this is actual;
					// due to simulation warning splitted into 2 parameters as tCHPE = tmult * tCHPEn
//parameter tmult   = 3;		// Multiplication factor for chip erase timing

parameter tBP = 	(DEVICE == "AT25DF041A") ? 7000 :
			(DEVICE == "AT26DF081A") ? 7000 :
			(DEVICE == "AT26DF161A") ? 7000 :
			(DEVICE == "AT26DF321")  ? 6000 : 7000;

parameter tBLKE64 = 	(DEVICE == "AT25DF041A") ? 950000000 :
			(DEVICE == "AT26DF081A") ? 950000000 :
			(DEVICE == "AT26DF161A") ? 950000000 :
			(DEVICE == "AT26DF321")  ? 1000000000 :950000000 ;

parameter tmult = 	(DEVICE == "AT25DF041A") ? 3 :
			(DEVICE == "AT26DF081A") ? 6 :
			(DEVICE == "AT26DF161A") ? 12 :
			(DEVICE == "AT26DF321")  ? 36 : 3;

//parameter fSCK    = 70;	// Serial clock (SCK) Frequency in MHz
//parameter tSCKH   = 6.4;	// SCK High time
//parameter tSCKL   = 6.4;	// SCK Low time

parameter fSCK = 	(DEVICE == "AT25DF041A") ? 70 :
			(DEVICE == "AT26DF081A") ? 70 :
			(DEVICE == "AT26DF161A") ? 70 :
			(DEVICE == "AT26DF321")  ? 66 : 70;

parameter tSCKH = 	(DEVICE == "AT25DF041A") ? 6.4 :
			(DEVICE == "AT26DF081A") ? 6.4 :
			(DEVICE == "AT26DF161A") ? 6.4 :
			(DEVICE == "AT26DF321")  ? 6.8 : 6.4;

parameter tSCKL = 	(DEVICE == "AT25DF041A") ? 6.4 :
			(DEVICE == "AT26DF081A") ? 6.4 :
			(DEVICE == "AT26DF161A") ? 6.4 :
			(DEVICE == "AT26DF321")  ? 6.8 : 6.4;
// ******************************************************************** //

// ********************** Manufacturer ID ********************** //
parameter [31:0] MAN_ID = (DEVICE == "AT25DF041A") ? 32'h1F_04_00_00 :
			(DEVICE == "AT26DF081A") ? 32'h1F_45_01_00 :
			(DEVICE == "AT26DF161A") ? 32'h1F_46_01_00 :
			(DEVICE == "AT26DF321")  ? 32'h1F_47_00_00 : 32'h1F_04_00_00;

// ********* Memory And Access Related Declarations ***************** //

parameter BLOCK64 = 	(DEVICE == "AT25DF041A") ? 8  : // no of 64kB blocks
			(DEVICE == "AT26DF081A") ? 16 : 
			(DEVICE == "AT26DF161A") ? 32 : 
			(DEVICE == "AT26DF321")  ? 64 : 8 ;

parameter SECTOR = 	(DEVICE == "AT25DF041A") ? 11 : // no of sectors
			(DEVICE == "AT26DF081A") ? 19 : 
			(DEVICE == "AT26DF161A") ? 32 : 
			(DEVICE == "AT26DF321")  ? 64 : 11 ;

// total memory size = no. of blocks * 64 k bits (i.e each block contains 64 KB)
parameter MEMSIZE = BLOCK64 * 64 * 1024; // total memory size

reg [7:0] memory [MEMSIZE-1:0]; // memory of selected device
reg [7:0] status_reg;		// Status register
reg [63:0] sector_reg; 		// Sector protection reg
reg [7:0] int_buffer [255:0];	// internal buffer to store data in page programming mode
// ****************** ***************** ***************** //


// ********* Registers to track the current operation of the device ******** //
reg deep_power_down;		// Device in Deep Power Down Mode
reg status_read;		// Status register is being read
reg erasing_block4;		// 4kB block erase
reg erasing_block32;		// 32kB block erase
reg erasing_block64;		// 64kB block erase
reg erasing_chip;		// chip erase
reg rd_dummy;			// low/high freq read array
reg byte_prog;			// Byte/page programming
reg seq_byte_prog;		// sequential byte programming
reg seq_byte_start;		// sequential byte programming start intimation


// ********* Events to trigger some task based on opcode *********** //
event  EDPD;		// Deep Power-down (enable)
event  RDPD;		// Resume from Deep Power-down
event  RA;		// Read Array
//event  RAL;		// Read Array (Low frequency)
event  BE4;		// Block Erase 4KB
event  BE32;		// Block Erase 32KB
event  BE64;		// Block Erase 64KB
event  CE;		// Chip Erase
event  BP;		// byte /page program
//event  SBPE;		// Sequential Byte Program Mode Erase
event  SBP;		// Sequential Byte Program
event  WE;		// Write Enable
event  WD;		// Write Disable
event  PS;		// Protect Sector
event  UPS;		// Un-Protect Sector
event  RSPR;		// Read Sector Protection Register
event  RSR;		// Read Status Register
event  WSR;		// Write Status Register
event  MIR;		// Manufacturer ID Read 


/******** Other variables/registers ******************/
reg [23:0] temp_addr;		// to store mem address temporarily
reg [23:0] current_address;	// to store mem address
reg [7:0] temp_data;		// temp read data from memory
reg [7:0] data_in; 		// data in for byte programming
reg [7:0] read_data;		// register in which opcode/data is read-in
reg [7:0] read_dummy;		// register in which dont care data is stored
reg [3:0] stat_reg_temp;	// WSR temp value for global protec/unprotect
reg [7:0] pp_address;		// specifies the page address for BP/PP
reg SO_reg;			// Signal out reg
reg SO_on;			// Signal out enable signal
reg SPRL;			// Sector Protection Register Locked
reg SPM;			// Sequential Program Mode Status
reg EPE;			// Erase/Program Error
reg WPP;			// Write Protection Pin Status
reg [1:0] SWP;			// Software Protection Status
reg WEL;			// Write Enable Latch Status
reg RDYnBSY;			// Ready/Busy Status
reg lock;			// to lock SPRL bit of status reg
reg unlock;			// to unlock SPRL bit of status reg
reg global_protect;		// global protection
reg global_unprotect;		// global unprotect
reg protect;			// to protect Sector reg bits
reg unprotect;			// to unprotect Sector reg bits
reg protected;			// check protection status of sector reg
reg SPRL_val;			// WSR temp value for SPRL
integer i,j,k,l;		// integers for accessing memory
integer pp;			// specifies no of bytes need to write in memory
integer pp_j;			// holds no of bytes received for page program
integer pp_i;			// holds no of bits received for each byte in page program
integer dummy;			// counter for receiving 8 dummy bit from SO
integer delay;			// waits for Chip Erase to complete

real tperiod;			// time period - on period
real tperiod1;			// time period - off period
reg freq_error;			// frequency limit exceeds indication


// ****************** Initial Block **************** //
`ifdef def_321
	assign HOLDB = 1'b1;
`endif

initial
begin

// Memory Initialization
//To pre-load Memory (in Hex format), use parameter MEMORY_FILE = <filename>, 
//where <filename> is the name of the pre-load file. 
//If PRELOAD = 0, the Memory is initialized to Erased state (all data = FF).
//If PRELOAD = 1, the Memory is initialized to PreLoad state (data in pre-load file).

	for(i=0; i<BLOCK64; i=i+1)			// Block64K access
	begin
	    for(j=0; j<2; j=j+1)			// Block32K access
	    begin
		for(k=0; k<8; k=k+1)			// Block4K access
		begin
		    for(l=0; l < 12'hfff; l=l+1)
		    begin
			memory[l] = 8'b11111111;
		    end
		end
	    end
	end

// Memory Initialization for preloading condition
if(PRELOAD==1)
begin
	$readmemh (MEMORY_FILE, memory);
end


// Status register initialization
SPRL = 1'b0;
SPM = 1'b0;
EPE = 1'b0;
WPP = 1'b0;
SWP = 2'b11;
WEL = 1'b0;
RDYnBSY = 1'b0;	// device is ready
status_reg[7] 	= SPRL;
status_reg[6] 	= SPM;
status_reg[5]	= EPE; // reserved
status_reg[4] 	= WPP;
status_reg[3:2] = SWP;
status_reg[1] 	= WEL;
status_reg[0] 	= RDYnBSY;
//status_reg = {1'b1,1'b0,1'b0,1'b0,2'b11,2'b0};

sector_reg = 64'hFFFFFFFFFFFFFFFF;

// Stand-by mode initialization
current_address  = 24'b0;
data_in		 = 8'b0;
stat_reg_temp	 = 4'b0;
deep_power_down	 = 1'b0;
status_read	 = 1'b0; 
rd_dummy	 = 1'b0;
seq_byte_start	 = 1'b0;
SO_on		 = 1'b0;
global_protect	 = 1'b0;
global_unprotect = 1'b0;
SPRL_val	 = 1'b0;
lock		 = 1'b0;
unlock		 = 1'b0;
dummy		 = 0;

deep_power_down	= 1'b0;
status_read	= 1'b0;
erasing_block4	= 1'b0;
erasing_block32 = 1'b0;
erasing_block64 = 1'b0;
erasing_chip	= 1'b0;
rd_dummy	= 1'b0;
byte_prog	= 1'b0;
seq_byte_prog	= 1'b0;
seq_byte_start	= 1'b0;

end // end of initial

// ********************** Drive SO ********************* //
bufif1 (SO, SO_reg, SO_on); //SO will be driven only if SO_on is High

// global protection and unprotection on sectors
always@(global_protect or global_unprotect)
begin
	if(global_protect==1'b1)
		sector_reg = 64'hFFFFFFFFFFFFFFFF;
	else if(global_unprotect==1'b1)
		sector_reg[SECTOR-1:0] = 'b0;
end

// ********************* Status register ********************* //
always @(WPB or lock or unlock)	//SPRL bit locking & Unlocking
begin
	if(WPB==1'b1 && SPRL==1'b0 && lock==1'b1)
		SPRL = 1'b1;
	else if(WPB==1'b1 && SPRL==1'b1 && unlock==1'b1)
		SPRL = 1'b0; // S/W Locked
	else if(WPB==1'b0 && SPRL==1'b0 && lock==1'b1)
		SPRL = 1'b1;
	else if(WPB==1'b0 && SPRL==1'b1 && unlock==1'b1)
		SPRL = 1'b1; // H/W Locked
end

always @(WPB)			// Write Protect (WP!) Pin Status
begin
	WPP = WPB;
end

always @(sector_reg)		// Software Protection Status
begin
	if(sector_reg[SECTOR-1:0]=='d0)
		SWP = 2'b00;
	else if((|sector_reg==1'b1) && (&sector_reg==1'b0))
		SWP = 2'b01;
	else if(&sector_reg==1'b1)
		SWP = 2'b11;
end

always @(SPRL or SPM or EPE or WPP or SWP or WEL or RDYnBSY)
begin
	status_reg = {SPRL,SPM,EPE,WPP,SWP,WEL,RDYnBSY};
end

// ******* to receive opcode and to switch to respective blocks ******* //
always @(negedge CSB)  // the device will now become active
begin : get_opcode_

	//@(negedge SCK);
	get_opcode;  // get opcode here

	if (deep_power_down == 1'b1) // Can be only after background has been enabled
		case (read_data)
			8'hAB:	// Resume from Deep Power-down
			begin
				$display("Opcode(%h) for Resume from Deep Power-down received",read_data);
				-> RDPD;
			end
			default :
			begin
				$display ("Opcode %h is not allowed: device in Deep Power-down", read_data);
				disable get_opcode_;
			end
		endcase
	else
	begin
		case (read_data)	// based on opcode, trigger an action
		8'h0B :	// Read Array
			begin
				$display("Opcode(%h) for Read Array received",read_data);
				rd_dummy = 1'b1;
				-> RA;
			end
		8'h03 :	// Read Array (low freq)
		  begin
		     // Comment out this to clean up sim output
		     //$display("Opcode(%h) for Read Array (Low Freq) received",read_data);
		     rd_dummy = 1'b0;
		     -> RA;
			end
		8'h20 :	// Block erase 4 KB
			begin
				$display("Opcode(%h) for 4 KB Block erase received",read_data);
				-> BE4;
			end
		8'h52 :	// Block erase 32 KB
			begin
				$display("Opcode(%h) for 32 KB Block erase received",read_data);
				-> BE32;
			end
		8'hD8 :	// Block erase 64 KB
			begin
				$display("Opcode(%h) for 64 KB Block erase received",read_data);
				-> BE64;
			end
		8'h60 :	// Chip erase
			begin
				$display("Opcode(%h) for Chip erase received",read_data);
				-> CE;
			end
		8'hC7 :	// Chip erase
			begin
				$display("Opcode(%h) for Chip erase received",read_data);
				-> CE;
			end
		8'h02 :	// Byte Program
			begin
				$display("Opcode(%h) Byte Program received",read_data);
				-> BP;
			end
		8'hAD :	// Sequential Byte Program Mode Erase
			begin
				if(DEVICE=="AT25DF041A" || DEVICE=="AT26DF081A" || DEVICE=="AT26DF161A")
				begin
					$display("Opcode(%h) Sequential Byte Program received",read_data);
					-> SBP;
				end
				else if(DEVICE=="AT26DF321")
					$display("Sequential Byte Program is not supported for device %s",DEVICE);
			end
		8'hAF :	// Sequential Byte Program Mode
			begin
				if(DEVICE=="AT25DF041A" || DEVICE=="AT26DF081A" || DEVICE=="AT26DF161A")
				begin
					$display("Opcode(%h) Sequential Byte Program received",read_data);
					-> SBP;
				end
				else if(DEVICE=="AT26DF321")
					$display("Sequential Byte Program is not supported for device %s",DEVICE);
			end
		8'h06 :	// Write Enable
			begin
				$display("Opcode(%h) for Write Enable received",read_data);
				-> WE;
			end
		8'h04 :	// Write Disable
			begin
				$display("Opcode(%h) for Write Disable received",read_data);
				-> WD;
			end
		8'h36 :	// Protect Sector
			begin
				$display("Opcode(%h) for Protect Sector received",read_data);
				-> PS;
			end
		8'h39 :	// Unprotect Sector
			begin
				$display("Opcode(%h) for Unprotect Sector received",read_data);
				-> UPS;
			end
		8'h3C :	// Read Sector Protection Register
			begin
				$display("Opcode(%h) for Read Sector Protection Register received",read_data);
				-> RSPR;
			end
		8'h05 :	// Read Status Register
			begin
				$display("Opcode(%h) for Status Register Read received",read_data);
				-> RSR;
			end
		8'h01 :	// Write Status Register
			begin
				$display("Opcode(%h) for Write Status Register received",read_data);
				-> WSR;
			end
		8'h9F :	// Read Manufacturer and Device ID
			begin
				$display("Opcode(%h) for Read Manufacturer and Device ID received",read_data);
				-> MIR;
			end
		8'hB9 :	// Deep Power-down
			begin
				$display("Opcode(%h) for Deep Power-down received",read_data);
				-> EDPD;
			end
		default :
		begin
			$display ("Unrecognized opcode %h", read_data);
			disable get_opcode_;
		end
		endcase
	end
end

// *********************** TASKS / FUNCTIONS ************************** //

// get_opcode is a task to get 8 bits of opcode.
// It obtains 8 bits of data obtained on SI
task get_opcode;

integer i;
begin
	for (i=8; i>0; i = i-1)
	begin
		@(posedge SCK);  
		read_data[i-1] = SI;
		if(HOLDB==1'b0)
			wait (HOLDB);
	end
	i=7;
end
endtask

// get_data is a task to get 8 bits of data. This data could be an address,
// data or anything. It just obtains 8 bits of data obtained on SI
task get_data;

integer i;
begin
	for (i=7; i>=0; i = i-1)
	begin
		@(posedge SCK);  
		read_data[i] = SI;
		if(HOLDB==1'b0)
			wait (HOLDB);
	end
	i=7;
end
endtask

// task read_out_array is to read from main Memory
task read_out_array ;
input [23:0] read_addr;
integer i;

begin
	temp_data = memory [read_addr];
	i = 7;
	while (CSB == 1'b0) // continue transmitting, while, CSB is Low
	begin
		@(negedge SCK);
		SO_reg = 1'bx;
		if(HOLDB==1'b0)
		begin
			#tHLQZ SO_on = 1'b0; 
			wait (HOLDB);
			#tHHQX;
		end
		#tV SO_reg = temp_data[i];
		SO_on = 1'b1; 
		if (i == 0) 
		begin
			//$display ("Data: %h read from memory location %h",temp_data,read_addr);
			read_addr = read_addr + 1; // next byte
			i = 7;
			if (read_addr >= (MEMSIZE-1))
				read_addr = 0; // Note that rollover occurs at end of memory,
			temp_data = memory [read_addr];
		end
		else
			i = i - 1; // next bit
	end // reading over, because CSB has gone high
end
endtask

// Sector protection
task protect_sector;
input [23:0] protect_address;

begin
	$display("Entered Protect Sector task");

    if (DEVICE == "AT26DF321" && protect==1'b1)
    begin
	if(protect_address[23:16]==8'b00111111)
		sector_reg[63] = 1'b1;
	else if(protect_address[23:16]==8'b00111110)
		sector_reg[62] = 1'b1;
	else if(protect_address[23:16]==8'b00111101)
		sector_reg[61] = 1'b1;
	else if(protect_address[23:16]==8'b00111100)
		sector_reg[60] = 1'b1;
	else if(protect_address[23:16]==8'b00111011)
		sector_reg[59] = 1'b1;
	else if(protect_address[23:16]==8'b00111010)
		sector_reg[58] = 1'b1;
	else if(protect_address[23:16]==8'b00111001)
		sector_reg[57] = 1'b1;
	else if(protect_address[23:16]==8'b00111000)
		sector_reg[56] = 1'b1;
	else if(protect_address[23:16]==8'b00110111)
		sector_reg[55] = 1'b1;
	else if(protect_address[23:16]==8'b00110110)
		sector_reg[54] = 1'b1;
	else if(protect_address[23:16]==8'b00110101)
		sector_reg[53] = 1'b1;
	else if(protect_address[23:16]==8'b00110100)
		sector_reg[52] = 1'b1;
	else if(protect_address[23:16]==8'b00110011)
		sector_reg[51] = 1'b1;
	else if(protect_address[23:16]==8'b00110010)
		sector_reg[50] = 1'b1;
	else if(protect_address[23:16]==8'b00110001)
		sector_reg[49] = 1'b1;
	else if(protect_address[23:16]==8'b00110000)
		sector_reg[48] = 1'b1;
	else if(protect_address[23:16]==8'b00101111)
		sector_reg[47] = 1'b1;
	else if(protect_address[23:16]==8'b00101110)
		sector_reg[46] = 1'b1;
	else if(protect_address[23:16]==8'b00101101)
		sector_reg[45] = 1'b1;
	else if(protect_address[23:16]==8'b00101100)
		sector_reg[44] = 1'b1;
	else if(protect_address[23:16]==8'b00101011)
		sector_reg[43] = 1'b1;
	else if(protect_address[23:16]==8'b00101010)
		sector_reg[42] = 1'b1;
	else if(protect_address[23:16]==8'b00101001)
		sector_reg[41] = 1'b1;
	else if(protect_address[23:16]==8'b00101000)
		sector_reg[40] = 1'b1;
	else if(protect_address[23:16]==8'b00100111)
		sector_reg[39] = 1'b1;
	else if(protect_address[23:16]==8'b00100110)
		sector_reg[38] = 1'b1;
	else if(protect_address[23:16]==8'b00100101)
		sector_reg[37] = 1'b1;
	else if(protect_address[23:16]==8'b00100100)
		sector_reg[36] = 1'b1;
	else if(protect_address[23:16]==8'b00100011)
		sector_reg[35] = 1'b1;
	else if(protect_address[23:16]==8'b00100010)
		sector_reg[34] = 1'b1;
	else if(protect_address[23:16]==8'b00100001)
		sector_reg[33] = 1'b1;
	else if(protect_address[23:16]==8'b00100000)
		sector_reg[32] = 1'b1;
    end
    if ((DEVICE == "AT26DF161A" || DEVICE == "AT26DF321") && protect==1'b1)
    begin
	if(protect_address[23:16]==8'b00011111)
		sector_reg[31] = 1'b1;
	else if(protect_address[23:16]==8'b00011110)
		sector_reg[30] = 1'b1;
	else if(protect_address[23:16]==8'b00011101)
		sector_reg[29] = 1'b1;
	else if(protect_address[23:16]==8'b00011100)
		sector_reg[28] = 1'b1;
	else if(protect_address[23:16]==8'b00011011)
		sector_reg[27] = 1'b1;
	else if(protect_address[23:16]==8'b00011010)
		sector_reg[26] = 1'b1;
	else if(protect_address[23:16]==8'b00011001)
		sector_reg[25] = 1'b1;
	else if(protect_address[23:16]==8'b00011000)
		sector_reg[24] = 1'b1;
	else if(protect_address[23:16]==8'b00010111)
		sector_reg[23] = 1'b1;
	else if(protect_address[23:16]==8'b00010110)
		sector_reg[22] = 1'b1;
	else if(protect_address[23:16]==8'b00010101)
		sector_reg[21] = 1'b1;
	else if(protect_address[23:16]==8'b00010100)
		sector_reg[20] = 1'b1;
	else if(protect_address[23:16]==8'b00010011)
		sector_reg[19] = 1'b1;
	else if(protect_address[23:16]==8'b00010010)
		sector_reg[18] = 1'b1;
	else if(protect_address[23:16]==8'b00010001)
		sector_reg[17] = 1'b1;
	else if(protect_address[23:16]==8'b00010000)
		sector_reg[16] = 1'b1;
    end

    if (DEVICE == "AT26DF081A" && protect==1'b1) // un-uniform sectors of AT26DF081A
    begin
	if(protect_address[23:14]==10'b00001111_00)
		sector_reg[15] = 1'b1;
	else if(protect_address[23:13]==11'b00001111_010)
		sector_reg[16] = 1'b1;
	else if(protect_address[23:13]==11'b00001111_011)
		sector_reg[17] = 1'b1;
	else if(protect_address[23:17]==9'b00001111_1)
		sector_reg[18] = 1'b1;
    end
    else if ((DEVICE == "AT26DF161A" || DEVICE == "AT26DF321") && protect==1'b1)
    begin
	if(protect_address[23:16]==8'b00001111)
		sector_reg[15] = 1'b1;
    end

    if ((DEVICE == "AT26DF081A" || DEVICE == "AT26DF161A" || DEVICE == "AT26DF321") && protect==1'b1)
    begin
//	if(protect_address[23:16]==8'b00001111)
//		sector_reg[15] = 1'b1;
	if(protect_address[23:16]==8'b00001110)
		sector_reg[14] = 1'b1;
	else if(protect_address[23:16]==8'b00001101)
		sector_reg[13] = 1'b1;
	else if(protect_address[23:16]==8'b00001100)
		sector_reg[12] = 1'b1;
	else if(protect_address[23:16]==8'b00001011)
		sector_reg[11] = 1'b1;
	else if(protect_address[23:16]==8'b00001010)
		sector_reg[10] = 1'b1;
	else if(protect_address[23:16]==8'b00001001)
		sector_reg[9] = 1'b1;
	else if(protect_address[23:16]==8'b00001000)
		sector_reg[8] = 1'b1;
    end

    if (DEVICE == "AT25DF041A" && protect==1'b1) // un-uniform sectors of AT25DF041A
    begin
	if(protect_address[23:15]==9'b00000111_0)
		sector_reg[7] = 1'b1;
	else if(protect_address[23:13]==11'b00000111_100)
		sector_reg[8] = 1'b1;
	else if(protect_address[23:13]==11'b00000111_101)
		sector_reg[9] = 1'b1;
	else if(protect_address[23:14]==10'b00000111_11)
		sector_reg[10] = 1'b1;
    end
    else if ((DEVICE == "AT26DF081A" || DEVICE == "AT26DF161A" || DEVICE == "AT26DF321") && protect==1'b1)
	if(protect_address[23:16]==8'b00000111)
		sector_reg[7] = 1'b1;

    if ((DEVICE == "AT25DF041A" || DEVICE == "AT26DF081A" 
	|| DEVICE == "AT26DF161A" || DEVICE == "AT26DF321") && protect==1'b1)
    begin
//	if(protect_address[23:16]==8'b00000111)
//		sector_reg[7] = 1'b1;
	if(protect_address[23:16]==8'b00000110)
		sector_reg[6] = 1'b1;
	else if(protect_address[23:16]==8'b00000101)
		sector_reg[5] = 1'b1;
	else if(protect_address[23:16]==8'b00000100)
		sector_reg[4] = 1'b1;
	else if(protect_address[23:16]==8'b00000011)
		sector_reg[3] = 1'b1;
	else if(protect_address[23:16]==8'b00000010)
		sector_reg[2] = 1'b1;
	else if(protect_address[23:16]==8'b00000001)
		sector_reg[1] = 1'b1;
	else if(protect_address[23:16]==8'b00000000)
		sector_reg[0] = 1'b1;
    end
end
endtask

// Sector Unprotection
task unprotect_sector;
input [23:0] unprotect_address;
begin
    if ((DEVICE == "AT25DF041A") && unprotect==1'b1) // sectors of AT25DF041A
    begin
	$display("Entered Unprotect sector for Device: AT25DF041A");
	if(unprotect_address[23:14]==10'b00000111_11)
		sector_reg[10] = 1'b0;
	else if(unprotect_address[23:13]==11'b00000111_101)
		sector_reg[9] = 1'b0;
	else if(unprotect_address[23:13]==11'b00000111_100)
		sector_reg[8] = 1'b0;
	else if(unprotect_address[23:15]==9'b00000111_0)
		sector_reg[7] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000110)
		sector_reg[6] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000101)
		sector_reg[5] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000100)
		sector_reg[4] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000011)
		sector_reg[3] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000010)
		sector_reg[2] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000001)
		sector_reg[1] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000000)
		sector_reg[0] = 1'b0;
    end
    else if (DEVICE == "AT26DF081A" && unprotect==1'b1) // sectors of AT26DF081A
    begin
	$display("Entered Unprotect sector for Device: AT26DF081A");
	if(unprotect_address[23:17]==9'b00001111_1)
		sector_reg[18] = 1'b0;
	else if(unprotect_address[23:13]==11'b00001111_011)
		sector_reg[17] = 1'b0;
	else if(unprotect_address[23:13]==11'b00001111_010)
		sector_reg[16] = 1'b0;
	else if(unprotect_address[23:14]==10'b00001111_00)
		sector_reg[15] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001110)
		sector_reg[14] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001101)
		sector_reg[13] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001100)
		sector_reg[12] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001011)
		sector_reg[11] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001010)
		sector_reg[10] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001001)
		sector_reg[9] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001000)
		sector_reg[8] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000111)
		sector_reg[7] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000110)
		sector_reg[6] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000101)
		sector_reg[5] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000100)
		sector_reg[4] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000011)
		sector_reg[3] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000010)
		sector_reg[2] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000001)
		sector_reg[1] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000000)
		sector_reg[0] = 1'b0;
    end
    else if ((DEVICE == "AT26DF161A") && unprotect==1'b1) // sectors of AT26DF161A
    begin
	$display("Entered Unprotect sector for Device: AT26DF161A");
	if(unprotect_address[23:16]==8'b00011111)
		sector_reg[31] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011110)
		sector_reg[30] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011101)
		sector_reg[29] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011100)
		sector_reg[28] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011011)
		sector_reg[27] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011010)
		sector_reg[26] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011001)
		sector_reg[25] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011000)
		sector_reg[24] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010111)
		sector_reg[23] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010110)
		sector_reg[22] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010101)
		sector_reg[21] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010100)
		sector_reg[20] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010011)
		sector_reg[19] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010010)
		sector_reg[18] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010001)
		sector_reg[17] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010000)
		sector_reg[16] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001111)
		sector_reg[15] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001110)
		sector_reg[14] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001101)
		sector_reg[13] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001100)
		sector_reg[12] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001011)
		sector_reg[11] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001010)
		sector_reg[10] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001001)
		sector_reg[9] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001000)
		sector_reg[8] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000111)
		sector_reg[7] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000110)
		sector_reg[6] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000101)
		sector_reg[5] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000100)
		sector_reg[4] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000011)
		sector_reg[3] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000010)
		sector_reg[2] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000001)
		sector_reg[1] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000000)
		sector_reg[0] = 1'b0;
    end
    else if (DEVICE == "AT26DF321" && unprotect==1'b1) // sectors of AT26DF321
    begin
	$display("Entered Unprotect sector for Device: AT26DF321");
	if(unprotect_address[23:16]==8'b00111111)
		sector_reg[63] = 1'b0;
	else if(unprotect_address[23:16]==8'b00111110)
		sector_reg[62] = 1'b0;
	else if(unprotect_address[23:16]==8'b00111101)
		sector_reg[61] = 1'b0;
	else if(unprotect_address[23:16]==8'b00111100)
		sector_reg[60] = 1'b0;
	else if(unprotect_address[23:16]==8'b00111011)
		sector_reg[59] = 1'b0;
	else if(unprotect_address[23:16]==8'b00111010)
		sector_reg[58] = 1'b0;
	else if(unprotect_address[23:16]==8'b00111001)
		sector_reg[57] = 1'b0;
	else if(unprotect_address[23:16]==8'b00111000)
		sector_reg[56] = 1'b0;
	else if(unprotect_address[23:16]==8'b00110111)
		sector_reg[55] = 1'b0;
	else if(unprotect_address[23:16]==8'b00110110)
		sector_reg[54] = 1'b0;
	else if(unprotect_address[23:16]==8'b00110101)
		sector_reg[53] = 1'b0;
	else if(unprotect_address[23:16]==8'b00110100)
		sector_reg[52] = 1'b0;
	else if(unprotect_address[23:16]==8'b00110011)
		sector_reg[51] = 1'b0;
	else if(unprotect_address[23:16]==8'b00110010)
		sector_reg[50] = 1'b0;
	else if(unprotect_address[23:16]==8'b00110001)
		sector_reg[49] = 1'b0;
	else if(unprotect_address[23:16]==8'b00110000)
		sector_reg[48] = 1'b0;
	else if(unprotect_address[23:16]==8'b00101111)
		sector_reg[47] = 1'b0;
	else if(unprotect_address[23:16]==8'b00101110)
		sector_reg[46] = 1'b0;
	else if(unprotect_address[23:16]==8'b00101101)
		sector_reg[45] = 1'b0;
	else if(unprotect_address[23:16]==8'b00101100)
		sector_reg[44] = 1'b0;
	else if(unprotect_address[23:16]==8'b00101011)
		sector_reg[43] = 1'b0;
	else if(unprotect_address[23:16]==8'b00101010)
		sector_reg[42] = 1'b0;
	else if(unprotect_address[23:16]==8'b00101001)
		sector_reg[41] = 1'b0;
	else if(unprotect_address[23:16]==8'b00101000)
		sector_reg[40] = 1'b0;
	else if(unprotect_address[23:16]==8'b00100111)
		sector_reg[39] = 1'b0;
	else if(unprotect_address[23:16]==8'b00100110)
		sector_reg[38] = 1'b0;
	else if(unprotect_address[23:16]==8'b00100101)
		sector_reg[37] = 1'b0;
	else if(unprotect_address[23:16]==8'b00100100)
		sector_reg[36] = 1'b0;
	else if(unprotect_address[23:16]==8'b00100011)
		sector_reg[35] = 1'b0;
	else if(unprotect_address[23:16]==8'b00100010)
		sector_reg[34] = 1'b0;
	else if(unprotect_address[23:16]==8'b00100001)
		sector_reg[33] = 1'b0;
	else if(unprotect_address[23:16]==8'b00100000)
		sector_reg[32] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011111)
		sector_reg[31] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011110)
		sector_reg[30] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011101)
		sector_reg[29] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011100)
		sector_reg[28] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011011)
		sector_reg[27] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011010)
		sector_reg[26] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011001)
		sector_reg[25] = 1'b0;
	else if(unprotect_address[23:16]==8'b00011000)
		sector_reg[24] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010111)
		sector_reg[23] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010110)
		sector_reg[22] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010101)
		sector_reg[21] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010100)
		sector_reg[20] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010011)
		sector_reg[19] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010010)
		sector_reg[18] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010001)
		sector_reg[17] = 1'b0;
	else if(unprotect_address[23:16]==8'b00010000)
		sector_reg[16] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001111)
		sector_reg[15] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001110)
		sector_reg[14] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001101)
		sector_reg[13] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001100)
		sector_reg[12] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001011)
		sector_reg[11] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001010)
		sector_reg[10] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001001)
		sector_reg[9] = 1'b0;
	else if(unprotect_address[23:16]==8'b00001000)
		sector_reg[8] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000111)
		sector_reg[7] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000110)
		sector_reg[6] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000101)
		sector_reg[5] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000100)
		sector_reg[4] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000011)
		sector_reg[3] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000010)
		sector_reg[2] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000001)
		sector_reg[1] = 1'b0;
	else if(unprotect_address[23:16]==8'b00000000)
		sector_reg[0] = 1'b0;
    end
	else
	$display("Unprotect Sector failed");

end
endtask

// Check Sector Protection
task check_protection;
input [23:0] check_address;
begin
    if (DEVICE == "AT26DF321")
    begin
	if((check_address[23:16]==8'b00111111 && sector_reg[63]==1'b1)
	|| (check_address[23:16]==8'b00111110 && sector_reg[62]==1'b1)
	|| (check_address[23:16]==8'b00111101 && sector_reg[61]==1'b1)
	|| (check_address[23:16]==8'b00111100 && sector_reg[60]==1'b1)
	|| (check_address[23:16]==8'b00111011 && sector_reg[59]==1'b1)
	|| (check_address[23:16]==8'b00111010 && sector_reg[58]==1'b1)
	|| (check_address[23:16]==8'b00111001 && sector_reg[57]==1'b1)
	|| (check_address[23:16]==8'b00111000 && sector_reg[56]==1'b1)
	|| (check_address[23:16]==8'b00110111 && sector_reg[55]==1'b1)
	|| (check_address[23:16]==8'b00110110 && sector_reg[54]==1'b1)
	|| (check_address[23:16]==8'b00110101 && sector_reg[53]==1'b1)
	|| (check_address[23:16]==8'b00110100 && sector_reg[52]==1'b1)
	|| (check_address[23:16]==8'b00110011 && sector_reg[51]==1'b1)
	|| (check_address[23:16]==8'b00110010 && sector_reg[50]==1'b1)
	|| (check_address[23:16]==8'b00110001 && sector_reg[49]==1'b1)
	|| (check_address[23:16]==8'b00110000 && sector_reg[48]==1'b1)
	|| (check_address[23:16]==8'b00101111 && sector_reg[47]==1'b1)
	|| (check_address[23:16]==8'b00101110 && sector_reg[46]==1'b1)
	|| (check_address[23:16]==8'b00101101 && sector_reg[45]==1'b1)
	|| (check_address[23:16]==8'b00101100 && sector_reg[44]==1'b1)
	|| (check_address[23:16]==8'b00101011 && sector_reg[43]==1'b1)
	|| (check_address[23:16]==8'b00101010 && sector_reg[42]==1'b1)
	|| (check_address[23:16]==8'b00101001 && sector_reg[41]==1'b1)
	|| (check_address[23:16]==8'b00101000 && sector_reg[40]==1'b1)
	|| (check_address[23:16]==8'b00100111 && sector_reg[39]==1'b1)
	|| (check_address[23:16]==8'b00100110 && sector_reg[38]==1'b1)
	|| (check_address[23:16]==8'b00100101 && sector_reg[37]==1'b1)
	|| (check_address[23:16]==8'b00100100 && sector_reg[36]==1'b1)
	|| (check_address[23:16]==8'b00100011 && sector_reg[35]==1'b1)
	|| (check_address[23:16]==8'b00100010 && sector_reg[34]==1'b1)
	|| (check_address[23:16]==8'b00100001 && sector_reg[33]==1'b1)
	|| (check_address[23:16]==8'b00100000 && sector_reg[32]==1'b1)
	|| (check_address[23:16]==8'b00011111 && sector_reg[31]==1'b1)
	|| (check_address[23:16]==8'b00011110 && sector_reg[30]==1'b1)
	|| (check_address[23:16]==8'b00011101 && sector_reg[29]==1'b1)
	|| (check_address[23:16]==8'b00011100 && sector_reg[28]==1'b1)
	|| (check_address[23:16]==8'b00011011 && sector_reg[27]==1'b1)
	|| (check_address[23:16]==8'b00011010 && sector_reg[26]==1'b1)
	|| (check_address[23:16]==8'b00011001 && sector_reg[25]==1'b1)
	|| (check_address[23:16]==8'b00011000 && sector_reg[24]==1'b1)
	|| (check_address[23:16]==8'b00010111 && sector_reg[23]==1'b1)
	|| (check_address[23:16]==8'b00010110 && sector_reg[22]==1'b1)
	|| (check_address[23:16]==8'b00010101 && sector_reg[21]==1'b1)
	|| (check_address[23:16]==8'b00010100 && sector_reg[20]==1'b1)
	|| (check_address[23:16]==8'b00010011 && sector_reg[19]==1'b1)
	|| (check_address[23:16]==8'b00010010 && sector_reg[18]==1'b1)
	|| (check_address[23:16]==8'b00010001 && sector_reg[17]==1'b1)
	|| (check_address[23:16]==8'b00010000 && sector_reg[16]==1'b1)
	|| (check_address[23:16]==8'b00001111 && sector_reg[15]==1'b1)
	|| (check_address[23:16]==8'b00001110 && sector_reg[14]==1'b1)
	|| (check_address[23:16]==8'b00001101 && sector_reg[13]==1'b1)
	|| (check_address[23:16]==8'b00001100 && sector_reg[12]==1'b1)
	|| (check_address[23:16]==8'b00001011 && sector_reg[11]==1'b1)
	|| (check_address[23:16]==8'b00001010 && sector_reg[10]==1'b1)
	|| (check_address[23:16]==8'b00001001 && sector_reg[9] ==1'b1)
	|| (check_address[23:16]==8'b00001000 && sector_reg[8] ==1'b1)
	|| (check_address[23:16]==8'b00000111 && sector_reg[7] ==1'b1)
	|| (check_address[23:16]==8'b00000110 && sector_reg[6] ==1'b1)
	|| (check_address[23:16]==8'b00000101 && sector_reg[5] ==1'b1)
	|| (check_address[23:16]==8'b00000100 && sector_reg[4] ==1'b1)
	|| (check_address[23:16]==8'b00000011 && sector_reg[3] ==1'b1)
	|| (check_address[23:16]==8'b00000010 && sector_reg[2] ==1'b1)
	|| (check_address[23:16]==8'b00000001 && sector_reg[1] ==1'b1)
	|| (check_address[23:16]==8'b00000000 && sector_reg[0] ==1'b1))
		protected = 1'b1;
	else
		protected = 1'b0;
    end
    else if (DEVICE == "AT26DF161A")
    begin
	if((check_address[23:16]==8'b00011111 && sector_reg[31]==1'b1)
	|| (check_address[23:16]==8'b00011110 && sector_reg[30]==1'b1)
	|| (check_address[23:16]==8'b00011101 && sector_reg[29]==1'b1)
	|| (check_address[23:16]==8'b00011100 && sector_reg[28]==1'b1)
	|| (check_address[23:16]==8'b00011011 && sector_reg[27]==1'b1)
	|| (check_address[23:16]==8'b00011010 && sector_reg[26]==1'b1)
	|| (check_address[23:16]==8'b00011001 && sector_reg[25]==1'b1)
	|| (check_address[23:16]==8'b00011000 && sector_reg[24]==1'b1)
	|| (check_address[23:16]==8'b00010111 && sector_reg[23]==1'b1)
	|| (check_address[23:16]==8'b00010110 && sector_reg[22]==1'b1)
	|| (check_address[23:16]==8'b00010101 && sector_reg[21]==1'b1)
	|| (check_address[23:16]==8'b00010100 && sector_reg[20]==1'b1)
	|| (check_address[23:16]==8'b00010011 && sector_reg[19]==1'b1)
	|| (check_address[23:16]==8'b00010010 && sector_reg[18]==1'b1)
	|| (check_address[23:16]==8'b00010001 && sector_reg[17]==1'b1)
	|| (check_address[23:16]==8'b00010000 && sector_reg[16]==1'b1)
	|| (check_address[23:16]==8'b00001111 && sector_reg[15]==1'b1)
	|| (check_address[23:16]==8'b00001110 && sector_reg[14]==1'b1)
	|| (check_address[23:16]==8'b00001101 && sector_reg[13]==1'b1)
	|| (check_address[23:16]==8'b00001100 && sector_reg[12]==1'b1)
	|| (check_address[23:16]==8'b00001011 && sector_reg[11]==1'b1)
	|| (check_address[23:16]==8'b00001010 && sector_reg[10]==1'b1)
	|| (check_address[23:16]==8'b00001001 && sector_reg[9] ==1'b1)
	|| (check_address[23:16]==8'b00001000 && sector_reg[8] ==1'b1)
	|| (check_address[23:16]==8'b00000111 && sector_reg[7] ==1'b1)
	|| (check_address[23:16]==8'b00000110 && sector_reg[6] ==1'b1)
	|| (check_address[23:16]==8'b00000101 && sector_reg[5] ==1'b1)
	|| (check_address[23:16]==8'b00000100 && sector_reg[4] ==1'b1)
	|| (check_address[23:16]==8'b00000011 && sector_reg[3] ==1'b1)
	|| (check_address[23:16]==8'b00000010 && sector_reg[2] ==1'b1)
	|| (check_address[23:16]==8'b00000001 && sector_reg[1] ==1'b1)
	|| (check_address[23:16]==8'b00000000 && sector_reg[0] ==1'b1))
		protected = 1'b1;
	else
		protected = 1'b0;
    end
    else if (DEVICE == "AT26DF081A") // un-uniform sectors of AT26DF081A
    begin
	if((check_address[23:17]==9'b00001111_1 && sector_reg[18]   ==1'b1)
	|| (check_address[23:13]==11'b00001111_011 && sector_reg[17]==1'b1)
	|| (check_address[23:13]==11'b00001111_010 && sector_reg[16]==1'b1)
	|| (check_address[23:14]==10'b00001111_00 && sector_reg[15] ==1'b1)
	|| (check_address[23:16]==8'b00001110 && sector_reg[14]==1'b1)
	|| (check_address[23:16]==8'b00001101 && sector_reg[13]==1'b1)
	|| (check_address[23:16]==8'b00001100 && sector_reg[12]==1'b1)
	|| (check_address[23:16]==8'b00001011 && sector_reg[11]==1'b1)
	|| (check_address[23:16]==8'b00001010 && sector_reg[10]==1'b1)
	|| (check_address[23:16]==8'b00001001 && sector_reg[9] ==1'b1)
	|| (check_address[23:16]==8'b00001000 && sector_reg[8] ==1'b1)
	|| (check_address[23:16]==8'b00000111 && sector_reg[7] ==1'b1)
	|| (check_address[23:16]==8'b00000110 && sector_reg[6] ==1'b1)
	|| (check_address[23:16]==8'b00000101 && sector_reg[5] ==1'b1)
	|| (check_address[23:16]==8'b00000100 && sector_reg[4] ==1'b1)
	|| (check_address[23:16]==8'b00000011 && sector_reg[3] ==1'b1)
	|| (check_address[23:16]==8'b00000010 && sector_reg[2] ==1'b1)
	|| (check_address[23:16]==8'b00000001 && sector_reg[1] ==1'b1)
	|| (check_address[23:16]==8'b00000000 && sector_reg[0] ==1'b1))
		protected = 1'b1;
	else
		protected = 1'b0;
    end
    else if (DEVICE == "AT25DF041A") // un-uniform sectors of AT25DF041A
    begin
	if((check_address[23:14]==10'b00000111_11 && sector_reg[10]==1'b1)
	|| (check_address[23:13]==11'b00000111_101 && sector_reg[9]==1'b1)
	|| (check_address[23:13]==11'b00000111_100 && sector_reg[8]==1'b1)
	|| (check_address[23:15]==9'b00000111_0 && sector_reg[7]   ==1'b1)
	|| (check_address[23:16]==8'b00000110 && sector_reg[6]==1'b1)
	|| (check_address[23:16]==8'b00000101 && sector_reg[5]==1'b1)
	|| (check_address[23:16]==8'b00000100 && sector_reg[4]==1'b1)
	|| (check_address[23:16]==8'b00000011 && sector_reg[3]==1'b1)
	|| (check_address[23:16]==8'b00000010 && sector_reg[2]==1'b1)
	|| (check_address[23:16]==8'b00000001 && sector_reg[1]==1'b1)
	|| (check_address[23:16]==8'b00000000 && sector_reg[0]==1'b1))
		protected = 1'b1;
	else
		protected = 1'b0;
    end
	else
	$display("Check Sector Protection failed");
end
endtask

// Sending Sector Protection status
task send_protection_status;
integer local_i;
reg [7:0] send_status;	// status value, 'ff' if protected, '00' if unprotected
begin
	if(protected==1'b1)
		send_status = 8'hff;
	else
		send_status = 8'h00;
	local_i = 7;

	while (CSB == 1'b0) // continue transmitting, while, CSB is Low
	begin
		@(negedge SCK);
		SO_reg = 1'bx;
		if(HOLDB==1'b0)
		begin
			#tHLQZ SO_on = 1'b0; 
			wait (HOLDB);
			#tHHQX;
		end
		#tV;
		SO_reg = send_status[local_i];
		SO_on = 1'b1; 
		if (local_i == 0) 
			local_i = 7;
		else
			local_i = local_i - 1; // next bit
	end // sending status over, because CSB has gone high
end
endtask

// receive data for byte/page programming
task page_program;
begin
	pp_j = 0;
	while(CSB==1'b0)
	begin
		for (pp_i=8; pp_i>0; pp_i = pp_i-1)
		begin
			@(posedge SCK);  
			read_data[pp_i-1] = SI;
			if(HOLDB==1'b0)
				wait (HOLDB);
		end
		int_buffer[pp_j] = read_data;
		pp_j = pp_j+1;
	$display("One byte of data: %h received for Page Program",read_data);
	end
end
endtask

// Byte program for devices. also used for page program
task byte_program;
input [23:0] write_address;
input [7:0] write_data;
begin
	memory [write_address] = write_data;
	$display ("One Byte of data %h written in memory in location %h", write_data, write_address);
end
endtask

// Erase a 4kB block
task erase_4kb;
input [23:0] erase_address;

reg [11:0] erase4_i;
reg [23:0] block_addr4;

begin
	block_addr4 = {erase_address[23:12],12'b0000_0000_0000};
	$display ("4kB Block with start address %h is going to be erased", block_addr4);

	for(erase4_i=12'b0; erase4_i < 12'b1111_1111_1111; erase4_i=erase4_i+1)
	begin
		memory [block_addr4 + erase4_i] = 8'hff;
	end
end
endtask

// Erase a 32kB block
task erase_32kb;
input [23:0] erase_address;

reg [14:0] erase32_i;
reg [23:0] block_addr32;

begin
	block_addr32 = {erase_address[23:15],15'b0000_0000_0000_000};
	$display ("32kB Block with start address %h is going to be erased", block_addr32);

	for(erase32_i=15'b0; erase32_i < 15'b1111_1111_1111_111; erase32_i=erase32_i+1)
	begin
		memory [block_addr32 + erase32_i] = 8'hff;
	end
end
endtask

// Erase a 64kB block
task erase_64kb;
input [23:0] erase_address;

reg [15:0] erase64_i;
reg [23:0] block_addr64;

begin
	block_addr64 = {erase_address[23:16],16'b0000_0000_0000_0000};
	$display ("64kB Block with start address %h is going to be erased", block_addr64);

	for(erase64_i=0; erase64_i < 16'b1111_1111_1111_1111; erase64_i=erase64_i+1)
	begin
		memory [block_addr64 + erase64_i] = 8'hff;
	end
end
endtask

// Chip Erase
task erase_chip;

reg [23:0] erase_i;

begin
	$display ("Chip Erase is going to be started");
	for(erase_i=0; erase_i < (MEMSIZE-1); erase_i=erase_i+1)
	begin
		memory [erase_i] = 8'hff;
	end
end
endtask

// ******************* Execution of Opcodes ********************* //

// ************* Deep Power-down ***************** //
always @(EDPD)
begin : EDPD_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device is busy. Deep Power-down command cannot be issued");
		disable EDPD_ ;     
	end
	// if it comes here, means, the above if was false.

   //if (freq_error==1'b1)
	//$display("WARNING: Frequency should be less than %d Mhz for SPI interface. Deep Power-down is not allowed.",fSCK);

	@ (posedge CSB);
	RDYnBSY = 1'b1;
	#tEDPD deep_power_down = 1'b1;
	RDYnBSY = 1'b0;
	$display ("Device %s enters into Deep Power-down mode. Send 'Resume from Deep Power-down' to resume", DEVICE);
end

// ************* Resume from Deep Power-down ***************** //
always @(RDPD)
begin : RDPD_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device is busy. Deep Power-down command cannot be issued");
		disable EDPD_ ;     
	end
	// if it comes here, means, the above if was false.

   //if (freq_error==1'b1)
	//$display("WARNING: Frequency should be less than %d Mhz for SPI interface. Resume from Deep Power-down is not allowed.",fSCK);

	@ (posedge CSB);
	RDYnBSY = 1'b1;
	#tRDPD deep_power_down = 1'b0;
	RDYnBSY = 1'b0;
	$display ("Device %s Resumes from Deep Power-down mode", DEVICE);
end

// ************* Manufacturing ID Read ******************** //
always @(MIR)
begin: MIR_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device is busy. Manufacturing ID Read cannot be issued");
		disable EDPD_ ;     
	end
	// if it comes here, means, the above if was false.

   //if (freq_error==1'b1)
	//$display("WARNING: Frequency should be less than %d Mhz for SPI interface. Manufacturing ID Read is not allowed.",fSCK);

	j = 32;
	while (CSB == 1'b0)
	begin
		@(negedge SCK);
		SO_reg = 1'bx;
		if(HOLDB==1'b0)
		begin
			#tHLQZ SO_on = 1'b0; 
			wait (HOLDB);
			#tHHQX;
		end
		#tV;
		if (j > 0) 
		begin
			SO_reg = MAN_ID[j-1];
			j = j-1;
			SO_on = 1'b1;
			if(j == 0)
			begin
				$display ("Manufacture ID and Device ID of Device %s sent", DEVICE);
				j = 32;
			end
		end
	end // output next bit on next falling edge of SCK
	$display ("Manufacture ID and Device ID of Device %s sent", DEVICE);
end

// ************ Read Status Register ******************** //
always @(RSR)
begin: RSR_
   //if (freq_error==1'b1)
	//$display("WARNING: Frequency should be less than %d Mhz for SPI interface. Status Register Read is not allowed.",fSCK);

	status_read = 1'b1; // reading status_reg
	j = 8;
	while (CSB == 1'b0)
	begin
		@(negedge SCK);
		SO_reg = 1'bx;
		if(HOLDB==1'b0)
		begin
			#tHLQZ SO_on = 1'b0; 
			wait (HOLDB);
			#tHHQX;
		end
		#tV;
		if (j > 0)
		begin
			SO_on = 1'b1;
			SO_reg = status_reg[j-1];
			j = j-1;
			if (j == 0)
			begin
				j = 8;
				$display ("Status register content of Device %s transmitted", DEVICE);
			end
		end
	end // output next bit on next falling edge of SCK
	status_read = 1'b0; // status_reg read is over
end

// ************ Write Status Register ******************** //
always @(WSR)
begin : WSR_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. Write Status Register is not allowed", DEVICE);
		disable WSR_;
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display("WARNING: Frequency should be less than %d Mhz for SPI interface. Write Status Register is not allowed.",fSCK);

	get_data;
	SPRL_val = read_data [7];
	stat_reg_temp = read_data [5:2];

	@ (posedge CSB);
	if(WEL==1'b1)
	begin
		if(WPB==1'b0 && SPRL==1'b0 && SPRL_val==1'b1)
			$display("SPRL Hardware locked");
		else if(WPB==1'b1 && SPRL==1'b0 && SPRL_val==1'b1)
			$display("SPRL Software locked");
		else if(WPB==1'b0 && SPRL==1'b1 && SPRL_val==1'b1)
			$display("SPRL Hardware locked. Lock cannot be done");
		else if(WPB==1'b1 && SPRL==1'b1 && SPRL_val==1'b1)
			$display("SPRL Software locked. Lock cannot be done");
		else if(WPB==1'b0 && SPRL==1'b1 && SPRL_val==1'b0)
			$display("SPRL Hardware locked. Unlock cannot be done");
		else if(WPB==1'b1 && SPRL==1'b1 && SPRL_val==1'b0)
			$display("Sector Protection Register UnLocked");
		else
			$display("SPRL in unlocked state");

		if(stat_reg_temp==4'b1111 && SPRL==1'b0)
			global_protect = 1'b1;
		else if(stat_reg_temp==4'b0000 && SPRL==1'b0)
			global_unprotect = 1'b1;
		else if(SPRL==1'b1 && (stat_reg_temp==4'b0000 || stat_reg_temp==4'b1111))
		begin
			$display("SPRL locked. Global Protect/Unprotect cannot be done");
			global_protect = 1'b0;
			global_unprotect = 1'b0;
		end

		if(SPRL==1'b0 && global_protect==1'b1)
			$display("Global Protection issued for Sector protection register");
		else if(SPRL==1'b0 && global_unprotect==1'b1)
			$display("Global Unprotect issued for Sector protection register");
		else if(SPRL==1'b1 && (global_protect==1'b1 || global_unprotect==1'b1))
			$display("SPRL locked. Global Protect/Unprotect cannot be done");

		if(SPRL==1'b0 && SPRL_val==1'b1)
		begin
			RDYnBSY = 1'b1;
			lock = 1'b1;
			#tWRSR;
		end
		else if(SPRL==1'b1 && SPRL_val==1'b0)
		begin
			RDYnBSY = 1'b1;
			unlock = 1'b1;
			#tWRSR;
		end
		else if(global_protect==1'b1 || global_unprotect==1'b1)
		begin
			RDYnBSY = 1'b1;
			#tWRSR;
		end
	end
	else
		$display ("WEL bit not set. Write Status Register is not allowed");

	lock = 1'b0;
	unlock = 1'b0;
	RDYnBSY = 1'b0;
	global_protect = 1'b0;
	global_unprotect = 1'b0;
	WEL = 1'b0;
	$display ("Write Status Register operation completed");
end

// ************ Write Enable ******************** //
always @(WE)
begin : WE_
   if (freq_error==1'b1)
	$display("WARNING: Frequency should be less than %d MHz for SPI interface. Write Enable is not allowed.",fSCK);

	@ (posedge CSB);
	WEL = 1'b1;
	$display ("Write Enable Latch Set");
end

// ************ Write Disable ******************** //
always @(WD)
begin : WD_
   if (freq_error==1'b1)
	$display("WARNING: Frequency should be less than %d MHz for SPI interface. Write Disable is not allowed.",fSCK);

	@ (posedge CSB);
	WEL = 1'b0;
	seq_byte_start = 1'b0;
	SPM = 1'b0;
	$display ("Write Enable Latch Reset");
end

// ******************** Read Array ********************** //
always @(RA)
begin : RA_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. Read Array is not allowed", DEVICE);
		disable RA_;
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. Read Array is not allowed",fSCK);

	get_data;
	temp_addr [23:16] = read_data [7:0];
	get_data;
	temp_addr [15:8] = read_data [7:0];
	get_data;
	temp_addr [7:0] = read_data [7:0];
	current_address = temp_addr;

	if(rd_dummy==1'b1 && CSB==1'b0) // for SCK freq, receive 8 dummy bits
	begin
		for (dummy = 7; dummy >= 0; dummy = dummy - 1) // these are dont-care, so discarded
		begin
			@(posedge SCK);  
			read_dummy[dummy] = SI;
			if(HOLDB==1'b0)
				wait (HOLDB);
		end
		read_dummy = 8'b0;
	end

	read_out_array(current_address); // read continuously from memory untill CSB deasserted
	current_address = 24'b0;
end

// ****************** Protect Sector ****************** //
always @(PS)
begin : PS_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. Protect Sector is not allowed", DEVICE);
		disable PS_ ;     
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. Protect Sector is not allowed",fSCK);

	get_data;
	temp_addr [23:16] = read_data [7:0];
	get_data;
	temp_addr [15:8] = read_data [7:0];
	get_data;
	temp_addr [7:0] = read_data [7:0];
	current_address = temp_addr;

	@ (posedge CSB);
	if(WEL==1'b1 && SPRL==1'b0)
	begin
		RDYnBSY = 1'b1;
		protect = 1'b1;
		protect_sector(current_address);
		#tSECP;
		$display ("Sector for Address %h is Protected", current_address);
	end
	else
		$display ("WEL bit not set or Sector Protection Register Locked. Protect Sector is not allowed");
	WEL = 1'b0;
	RDYnBSY = 1'b0;
	protect = 1'b0;
	current_address = 24'b0;
end

// ****************** Un-Protect Sector ****************** //
always @(UPS)
begin : UPS_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. Un-Protect Sector is not allowed", DEVICE);
		disable UPS_ ;     
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. Un-Protect Sector is not allowed",fSCK);

	get_data;
	temp_addr [23:16] = read_data [7:0];
	get_data;
	temp_addr [15:8] = read_data [7:0];
	get_data;
	temp_addr [7:0] = read_data [7:0];
	current_address = temp_addr;

	@ (posedge CSB);
	if(WEL==1'b1 && SPRL==1'b0)
	begin
		RDYnBSY = 1'b1;
		unprotect = 1'b1;
		unprotect_sector(current_address);
		#tSECUP;
		$display ("Sector for Address %h is UnProtected", current_address);
	end
	else
		$display ("WEL bit not set or Sector Protection Register Locked. Un-Protect Sector is not allowed");

	unprotect = 1'b0;
	WEL = 1'b0;
	RDYnBSY = 1'b0;
	current_address = 24'b0;
end

// ****************** Read Sector Protection Register ****************** //
always @(RSPR)
begin : RSPR_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. Read Sector Protection Register is not allowed", DEVICE);
		disable RSPR_ ;
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. Read Sector Protection Register is not allowed",fSCK);

	get_data;
	temp_addr [23:16] = read_data [7:0];
	get_data;
	temp_addr [15:8] = read_data [7:0];
	get_data;
	temp_addr [7:0] = read_data [7:0];
	current_address = temp_addr;

	check_protection(current_address);
	if(protected==1'b1)
		$display ("Sector for Address %h is Protected", current_address);
	else
		$display ("Sector for Address %h is UnProtected", current_address);

	send_protection_status;	// sending the Sector Protection Register content in SO
	current_address = 24'b0;
	$display ("Read Sector Protection Register completed");
end

// ********************* Byte Program ********************* //
always @(BP)
begin : BP_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. Byte Program is not allowed", DEVICE);
		disable BP_ ; 
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. Byte Program is not allowed",fSCK);

	// to receive 3 bytes of address
	get_data;
	temp_addr [23:16] = read_data [7:0];
	get_data;
	temp_addr [15:8] = read_data [7:0];
	get_data;
	temp_addr [7:0] = read_data [7:0];
	current_address = temp_addr;

/*
	// to receive 1 bytes of data
	get_data;
	data_in [7:0] = read_data [7:0];
*/
	page_program;	// page program - receives data

	if(pp_i < 8)	// page program should not proceed if CSB deasserted at intermediate points
	begin
		$display ("Chip Select deasserted in non-even point. Byte/Page Program is not allowed");
		WEL = 1'b0;
		EPE = 1'b1;
		disable BP_ ;
	end

	if(WEL==1'b0)
	begin
		$display ("WEL bit not set. Byte Program is not allowed");
		disable BP_ ;
	end

	check_protection(current_address);

	if(protected==1'b1)
	begin
		$display("Sector for Address %h is Protected. Byte Program cannot be performed", current_address);
		WEL = 1'b0;
		disable BP_ ;
	end
	else
	begin
		$display ("Sector for Address %h is UnProtected, Byte Program can be performed", current_address);
//		@ (posedge CSB);
		RDYnBSY = 1'b1;
		byte_prog = 1'b1;
		pp_address = current_address[7:0];

		for(pp = 0; pp < pp_j; pp = pp+1)
		begin
			data_in = int_buffer[pp];
			byte_program({current_address[23:8],pp_address}, data_in);
			pp_address = pp_address + 1'b1;
		end
		$display("Byte write completed");

		#tPP;
		pp		 = 0;
		pp_j		 = 0;
		pp_i		 = 0;
		WEL		 = 1'b0;
		RDYnBSY		 = 1'b0;
		byte_prog	 = 1'b0;
		current_address  = 24'b0;
		pp_address	 = 8'b0;
		data_in		 = 8'b0;
	end
end

// ********************* Sequential Byte Program ********************* //
always @(SBP)
begin : SBP_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. Sequential Byte Program is not allowed", DEVICE);
		disable SBP_ ; 
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. Sequential Byte Program is not allowed",fSCK);

	if(seq_byte_start==1'b0)
	begin
	// to receive 3 bytes of address
		get_data;
		temp_addr [23:16] = read_data [7:0];
		get_data;
		temp_addr [15:8] = read_data [7:0];
		get_data;
		temp_addr [7:0] = read_data [7:0];
		current_address = temp_addr;
	end

	SPM = 1'b1;	// Entered Sequential Byte Programing mode

	if(seq_byte_start==1'b1)	// to increment address when entering sequential mode
	begin
		if(current_address < (MEMSIZE-1))
			current_address = current_address + 1'b1;
		else if(current_address == (MEMSIZE-1))
		begin
			$display ("Sequential Byte Program for device: %s reaches end of memory (%h). No Wrapping allowed. Sequential Byte Program is not allowed", DEVICE, MEMSIZE-1);
			WEL = 1'b0;
			SPM = 1'b0;
			seq_byte_start = 1'b0;
			disable SBP_ ; 
		end
	end

	// to receive 1 bytes of data
	get_data;
	data_in [7:0] = read_data [7:0];

	if(WEL==1'b0)
	begin
		$display ("WEL bit not set. Sequential Byte Program is not allowed");
		seq_byte_start = 1'b0;
		SPM = 1'b0;
		disable SBP_ ;
	end

	check_protection(current_address);

	if(protected==1'b1)
	begin
		$display("Sector for Address %h is Protected. Sequential Byte Program cannot be performed", current_address);
		seq_byte_start = 1'b0;
		WEL = 1'b0;
		SPM = 1'b0;
		disable SBP_ ;
	end
	else
	begin
		$display ("Sector for Address %h is UnProtected, Sequential Byte Program can be performed", current_address);
		@ (posedge CSB);
		RDYnBSY = 1'b1;
		seq_byte_prog = 1'b1;

		byte_program(current_address, data_in);
		$display("Sequential Byte write completed");

		#tBP;
		RDYnBSY = 1'b0;
		seq_byte_prog = 1'b0;
		data_in = 8'b0;
		seq_byte_start = 1'b1;
	end
end

// ********************* 4kB Block Erase ********************* //
always @(BE4)
begin : BE4_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. 4KB Block Erase is not allowed", DEVICE);
		disable BE4_ ;
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. 4KB Block Erase is not allowed",fSCK);

	get_data;
	temp_addr [23:16] = read_data [7:0];
	get_data;
	temp_addr [15:8] = read_data [7:0];
	get_data;
	temp_addr [7:0] = read_data [7:0];
	current_address = temp_addr;

	if(WEL==1'b0)
	begin
		$display ("WEL bit not set. 4KB Block Erase is not allowed");
		disable BE4_ ;
	end

	check_protection(current_address);

	if(protected==1'b1)
	begin
		$display("Sector for Address %h is Protected. 4KB Block Erase cannot be performed", current_address);
		WEL = 1'b0;
		disable BE4_ ;
	end
	else
	begin
		$display ("Sector for Address %h is UnProtected, 4KB Block Erase can be performed", current_address);
		@ (posedge CSB);
		RDYnBSY = 1'b1;
		erasing_block4 = 1'b1;

		erase_4kb(current_address);
		#tBLKE4;

		$display ("4kB Block with start address %h erased", {current_address[23:12],12'b0});
		WEL = 1'b0;
		RDYnBSY = 1'b0;
		current_address = 24'b0;
		erasing_block4 = 1'b0;
	end
end

// ********************* 32kB Block Erase ********************* //
always @(BE32)
begin : BE32_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. 32KB Block Erase is not allowed", DEVICE);
		disable BE32_ ;
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. 32KB Block Erase is not allowed",fSCK);

	get_data;
	temp_addr [23:16] = read_data [7:0];
	get_data;
	temp_addr [15:8] = read_data [7:0];
	get_data;
	temp_addr [7:0] = read_data [7:0];
	current_address = temp_addr;

	if(WEL==1'b0)
	begin
		$display ("WEL bit not set. 32KB Block Erase is not allowed");
		disable BE32_ ;
	end

	if(DEVICE == "AT25DF041A" && current_address[23:15]==9'b0000_0111_1)
	begin
		check_protection({current_address[23:16],2'b11,14'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 32KB Block Erase cannot be performed", {current_address[23:16],2'b11,14'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE32_ ;
		end
		check_protection({current_address[23:16],3'b100,13'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 32KB Block Erase cannot be performed", {current_address[23:16],3'b100,13'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE32_ ;
		end
		check_protection({current_address[23:16],3'b101,13'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 32KB Block Erase cannot be performed", {current_address[23:16],3'b101,13'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE32_ ;
		end
	end
	else if(DEVICE == "AT26DF081A" && current_address[23:15]==9'b0000_1111_0)
	begin
		check_protection({current_address[23:16],2'b00,15'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 32KB Block Erase cannot be performed", {current_address[23:16],2'b00,15'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE32_ ;
		end
		check_protection({current_address[23:16],3'b010,13'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 32KB Block Erase cannot be performed", {current_address[23:16],3'b010,13'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE32_ ;
		end
		check_protection({current_address[23:16],3'b011,13'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 32KB Block Erase cannot be performed", {current_address[23:16],3'b011,13'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE32_ ;
		end
	end
	else
		check_protection(current_address);

	if(protected==1'b1)
	begin
		$display("Sector for Address %h is Protected. 32KB Block Erase cannot be performed", current_address);
		WEL = 1'b0;
		disable BE32_ ;
	end
	else
	begin
		$display ("Sector for Address %h is UnProtected, 32KB Block Erase can be performed", current_address);
		@ (posedge CSB);
		RDYnBSY = 1'b1;
		erasing_block32 = 1'b1;

		erase_32kb(current_address);
		#tBLKE32;

		$display ("32KB Block with start address %h erased", {current_address[23:15],15'b0});
		WEL = 1'b0;
		RDYnBSY = 1'b0;
		current_address = 24'b0;
		erasing_block32 = 1'b0;
	end
end

// ********************* 64kB Block Erase ********************* //
always @(BE64)
begin : BE64_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. 64KB Block Erase is not allowed", DEVICE);
		disable BE64_ ;
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. 64KB Block Erase is not allowed",fSCK);

	get_data;
	temp_addr [23:16] = read_data [7:0];
	get_data;
	temp_addr [15:8] = read_data [7:0];
	get_data;
	temp_addr [7:0] = read_data [7:0];
	current_address = temp_addr;

	if(WEL==1'b0)
	begin
		$display ("WEL bit not set. 64KB Block Erase is not allowed");
		disable BE64_ ;
	end

	if(DEVICE == "AT25DF041A" && current_address[23:16]==8'b0000_0111)
	begin
		check_protection({current_address[23:16],1'b0,15'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", {current_address[23:16],1'b0,15'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE64_ ;
		end
		check_protection({current_address[23:16],2'b11,14'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", {current_address[23:16],2'b11,14'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE64_ ;
		end
		check_protection({current_address[23:16],3'b100,13'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", {current_address[23:16],3'b100,13'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE64_ ;
		end
		check_protection({current_address[23:16],3'b101,13'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", {current_address[23:16],3'b101,13'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE64_ ;
		end
	end
	else if(DEVICE == "AT26DF081A" && current_address[23:16]==8'b0000_1111)
	begin
		check_protection({current_address[23:16],2'b00,15'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", {current_address[23:16],2'b00,15'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE64_ ;
		end
		check_protection({current_address[23:16],1'b1,14'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", {current_address[23:16],1'b1,14'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE64_ ;
		end
		check_protection({current_address[23:16],3'b010,13'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", {current_address[23:16],3'b010,13'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE64_ ;
		end
		check_protection({current_address[23:16],3'b011,13'b0});
		if(protected==1'b1)
		begin
			$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", {current_address[23:16],3'b011,13'b0});
			EPE = 1'b1;
			WEL = 1'b0;
			disable BE64_ ;
		end
	end
	else
		check_protection(current_address);

	if(protected==1'b1)
	begin
		$display("Sector for Address %h is Protected. 64KB Block Erase cannot be performed", current_address);
		WEL = 1'b0;
		disable BE64_ ;
	end
	else
	begin
		$display ("Sector for Address %h is UnProtected, 64KB Block Erase can be performed", current_address);
		@ (posedge CSB);
		RDYnBSY = 1'b1;
		erasing_block64 = 1'b1;

		erase_64kb(current_address);
		#tBLKE64;

		$display ("64kB Block with start address %h erased", {current_address[23:16],16'b0});
		WEL = 1'b0;
		RDYnBSY = 1'b0;
		current_address = 24'b0;
		erasing_block64 = 1'b0;
	end
end

// ********************* Chip Erase ********************* //
always @(CE)
begin : CE_
	if (RDYnBSY == 1'b1) // device is already busy
	begin
		$display ("Device %s is busy. Chip Erase is not allowed", DEVICE);
		disable CE_ ;
	end
	// if it comes here, means, the above if was false.

   if (freq_error==1'b1)
	$display ("WARNING: Frequency should be less than %d MHz for SPI interface. Chip Erase is not allowed",fSCK);

	if(WEL==1'b0)
	begin
		$display ("WEL bit not set. Chip Erase is not allowed");
		disable CE_ ;
	end

	if(SWP==2'b00)
	begin
		$display("All Sectors in the chip are UnProtected. Chip Erase can be performed");
		@ (posedge CSB);
		RDYnBSY = 1'b1;
		erasing_chip = 1'b1;

		erase_chip;
		for(delay =0; delay < tmult; delay = delay+1)
			#tCHPEn;

		WEL = 1'b0;
		RDYnBSY = 1'b0;
		erasing_chip = 1'b0;
	end
	else if(SWP!=2'b00)
	begin
		$display("Some or all Sectors in the chip is Protected. Chip Erase cannot be performed");
		EPE = 1'b1;
		disable CE_ ;
	end

	$display ("Chip Erase Completed");
end

// ******** Posedge CSB. Stop all reading, recvng. commands/addresses etc. ********* //

always @(posedge CSB)
begin
	disable RA_;	// Read Array (low freq and normal freq)
	disable MIR_;	// MIR will stop, if CSB goes high
	disable RSR_;	// Status reading should stop.

	disable get_opcode;		// Stop opcode retrieval
	disable get_data;		// Stop address/data retrieval
	disable read_out_array;		// send data in SO
	disable send_protection_status; // Send Protection status
	disable page_program;

	temp_data = 8'b0;
	temp_addr = 24'b0;
	rd_dummy = 1'b0;
	status_read = 1'b0; 
	protected = 1'b0;
	read_data = 8'b0;
	EPE = 1'b0;

	#tDIS SO_on = 1'b0;  // SO is now in high-impedance
	SO_reg = 1'b0;
end

// ********************** Frequeny Checking ********************** //
always @ (negedge SCK)
begin
	tperiod <= $time;
	tperiod1 <= tperiod;
end

//always @(tperiod or tperiod1)
always @(negedge SCK)
begin
	if ((tperiod - tperiod1) < (tSCKH + tSCKH))
	begin
		//freq_error = 1'b1;
		//$display("Frequency exceeds max limit (14285 ms). Time period detected is %t", (tperiod -tperiod1)); 
	end
	else
		freq_error = 1'b0;

end // always
// **************************************************************** //

endmodule
