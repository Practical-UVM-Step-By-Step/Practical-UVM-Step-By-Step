`timescale 1ns/1ns

`define MODULE_NAME wb_sdram_ctrl


`define BURST_LENGTH `LENGTH

//
// Specify either type of memory
// or
// BA_SIZE, ROW_SIZE, COL_SIZE and SDRAM_DATA_WIDTH
//
// either in this file or as command line option; +define+MT48LC16M16
//

// number of adr lines to use
// 2^2 = 4 32 bit word burst
`define BURST_SIZE 2

`define DEVICE MT48LC16M16
// using 1 of MT48LC16M16
// SDRAM data width is 16
  
`define SDRAM_DATA_WIDTH 16
`define COL_SIZE 9  
`define ROW_SIZE 13
`define BA_SIZE 2

`define SDRAM16
`define COL {4'b0000,wb_adr_i[9:1]}
`define ROW wb_adr_i[22:10]
`define BA wb_adr_i[24:23]
`define WORD_SIZE 1
`define END_OF_BURST burst_counter[0]
`define WB_ADR_HI 24
`define WB_ADR_LO 1

// FIFO
`define DLY_INIT 4095
`define AREF_INIT 390

// LMR
// [12:10] reserved
// [9]     WB, write burst; 0 - programmed burst length, 1 - single location
// [8:7]   OP Mode, 2'b00
// [6:4]   CAS Latency; 3'b010 - 2, 3'b011 - 3
// [3]     BT, Burst Type; 1'b0 - sequential, 1'b1 - interleaved
// [2:0]   Burst length; 3'b000 - 1, 3'b001 - 2, 3'b010 - 4, 3'b011 - 8, 3'b111 - full page
`define WB 1'b1
`define CL 2
`define BT 1'b0
`define BL 3'b000

// Adr to SDRAM {ba[1:0],a[12:0]}
`define A_LMR     {2'b00,3'b000,`WB,2'b00,3'd`CL,`BT,`BL}
`define A_PRE     {2'b00,13'b0010000000000}
`define A_ACT     {`BA,`ROW}
`define A_READ    {`BA,`COL}
`define A_WRITE   {`BA,`COL}
`define A_DEFAULT {2'b00,13'b0000000000000}

// command
`define CMD {ras, cas, we}
`define CMD_NOP   3'b111
`define CMD_AREF  3'b001
`define CMD_LMR   3'b000
`define CMD_PRE   3'b010
`define CMD_ACT   3'b011
`define CMD_READ  3'b101
`define CMD_WRITE 3'b100
`define CMD_BT    3'b110
