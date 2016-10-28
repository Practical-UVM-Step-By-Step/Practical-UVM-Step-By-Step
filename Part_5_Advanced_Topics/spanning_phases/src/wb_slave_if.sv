`ifndef WB_SLAVE_IF__SV
 `define WB_SLAVE_IF__SV

interface wb_slave_if (input bit clk, input bit rst);


   parameter setup_time = 5/*ns*/;
   parameter hold_time  = 3/*ns*/;


   // Common Signals
   wire CYC_I;
   wire [31:0] DAT_I;
   wire [31:0] DAT_O;
   wire        RST_I;
   logic [15:0] TGD_I;
   logic [15:0] TGD_O;
   // Slave Signals
   logic 	ACK_O	;
   wire [31:0] 	ADR_I;	
   logic 	ERR_O	;
   wire 	LOCK_I	;
   logic 	RTY_O	;
   logic [3:0] 	SEL_I	;
   wire 	STB_I	;
   logic [15:0] TGA_I	;
   logic [15:0] TGC_I	;
   wire 	WE_I	;


   // Define one clocking block per clock domain
   //       with synchronous signal direction from a
   //       master perspective


   clocking slave_cb @(posedge clk);
      default input #setup_time output #hold_time;

      // Common Signals
      input 	CYC_I;
      input 	DAT_I;
      output 	DAT_O;
      input 	RST_I;
      input 	TGD_I;
      output 	TGD_O;
      // Slave Signals
      output 	ACK_O	;
      input 	ADR_I;	
      output 	ERR_O	;
      input 	LOCK_I	;
      output 	RTY_O	;
      input 	SEL_I	;
      input 	STB_I	;
      input 	TGA_I	;
      input 	TGC_I	;
      input 	WE_I	;

   endclocking: slave_cb

   clocking slave_mon_cb @(posedge clk);
      default input #setup_time output #hold_time;

      // Common Signals
      input 	CYC_I;
      input 	DAT_I;
      input 	DAT_O;
      input 	RST_I;
      input 	TGD_I;
      input 	TGD_O;
      // Slave Signals
      input 	ACK_O	;
      input 	ADR_I;	
      input 	ERR_O	;
      input 	LOCK_I	;
      input 	RTY_O	;
      input 	SEL_I	;
      input 	STB_I	;
      input 	TGA_I	;
      input 	TGC_I	;
      input 	WE_I;

   endclocking: slave_mon_cb


   modport slave (clocking slave_cb);


   modport slave_mon (clocking slave_mon_cb);

endinterface: wb_slave_if

`endif // WB_SLAVE_IF__SV
