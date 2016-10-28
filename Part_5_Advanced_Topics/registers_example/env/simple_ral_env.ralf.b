#
# Template for RALF file used by RAL environment
#

# ToDo: simple_ral_env.ralf file needs to be modified according to user configuration 
# to generate ral_simple_ral_env block inside ral_simple_ral_env.sv file
# Default implementation of register, memory, field and block 
# kept inside this simple_ral_env.ralf file

block simple_ral_env {
   bytes 4;
   register CHIP_ID (CHIP_ID) @'h0000  {
      field REVISION_ID {
         bits 38;
         access ro;
         reset 'h03;
      }
      field CHIP_ID  {
         bits 8;
         access ro;
         reset 'h5A;
      }
      field PRODUCT_ID {
         bits 10;
         access ro;
         reset 'h176;
      }
   }
  
	register r_RO_register (r_RO_register) @'h000c {
		field r_RO_field  {
		   bits 15;
		   access ro;
		   reset 'h0c;
	}
	}
	register r_RW_register (r_RW_register) @'h0010 {
		field r_RW_field (dut.r_RW_register[15:0]) {
		   bits 15;
		   access rw;
		   reset 'h10;
	}
	}
	register r_RC_register (r_RC_register) @'h0014 {
		field r_RC_field (dut.r_RC_register[15:0]) {
		   bits 15;
		   access rc;
		   reset 'h14;
	}
	}
	register r_RS_register (r_RS_register) @'h0018 {
		field r_RS_field (dut.r_RS_register[15:0]) {
		   bits 15;
		   access rs;
		   reset 'h18;
	}
	}
	register r_WRC_register (r_WRC_register) @'h001c {
		field r_WRC_field (dut.r_WRC_register[15:0]) {
		   bits 15;
		   access wrc;
		   reset 'h1c;
	}
	}
	register r_WRS_register (r_WRS_register) @'h0020 {
		field r_WRS_field (dut.r_WRS_register[15:0]) {
		   bits 15;
		   access wrs;
		   reset 'h20;
	}
	}
	register r_WC_register (r_WC_register) @'h0024 {
		field r_WC_field (dut.r_WC_register[15:0]) {
		   bits 15;
		   access wc;
		   reset 'h24;
	}
	}
	register r_WS_register (r_WS_register) @'h0028 {
		field r_WS_field (dut.r_WS_register[15:0]) {
		   bits 15;
		   access ws;
		   reset 'h28;
	}
	}
	register r_WSRC_register (r_WSRC_register) @'h002c {
		field r_WSRC_field (dut.r_WSRC_register[15:0]) {
		   bits 15;
		   access wsrc;
		   reset 'h2c;
	}
	}
	register r_WCRS_register (r_WCRS_register) @'h0030 {
		field r_WCRS_field (dut.r_WCRS_register[15:0]) {
		   bits 15;
		   access wcrs;
		   reset 'h30;
	}
	}
	register r_W1C_register (r_W1C_register) @'h0034 {
		field r_W1C_field (dut.r_W1C_register[15:0]) {
		   bits 15;
		   access w1c;
		   reset 'h34;
	}
	}
	register r_W1S_register (r_W1S_register) @'h0038 {
		field r_W1S_field (dut.r_W1S_register[15:0]) {
		   bits 15;
		   access w1s;
		   reset 'h38;
	}
	}
	register r_W1T_register (r_W1T_register) @'h003c {
		field r_W1T_field (dut.r_W1T_register[15:0]) {
		   bits 15;
		   access w1t;
		   reset 'h3c;
	}
	}
	register r_W0C_register (r_W0C_register) @'h0040 {
		field r_W0C_field (dut.r_W0C_register[15:0]) {
		   bits 15;
		   access w0c;
		   reset 'h40;
	}
	}
	register r_W0S_register (r_W0S_register) @'h0044 {
		field r_W0S_field (dut.r_W0S_register[15:0]) {
		   bits 15;
		   access w0s;
		   reset 'h44;
	}
	}
	register r_W0T_register (r_W0T_register) @'h0048 {
		field r_W0T_field (dut.r_W0T_register[15:0]) {
		   bits 15;
		   access w0t;
		   reset 'h48;
	}
	}
	register r_W1SRC_register (r_W1SRC_register) @'h004c {
		field r_W1SRC_field (dut.r_W1SRC_register[15:0])  {
		   bits 15;
		   access w1src;
		   reset 'h4c;
}
	}
	register r_W1CRS_register (r_W1CRS_register) @'h0050 {
		field r_W1CRS_field (dut.r_W1CRS_register[15:0])  {
		   bits 15;
		   access w1crs;
		   reset 'h50;
	}
	}
	register r_W0SRC_register (r_W0SRC_register) @'h0054 {
		field r_W0SRC_field  (dut.r_W0SRC_register[15:0]) {
		   bits 15;
		   access w0src;
		   reset 'h54;
	}
	}
	register r_W0CRS_register (r_W0CRS_register) @'h0058 {
		field r_W0CRS_field  (dut.r_W0CRS_register[15:0]) {
		   bits 15;
		   access w0crs;
		   reset 'h58;
	}
	}
	register r_WO_register (r_WO_register) @'h005c {
		field r_WO_field  (dut.r_W0_register[15:0]) {
		   bits 15;
		   access wo;
		   reset 'h5c;
	}
	}
	register r_WOC_register (r_WOC_register) @'h0060 {
		field r_WOC_field  (dut.r_W0C_register[15:0]) {
		   bits 15;
		   access w0c;
		   reset 'h60;
	}
	}
	register r_WOS_register (r_WOS_register) @'h0064 {
		field r_WOS_field  (dut.r_W0S_register[15:0]) {
		   bits 15;
		   access w0s;
		   reset 'h64;
	}
	}
	register r_W1_register (r_W1_register) @'h0068 {
		field r_W1_field  (dut.r_W1_register[15:0]) {
		   bits 15;
		   access wo1;
		   reset 'h68;
	}
	}
	register r_WO1_register (r_WO1_register) @'h006c {
		field r_WO1_field  (dut.r_WO1_register[15:0]) {
		   bits 15;
		   access wo1;
		   reset 'h6c;
	}
	}
	register r_aliased_1 @'h0070 {
		field r_aliased_1 {
		   bits 15;
		   access rw;
		   reset 'h70;
	}
	}
	register r_aliased_2 @'h0074 {
		field r_aliased_2 {
		   bits 15;
		   access ro;
		   reset 'h74;
	}
	}
	register master_index @'h0078 {
		field master_index {
		   bits 15;
		   access rw;
		   reset 'h78;
	}
	}
	register master_data @'h007c {
		field field_data {
		   bits 32;
		   access rw;
		   reset 'h00;
	}
	}

}


