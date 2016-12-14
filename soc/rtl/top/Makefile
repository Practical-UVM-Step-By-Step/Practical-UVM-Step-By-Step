INCLUDES = +incdir+$(ROOT)/rtl/wb_conmax+$(ROOT)/rtl/vga_lcd+$(ROOT)/rtl/uart16550+$(ROOT)/rtl/or1k_top+$(ROOT)/rtl/tap+$(ROOT)/rtl/spi_ctrl
compile: 
	vcs +v2k +incdir+../include -f filelist -timescale=1ns/1ps  +define+VGA_12BIT_DVI -debug_all \
	+libext+.v \
	-f $(ROOT)/rtl/wb_conmax/filelist \
	-f $(ROOT)/rtl/vga_lcd/filelist \
	-f $(ROOT)/rtl/smii/filelist \
	-f  $(ROOT)/rtl/uart16550/filelist $(INCLUDES)  -l comp.log \
	-y $(ROOT)/rtl/rom \
	-y $(ROOT)/rtl/ram_wb \
	-y $(ROOT)/rtl/or1k_top \
	-y $(ROOT)/rtl/ethernet \
	-y $(ROOT)/rtl/spi_ctrl \
	-y $(ROOT)/rtl/or1200  \
	-y $(ROOT)/rtl/debug_if \
	-y $(ROOT)/rtl/tap  \
	-y $(ROOT)/rtl/or1k_startup \
	-y  . 


clean: 
	rm -rf *.log simv* csrc* DVE*
