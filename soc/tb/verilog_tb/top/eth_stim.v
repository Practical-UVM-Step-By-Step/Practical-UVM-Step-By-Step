//////////////////////////////////////////////////////////////////////
////                                                              ////
////  ORPSoC Testbench - Ethernet MAC Stimulus                    ////
////                                                              ////
////  Description                                                 ////
////  Ethernet MAC stimulus tasks. Taken from the project         ////
////  testbench in the ethmac core.                               ////
////                                                              ////
////  To Do:                                                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////      - Tadej Markovic, tadej@opencores.org                   ////
////      - Igor Mohor,     igorM@opencores.org                   ////
////      - jb, jb@orsoc.se                                       ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


reg [15:0] rx_packet_length;
reg [7:0] st_data;
parameter Tp = 1;
initial 
  begin

     repeat(170000) @(posedge eth_clk);
     
     rx_packet_length = 16'd96; // Bytes
     
     st_data = 8'h0F;
     set_rx_packet(0, rx_packet_length, 1'b0, 48'h0012_3456_789a, 48'h0708_090A_0B0C, 16'h0D0E, st_data); // length without CRC
     set_rx_addr_type(0, 48'h0102_0304_0506, 48'h0708_090A_0B0C, 16'h0D0E);
     append_rx_crc(0, rx_packet_length, 1'b0, 1'b0);

     /*
     // write to phy's control register for 10Mbps
     #Tp eth_phy0.control_bit14_10 = 5'b00000; // bit 13 reset - speed 10
     #Tp eth_phy0.control_bit8_0   = 9'h1_00;  // bit 6 reset  - (10/100), bit 8 set - FD
     */
     
     /*
     // write to phy's control register for 100Mbps
     #Tp eth_phy0.control_bit14_10 = 5'b01000; // bit 13 reset - speed 100
     #Tp eth_phy0.control_bit8_0   = 9'h1_00;  // bit 6 reset  - (10/100), bit 8 set - FD
      */

     //#Tp eth_phy0.carrier_sense_tx_fd_detect(1); // Full duplex CRS detect normally off

     /*
      from eth_phy.v:
      task send_rx_packet;
      input  [(8*8)-1:0] preamble_data; // preamble data to be sent - correct is 64'h0055_5555_5555_5555
      input [3:0] 	preamble_len; // length of preamble in bytes - max is 4'h8, correct is 4'h7 
      input [7:0] 	sfd_data; // SFD data to be sent - correct is 8'hD5
      input [31:0] 	start_addr; // start address
      input [31:0] len; // length of frame in Bytes (without preamble and SFD)
      input 	  plus_drible_nibble; // if length is longer for one nibble
      
      */
     //     while (1)
      // begin
	  #300000 eth_phy0.send_rx_packet(64'h0055_5555_5555_5555, 4'h7, 8'hD5, 0, rx_packet_length, 1'b0);
  //end
     /* TODO: Some checking here that the packet's contents actually ended up in RAM correctly */
     
  end
/*   
  TASKS for set and check RX packets:
  -----------------------------------
  set_rx_packet 
    (rxpnt[31:0], len[15:0], plus_nibble, d_addr[47:0], s_addr[47:0], type_len[15:0], start_data[7:0]);
  check_rx_packet 
    (rxpnt_phy[31:0], rxpnt_wb[31:0], len[15:0], plus_nibble, successful_nibble, failure[31:0]);
*/
task set_rx_packet;
  input  [31:0] rxpnt; // pointer to place in in the phy rx buffer we'll start at
  input  [15:0] len;
  input         plus_dribble_nibble; // if length is longer for one nibble
  input  [47:0] eth_dest_addr;
  input  [47:0] eth_source_addr;
  input  [15:0] eth_type_len;
  input  [7:0]  eth_start_data;
  integer       i, sd;
  reg    [47:0] dest_addr;
  reg    [47:0] source_addr;
  reg    [15:0] type_len;
  reg    [21:0] buffer;
  reg           delta_t;
begin
  buffer = rxpnt[21:0];
  dest_addr = eth_dest_addr;
  source_addr = eth_source_addr;
  type_len = eth_type_len;
  sd = eth_start_data;
  delta_t = 0;
  for(i = 0; i < len; i = i + 1) 
  begin
    if (i < 6)
    begin
      eth_phy0.rx_mem[buffer] = dest_addr[47:40];
      dest_addr = dest_addr << 8;
    end
    else if (i < 12)
    begin
      eth_phy0.rx_mem[buffer] = source_addr[47:40];
      source_addr = source_addr << 8;
    end
    else if (i < 14)
    begin
      eth_phy0.rx_mem[buffer] = type_len[15:8];
      type_len = type_len << 8;
    end
    else
    begin
      eth_phy0.rx_mem[buffer] = sd[7:0];
      sd = sd + 1;
    end
    buffer = buffer + 1;
  end
  delta_t = !delta_t;
  if (plus_dribble_nibble)
    eth_phy0.rx_mem[buffer] = {4'h0, 4'hD /*sd[3:0]*/};
  delta_t = !delta_t;
end
endtask // set_rx_packet




task set_rx_addr_type;
  input  [31:0] rxpnt;
  input  [47:0] eth_dest_addr;
  input  [47:0] eth_source_addr;
  input  [15:0] eth_type_len;
  integer       i;
  reg    [47:0] dest_addr;
  reg    [47:0] source_addr;
  reg    [15:0] type_len;
  reg    [21:0] buffer;
  reg           delta_t;
begin
  buffer = rxpnt[21:0];
  dest_addr = eth_dest_addr;
  source_addr = eth_source_addr;
  type_len = eth_type_len;
  delta_t = 0;
  for(i = 0; i < 14; i = i + 1) 
  begin
    if (i < 6)
    begin
      eth_phy0.rx_mem[buffer] = dest_addr[47:40];
      dest_addr = dest_addr << 8;
    end
    else if (i < 12)
    begin
      eth_phy0.rx_mem[buffer] = source_addr[47:40];
      source_addr = source_addr << 8;
    end
    else // if (i < 14)
    begin
      eth_phy0.rx_mem[buffer] = type_len[15:8];
      type_len = type_len << 8;
    end
    buffer = buffer + 1;
  end
  delta_t = !delta_t;
end
endtask // set_rx_addr_type

/*
task check_rx_packet;
  input  [31:0] rxpnt_phy; // source
  input  [31:0] rxpnt_wb;  // destination
  input  [15:0] len;
  input         plus_dribble_nibble; // if length is longer for one nibble
  input         successful_dribble_nibble; // if additional nibble is stored into memory
  output [31:0] failure;
  integer       i, data_wb, data_phy;
  reg    [31:0] addr_wb, addr_phy;
  reg    [31:0] failure;
  reg    [21:0] buffer;
  reg           delta_t;
begin
  addr_phy = rxpnt_phy;
  addr_wb = rxpnt_wb;
  delta_t = 0;
  failure = 0;

  // First write might not be word allign.
  if(addr_wb[1:0] == 1)
  begin
    wb_slave.rd_mem(addr_wb[21:0] - 1, data_wb, 4'h7);
    data_phy[31:24] = 0;
    data_phy[23:16] = eth_phy0.rx_mem[addr_phy[21:0]];
    data_phy[15: 8] = eth_phy0.rx_mem[addr_phy[21:0] + 1];
    data_phy[ 7: 0] = eth_phy0.rx_mem[addr_phy[21:0] + 2];
    i = 3;
    if (data_phy[23:0] !== data_wb[23:0])
    begin
      //`TIME;
      //$display("   addr_phy = %h, addr_wb = %h", rxpnt_phy, rxpnt_wb);
      //$display("*E Wrong 1. word (3 bytes) of RX packet! phy = %h, wb = %h", data_phy[23:0], data_wb[23:0]);
      failure = 1;
    end
  end
  else if (addr_wb[1:0] == 2)
  begin
    wb_slave.rd_mem(addr_wb[21:0] - 2, data_wb, 4'h3);
    data_phy[31:16] = 0;
    data_phy[15: 8] = eth_phy0.rx_mem[addr_phy[21:0]];
    data_phy[ 7: 0] = eth_phy0.rx_mem[addr_phy[21:0] + 1];
    i = 2;
    if (data_phy[15:0] !== data_wb[15:0])
    begin
      //`TIME;
      //$display("   addr_phy = %h, addr_wb = %h", rxpnt_phy, rxpnt_wb);
      //$display("*E Wrong 1. word (2 bytes) of RX packet! phy = %h, wb = %h", data_phy[15:0], data_wb[15:0]);
      failure = 1;
    end
  end
  else if (addr_wb[1:0] == 3)
  begin
    wb_slave.rd_mem(addr_wb[21:0] - 3, data_wb, 4'h1);
    data_phy[31: 8] = 0;
    data_phy[ 7: 0] = eth_phy0.rx_mem[addr_phy[21:0]];
    i = 1;
    if (data_phy[7:0] !== data_wb[7:0])
    begin
      //`TIME;
      //$display("   addr_phy = %h, addr_wb = %h", rxpnt_phy, rxpnt_wb);
      //$display("*E Wrong 1. word (1 byte) of RX packet! phy = %h, wb = %h", data_phy[7:0], data_wb[7:0]);
      failure = 1;
    end
  end
  else
    i = 0;
  delta_t = !delta_t;

  for(i = i; i < (len - 4); i = i + 4) // Last 0-3 bytes are not checked
  begin
    wb_slave.rd_mem(addr_wb[21:0] + i, data_wb, 4'hF);
    data_phy[31:24] = eth_phy0.rx_mem[addr_phy[21:0] + i];
    data_phy[23:16] = eth_phy0.rx_mem[addr_phy[21:0] + i + 1];
    data_phy[15: 8] = eth_phy0.rx_mem[addr_phy[21:0] + i + 2];
    data_phy[ 7: 0] = eth_phy0.rx_mem[addr_phy[21:0] + i + 3];
    if (data_phy[31:0] !== data_wb[31:0])
    begin
      //`TIME;
      //if (i == 0)
      //  $display("   addr_phy = %h, addr_wb = %h", rxpnt_phy, rxpnt_wb);
      //$display("*E Wrong %0d. word (4 bytes) of RX packet! phy = %h, wb = %h", ((i/4)+1), data_phy[31:0], data_wb[31:0]);
      failure = failure + 1;
    end
  end
  delta_t = !delta_t;

  // Last word
  if((len - i) == 3)
  begin
    wb_slave.rd_mem(addr_wb[21:0] + i, data_wb, 4'hF);
    data_phy[31:24] = eth_phy0.rx_mem[addr_phy[21:0] + i];
    data_phy[23:16] = eth_phy0.rx_mem[addr_phy[21:0] + i + 1];
    data_phy[15: 8] = eth_phy0.rx_mem[addr_phy[21:0] + i + 2];
    if (plus_dribble_nibble)
      data_phy[ 7: 0] = eth_phy0.rx_mem[addr_phy[21:0] + i + 3];
    else
      data_phy[ 7: 0] = 0;
    if (data_phy[31:8] !== data_wb[31:8])
    begin
      //`TIME;
      //$display("*E Wrong %0d. word (3 bytes) of RX packet! phy = %h, wb = %h", ((i/4)+1), data_phy[31:8], data_wb[31:8]);
      failure = failure + 1;
    end
    if (plus_dribble_nibble && successful_dribble_nibble)
    begin
      if (data_phy[3:0] !== data_wb[3:0])
      begin
        //`TIME;
        //$display("*E Wrong dribble nibble in %0d. word (3 bytes) of RX packet!", ((i/4)+1));
        failure = failure + 1;
      end
    end
    else if (plus_dribble_nibble && !successful_dribble_nibble)
    begin
      if (data_phy[3:0] === data_wb[3:0])
      begin
        //`TIME;
        //$display("*E Wrong dribble nibble in %0d. word (3 bytes) of RX packet!", ((i/4)+1));
        failure = failure + 1;
      end
    end
  end
  else if((len - i) == 2)
  begin
    wb_slave.rd_mem(addr_wb[21:0] + i, data_wb, 4'hE);
    data_phy[31:24] = eth_phy0.rx_mem[addr_phy[21:0] + i];
    data_phy[23:16] = eth_phy0.rx_mem[addr_phy[21:0] + i + 1];
    if (plus_dribble_nibble)
      data_phy[15: 8] = eth_phy0.rx_mem[addr_phy[21:0] + i + 2];
    else
      data_phy[15: 8] = 0;
    data_phy[ 7: 0] = 0;
    if (data_phy[31:16] !== data_wb[31:16])
    begin
      //`TIME;
      //$display("*E Wrong %0d. word (2 bytes) of RX packet! phy = %h, wb = %h", ((i/4)+1), data_phy[31:16], data_wb[31:16]);
      failure = failure + 1;
    end
    if (plus_dribble_nibble && successful_dribble_nibble)
    begin
      if (data_phy[11:8] !== data_wb[11:8])
      begin
        //`TIME;
        //$display("*E Wrong dribble nibble in %0d. word (2 bytes) of RX packet!", ((i/4)+1));
        failure = failure + 1;
      end
    end
    else if (plus_dribble_nibble && !successful_dribble_nibble)
    begin
      if (data_phy[11:8] === data_wb[11:8])
      begin
        //`TIME;
        //$display("*E Wrong dribble nibble in %0d. word (2 bytes) of RX packet!", ((i/4)+1));
        failure = failure + 1;
      end
    end
  end
  else if((len - i) == 1)
  begin
    wb_slave.rd_mem(addr_wb[21:0] + i, data_wb, 4'hC);
    data_phy[31:24] = eth_phy0.rx_mem[addr_phy[21:0] + i];
    if (plus_dribble_nibble)
      data_phy[23:16] = eth_phy0.rx_mem[addr_phy[21:0] + i + 1];
    else
      data_phy[23:16] = 0;
    data_phy[15: 8] = 0;
    data_phy[ 7: 0] = 0;
    if (data_phy[31:24] !== data_wb[31:24])
    begin
      //`TIME;
      //$display("*E Wrong %0d. word (1 byte) of RX packet! phy = %h, wb = %h", ((i/4)+1), data_phy[31:24], data_wb[31:24]);
      failure = failure + 1;
    end
    if (plus_dribble_nibble && successful_dribble_nibble)
    begin
      if (data_phy[19:16] !== data_wb[19:16])
      begin
        //`TIME;
        //$display("*E Wrong dribble nibble in %0d. word (1 byte) of RX packet!", ((i/4)+1));
        failure = failure + 1;
      end
    end
    else if (plus_dribble_nibble && !successful_dribble_nibble)
    begin
      if (data_phy[19:16] === data_wb[19:16])
      begin
        //`TIME;
        //$display("*E Wrong dribble nibble in %0d. word (1 byte) of RX packet!", ((i/4)+1));
        failure = failure + 1;
      end
    end
  end
  else if((len - i) == 4)
  begin
    wb_slave.rd_mem(addr_wb[21:0] + i, data_wb, 4'hF);
    data_phy[31:24] = eth_phy0.rx_mem[addr_phy[21:0] + i];
    data_phy[23:16] = eth_phy0.rx_mem[addr_phy[21:0] + i + 1];
    data_phy[15: 8] = eth_phy0.rx_mem[addr_phy[21:0] + i + 2];
    data_phy[ 7: 0] = eth_phy0.rx_mem[addr_phy[21:0] + i + 3];
    if (data_phy[31:0] !== data_wb[31:0])
    begin
      //`TIME;
      //$display("*E Wrong %0d. word (4 bytes) of RX packet! phy = %h, wb = %h", ((i/4)+1), data_phy[31:0], data_wb[31:0]);
      failure = failure + 1;
    end
    if (plus_dribble_nibble)
    begin
      wb_slave.rd_mem(addr_wb[21:0] + i + 4, data_wb, 4'h8);
      data_phy[31:24] = eth_phy0.rx_mem[addr_phy[21:0] + i + 4];
      if (successful_dribble_nibble)
      begin
        if (data_phy[27:24] !== data_wb[27:24])
        begin
          //`TIME;
          //$display("*E Wrong dribble nibble in %0d. word (0 bytes) of RX packet!", ((i/4)+2));
          failure = failure + 1;
        end
      end
      else
      begin
        if (data_phy[27:24] === data_wb[27:24])
        begin
          //`TIME;
          //$display("*E Wrong dribble nibble in %0d. word (0 bytes) of RX packet!", ((i/4)+2));
          failure = failure + 1;
        end
      end
    end
  end
  else
    $display("(%0t)(%m) ERROR", $time);
  delta_t = !delta_t;
end
endtask // check_rx_packet
*/
   
//////////////////////////////////////////////////////////////
// Ethernet CRC Basic tasks
//////////////////////////////////////////////////////////////

task append_rx_crc;
  input  [31:0] rxpnt_phy; // source
  input  [15:0] len; // length in bytes without CRC
  input         plus_dribble_nibble; // if length is longer for one nibble
  input         negated_crc; // if appended CRC is correct or not
  reg    [31:0] crc;
  reg    [7:0]  tmp;
  reg    [31:0] addr_phy;
  reg           delta_t;
begin
  addr_phy = rxpnt_phy + len;
  delta_t = 0;
  // calculate CRC from prepared packet
  paralel_crc_phy_rx(rxpnt_phy, {16'h0, len}, plus_dribble_nibble, crc);
  if (negated_crc)
    crc = ~crc;
  delta_t = !delta_t;

  if (plus_dribble_nibble)
  begin
    tmp = eth_phy0.rx_mem[addr_phy];
    eth_phy0.rx_mem[addr_phy]     = {crc[27:24], tmp[3:0]};
    eth_phy0.rx_mem[addr_phy + 1] = {crc[19:16], crc[31:28]};
    eth_phy0.rx_mem[addr_phy + 2] = {crc[11:8], crc[23:20]};
    eth_phy0.rx_mem[addr_phy + 3] = {crc[3:0], crc[15:12]};
    eth_phy0.rx_mem[addr_phy + 4] = {4'h0, crc[7:4]};
  end
  else
  begin
    eth_phy0.rx_mem[addr_phy]     = crc[31:24];
    eth_phy0.rx_mem[addr_phy + 1] = crc[23:16];
    eth_phy0.rx_mem[addr_phy + 2] = crc[15:8];
    eth_phy0.rx_mem[addr_phy + 3] = crc[7:0];
  end
end
endtask // append_rx_crc

task append_rx_crc_delayed;
  input  [31:0] rxpnt_phy; // source
  input  [15:0] len; // length in bytes without CRC
  input         plus_dribble_nibble; // if length is longer for one nibble
  input         negated_crc; // if appended CRC is correct or not
  reg    [31:0] crc;
  reg    [7:0]  tmp;
  reg    [31:0] addr_phy;
  reg           delta_t;
begin
  addr_phy = rxpnt_phy + len;
  delta_t = 0;
  // calculate CRC from prepared packet
  paralel_crc_phy_rx(rxpnt_phy+4, {16'h0, len}-4, plus_dribble_nibble, crc);
  if (negated_crc)
    crc = ~crc;
  delta_t = !delta_t;

  if (plus_dribble_nibble)
  begin
    tmp = eth_phy0.rx_mem[addr_phy];
    eth_phy0.rx_mem[addr_phy]     = {crc[27:24], tmp[3:0]};
    eth_phy0.rx_mem[addr_phy + 1] = {crc[19:16], crc[31:28]};
    eth_phy0.rx_mem[addr_phy + 2] = {crc[11:8], crc[23:20]};
    eth_phy0.rx_mem[addr_phy + 3] = {crc[3:0], crc[15:12]};
    eth_phy0.rx_mem[addr_phy + 4] = {4'h0, crc[7:4]};
  end
  else
  begin
    eth_phy0.rx_mem[addr_phy]     = crc[31:24];
    eth_phy0.rx_mem[addr_phy + 1] = crc[23:16];
    eth_phy0.rx_mem[addr_phy + 2] = crc[15:8];
    eth_phy0.rx_mem[addr_phy + 3] = crc[7:0];
  end
end
endtask // append_rx_crc_delayed


// paralel CRC calculating for PHY RX
task paralel_crc_phy_rx;
  input  [31:0] start_addr; // start address
  input  [31:0] len; // length of frame in Bytes without CRC length
  input         plus_dribble_nibble; // if length is longer for one nibble
  output [31:0] crc_out;
  reg    [21:0] addr_cnt; // only 22 address lines
  integer       word_cnt;
  integer       nibble_cnt;
  reg    [31:0] load_reg;
  reg           delta_t;
  reg    [31:0] crc_next;
  reg    [31:0] crc;
  reg           crc_error;
  reg     [3:0] data_in;
  integer       i;
begin
  #1 addr_cnt = start_addr[21:0];
  word_cnt = 24; // 27; // start of the frame - nibble granularity (MSbit first)
  crc = 32'hFFFF_FFFF; // INITIAL value
  delta_t = 0;
  // length must include 4 bytes of ZEROs, to generate CRC
  // get number of nibbles from Byte length (2^1 = 2)
  if (plus_dribble_nibble)
    nibble_cnt = ((len + 4) << 1) + 1'b1; // one nibble longer
  else
    nibble_cnt = ((len + 4) << 1);
  // because of MAGIC NUMBER nibbles are swapped [3:0] -> [0:3]
  load_reg[31:24] = eth_phy0.rx_mem[addr_cnt];
  addr_cnt = addr_cnt + 1;
  load_reg[23:16] = eth_phy0.rx_mem[addr_cnt];
  addr_cnt = addr_cnt + 1;
  load_reg[15: 8] = eth_phy0.rx_mem[addr_cnt];
  addr_cnt = addr_cnt + 1;
  load_reg[ 7: 0] = eth_phy0.rx_mem[addr_cnt];
  addr_cnt = addr_cnt + 1;
  while (nibble_cnt > 0)
  begin
    // wait for delta time
    delta_t = !delta_t;
    // shift data in

    if(nibble_cnt <= 8) // for additional 8 nibbles shift ZEROs in!
      data_in[3:0] = 4'h0;
    else

      data_in[3:0] = {load_reg[word_cnt], load_reg[word_cnt+1], load_reg[word_cnt+2], load_reg[word_cnt+3]};
    crc_next[0]  = (data_in[0] ^ crc[28]);
    crc_next[1]  = (data_in[1] ^ data_in[0] ^ crc[28]    ^ crc[29]);
    crc_next[2]  = (data_in[2] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[30]);
    crc_next[3]  = (data_in[3] ^ data_in[2] ^ data_in[1] ^ crc[29]  ^ crc[30] ^ crc[31]);
    crc_next[4]  = (data_in[3] ^ data_in[2] ^ data_in[0] ^ crc[28]  ^ crc[30] ^ crc[31]) ^ crc[0];
    crc_next[5]  = (data_in[3] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[31]) ^ crc[1];
    crc_next[6]  = (data_in[2] ^ data_in[1] ^ crc[29]    ^ crc[30]) ^ crc[ 2];
    crc_next[7]  = (data_in[3] ^ data_in[2] ^ data_in[0] ^ crc[28]  ^ crc[30] ^ crc[31]) ^ crc[3];
    crc_next[8]  = (data_in[3] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[31]) ^ crc[4];
    crc_next[9]  = (data_in[2] ^ data_in[1] ^ crc[29]    ^ crc[30]) ^ crc[5];
    crc_next[10] = (data_in[3] ^ data_in[2] ^ data_in[0] ^ crc[28]  ^ crc[30] ^ crc[31]) ^ crc[6];
    crc_next[11] = (data_in[3] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[31]) ^ crc[7];
    crc_next[12] = (data_in[2] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[30]) ^ crc[8];
    crc_next[13] = (data_in[3] ^ data_in[2] ^ data_in[1] ^ crc[29]  ^ crc[30] ^ crc[31]) ^ crc[9];
    crc_next[14] = (data_in[3] ^ data_in[2] ^ crc[30]    ^ crc[31]) ^ crc[10];
    crc_next[15] = (data_in[3] ^ crc[31])   ^ crc[11];
    crc_next[16] = (data_in[0] ^ crc[28])   ^ crc[12];
    crc_next[17] = (data_in[1] ^ crc[29])   ^ crc[13];
    crc_next[18] = (data_in[2] ^ crc[30])   ^ crc[14];
    crc_next[19] = (data_in[3] ^ crc[31])   ^ crc[15];
    crc_next[20] =  crc[16];
    crc_next[21] =  crc[17];
    crc_next[22] = (data_in[0] ^ crc[28])   ^ crc[18];
    crc_next[23] = (data_in[1] ^ data_in[0] ^ crc[29]    ^ crc[28]) ^ crc[19];
    crc_next[24] = (data_in[2] ^ data_in[1] ^ crc[30]    ^ crc[29]) ^ crc[20];
    crc_next[25] = (data_in[3] ^ data_in[2] ^ crc[31]    ^ crc[30]) ^ crc[21];
    crc_next[26] = (data_in[3] ^ data_in[0] ^ crc[31]    ^ crc[28]) ^ crc[22];
    crc_next[27] = (data_in[1] ^ crc[29])   ^ crc[23];
    crc_next[28] = (data_in[2] ^ crc[30])   ^ crc[24];
    crc_next[29] = (data_in[3] ^ crc[31])   ^ crc[25];
    crc_next[30] =  crc[26];
    crc_next[31] =  crc[27];

    crc = crc_next;
    crc_error = crc[31:0] != 32'hc704dd7b;  // CRC not equal to magic number
    case (nibble_cnt)
    9: crc_out = {!crc[24], !crc[25], !crc[26], !crc[27], !crc[28], !crc[29], !crc[30], !crc[31],
                  !crc[16], !crc[17], !crc[18], !crc[19], !crc[20], !crc[21], !crc[22], !crc[23],
                  !crc[ 8], !crc[ 9], !crc[10], !crc[11], !crc[12], !crc[13], !crc[14], !crc[15],
                  !crc[ 0], !crc[ 1], !crc[ 2], !crc[ 3], !crc[ 4], !crc[ 5], !crc[ 6], !crc[ 7]};
    default: crc_out = crc_out;
    endcase
    // wait for delta time
    delta_t = !delta_t;
    // increment address and load new data
    if ((word_cnt+3) == 7)//4)
    begin
      // because of MAGIC NUMBER nibbles are swapped [3:0] -> [0:3]
      load_reg[31:24] = eth_phy0.rx_mem[addr_cnt];
      addr_cnt = addr_cnt + 1;
      load_reg[23:16] = eth_phy0.rx_mem[addr_cnt];
      addr_cnt = addr_cnt + 1;
      load_reg[15: 8] = eth_phy0.rx_mem[addr_cnt];
      addr_cnt = addr_cnt + 1;
      load_reg[ 7: 0] = eth_phy0.rx_mem[addr_cnt];
      addr_cnt = addr_cnt + 1;
    end
    // set new load bit position
    if((word_cnt+3) == 31)
      word_cnt = 16;
    else if ((word_cnt+3) == 23)
      word_cnt = 8;
    else if ((word_cnt+3) == 15)
      word_cnt = 0;
    else if ((word_cnt+3) == 7)
      word_cnt = 24;
    else
      word_cnt = word_cnt + 4;// - 4;
    // decrement nibble counter
    nibble_cnt = nibble_cnt - 1;
    // wait for delta time
    delta_t = !delta_t;
  end // while
  #1;
end
endtask // paralel_crc_phy_rx
   