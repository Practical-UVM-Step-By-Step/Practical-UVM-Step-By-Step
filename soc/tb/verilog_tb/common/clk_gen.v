module clk_gen
  (
   input POWERDOWN,
   input CLKA,
   output LOCK,
   output GLA,
   output GLB,
   output GLC
   );

   assign LOCK = POWERDOWN;
   assign GLA = CLKA;
   assign GLB = 1'b0;
   assign GLC = 1'b0;
endmodule // clk_gen
