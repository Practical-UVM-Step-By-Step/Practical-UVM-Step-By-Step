//
// Template for UVM-compliant interface
//

`ifndef WB_MASTER_IF__SV
`define WB_MASTER_IF__SV

interface wb_master_if (input wire clk,input bit rst);

   // ToDo: Define default setup & hold times

   parameter setup_time = 5/*ns*/;
   parameter hold_time  = 3/*ns*/;


// Common Signals
  wire  [31:0] DAT_I;
  wire  [31:0] DAT_O;
  wire RST_I = rst;
  wire  [15:0] TGD_I;
  wire [15:0] TGD_O;
 

  // Master signals
  logic ACK_I;
  logic [31:0] ADR_O;
  logic CYC_O;
  logic ERR_I;
  logic LOCK_O;

  logic RTY_I ;
  logic [3:0] SEL_O;	
  logic STB_O;	
  logic [15:0] TGA_O;	
  logic [15:0] TGC_O;	
  logic WE_O;	


 clocking master_cb @(posedge clk);

// Common Signals
  input clk;
  input rst;

  input  DAT_I;
  output  DAT_O;
  input RST_I;
  input  TGD_I;
  output TGD_O;
 

  // Master signals
  input  ACK_I;
  output ADR_O;
  output CYC_O;
  input ERR_I;
  output LOCK_O;

  input RTY_I ;
  output  SEL_O;	
  output STB_O;	
  output  TGA_O;	
  output  TGC_O;	
  output WE_O;
 endclocking




 clocking monitor_cb @(posedge clk);
// Common Signals
  input clk;
  input rst;

  input  DAT_I;
  input  DAT_O;
  input RST_I;
  input  TGD_I;
  input TGD_O;
 

  // Master signals
  input  ACK_I;
  input ADR_O;
  input CYC_O;
  input ERR_I;
  input LOCK_O;

  input RTY_I ;
  input  SEL_O;	
  input STB_O;	
  input  TGA_O;	
  input  TGC_O;	
  input WE_O;
 endclocking


 modport master (clocking master_cb);


 modport monitor (clocking monitor_cb);


endinterface: wb_master_if

`endif // WB_MASTER_IF__SV
