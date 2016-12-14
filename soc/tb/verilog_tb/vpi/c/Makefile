######################################################################
####                                                              ####
####  VPI Makefile                                                ####
####                                                              ####
####  Description                                                 ####
####  Makefile for VPI libraries                                  ####
####                                                              ####
####  To Do:                                                      ####
####    Add compatability for other simulators (Cadence, etc.)    ####
####                                                              ####
####  Author(s):                                                  ####
####      - jb, jb@orsoc.se                                       ####
####                                                              ####
####                                                              ####
######################################################################
####                                                              ####
#### Copyright (C) 2009 Authors and OPENCORES.ORG                 ####
####                                                              ####
#### This source file may be used and distributed without         ####
#### restriction provided that this copyright statement is not    ####
#### removed from the file and that any derivative work contains  ####
#### the original copyright notice and the associated disclaimer. ####
####                                                              ####
#### This source file is free software; you can redistribute it   ####
#### and/or modify it under the terms of the GNU Lesser General   ####
#### Public License as published by the Free Software Foundation; ####
#### either version 2.1 of the License, or (at your option) any   ####
#### later version.                                               ####
####                                                              ####
#### This source is distributed in the hope that it will be       ####
#### useful, but WITHOUT ANY WARRANTY; without even the implied   ####
#### warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ####
#### PURPOSE.  See the GNU Lesser General Public License for more ####
#### details.                                                     ####
####                                                              ####
#### You should have received a copy of the GNU Lesser General    ####
#### Public License along with this source; if not, download it   ####
#### from http://www.opencores.org/lgpl.shtml                     ####
####                                                              ####
######################################################################

SOURCE_FILES= jp_vpi.c rsp-rtl_sim.c gdb.c

# Uncomment this line to enable debugging of all VPI code

#DEBUG_DEFINES=-DDEBUG -DDEBUG2 -DDEBUG_ON=1 -DDEBUG_GDB=1 -DDEBUG_CMDS=1

all: jp_vpi

jp_vpi: $(SOURCE_FILES)
	iverilog-vpi $(SOURCE_FILES) $(DEBUG_DEFINES)

clean:
	rm -f *.o *~ jp_vpi.vpi
