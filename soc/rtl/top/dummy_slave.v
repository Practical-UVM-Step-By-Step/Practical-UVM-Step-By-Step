module dummy_slave
   ( dat_o, stb_i, cyc_i, ack_o, clk, rst );
   

   output [31:0] dat_o;
   input 	 stb_i;
   input 	 cyc_i;
   output 	 ack_o;
   input 	 clk;
   input 	 rst;

   reg 		 ack_o;
   
   parameter [31:0] value = 32'hc0000000;

   assign dat_o = value;

   always @ (posedge clk or posedge rst)
     if (rst)
       ack_o <= 1'b0;
     else
       ack_o <= stb_i & cyc_i & !ack_o;

endmodule //

  
