module ram_wb_sc_sw (dat_i, dat_o, adr_i, we_i, clk );

   parameter dat_width = 32;
   parameter adr_width = 20;
   parameter mem_size  = 262144;
   
   input [dat_width-1:0]      dat_i;
   input [adr_width-1:0]      adr_i;
   input 		      we_i;
   output reg [dat_width-1:0] dat_o;
   input 		      clk;   

   reg [dat_width-1:0] ram [0:mem_size - 1] /* verilator public */ /* synthesis ram_style = no_rw_check */;

   // Preload the memory
   // Note! This vmem file must be WORD addressed, not BYTE addressed
   // eg: @00000000 00000000 00000000 00000000 00000000
   //     @00000004 00000000 00000000 00000000 00000000
   //     @00000008 00000000 00000000 00000000 00000000
   //     @0000000c 00000000 00000000 00000000 00000000
   //     etc..

   parameter memory_file = "sram.vmem";   
   
`ifdef verilator
   
   task do_readmemh;
      // verilator public
      $readmemh(memory_file, ram);
   endtask // do_readmemh
   
`else
   
   initial
     begin
	$readmemh(memory_file, ram);
     end
   
`endif
   
   // Function to access RAM (for use by Verilator).
   function [31:0] get_mem;
      // verilator public
      input [adr_width-1:0] 		addr;
      get_mem = ram[addr];
   endfunction // get_mem

   // Function to write RAM (for use by Verilator).
   function set_mem;
      // verilator public
      input [adr_width-1:0] 		addr;
      input [dat_width-1:0] 		data;
      ram[addr] = data;
   endfunction // set_mem

   always @ (posedge clk)
     begin 
	dat_o <= ram[adr_i];
	if (we_i)
	  ram[adr_i] <= dat_i;
     end 

endmodule // ram_wb_sc_sw

