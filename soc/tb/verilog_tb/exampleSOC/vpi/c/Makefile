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

# Due to a difference in the type for a memory array passed back to the VPI
# interface, we must indicate whether we're compiling the jp_vpi module for use
# with Modelsim or with Icarus. We do this via defines passed at compile time,
# -DSIMULATOR_VPI

# Set V=1 when calling make to enable verbose output
# mainly for debugging purposes.
ifeq ($(V), 1)
Q=
QUIET=
else
Q ?=@
QUIET=-quiet
endif

all: jp_vpi

jp_vpi: $(SOURCE_FILES)
	iverilog-vpi $(SOURCE_FILES) $(DEBUG_DEFINES) -DICARUS_VPI

SOURCE_FILES= jp_vpi.c rsp-rtl_sim.c gdb.c
OBJ_FILES=    jp_vpi.o rsp-rtl_sim.o gdb.o

MODELTECH_INC_PATH=$(MGC_PATH)/modeltech/include
MODELTECH_VPI_CFLAGS=-fPIC -fno-stack-protector -DMODELSIM_VPI
# Modelsim VPI compile commands
msim_jp_vpi.sl: $(OBJ_FILES)
	ld -shared -E -o $@ $?
%.o: %.c
	$(Q)echo; echo "\t### Building VPI debug components for Modelsim ###"; echo;
	$(Q)gcc -g ${DEBUG_DEFINES} -I${MODELTECH_INC_PATH} \
	-l${MODELTECH_INC_PATH} \
	$(MODELTECH_VPI_CFLAGS) \
	-c $< -o $*.o

clean:
	$(Q)echo; echo "\t### Cleaning VPI debug directory ###"; echo;
	$(Q)rm -f *.o *~ jp_vpi.vpi msim_jp_vpi.sl
