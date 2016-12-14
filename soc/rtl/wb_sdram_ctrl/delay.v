`timescale 1ns/1ns
module delay #
  (
   parameter depth = 3,
   width = 2
   )

   (
    input [width-1:0]  d,
    output [width-1:0] q,
    input 	       clear,
    input 	       clk,
    input 	       rst
    );

   reg [width-1:0] dffs [1:depth];

   integer i;
   always @ (posedge clk or posedge rst)
     if (rst)
       for ( i=1; i < depth+1; i= i + 1)
	 dffs[i] <= 0; //{depth{1'b0}};
     else
       if (clear)
	 for ( i=1; i < depth+1; i= i + 1)
	   dffs[i] <= 0; //{depth{1'b0}};
       else
	 begin
	    dffs[1] <= d;	  
	    for ( i=2; i < depth+1; i= i + 1)
	      dffs[i] <= dffs[i-1];
	 end
   
   assign q = dffs[depth];
   
endmodule //

   
