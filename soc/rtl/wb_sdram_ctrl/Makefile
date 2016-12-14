define:
	vpp wb_sdram_ctrl_defines.vpp > wb_sdram_ctrl_defines.v

basic: define
	perl fizzim.pl -terse < wb_sdram_ctrl_burst.fzm > wb_sdram_ctrl_burst.v
	perl fizzim.pl -encoding onehot -terse < wb_sdram_ctrl_fsm.fzm > wb_sdram_ctrl_fsm.v

MT48LC16M16:
	cp ./MT48LC16M16.v ./defines.v

fifo:
	vpp wb_sdram_ctrl_fifo.vpp > fifo.v
	vppp --simple fifo.v > wb_sdram_ctrl_fifo.v

all: MT48LC16M16 fifo basic
	vppp --simple delay.v wb_sdram_ctrl_fsm.v wb_sdram_ctrl_fifo.v wb_sdram_ctrl_top.v > wb_sdram_ctrl_ip.v

