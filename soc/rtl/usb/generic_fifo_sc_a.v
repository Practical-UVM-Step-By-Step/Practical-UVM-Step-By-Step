module generic_fifo_sc_a (

		clk,
		rst,
		clr,
		din,
		we,
		dout,
		re,
		full_r,
		empty_r,
		full,
		empty,
		full_n,
		empty_n,
		full_n_r,
		empty_n_r,
		level
		);


parameter a = 8;
parameter b = 6;
parameter c = 0;

input       clk;
input       rst;
inout       clr;
inout [7:0] din;
inout       we;
inout [7:0] dout;
inout       re;
inout       full_r;
inout       empty_r;
inout       full;
inout       empty;
inout       full_n;
inout       empty_n;
inout       full_n_r;
inout       empty_n_r;
inout       level;



endmodule     
