`ifndef RAL_WB_DMA
`define RAL_WB_DMA

import uvm_pkg::*;

class ral_reg_CSR extends uvm_reg;
	rand uvm_reg_field PAUSE;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   PAUSE: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	endgroup
	function new(string name = "CSR");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.PAUSE = uvm_reg_field::type_id::create("PAUSE",,get_full_name());
      this.PAUSE.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_CSR)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CSR


class ral_reg_INT_MASKA extends uvm_reg;
	rand uvm_reg_field f_mask0;
	rand uvm_reg_field f_mask1;
	rand uvm_reg_field f_mask2;
	rand uvm_reg_field f_mask3;
	rand uvm_reg_field f_mask4;
	rand uvm_reg_field f_mask5;
	rand uvm_reg_field f_mask6;
	rand uvm_reg_field f_mask7;
	rand uvm_reg_field f_mask8;
	rand uvm_reg_field f_mask9;
	rand uvm_reg_field f_mask10;
	rand uvm_reg_field f_mask11;
	rand uvm_reg_field f_mask12;
	rand uvm_reg_field f_mask13;
	rand uvm_reg_field f_mask14;
	rand uvm_reg_field f_mask15;
	rand uvm_reg_field f_mask16;
	rand uvm_reg_field f_mask17;
	rand uvm_reg_field f_mask18;
	rand uvm_reg_field f_mask19;
	rand uvm_reg_field f_mask20;
	rand uvm_reg_field f_mask21;
	rand uvm_reg_field f_mask22;
	rand uvm_reg_field f_mask23;
	rand uvm_reg_field f_mask24;
	rand uvm_reg_field f_mask25;
	rand uvm_reg_field f_mask26;
	rand uvm_reg_field f_mask27;
	rand uvm_reg_field f_mask28;
	rand uvm_reg_field f_mask29;
	rand uvm_reg_field f_mask30;
	rand uvm_reg_field f_mask31;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   f_mask0: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask1: coverpoint {m_data[1:1], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask2: coverpoint {m_data[2:2], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask3: coverpoint {m_data[3:3], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask4: coverpoint {m_data[4:4], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask5: coverpoint {m_data[5:5], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask6: coverpoint {m_data[6:6], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask7: coverpoint {m_data[7:7], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask8: coverpoint {m_data[8:8], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask9: coverpoint {m_data[9:9], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask10: coverpoint {m_data[10:10], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask11: coverpoint {m_data[11:11], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask12: coverpoint {m_data[12:12], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask13: coverpoint {m_data[13:13], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask14: coverpoint {m_data[14:14], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask15: coverpoint {m_data[15:15], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask16: coverpoint {m_data[16:16], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask17: coverpoint {m_data[17:17], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask18: coverpoint {m_data[18:18], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask19: coverpoint {m_data[19:19], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask20: coverpoint {m_data[20:20], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask21: coverpoint {m_data[21:21], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask22: coverpoint {m_data[22:22], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask23: coverpoint {m_data[23:23], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask24: coverpoint {m_data[24:24], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask25: coverpoint {m_data[25:25], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask26: coverpoint {m_data[26:26], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask27: coverpoint {m_data[27:27], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask28: coverpoint {m_data[28:28], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask29: coverpoint {m_data[29:29], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask30: coverpoint {m_data[30:30], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask31: coverpoint {m_data[31:31], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	endgroup
	function new(string name = "INT_MASKA");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.f_mask0 = uvm_reg_field::type_id::create("f_mask0",,get_full_name());
      this.f_mask0.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask1 = uvm_reg_field::type_id::create("f_mask1",,get_full_name());
      this.f_mask1.configure(this, 1, 1, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask2 = uvm_reg_field::type_id::create("f_mask2",,get_full_name());
      this.f_mask2.configure(this, 1, 2, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask3 = uvm_reg_field::type_id::create("f_mask3",,get_full_name());
      this.f_mask3.configure(this, 1, 3, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask4 = uvm_reg_field::type_id::create("f_mask4",,get_full_name());
      this.f_mask4.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask5 = uvm_reg_field::type_id::create("f_mask5",,get_full_name());
      this.f_mask5.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask6 = uvm_reg_field::type_id::create("f_mask6",,get_full_name());
      this.f_mask6.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask7 = uvm_reg_field::type_id::create("f_mask7",,get_full_name());
      this.f_mask7.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask8 = uvm_reg_field::type_id::create("f_mask8",,get_full_name());
      this.f_mask8.configure(this, 1, 8, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask9 = uvm_reg_field::type_id::create("f_mask9",,get_full_name());
      this.f_mask9.configure(this, 1, 9, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask10 = uvm_reg_field::type_id::create("f_mask10",,get_full_name());
      this.f_mask10.configure(this, 1, 10, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask11 = uvm_reg_field::type_id::create("f_mask11",,get_full_name());
      this.f_mask11.configure(this, 1, 11, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask12 = uvm_reg_field::type_id::create("f_mask12",,get_full_name());
      this.f_mask12.configure(this, 1, 12, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask13 = uvm_reg_field::type_id::create("f_mask13",,get_full_name());
      this.f_mask13.configure(this, 1, 13, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask14 = uvm_reg_field::type_id::create("f_mask14",,get_full_name());
      this.f_mask14.configure(this, 1, 14, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask15 = uvm_reg_field::type_id::create("f_mask15",,get_full_name());
      this.f_mask15.configure(this, 1, 15, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask16 = uvm_reg_field::type_id::create("f_mask16",,get_full_name());
      this.f_mask16.configure(this, 1, 16, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask17 = uvm_reg_field::type_id::create("f_mask17",,get_full_name());
      this.f_mask17.configure(this, 1, 17, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask18 = uvm_reg_field::type_id::create("f_mask18",,get_full_name());
      this.f_mask18.configure(this, 1, 18, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask19 = uvm_reg_field::type_id::create("f_mask19",,get_full_name());
      this.f_mask19.configure(this, 1, 19, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask20 = uvm_reg_field::type_id::create("f_mask20",,get_full_name());
      this.f_mask20.configure(this, 1, 20, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask21 = uvm_reg_field::type_id::create("f_mask21",,get_full_name());
      this.f_mask21.configure(this, 1, 21, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask22 = uvm_reg_field::type_id::create("f_mask22",,get_full_name());
      this.f_mask22.configure(this, 1, 22, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask23 = uvm_reg_field::type_id::create("f_mask23",,get_full_name());
      this.f_mask23.configure(this, 1, 23, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask24 = uvm_reg_field::type_id::create("f_mask24",,get_full_name());
      this.f_mask24.configure(this, 1, 24, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask25 = uvm_reg_field::type_id::create("f_mask25",,get_full_name());
      this.f_mask25.configure(this, 1, 25, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask26 = uvm_reg_field::type_id::create("f_mask26",,get_full_name());
      this.f_mask26.configure(this, 1, 26, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask27 = uvm_reg_field::type_id::create("f_mask27",,get_full_name());
      this.f_mask27.configure(this, 1, 27, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask28 = uvm_reg_field::type_id::create("f_mask28",,get_full_name());
      this.f_mask28.configure(this, 1, 28, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask29 = uvm_reg_field::type_id::create("f_mask29",,get_full_name());
      this.f_mask29.configure(this, 1, 29, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask30 = uvm_reg_field::type_id::create("f_mask30",,get_full_name());
      this.f_mask30.configure(this, 1, 30, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask31 = uvm_reg_field::type_id::create("f_mask31",,get_full_name());
      this.f_mask31.configure(this, 1, 31, "RW", 0, 1'h0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_INT_MASKA)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_INT_MASKA


class ral_reg_INT_MASKB extends uvm_reg;
	rand uvm_reg_field f_mask0;
	rand uvm_reg_field f_mask1;
	rand uvm_reg_field f_mask2;
	rand uvm_reg_field f_mask3;
	rand uvm_reg_field f_mask4;
	rand uvm_reg_field f_mask5;
	rand uvm_reg_field f_mask6;
	rand uvm_reg_field f_mask7;
	rand uvm_reg_field f_mask8;
	rand uvm_reg_field f_mask9;
	rand uvm_reg_field f_mask10;
	rand uvm_reg_field f_mask11;
	rand uvm_reg_field f_mask12;
	rand uvm_reg_field f_mask13;
	rand uvm_reg_field f_mask14;
	rand uvm_reg_field f_mask15;
	rand uvm_reg_field f_mask16;
	rand uvm_reg_field f_mask17;
	rand uvm_reg_field f_mask18;
	rand uvm_reg_field f_mask19;
	rand uvm_reg_field f_mask20;
	rand uvm_reg_field f_mask21;
	rand uvm_reg_field f_mask22;
	rand uvm_reg_field f_mask23;
	rand uvm_reg_field f_mask24;
	rand uvm_reg_field f_mask25;
	rand uvm_reg_field f_mask26;
	rand uvm_reg_field f_mask27;
	rand uvm_reg_field f_mask28;
	rand uvm_reg_field f_mask29;
	rand uvm_reg_field f_mask30;
	rand uvm_reg_field f_mask31;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   f_mask0: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask1: coverpoint {m_data[1:1], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask2: coverpoint {m_data[2:2], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask3: coverpoint {m_data[3:3], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask4: coverpoint {m_data[4:4], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask5: coverpoint {m_data[5:5], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask6: coverpoint {m_data[6:6], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask7: coverpoint {m_data[7:7], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask8: coverpoint {m_data[8:8], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask9: coverpoint {m_data[9:9], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask10: coverpoint {m_data[10:10], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask11: coverpoint {m_data[11:11], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask12: coverpoint {m_data[12:12], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask13: coverpoint {m_data[13:13], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask14: coverpoint {m_data[14:14], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask15: coverpoint {m_data[15:15], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask16: coverpoint {m_data[16:16], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask17: coverpoint {m_data[17:17], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask18: coverpoint {m_data[18:18], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask19: coverpoint {m_data[19:19], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask20: coverpoint {m_data[20:20], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask21: coverpoint {m_data[21:21], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask22: coverpoint {m_data[22:22], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask23: coverpoint {m_data[23:23], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask24: coverpoint {m_data[24:24], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask25: coverpoint {m_data[25:25], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask26: coverpoint {m_data[26:26], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask27: coverpoint {m_data[27:27], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask28: coverpoint {m_data[28:28], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask29: coverpoint {m_data[29:29], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask30: coverpoint {m_data[30:30], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask31: coverpoint {m_data[31:31], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	endgroup
	function new(string name = "INT_MASKB");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.f_mask0 = uvm_reg_field::type_id::create("f_mask0",,get_full_name());
      this.f_mask0.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask1 = uvm_reg_field::type_id::create("f_mask1",,get_full_name());
      this.f_mask1.configure(this, 1, 1, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask2 = uvm_reg_field::type_id::create("f_mask2",,get_full_name());
      this.f_mask2.configure(this, 1, 2, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask3 = uvm_reg_field::type_id::create("f_mask3",,get_full_name());
      this.f_mask3.configure(this, 1, 3, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask4 = uvm_reg_field::type_id::create("f_mask4",,get_full_name());
      this.f_mask4.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask5 = uvm_reg_field::type_id::create("f_mask5",,get_full_name());
      this.f_mask5.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask6 = uvm_reg_field::type_id::create("f_mask6",,get_full_name());
      this.f_mask6.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask7 = uvm_reg_field::type_id::create("f_mask7",,get_full_name());
      this.f_mask7.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask8 = uvm_reg_field::type_id::create("f_mask8",,get_full_name());
      this.f_mask8.configure(this, 1, 8, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask9 = uvm_reg_field::type_id::create("f_mask9",,get_full_name());
      this.f_mask9.configure(this, 1, 9, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask10 = uvm_reg_field::type_id::create("f_mask10",,get_full_name());
      this.f_mask10.configure(this, 1, 10, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask11 = uvm_reg_field::type_id::create("f_mask11",,get_full_name());
      this.f_mask11.configure(this, 1, 11, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask12 = uvm_reg_field::type_id::create("f_mask12",,get_full_name());
      this.f_mask12.configure(this, 1, 12, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask13 = uvm_reg_field::type_id::create("f_mask13",,get_full_name());
      this.f_mask13.configure(this, 1, 13, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask14 = uvm_reg_field::type_id::create("f_mask14",,get_full_name());
      this.f_mask14.configure(this, 1, 14, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask15 = uvm_reg_field::type_id::create("f_mask15",,get_full_name());
      this.f_mask15.configure(this, 1, 15, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask16 = uvm_reg_field::type_id::create("f_mask16",,get_full_name());
      this.f_mask16.configure(this, 1, 16, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask17 = uvm_reg_field::type_id::create("f_mask17",,get_full_name());
      this.f_mask17.configure(this, 1, 17, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask18 = uvm_reg_field::type_id::create("f_mask18",,get_full_name());
      this.f_mask18.configure(this, 1, 18, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask19 = uvm_reg_field::type_id::create("f_mask19",,get_full_name());
      this.f_mask19.configure(this, 1, 19, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask20 = uvm_reg_field::type_id::create("f_mask20",,get_full_name());
      this.f_mask20.configure(this, 1, 20, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask21 = uvm_reg_field::type_id::create("f_mask21",,get_full_name());
      this.f_mask21.configure(this, 1, 21, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask22 = uvm_reg_field::type_id::create("f_mask22",,get_full_name());
      this.f_mask22.configure(this, 1, 22, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask23 = uvm_reg_field::type_id::create("f_mask23",,get_full_name());
      this.f_mask23.configure(this, 1, 23, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask24 = uvm_reg_field::type_id::create("f_mask24",,get_full_name());
      this.f_mask24.configure(this, 1, 24, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask25 = uvm_reg_field::type_id::create("f_mask25",,get_full_name());
      this.f_mask25.configure(this, 1, 25, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask26 = uvm_reg_field::type_id::create("f_mask26",,get_full_name());
      this.f_mask26.configure(this, 1, 26, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask27 = uvm_reg_field::type_id::create("f_mask27",,get_full_name());
      this.f_mask27.configure(this, 1, 27, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask28 = uvm_reg_field::type_id::create("f_mask28",,get_full_name());
      this.f_mask28.configure(this, 1, 28, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask29 = uvm_reg_field::type_id::create("f_mask29",,get_full_name());
      this.f_mask29.configure(this, 1, 29, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask30 = uvm_reg_field::type_id::create("f_mask30",,get_full_name());
      this.f_mask30.configure(this, 1, 30, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask31 = uvm_reg_field::type_id::create("f_mask31",,get_full_name());
      this.f_mask31.configure(this, 1, 31, "RW", 0, 1'h0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_INT_MASKB)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_INT_MASKB


class ral_reg_INT_SRCA extends uvm_reg;
	rand uvm_reg_field f_mask0;
	rand uvm_reg_field f_mask1;
	rand uvm_reg_field f_mask2;
	rand uvm_reg_field f_mask3;
	rand uvm_reg_field f_mask4;
	rand uvm_reg_field f_mask5;
	rand uvm_reg_field f_mask6;
	rand uvm_reg_field f_mask7;
	rand uvm_reg_field f_mask8;
	rand uvm_reg_field f_mask9;
	rand uvm_reg_field f_mask10;
	rand uvm_reg_field f_mask11;
	rand uvm_reg_field f_mask12;
	rand uvm_reg_field f_mask13;
	rand uvm_reg_field f_mask14;
	rand uvm_reg_field f_mask15;
	rand uvm_reg_field f_mask16;
	rand uvm_reg_field f_mask17;
	rand uvm_reg_field f_mask18;
	rand uvm_reg_field f_mask19;
	rand uvm_reg_field f_mask20;
	rand uvm_reg_field f_mask21;
	rand uvm_reg_field f_mask22;
	rand uvm_reg_field f_mask23;
	rand uvm_reg_field f_mask24;
	rand uvm_reg_field f_mask25;
	rand uvm_reg_field f_mask26;
	rand uvm_reg_field f_mask27;
	rand uvm_reg_field f_mask28;
	rand uvm_reg_field f_mask29;
	rand uvm_reg_field f_mask30;
	rand uvm_reg_field f_mask31;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   f_mask0: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask1: coverpoint {m_data[1:1], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask2: coverpoint {m_data[2:2], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask3: coverpoint {m_data[3:3], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask4: coverpoint {m_data[4:4], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask5: coverpoint {m_data[5:5], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask6: coverpoint {m_data[6:6], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask7: coverpoint {m_data[7:7], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask8: coverpoint {m_data[8:8], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask9: coverpoint {m_data[9:9], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask10: coverpoint {m_data[10:10], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask11: coverpoint {m_data[11:11], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask12: coverpoint {m_data[12:12], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask13: coverpoint {m_data[13:13], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask14: coverpoint {m_data[14:14], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask15: coverpoint {m_data[15:15], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask16: coverpoint {m_data[16:16], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask17: coverpoint {m_data[17:17], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask18: coverpoint {m_data[18:18], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask19: coverpoint {m_data[19:19], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask20: coverpoint {m_data[20:20], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask21: coverpoint {m_data[21:21], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask22: coverpoint {m_data[22:22], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask23: coverpoint {m_data[23:23], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask24: coverpoint {m_data[24:24], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask25: coverpoint {m_data[25:25], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask26: coverpoint {m_data[26:26], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask27: coverpoint {m_data[27:27], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask28: coverpoint {m_data[28:28], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask29: coverpoint {m_data[29:29], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask30: coverpoint {m_data[30:30], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask31: coverpoint {m_data[31:31], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	endgroup
	function new(string name = "INT_SRCA");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.f_mask0 = uvm_reg_field::type_id::create("f_mask0",,get_full_name());
      this.f_mask0.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask1 = uvm_reg_field::type_id::create("f_mask1",,get_full_name());
      this.f_mask1.configure(this, 1, 1, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask2 = uvm_reg_field::type_id::create("f_mask2",,get_full_name());
      this.f_mask2.configure(this, 1, 2, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask3 = uvm_reg_field::type_id::create("f_mask3",,get_full_name());
      this.f_mask3.configure(this, 1, 3, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask4 = uvm_reg_field::type_id::create("f_mask4",,get_full_name());
      this.f_mask4.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask5 = uvm_reg_field::type_id::create("f_mask5",,get_full_name());
      this.f_mask5.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask6 = uvm_reg_field::type_id::create("f_mask6",,get_full_name());
      this.f_mask6.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask7 = uvm_reg_field::type_id::create("f_mask7",,get_full_name());
      this.f_mask7.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask8 = uvm_reg_field::type_id::create("f_mask8",,get_full_name());
      this.f_mask8.configure(this, 1, 8, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask9 = uvm_reg_field::type_id::create("f_mask9",,get_full_name());
      this.f_mask9.configure(this, 1, 9, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask10 = uvm_reg_field::type_id::create("f_mask10",,get_full_name());
      this.f_mask10.configure(this, 1, 10, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask11 = uvm_reg_field::type_id::create("f_mask11",,get_full_name());
      this.f_mask11.configure(this, 1, 11, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask12 = uvm_reg_field::type_id::create("f_mask12",,get_full_name());
      this.f_mask12.configure(this, 1, 12, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask13 = uvm_reg_field::type_id::create("f_mask13",,get_full_name());
      this.f_mask13.configure(this, 1, 13, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask14 = uvm_reg_field::type_id::create("f_mask14",,get_full_name());
      this.f_mask14.configure(this, 1, 14, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask15 = uvm_reg_field::type_id::create("f_mask15",,get_full_name());
      this.f_mask15.configure(this, 1, 15, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask16 = uvm_reg_field::type_id::create("f_mask16",,get_full_name());
      this.f_mask16.configure(this, 1, 16, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask17 = uvm_reg_field::type_id::create("f_mask17",,get_full_name());
      this.f_mask17.configure(this, 1, 17, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask18 = uvm_reg_field::type_id::create("f_mask18",,get_full_name());
      this.f_mask18.configure(this, 1, 18, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask19 = uvm_reg_field::type_id::create("f_mask19",,get_full_name());
      this.f_mask19.configure(this, 1, 19, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask20 = uvm_reg_field::type_id::create("f_mask20",,get_full_name());
      this.f_mask20.configure(this, 1, 20, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask21 = uvm_reg_field::type_id::create("f_mask21",,get_full_name());
      this.f_mask21.configure(this, 1, 21, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask22 = uvm_reg_field::type_id::create("f_mask22",,get_full_name());
      this.f_mask22.configure(this, 1, 22, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask23 = uvm_reg_field::type_id::create("f_mask23",,get_full_name());
      this.f_mask23.configure(this, 1, 23, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask24 = uvm_reg_field::type_id::create("f_mask24",,get_full_name());
      this.f_mask24.configure(this, 1, 24, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask25 = uvm_reg_field::type_id::create("f_mask25",,get_full_name());
      this.f_mask25.configure(this, 1, 25, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask26 = uvm_reg_field::type_id::create("f_mask26",,get_full_name());
      this.f_mask26.configure(this, 1, 26, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask27 = uvm_reg_field::type_id::create("f_mask27",,get_full_name());
      this.f_mask27.configure(this, 1, 27, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask28 = uvm_reg_field::type_id::create("f_mask28",,get_full_name());
      this.f_mask28.configure(this, 1, 28, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask29 = uvm_reg_field::type_id::create("f_mask29",,get_full_name());
      this.f_mask29.configure(this, 1, 29, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask30 = uvm_reg_field::type_id::create("f_mask30",,get_full_name());
      this.f_mask30.configure(this, 1, 30, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask31 = uvm_reg_field::type_id::create("f_mask31",,get_full_name());
      this.f_mask31.configure(this, 1, 31, "RW", 0, 1'h0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_INT_SRCA)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_INT_SRCA


class ral_reg_INT_SRCB extends uvm_reg;
	rand uvm_reg_field f_mask0;
	rand uvm_reg_field f_mask1;
	rand uvm_reg_field f_mask2;
	rand uvm_reg_field f_mask3;
	rand uvm_reg_field f_mask4;
	rand uvm_reg_field f_mask5;
	rand uvm_reg_field f_mask6;
	rand uvm_reg_field f_mask7;
	rand uvm_reg_field f_mask8;
	rand uvm_reg_field f_mask9;
	rand uvm_reg_field f_mask10;
	rand uvm_reg_field f_mask11;
	rand uvm_reg_field f_mask12;
	rand uvm_reg_field f_mask13;
	rand uvm_reg_field f_mask14;
	rand uvm_reg_field f_mask15;
	rand uvm_reg_field f_mask16;
	rand uvm_reg_field f_mask17;
	rand uvm_reg_field f_mask18;
	rand uvm_reg_field f_mask19;
	rand uvm_reg_field f_mask20;
	rand uvm_reg_field f_mask21;
	rand uvm_reg_field f_mask22;
	rand uvm_reg_field f_mask23;
	rand uvm_reg_field f_mask24;
	rand uvm_reg_field f_mask25;
	rand uvm_reg_field f_mask26;
	rand uvm_reg_field f_mask27;
	rand uvm_reg_field f_mask28;
	rand uvm_reg_field f_mask29;
	rand uvm_reg_field f_mask30;
	rand uvm_reg_field f_mask31;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   f_mask0: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask1: coverpoint {m_data[1:1], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask2: coverpoint {m_data[2:2], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask3: coverpoint {m_data[3:3], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask4: coverpoint {m_data[4:4], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask5: coverpoint {m_data[5:5], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask6: coverpoint {m_data[6:6], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask7: coverpoint {m_data[7:7], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask8: coverpoint {m_data[8:8], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask9: coverpoint {m_data[9:9], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask10: coverpoint {m_data[10:10], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask11: coverpoint {m_data[11:11], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask12: coverpoint {m_data[12:12], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask13: coverpoint {m_data[13:13], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask14: coverpoint {m_data[14:14], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask15: coverpoint {m_data[15:15], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask16: coverpoint {m_data[16:16], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask17: coverpoint {m_data[17:17], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask18: coverpoint {m_data[18:18], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask19: coverpoint {m_data[19:19], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask20: coverpoint {m_data[20:20], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask21: coverpoint {m_data[21:21], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask22: coverpoint {m_data[22:22], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask23: coverpoint {m_data[23:23], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask24: coverpoint {m_data[24:24], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask25: coverpoint {m_data[25:25], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask26: coverpoint {m_data[26:26], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask27: coverpoint {m_data[27:27], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask28: coverpoint {m_data[28:28], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask29: coverpoint {m_data[29:29], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask30: coverpoint {m_data[30:30], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   f_mask31: coverpoint {m_data[31:31], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	endgroup
	function new(string name = "INT_SRCB");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.f_mask0 = uvm_reg_field::type_id::create("f_mask0",,get_full_name());
      this.f_mask0.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask1 = uvm_reg_field::type_id::create("f_mask1",,get_full_name());
      this.f_mask1.configure(this, 1, 1, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask2 = uvm_reg_field::type_id::create("f_mask2",,get_full_name());
      this.f_mask2.configure(this, 1, 2, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask3 = uvm_reg_field::type_id::create("f_mask3",,get_full_name());
      this.f_mask3.configure(this, 1, 3, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask4 = uvm_reg_field::type_id::create("f_mask4",,get_full_name());
      this.f_mask4.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask5 = uvm_reg_field::type_id::create("f_mask5",,get_full_name());
      this.f_mask5.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask6 = uvm_reg_field::type_id::create("f_mask6",,get_full_name());
      this.f_mask6.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask7 = uvm_reg_field::type_id::create("f_mask7",,get_full_name());
      this.f_mask7.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask8 = uvm_reg_field::type_id::create("f_mask8",,get_full_name());
      this.f_mask8.configure(this, 1, 8, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask9 = uvm_reg_field::type_id::create("f_mask9",,get_full_name());
      this.f_mask9.configure(this, 1, 9, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask10 = uvm_reg_field::type_id::create("f_mask10",,get_full_name());
      this.f_mask10.configure(this, 1, 10, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask11 = uvm_reg_field::type_id::create("f_mask11",,get_full_name());
      this.f_mask11.configure(this, 1, 11, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask12 = uvm_reg_field::type_id::create("f_mask12",,get_full_name());
      this.f_mask12.configure(this, 1, 12, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask13 = uvm_reg_field::type_id::create("f_mask13",,get_full_name());
      this.f_mask13.configure(this, 1, 13, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask14 = uvm_reg_field::type_id::create("f_mask14",,get_full_name());
      this.f_mask14.configure(this, 1, 14, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask15 = uvm_reg_field::type_id::create("f_mask15",,get_full_name());
      this.f_mask15.configure(this, 1, 15, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask16 = uvm_reg_field::type_id::create("f_mask16",,get_full_name());
      this.f_mask16.configure(this, 1, 16, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask17 = uvm_reg_field::type_id::create("f_mask17",,get_full_name());
      this.f_mask17.configure(this, 1, 17, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask18 = uvm_reg_field::type_id::create("f_mask18",,get_full_name());
      this.f_mask18.configure(this, 1, 18, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask19 = uvm_reg_field::type_id::create("f_mask19",,get_full_name());
      this.f_mask19.configure(this, 1, 19, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask20 = uvm_reg_field::type_id::create("f_mask20",,get_full_name());
      this.f_mask20.configure(this, 1, 20, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask21 = uvm_reg_field::type_id::create("f_mask21",,get_full_name());
      this.f_mask21.configure(this, 1, 21, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask22 = uvm_reg_field::type_id::create("f_mask22",,get_full_name());
      this.f_mask22.configure(this, 1, 22, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask23 = uvm_reg_field::type_id::create("f_mask23",,get_full_name());
      this.f_mask23.configure(this, 1, 23, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask24 = uvm_reg_field::type_id::create("f_mask24",,get_full_name());
      this.f_mask24.configure(this, 1, 24, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask25 = uvm_reg_field::type_id::create("f_mask25",,get_full_name());
      this.f_mask25.configure(this, 1, 25, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask26 = uvm_reg_field::type_id::create("f_mask26",,get_full_name());
      this.f_mask26.configure(this, 1, 26, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask27 = uvm_reg_field::type_id::create("f_mask27",,get_full_name());
      this.f_mask27.configure(this, 1, 27, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask28 = uvm_reg_field::type_id::create("f_mask28",,get_full_name());
      this.f_mask28.configure(this, 1, 28, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask29 = uvm_reg_field::type_id::create("f_mask29",,get_full_name());
      this.f_mask29.configure(this, 1, 29, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask30 = uvm_reg_field::type_id::create("f_mask30",,get_full_name());
      this.f_mask30.configure(this, 1, 30, "RW", 0, 1'h0, 1, 0, 0);
      this.f_mask31 = uvm_reg_field::type_id::create("f_mask31",,get_full_name());
      this.f_mask31.configure(this, 1, 31, "RW", 0, 1'h0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_INT_SRCB)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_INT_SRCB


class ral_reg_CH0_CSR extends uvm_reg;
	rand uvm_reg_field CH_EN;
	rand uvm_reg_field DST_SEL;
	rand uvm_reg_field SRC_SEL;
	rand uvm_reg_field INC_DST;
	rand uvm_reg_field INC_SRC;
	rand uvm_reg_field MODE;
	rand uvm_reg_field ARS;
	rand uvm_reg_field USE_ED;
	rand uvm_reg_field SZ_WB;
	rand uvm_reg_field STOP;
	uvm_reg_field BUSY;
	uvm_reg_field DONE;
	rand uvm_reg_field ERR;
	rand uvm_reg_field PARITY;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   CH_EN: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   DST_SEL: coverpoint {m_data[1:1], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   SRC_SEL: coverpoint {m_data[2:2], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   INC_DST: coverpoint {m_data[3:3], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   INC_SRC: coverpoint {m_data[4:4], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   MODE: coverpoint {m_data[5:5], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   ARS: coverpoint {m_data[6:6], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   USE_ED: coverpoint {m_data[7:7], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   SZ_WB: coverpoint {m_data[8:8], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   STOP: coverpoint {m_data[9:9], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      option.weight = 2;
	   }
	   BUSY: coverpoint {m_data[10:10], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd = {2'b?1};
	      option.weight = 3;
	   }
	   DONE: coverpoint {m_data[11:11], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd = {2'b?1};
	      option.weight = 3;
	   }
	   ERR: coverpoint {m_data[12:12], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   PARITY: coverpoint {m_data[15:13], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {4'b??00};
	      wildcard bins bit_0_wr_as_1 = {4'b??10};
	      wildcard bins bit_0_rd_as_0 = {4'b??01};
	      wildcard bins bit_0_rd_as_1 = {4'b??11};
	      wildcard bins bit_1_wr_as_0 = {4'b?0?0};
	      wildcard bins bit_1_wr_as_1 = {4'b?1?0};
	      wildcard bins bit_1_rd_as_0 = {4'b?0?1};
	      wildcard bins bit_1_rd_as_1 = {4'b?1?1};
	      wildcard bins bit_2_wr_as_0 = {4'b0??0};
	      wildcard bins bit_2_wr_as_1 = {4'b1??0};
	      wildcard bins bit_2_rd_as_0 = {4'b0??1};
	      wildcard bins bit_2_rd_as_1 = {4'b1??1};
	      option.weight = 12;
	   }
	endgroup
	function new(string name = "CH0_CSR");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.CH_EN = uvm_reg_field::type_id::create("CH_EN",,get_full_name());
      this.CH_EN.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.DST_SEL = uvm_reg_field::type_id::create("DST_SEL",,get_full_name());
      this.DST_SEL.configure(this, 1, 1, "RW", 0, 1'h0, 1, 0, 0);
      this.SRC_SEL = uvm_reg_field::type_id::create("SRC_SEL",,get_full_name());
      this.SRC_SEL.configure(this, 1, 2, "RW", 0, 1'h0, 1, 0, 0);
      this.INC_DST = uvm_reg_field::type_id::create("INC_DST",,get_full_name());
      this.INC_DST.configure(this, 1, 3, "RW", 0, 1'h0, 1, 0, 0);
      this.INC_SRC = uvm_reg_field::type_id::create("INC_SRC",,get_full_name());
      this.INC_SRC.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.MODE = uvm_reg_field::type_id::create("MODE",,get_full_name());
      this.MODE.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.ARS = uvm_reg_field::type_id::create("ARS",,get_full_name());
      this.ARS.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
      this.USE_ED = uvm_reg_field::type_id::create("USE_ED",,get_full_name());
      this.USE_ED.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
      this.SZ_WB = uvm_reg_field::type_id::create("SZ_WB",,get_full_name());
      this.SZ_WB.configure(this, 1, 8, "RW", 0, 1'h0, 1, 0, 0);
      this.STOP = uvm_reg_field::type_id::create("STOP",,get_full_name());
      this.STOP.configure(this, 1, 9, "WO", 0, 1'h0, 1, 0, 0);
      this.BUSY = uvm_reg_field::type_id::create("BUSY",,get_full_name());
      this.BUSY.configure(this, 1, 10, "RO", 0, 1'h0, 1, 0, 0);
      this.DONE = uvm_reg_field::type_id::create("DONE",,get_full_name());
      this.DONE.configure(this, 1, 11, "RO", 0, 1'h0, 1, 0, 0);
      this.ERR = uvm_reg_field::type_id::create("ERR",,get_full_name());
      this.ERR.configure(this, 1, 12, "RC", 0, 1'h0, 1, 0, 0);
      this.PARITY = uvm_reg_field::type_id::create("PARITY",,get_full_name());
      this.PARITY.configure(this, 3, 13, "RW", 0, 3'h0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_CH0_CSR)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CH0_CSR


class ral_reg_CHN_SZ extends uvm_reg;
	rand uvm_reg_field CHK_SZ;
	rand uvm_reg_field TOT_SZ;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   CHK_SZ: coverpoint {m_data[27:16], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {13'b???????????00};
	      wildcard bins bit_0_wr_as_1 = {13'b???????????10};
	      wildcard bins bit_0_rd_as_0 = {13'b???????????01};
	      wildcard bins bit_0_rd_as_1 = {13'b???????????11};
	      wildcard bins bit_1_wr_as_0 = {13'b??????????0?0};
	      wildcard bins bit_1_wr_as_1 = {13'b??????????1?0};
	      wildcard bins bit_1_rd_as_0 = {13'b??????????0?1};
	      wildcard bins bit_1_rd_as_1 = {13'b??????????1?1};
	      wildcard bins bit_2_wr_as_0 = {13'b?????????0??0};
	      wildcard bins bit_2_wr_as_1 = {13'b?????????1??0};
	      wildcard bins bit_2_rd_as_0 = {13'b?????????0??1};
	      wildcard bins bit_2_rd_as_1 = {13'b?????????1??1};
	      wildcard bins bit_3_wr_as_0 = {13'b????????0???0};
	      wildcard bins bit_3_wr_as_1 = {13'b????????1???0};
	      wildcard bins bit_3_rd_as_0 = {13'b????????0???1};
	      wildcard bins bit_3_rd_as_1 = {13'b????????1???1};
	      wildcard bins bit_4_wr_as_0 = {13'b???????0????0};
	      wildcard bins bit_4_wr_as_1 = {13'b???????1????0};
	      wildcard bins bit_4_rd_as_0 = {13'b???????0????1};
	      wildcard bins bit_4_rd_as_1 = {13'b???????1????1};
	      wildcard bins bit_5_wr_as_0 = {13'b??????0?????0};
	      wildcard bins bit_5_wr_as_1 = {13'b??????1?????0};
	      wildcard bins bit_5_rd_as_0 = {13'b??????0?????1};
	      wildcard bins bit_5_rd_as_1 = {13'b??????1?????1};
	      wildcard bins bit_6_wr_as_0 = {13'b?????0??????0};
	      wildcard bins bit_6_wr_as_1 = {13'b?????1??????0};
	      wildcard bins bit_6_rd_as_0 = {13'b?????0??????1};
	      wildcard bins bit_6_rd_as_1 = {13'b?????1??????1};
	      wildcard bins bit_7_wr_as_0 = {13'b????0???????0};
	      wildcard bins bit_7_wr_as_1 = {13'b????1???????0};
	      wildcard bins bit_7_rd_as_0 = {13'b????0???????1};
	      wildcard bins bit_7_rd_as_1 = {13'b????1???????1};
	      wildcard bins bit_8_wr_as_0 = {13'b???0????????0};
	      wildcard bins bit_8_wr_as_1 = {13'b???1????????0};
	      wildcard bins bit_8_rd_as_0 = {13'b???0????????1};
	      wildcard bins bit_8_rd_as_1 = {13'b???1????????1};
	      wildcard bins bit_9_wr_as_0 = {13'b??0?????????0};
	      wildcard bins bit_9_wr_as_1 = {13'b??1?????????0};
	      wildcard bins bit_9_rd_as_0 = {13'b??0?????????1};
	      wildcard bins bit_9_rd_as_1 = {13'b??1?????????1};
	      wildcard bins bit_10_wr_as_0 = {13'b?0??????????0};
	      wildcard bins bit_10_wr_as_1 = {13'b?1??????????0};
	      wildcard bins bit_10_rd_as_0 = {13'b?0??????????1};
	      wildcard bins bit_10_rd_as_1 = {13'b?1??????????1};
	      wildcard bins bit_11_wr_as_0 = {13'b0???????????0};
	      wildcard bins bit_11_wr_as_1 = {13'b1???????????0};
	      wildcard bins bit_11_rd_as_0 = {13'b0???????????1};
	      wildcard bins bit_11_rd_as_1 = {13'b1???????????1};
	      option.weight = 48;
	   }
	   TOT_SZ: coverpoint {m_data[11:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {13'b???????????00};
	      wildcard bins bit_0_wr_as_1 = {13'b???????????10};
	      wildcard bins bit_0_rd_as_0 = {13'b???????????01};
	      wildcard bins bit_0_rd_as_1 = {13'b???????????11};
	      wildcard bins bit_1_wr_as_0 = {13'b??????????0?0};
	      wildcard bins bit_1_wr_as_1 = {13'b??????????1?0};
	      wildcard bins bit_1_rd_as_0 = {13'b??????????0?1};
	      wildcard bins bit_1_rd_as_1 = {13'b??????????1?1};
	      wildcard bins bit_2_wr_as_0 = {13'b?????????0??0};
	      wildcard bins bit_2_wr_as_1 = {13'b?????????1??0};
	      wildcard bins bit_2_rd_as_0 = {13'b?????????0??1};
	      wildcard bins bit_2_rd_as_1 = {13'b?????????1??1};
	      wildcard bins bit_3_wr_as_0 = {13'b????????0???0};
	      wildcard bins bit_3_wr_as_1 = {13'b????????1???0};
	      wildcard bins bit_3_rd_as_0 = {13'b????????0???1};
	      wildcard bins bit_3_rd_as_1 = {13'b????????1???1};
	      wildcard bins bit_4_wr_as_0 = {13'b???????0????0};
	      wildcard bins bit_4_wr_as_1 = {13'b???????1????0};
	      wildcard bins bit_4_rd_as_0 = {13'b???????0????1};
	      wildcard bins bit_4_rd_as_1 = {13'b???????1????1};
	      wildcard bins bit_5_wr_as_0 = {13'b??????0?????0};
	      wildcard bins bit_5_wr_as_1 = {13'b??????1?????0};
	      wildcard bins bit_5_rd_as_0 = {13'b??????0?????1};
	      wildcard bins bit_5_rd_as_1 = {13'b??????1?????1};
	      wildcard bins bit_6_wr_as_0 = {13'b?????0??????0};
	      wildcard bins bit_6_wr_as_1 = {13'b?????1??????0};
	      wildcard bins bit_6_rd_as_0 = {13'b?????0??????1};
	      wildcard bins bit_6_rd_as_1 = {13'b?????1??????1};
	      wildcard bins bit_7_wr_as_0 = {13'b????0???????0};
	      wildcard bins bit_7_wr_as_1 = {13'b????1???????0};
	      wildcard bins bit_7_rd_as_0 = {13'b????0???????1};
	      wildcard bins bit_7_rd_as_1 = {13'b????1???????1};
	      wildcard bins bit_8_wr_as_0 = {13'b???0????????0};
	      wildcard bins bit_8_wr_as_1 = {13'b???1????????0};
	      wildcard bins bit_8_rd_as_0 = {13'b???0????????1};
	      wildcard bins bit_8_rd_as_1 = {13'b???1????????1};
	      wildcard bins bit_9_wr_as_0 = {13'b??0?????????0};
	      wildcard bins bit_9_wr_as_1 = {13'b??1?????????0};
	      wildcard bins bit_9_rd_as_0 = {13'b??0?????????1};
	      wildcard bins bit_9_rd_as_1 = {13'b??1?????????1};
	      wildcard bins bit_10_wr_as_0 = {13'b?0??????????0};
	      wildcard bins bit_10_wr_as_1 = {13'b?1??????????0};
	      wildcard bins bit_10_rd_as_0 = {13'b?0??????????1};
	      wildcard bins bit_10_rd_as_1 = {13'b?1??????????1};
	      wildcard bins bit_11_wr_as_0 = {13'b0???????????0};
	      wildcard bins bit_11_wr_as_1 = {13'b1???????????0};
	      wildcard bins bit_11_rd_as_0 = {13'b0???????????1};
	      wildcard bins bit_11_rd_as_1 = {13'b1???????????1};
	      option.weight = 48;
	   }
	endgroup
	function new(string name = "CHN_SZ");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.CHK_SZ = uvm_reg_field::type_id::create("CHK_SZ",,get_full_name());
      this.CHK_SZ.configure(this, 12, 16, "RW", 0, 12'h0, 0, 0, 1);
      this.TOT_SZ = uvm_reg_field::type_id::create("TOT_SZ",,get_full_name());
      this.TOT_SZ.configure(this, 12, 0, "RW", 0, 12'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_CHN_SZ)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CHN_SZ


class ral_reg_CHN_A0 extends uvm_reg;
	rand uvm_reg_field ADDRESS;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   ADDRESS: coverpoint {m_data[28:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {30'b????????????????????????????00};
	      wildcard bins bit_0_wr_as_1 = {30'b????????????????????????????10};
	      wildcard bins bit_0_rd_as_0 = {30'b????????????????????????????01};
	      wildcard bins bit_0_rd_as_1 = {30'b????????????????????????????11};
	      wildcard bins bit_1_wr_as_0 = {30'b???????????????????????????0?0};
	      wildcard bins bit_1_wr_as_1 = {30'b???????????????????????????1?0};
	      wildcard bins bit_1_rd_as_0 = {30'b???????????????????????????0?1};
	      wildcard bins bit_1_rd_as_1 = {30'b???????????????????????????1?1};
	      wildcard bins bit_2_wr_as_0 = {30'b??????????????????????????0??0};
	      wildcard bins bit_2_wr_as_1 = {30'b??????????????????????????1??0};
	      wildcard bins bit_2_rd_as_0 = {30'b??????????????????????????0??1};
	      wildcard bins bit_2_rd_as_1 = {30'b??????????????????????????1??1};
	      wildcard bins bit_3_wr_as_0 = {30'b?????????????????????????0???0};
	      wildcard bins bit_3_wr_as_1 = {30'b?????????????????????????1???0};
	      wildcard bins bit_3_rd_as_0 = {30'b?????????????????????????0???1};
	      wildcard bins bit_3_rd_as_1 = {30'b?????????????????????????1???1};
	      wildcard bins bit_4_wr_as_0 = {30'b????????????????????????0????0};
	      wildcard bins bit_4_wr_as_1 = {30'b????????????????????????1????0};
	      wildcard bins bit_4_rd_as_0 = {30'b????????????????????????0????1};
	      wildcard bins bit_4_rd_as_1 = {30'b????????????????????????1????1};
	      wildcard bins bit_5_wr_as_0 = {30'b???????????????????????0?????0};
	      wildcard bins bit_5_wr_as_1 = {30'b???????????????????????1?????0};
	      wildcard bins bit_5_rd_as_0 = {30'b???????????????????????0?????1};
	      wildcard bins bit_5_rd_as_1 = {30'b???????????????????????1?????1};
	      wildcard bins bit_6_wr_as_0 = {30'b??????????????????????0??????0};
	      wildcard bins bit_6_wr_as_1 = {30'b??????????????????????1??????0};
	      wildcard bins bit_6_rd_as_0 = {30'b??????????????????????0??????1};
	      wildcard bins bit_6_rd_as_1 = {30'b??????????????????????1??????1};
	      wildcard bins bit_7_wr_as_0 = {30'b?????????????????????0???????0};
	      wildcard bins bit_7_wr_as_1 = {30'b?????????????????????1???????0};
	      wildcard bins bit_7_rd_as_0 = {30'b?????????????????????0???????1};
	      wildcard bins bit_7_rd_as_1 = {30'b?????????????????????1???????1};
	      wildcard bins bit_8_wr_as_0 = {30'b????????????????????0????????0};
	      wildcard bins bit_8_wr_as_1 = {30'b????????????????????1????????0};
	      wildcard bins bit_8_rd_as_0 = {30'b????????????????????0????????1};
	      wildcard bins bit_8_rd_as_1 = {30'b????????????????????1????????1};
	      wildcard bins bit_9_wr_as_0 = {30'b???????????????????0?????????0};
	      wildcard bins bit_9_wr_as_1 = {30'b???????????????????1?????????0};
	      wildcard bins bit_9_rd_as_0 = {30'b???????????????????0?????????1};
	      wildcard bins bit_9_rd_as_1 = {30'b???????????????????1?????????1};
	      wildcard bins bit_10_wr_as_0 = {30'b??????????????????0??????????0};
	      wildcard bins bit_10_wr_as_1 = {30'b??????????????????1??????????0};
	      wildcard bins bit_10_rd_as_0 = {30'b??????????????????0??????????1};
	      wildcard bins bit_10_rd_as_1 = {30'b??????????????????1??????????1};
	      wildcard bins bit_11_wr_as_0 = {30'b?????????????????0???????????0};
	      wildcard bins bit_11_wr_as_1 = {30'b?????????????????1???????????0};
	      wildcard bins bit_11_rd_as_0 = {30'b?????????????????0???????????1};
	      wildcard bins bit_11_rd_as_1 = {30'b?????????????????1???????????1};
	      wildcard bins bit_12_wr_as_0 = {30'b????????????????0????????????0};
	      wildcard bins bit_12_wr_as_1 = {30'b????????????????1????????????0};
	      wildcard bins bit_12_rd_as_0 = {30'b????????????????0????????????1};
	      wildcard bins bit_12_rd_as_1 = {30'b????????????????1????????????1};
	      wildcard bins bit_13_wr_as_0 = {30'b???????????????0?????????????0};
	      wildcard bins bit_13_wr_as_1 = {30'b???????????????1?????????????0};
	      wildcard bins bit_13_rd_as_0 = {30'b???????????????0?????????????1};
	      wildcard bins bit_13_rd_as_1 = {30'b???????????????1?????????????1};
	      wildcard bins bit_14_wr_as_0 = {30'b??????????????0??????????????0};
	      wildcard bins bit_14_wr_as_1 = {30'b??????????????1??????????????0};
	      wildcard bins bit_14_rd_as_0 = {30'b??????????????0??????????????1};
	      wildcard bins bit_14_rd_as_1 = {30'b??????????????1??????????????1};
	      wildcard bins bit_15_wr_as_0 = {30'b?????????????0???????????????0};
	      wildcard bins bit_15_wr_as_1 = {30'b?????????????1???????????????0};
	      wildcard bins bit_15_rd_as_0 = {30'b?????????????0???????????????1};
	      wildcard bins bit_15_rd_as_1 = {30'b?????????????1???????????????1};
	      wildcard bins bit_16_wr_as_0 = {30'b????????????0????????????????0};
	      wildcard bins bit_16_wr_as_1 = {30'b????????????1????????????????0};
	      wildcard bins bit_16_rd_as_0 = {30'b????????????0????????????????1};
	      wildcard bins bit_16_rd_as_1 = {30'b????????????1????????????????1};
	      wildcard bins bit_17_wr_as_0 = {30'b???????????0?????????????????0};
	      wildcard bins bit_17_wr_as_1 = {30'b???????????1?????????????????0};
	      wildcard bins bit_17_rd_as_0 = {30'b???????????0?????????????????1};
	      wildcard bins bit_17_rd_as_1 = {30'b???????????1?????????????????1};
	      wildcard bins bit_18_wr_as_0 = {30'b??????????0??????????????????0};
	      wildcard bins bit_18_wr_as_1 = {30'b??????????1??????????????????0};
	      wildcard bins bit_18_rd_as_0 = {30'b??????????0??????????????????1};
	      wildcard bins bit_18_rd_as_1 = {30'b??????????1??????????????????1};
	      wildcard bins bit_19_wr_as_0 = {30'b?????????0???????????????????0};
	      wildcard bins bit_19_wr_as_1 = {30'b?????????1???????????????????0};
	      wildcard bins bit_19_rd_as_0 = {30'b?????????0???????????????????1};
	      wildcard bins bit_19_rd_as_1 = {30'b?????????1???????????????????1};
	      wildcard bins bit_20_wr_as_0 = {30'b????????0????????????????????0};
	      wildcard bins bit_20_wr_as_1 = {30'b????????1????????????????????0};
	      wildcard bins bit_20_rd_as_0 = {30'b????????0????????????????????1};
	      wildcard bins bit_20_rd_as_1 = {30'b????????1????????????????????1};
	      wildcard bins bit_21_wr_as_0 = {30'b???????0?????????????????????0};
	      wildcard bins bit_21_wr_as_1 = {30'b???????1?????????????????????0};
	      wildcard bins bit_21_rd_as_0 = {30'b???????0?????????????????????1};
	      wildcard bins bit_21_rd_as_1 = {30'b???????1?????????????????????1};
	      wildcard bins bit_22_wr_as_0 = {30'b??????0??????????????????????0};
	      wildcard bins bit_22_wr_as_1 = {30'b??????1??????????????????????0};
	      wildcard bins bit_22_rd_as_0 = {30'b??????0??????????????????????1};
	      wildcard bins bit_22_rd_as_1 = {30'b??????1??????????????????????1};
	      wildcard bins bit_23_wr_as_0 = {30'b?????0???????????????????????0};
	      wildcard bins bit_23_wr_as_1 = {30'b?????1???????????????????????0};
	      wildcard bins bit_23_rd_as_0 = {30'b?????0???????????????????????1};
	      wildcard bins bit_23_rd_as_1 = {30'b?????1???????????????????????1};
	      wildcard bins bit_24_wr_as_0 = {30'b????0????????????????????????0};
	      wildcard bins bit_24_wr_as_1 = {30'b????1????????????????????????0};
	      wildcard bins bit_24_rd_as_0 = {30'b????0????????????????????????1};
	      wildcard bins bit_24_rd_as_1 = {30'b????1????????????????????????1};
	      wildcard bins bit_25_wr_as_0 = {30'b???0?????????????????????????0};
	      wildcard bins bit_25_wr_as_1 = {30'b???1?????????????????????????0};
	      wildcard bins bit_25_rd_as_0 = {30'b???0?????????????????????????1};
	      wildcard bins bit_25_rd_as_1 = {30'b???1?????????????????????????1};
	      wildcard bins bit_26_wr_as_0 = {30'b??0??????????????????????????0};
	      wildcard bins bit_26_wr_as_1 = {30'b??1??????????????????????????0};
	      wildcard bins bit_26_rd_as_0 = {30'b??0??????????????????????????1};
	      wildcard bins bit_26_rd_as_1 = {30'b??1??????????????????????????1};
	      wildcard bins bit_27_wr_as_0 = {30'b?0???????????????????????????0};
	      wildcard bins bit_27_wr_as_1 = {30'b?1???????????????????????????0};
	      wildcard bins bit_27_rd_as_0 = {30'b?0???????????????????????????1};
	      wildcard bins bit_27_rd_as_1 = {30'b?1???????????????????????????1};
	      wildcard bins bit_28_wr_as_0 = {30'b0????????????????????????????0};
	      wildcard bins bit_28_wr_as_1 = {30'b1????????????????????????????0};
	      wildcard bins bit_28_rd_as_0 = {30'b0????????????????????????????1};
	      wildcard bins bit_28_rd_as_1 = {30'b1????????????????????????????1};
	      option.weight = 116;
	   }
	endgroup
	function new(string name = "CHN_A0");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.ADDRESS = uvm_reg_field::type_id::create("ADDRESS",,get_full_name());
      this.ADDRESS.configure(this, 29, 0, "RW", 0, 29'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_CHN_A0)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CHN_A0


class ral_reg_CHN_AM0 extends uvm_reg;
	rand uvm_reg_field ADDRESS_MASK;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   ADDRESS_MASK: coverpoint {m_data[27:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {29'b???????????????????????????00};
	      wildcard bins bit_0_wr_as_1 = {29'b???????????????????????????10};
	      wildcard bins bit_0_rd_as_0 = {29'b???????????????????????????01};
	      wildcard bins bit_0_rd_as_1 = {29'b???????????????????????????11};
	      wildcard bins bit_1_wr_as_0 = {29'b??????????????????????????0?0};
	      wildcard bins bit_1_wr_as_1 = {29'b??????????????????????????1?0};
	      wildcard bins bit_1_rd_as_0 = {29'b??????????????????????????0?1};
	      wildcard bins bit_1_rd_as_1 = {29'b??????????????????????????1?1};
	      wildcard bins bit_2_wr_as_0 = {29'b?????????????????????????0??0};
	      wildcard bins bit_2_wr_as_1 = {29'b?????????????????????????1??0};
	      wildcard bins bit_2_rd_as_0 = {29'b?????????????????????????0??1};
	      wildcard bins bit_2_rd_as_1 = {29'b?????????????????????????1??1};
	      wildcard bins bit_3_wr_as_0 = {29'b????????????????????????0???0};
	      wildcard bins bit_3_wr_as_1 = {29'b????????????????????????1???0};
	      wildcard bins bit_3_rd_as_0 = {29'b????????????????????????0???1};
	      wildcard bins bit_3_rd_as_1 = {29'b????????????????????????1???1};
	      wildcard bins bit_4_wr_as_0 = {29'b???????????????????????0????0};
	      wildcard bins bit_4_wr_as_1 = {29'b???????????????????????1????0};
	      wildcard bins bit_4_rd_as_0 = {29'b???????????????????????0????1};
	      wildcard bins bit_4_rd_as_1 = {29'b???????????????????????1????1};
	      wildcard bins bit_5_wr_as_0 = {29'b??????????????????????0?????0};
	      wildcard bins bit_5_wr_as_1 = {29'b??????????????????????1?????0};
	      wildcard bins bit_5_rd_as_0 = {29'b??????????????????????0?????1};
	      wildcard bins bit_5_rd_as_1 = {29'b??????????????????????1?????1};
	      wildcard bins bit_6_wr_as_0 = {29'b?????????????????????0??????0};
	      wildcard bins bit_6_wr_as_1 = {29'b?????????????????????1??????0};
	      wildcard bins bit_6_rd_as_0 = {29'b?????????????????????0??????1};
	      wildcard bins bit_6_rd_as_1 = {29'b?????????????????????1??????1};
	      wildcard bins bit_7_wr_as_0 = {29'b????????????????????0???????0};
	      wildcard bins bit_7_wr_as_1 = {29'b????????????????????1???????0};
	      wildcard bins bit_7_rd_as_0 = {29'b????????????????????0???????1};
	      wildcard bins bit_7_rd_as_1 = {29'b????????????????????1???????1};
	      wildcard bins bit_8_wr_as_0 = {29'b???????????????????0????????0};
	      wildcard bins bit_8_wr_as_1 = {29'b???????????????????1????????0};
	      wildcard bins bit_8_rd_as_0 = {29'b???????????????????0????????1};
	      wildcard bins bit_8_rd_as_1 = {29'b???????????????????1????????1};
	      wildcard bins bit_9_wr_as_0 = {29'b??????????????????0?????????0};
	      wildcard bins bit_9_wr_as_1 = {29'b??????????????????1?????????0};
	      wildcard bins bit_9_rd_as_0 = {29'b??????????????????0?????????1};
	      wildcard bins bit_9_rd_as_1 = {29'b??????????????????1?????????1};
	      wildcard bins bit_10_wr_as_0 = {29'b?????????????????0??????????0};
	      wildcard bins bit_10_wr_as_1 = {29'b?????????????????1??????????0};
	      wildcard bins bit_10_rd_as_0 = {29'b?????????????????0??????????1};
	      wildcard bins bit_10_rd_as_1 = {29'b?????????????????1??????????1};
	      wildcard bins bit_11_wr_as_0 = {29'b????????????????0???????????0};
	      wildcard bins bit_11_wr_as_1 = {29'b????????????????1???????????0};
	      wildcard bins bit_11_rd_as_0 = {29'b????????????????0???????????1};
	      wildcard bins bit_11_rd_as_1 = {29'b????????????????1???????????1};
	      wildcard bins bit_12_wr_as_0 = {29'b???????????????0????????????0};
	      wildcard bins bit_12_wr_as_1 = {29'b???????????????1????????????0};
	      wildcard bins bit_12_rd_as_0 = {29'b???????????????0????????????1};
	      wildcard bins bit_12_rd_as_1 = {29'b???????????????1????????????1};
	      wildcard bins bit_13_wr_as_0 = {29'b??????????????0?????????????0};
	      wildcard bins bit_13_wr_as_1 = {29'b??????????????1?????????????0};
	      wildcard bins bit_13_rd_as_0 = {29'b??????????????0?????????????1};
	      wildcard bins bit_13_rd_as_1 = {29'b??????????????1?????????????1};
	      wildcard bins bit_14_wr_as_0 = {29'b?????????????0??????????????0};
	      wildcard bins bit_14_wr_as_1 = {29'b?????????????1??????????????0};
	      wildcard bins bit_14_rd_as_0 = {29'b?????????????0??????????????1};
	      wildcard bins bit_14_rd_as_1 = {29'b?????????????1??????????????1};
	      wildcard bins bit_15_wr_as_0 = {29'b????????????0???????????????0};
	      wildcard bins bit_15_wr_as_1 = {29'b????????????1???????????????0};
	      wildcard bins bit_15_rd_as_0 = {29'b????????????0???????????????1};
	      wildcard bins bit_15_rd_as_1 = {29'b????????????1???????????????1};
	      wildcard bins bit_16_wr_as_0 = {29'b???????????0????????????????0};
	      wildcard bins bit_16_wr_as_1 = {29'b???????????1????????????????0};
	      wildcard bins bit_16_rd_as_0 = {29'b???????????0????????????????1};
	      wildcard bins bit_16_rd_as_1 = {29'b???????????1????????????????1};
	      wildcard bins bit_17_wr_as_0 = {29'b??????????0?????????????????0};
	      wildcard bins bit_17_wr_as_1 = {29'b??????????1?????????????????0};
	      wildcard bins bit_17_rd_as_0 = {29'b??????????0?????????????????1};
	      wildcard bins bit_17_rd_as_1 = {29'b??????????1?????????????????1};
	      wildcard bins bit_18_wr_as_0 = {29'b?????????0??????????????????0};
	      wildcard bins bit_18_wr_as_1 = {29'b?????????1??????????????????0};
	      wildcard bins bit_18_rd_as_0 = {29'b?????????0??????????????????1};
	      wildcard bins bit_18_rd_as_1 = {29'b?????????1??????????????????1};
	      wildcard bins bit_19_wr_as_0 = {29'b????????0???????????????????0};
	      wildcard bins bit_19_wr_as_1 = {29'b????????1???????????????????0};
	      wildcard bins bit_19_rd_as_0 = {29'b????????0???????????????????1};
	      wildcard bins bit_19_rd_as_1 = {29'b????????1???????????????????1};
	      wildcard bins bit_20_wr_as_0 = {29'b???????0????????????????????0};
	      wildcard bins bit_20_wr_as_1 = {29'b???????1????????????????????0};
	      wildcard bins bit_20_rd_as_0 = {29'b???????0????????????????????1};
	      wildcard bins bit_20_rd_as_1 = {29'b???????1????????????????????1};
	      wildcard bins bit_21_wr_as_0 = {29'b??????0?????????????????????0};
	      wildcard bins bit_21_wr_as_1 = {29'b??????1?????????????????????0};
	      wildcard bins bit_21_rd_as_0 = {29'b??????0?????????????????????1};
	      wildcard bins bit_21_rd_as_1 = {29'b??????1?????????????????????1};
	      wildcard bins bit_22_wr_as_0 = {29'b?????0??????????????????????0};
	      wildcard bins bit_22_wr_as_1 = {29'b?????1??????????????????????0};
	      wildcard bins bit_22_rd_as_0 = {29'b?????0??????????????????????1};
	      wildcard bins bit_22_rd_as_1 = {29'b?????1??????????????????????1};
	      wildcard bins bit_23_wr_as_0 = {29'b????0???????????????????????0};
	      wildcard bins bit_23_wr_as_1 = {29'b????1???????????????????????0};
	      wildcard bins bit_23_rd_as_0 = {29'b????0???????????????????????1};
	      wildcard bins bit_23_rd_as_1 = {29'b????1???????????????????????1};
	      wildcard bins bit_24_wr_as_0 = {29'b???0????????????????????????0};
	      wildcard bins bit_24_wr_as_1 = {29'b???1????????????????????????0};
	      wildcard bins bit_24_rd_as_0 = {29'b???0????????????????????????1};
	      wildcard bins bit_24_rd_as_1 = {29'b???1????????????????????????1};
	      wildcard bins bit_25_wr_as_0 = {29'b??0?????????????????????????0};
	      wildcard bins bit_25_wr_as_1 = {29'b??1?????????????????????????0};
	      wildcard bins bit_25_rd_as_0 = {29'b??0?????????????????????????1};
	      wildcard bins bit_25_rd_as_1 = {29'b??1?????????????????????????1};
	      wildcard bins bit_26_wr_as_0 = {29'b?0??????????????????????????0};
	      wildcard bins bit_26_wr_as_1 = {29'b?1??????????????????????????0};
	      wildcard bins bit_26_rd_as_0 = {29'b?0??????????????????????????1};
	      wildcard bins bit_26_rd_as_1 = {29'b?1??????????????????????????1};
	      wildcard bins bit_27_wr_as_0 = {29'b0???????????????????????????0};
	      wildcard bins bit_27_wr_as_1 = {29'b1???????????????????????????0};
	      wildcard bins bit_27_rd_as_0 = {29'b0???????????????????????????1};
	      wildcard bins bit_27_rd_as_1 = {29'b1???????????????????????????1};
	      option.weight = 112;
	   }
	endgroup
	function new(string name = "CHN_AM0");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.ADDRESS_MASK = uvm_reg_field::type_id::create("ADDRESS_MASK",,get_full_name());
      this.ADDRESS_MASK.configure(this, 28, 0, "RW", 0, 28'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_CHN_AM0)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CHN_AM0


class ral_reg_CHN_A1 extends uvm_reg;
	rand uvm_reg_field ADDRESS;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   ADDRESS: coverpoint {m_data[28:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {30'b????????????????????????????00};
	      wildcard bins bit_0_wr_as_1 = {30'b????????????????????????????10};
	      wildcard bins bit_0_rd_as_0 = {30'b????????????????????????????01};
	      wildcard bins bit_0_rd_as_1 = {30'b????????????????????????????11};
	      wildcard bins bit_1_wr_as_0 = {30'b???????????????????????????0?0};
	      wildcard bins bit_1_wr_as_1 = {30'b???????????????????????????1?0};
	      wildcard bins bit_1_rd_as_0 = {30'b???????????????????????????0?1};
	      wildcard bins bit_1_rd_as_1 = {30'b???????????????????????????1?1};
	      wildcard bins bit_2_wr_as_0 = {30'b??????????????????????????0??0};
	      wildcard bins bit_2_wr_as_1 = {30'b??????????????????????????1??0};
	      wildcard bins bit_2_rd_as_0 = {30'b??????????????????????????0??1};
	      wildcard bins bit_2_rd_as_1 = {30'b??????????????????????????1??1};
	      wildcard bins bit_3_wr_as_0 = {30'b?????????????????????????0???0};
	      wildcard bins bit_3_wr_as_1 = {30'b?????????????????????????1???0};
	      wildcard bins bit_3_rd_as_0 = {30'b?????????????????????????0???1};
	      wildcard bins bit_3_rd_as_1 = {30'b?????????????????????????1???1};
	      wildcard bins bit_4_wr_as_0 = {30'b????????????????????????0????0};
	      wildcard bins bit_4_wr_as_1 = {30'b????????????????????????1????0};
	      wildcard bins bit_4_rd_as_0 = {30'b????????????????????????0????1};
	      wildcard bins bit_4_rd_as_1 = {30'b????????????????????????1????1};
	      wildcard bins bit_5_wr_as_0 = {30'b???????????????????????0?????0};
	      wildcard bins bit_5_wr_as_1 = {30'b???????????????????????1?????0};
	      wildcard bins bit_5_rd_as_0 = {30'b???????????????????????0?????1};
	      wildcard bins bit_5_rd_as_1 = {30'b???????????????????????1?????1};
	      wildcard bins bit_6_wr_as_0 = {30'b??????????????????????0??????0};
	      wildcard bins bit_6_wr_as_1 = {30'b??????????????????????1??????0};
	      wildcard bins bit_6_rd_as_0 = {30'b??????????????????????0??????1};
	      wildcard bins bit_6_rd_as_1 = {30'b??????????????????????1??????1};
	      wildcard bins bit_7_wr_as_0 = {30'b?????????????????????0???????0};
	      wildcard bins bit_7_wr_as_1 = {30'b?????????????????????1???????0};
	      wildcard bins bit_7_rd_as_0 = {30'b?????????????????????0???????1};
	      wildcard bins bit_7_rd_as_1 = {30'b?????????????????????1???????1};
	      wildcard bins bit_8_wr_as_0 = {30'b????????????????????0????????0};
	      wildcard bins bit_8_wr_as_1 = {30'b????????????????????1????????0};
	      wildcard bins bit_8_rd_as_0 = {30'b????????????????????0????????1};
	      wildcard bins bit_8_rd_as_1 = {30'b????????????????????1????????1};
	      wildcard bins bit_9_wr_as_0 = {30'b???????????????????0?????????0};
	      wildcard bins bit_9_wr_as_1 = {30'b???????????????????1?????????0};
	      wildcard bins bit_9_rd_as_0 = {30'b???????????????????0?????????1};
	      wildcard bins bit_9_rd_as_1 = {30'b???????????????????1?????????1};
	      wildcard bins bit_10_wr_as_0 = {30'b??????????????????0??????????0};
	      wildcard bins bit_10_wr_as_1 = {30'b??????????????????1??????????0};
	      wildcard bins bit_10_rd_as_0 = {30'b??????????????????0??????????1};
	      wildcard bins bit_10_rd_as_1 = {30'b??????????????????1??????????1};
	      wildcard bins bit_11_wr_as_0 = {30'b?????????????????0???????????0};
	      wildcard bins bit_11_wr_as_1 = {30'b?????????????????1???????????0};
	      wildcard bins bit_11_rd_as_0 = {30'b?????????????????0???????????1};
	      wildcard bins bit_11_rd_as_1 = {30'b?????????????????1???????????1};
	      wildcard bins bit_12_wr_as_0 = {30'b????????????????0????????????0};
	      wildcard bins bit_12_wr_as_1 = {30'b????????????????1????????????0};
	      wildcard bins bit_12_rd_as_0 = {30'b????????????????0????????????1};
	      wildcard bins bit_12_rd_as_1 = {30'b????????????????1????????????1};
	      wildcard bins bit_13_wr_as_0 = {30'b???????????????0?????????????0};
	      wildcard bins bit_13_wr_as_1 = {30'b???????????????1?????????????0};
	      wildcard bins bit_13_rd_as_0 = {30'b???????????????0?????????????1};
	      wildcard bins bit_13_rd_as_1 = {30'b???????????????1?????????????1};
	      wildcard bins bit_14_wr_as_0 = {30'b??????????????0??????????????0};
	      wildcard bins bit_14_wr_as_1 = {30'b??????????????1??????????????0};
	      wildcard bins bit_14_rd_as_0 = {30'b??????????????0??????????????1};
	      wildcard bins bit_14_rd_as_1 = {30'b??????????????1??????????????1};
	      wildcard bins bit_15_wr_as_0 = {30'b?????????????0???????????????0};
	      wildcard bins bit_15_wr_as_1 = {30'b?????????????1???????????????0};
	      wildcard bins bit_15_rd_as_0 = {30'b?????????????0???????????????1};
	      wildcard bins bit_15_rd_as_1 = {30'b?????????????1???????????????1};
	      wildcard bins bit_16_wr_as_0 = {30'b????????????0????????????????0};
	      wildcard bins bit_16_wr_as_1 = {30'b????????????1????????????????0};
	      wildcard bins bit_16_rd_as_0 = {30'b????????????0????????????????1};
	      wildcard bins bit_16_rd_as_1 = {30'b????????????1????????????????1};
	      wildcard bins bit_17_wr_as_0 = {30'b???????????0?????????????????0};
	      wildcard bins bit_17_wr_as_1 = {30'b???????????1?????????????????0};
	      wildcard bins bit_17_rd_as_0 = {30'b???????????0?????????????????1};
	      wildcard bins bit_17_rd_as_1 = {30'b???????????1?????????????????1};
	      wildcard bins bit_18_wr_as_0 = {30'b??????????0??????????????????0};
	      wildcard bins bit_18_wr_as_1 = {30'b??????????1??????????????????0};
	      wildcard bins bit_18_rd_as_0 = {30'b??????????0??????????????????1};
	      wildcard bins bit_18_rd_as_1 = {30'b??????????1??????????????????1};
	      wildcard bins bit_19_wr_as_0 = {30'b?????????0???????????????????0};
	      wildcard bins bit_19_wr_as_1 = {30'b?????????1???????????????????0};
	      wildcard bins bit_19_rd_as_0 = {30'b?????????0???????????????????1};
	      wildcard bins bit_19_rd_as_1 = {30'b?????????1???????????????????1};
	      wildcard bins bit_20_wr_as_0 = {30'b????????0????????????????????0};
	      wildcard bins bit_20_wr_as_1 = {30'b????????1????????????????????0};
	      wildcard bins bit_20_rd_as_0 = {30'b????????0????????????????????1};
	      wildcard bins bit_20_rd_as_1 = {30'b????????1????????????????????1};
	      wildcard bins bit_21_wr_as_0 = {30'b???????0?????????????????????0};
	      wildcard bins bit_21_wr_as_1 = {30'b???????1?????????????????????0};
	      wildcard bins bit_21_rd_as_0 = {30'b???????0?????????????????????1};
	      wildcard bins bit_21_rd_as_1 = {30'b???????1?????????????????????1};
	      wildcard bins bit_22_wr_as_0 = {30'b??????0??????????????????????0};
	      wildcard bins bit_22_wr_as_1 = {30'b??????1??????????????????????0};
	      wildcard bins bit_22_rd_as_0 = {30'b??????0??????????????????????1};
	      wildcard bins bit_22_rd_as_1 = {30'b??????1??????????????????????1};
	      wildcard bins bit_23_wr_as_0 = {30'b?????0???????????????????????0};
	      wildcard bins bit_23_wr_as_1 = {30'b?????1???????????????????????0};
	      wildcard bins bit_23_rd_as_0 = {30'b?????0???????????????????????1};
	      wildcard bins bit_23_rd_as_1 = {30'b?????1???????????????????????1};
	      wildcard bins bit_24_wr_as_0 = {30'b????0????????????????????????0};
	      wildcard bins bit_24_wr_as_1 = {30'b????1????????????????????????0};
	      wildcard bins bit_24_rd_as_0 = {30'b????0????????????????????????1};
	      wildcard bins bit_24_rd_as_1 = {30'b????1????????????????????????1};
	      wildcard bins bit_25_wr_as_0 = {30'b???0?????????????????????????0};
	      wildcard bins bit_25_wr_as_1 = {30'b???1?????????????????????????0};
	      wildcard bins bit_25_rd_as_0 = {30'b???0?????????????????????????1};
	      wildcard bins bit_25_rd_as_1 = {30'b???1?????????????????????????1};
	      wildcard bins bit_26_wr_as_0 = {30'b??0??????????????????????????0};
	      wildcard bins bit_26_wr_as_1 = {30'b??1??????????????????????????0};
	      wildcard bins bit_26_rd_as_0 = {30'b??0??????????????????????????1};
	      wildcard bins bit_26_rd_as_1 = {30'b??1??????????????????????????1};
	      wildcard bins bit_27_wr_as_0 = {30'b?0???????????????????????????0};
	      wildcard bins bit_27_wr_as_1 = {30'b?1???????????????????????????0};
	      wildcard bins bit_27_rd_as_0 = {30'b?0???????????????????????????1};
	      wildcard bins bit_27_rd_as_1 = {30'b?1???????????????????????????1};
	      wildcard bins bit_28_wr_as_0 = {30'b0????????????????????????????0};
	      wildcard bins bit_28_wr_as_1 = {30'b1????????????????????????????0};
	      wildcard bins bit_28_rd_as_0 = {30'b0????????????????????????????1};
	      wildcard bins bit_28_rd_as_1 = {30'b1????????????????????????????1};
	      option.weight = 116;
	   }
	endgroup
	function new(string name = "CHN_A1");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.ADDRESS = uvm_reg_field::type_id::create("ADDRESS",,get_full_name());
      this.ADDRESS.configure(this, 29, 0, "RW", 0, 29'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_CHN_A1)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CHN_A1


class ral_reg_CHN_AM1 extends uvm_reg;
	rand uvm_reg_field ADDRESS_MASK;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   ADDRESS_MASK: coverpoint {m_data[27:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {29'b???????????????????????????00};
	      wildcard bins bit_0_wr_as_1 = {29'b???????????????????????????10};
	      wildcard bins bit_0_rd_as_0 = {29'b???????????????????????????01};
	      wildcard bins bit_0_rd_as_1 = {29'b???????????????????????????11};
	      wildcard bins bit_1_wr_as_0 = {29'b??????????????????????????0?0};
	      wildcard bins bit_1_wr_as_1 = {29'b??????????????????????????1?0};
	      wildcard bins bit_1_rd_as_0 = {29'b??????????????????????????0?1};
	      wildcard bins bit_1_rd_as_1 = {29'b??????????????????????????1?1};
	      wildcard bins bit_2_wr_as_0 = {29'b?????????????????????????0??0};
	      wildcard bins bit_2_wr_as_1 = {29'b?????????????????????????1??0};
	      wildcard bins bit_2_rd_as_0 = {29'b?????????????????????????0??1};
	      wildcard bins bit_2_rd_as_1 = {29'b?????????????????????????1??1};
	      wildcard bins bit_3_wr_as_0 = {29'b????????????????????????0???0};
	      wildcard bins bit_3_wr_as_1 = {29'b????????????????????????1???0};
	      wildcard bins bit_3_rd_as_0 = {29'b????????????????????????0???1};
	      wildcard bins bit_3_rd_as_1 = {29'b????????????????????????1???1};
	      wildcard bins bit_4_wr_as_0 = {29'b???????????????????????0????0};
	      wildcard bins bit_4_wr_as_1 = {29'b???????????????????????1????0};
	      wildcard bins bit_4_rd_as_0 = {29'b???????????????????????0????1};
	      wildcard bins bit_4_rd_as_1 = {29'b???????????????????????1????1};
	      wildcard bins bit_5_wr_as_0 = {29'b??????????????????????0?????0};
	      wildcard bins bit_5_wr_as_1 = {29'b??????????????????????1?????0};
	      wildcard bins bit_5_rd_as_0 = {29'b??????????????????????0?????1};
	      wildcard bins bit_5_rd_as_1 = {29'b??????????????????????1?????1};
	      wildcard bins bit_6_wr_as_0 = {29'b?????????????????????0??????0};
	      wildcard bins bit_6_wr_as_1 = {29'b?????????????????????1??????0};
	      wildcard bins bit_6_rd_as_0 = {29'b?????????????????????0??????1};
	      wildcard bins bit_6_rd_as_1 = {29'b?????????????????????1??????1};
	      wildcard bins bit_7_wr_as_0 = {29'b????????????????????0???????0};
	      wildcard bins bit_7_wr_as_1 = {29'b????????????????????1???????0};
	      wildcard bins bit_7_rd_as_0 = {29'b????????????????????0???????1};
	      wildcard bins bit_7_rd_as_1 = {29'b????????????????????1???????1};
	      wildcard bins bit_8_wr_as_0 = {29'b???????????????????0????????0};
	      wildcard bins bit_8_wr_as_1 = {29'b???????????????????1????????0};
	      wildcard bins bit_8_rd_as_0 = {29'b???????????????????0????????1};
	      wildcard bins bit_8_rd_as_1 = {29'b???????????????????1????????1};
	      wildcard bins bit_9_wr_as_0 = {29'b??????????????????0?????????0};
	      wildcard bins bit_9_wr_as_1 = {29'b??????????????????1?????????0};
	      wildcard bins bit_9_rd_as_0 = {29'b??????????????????0?????????1};
	      wildcard bins bit_9_rd_as_1 = {29'b??????????????????1?????????1};
	      wildcard bins bit_10_wr_as_0 = {29'b?????????????????0??????????0};
	      wildcard bins bit_10_wr_as_1 = {29'b?????????????????1??????????0};
	      wildcard bins bit_10_rd_as_0 = {29'b?????????????????0??????????1};
	      wildcard bins bit_10_rd_as_1 = {29'b?????????????????1??????????1};
	      wildcard bins bit_11_wr_as_0 = {29'b????????????????0???????????0};
	      wildcard bins bit_11_wr_as_1 = {29'b????????????????1???????????0};
	      wildcard bins bit_11_rd_as_0 = {29'b????????????????0???????????1};
	      wildcard bins bit_11_rd_as_1 = {29'b????????????????1???????????1};
	      wildcard bins bit_12_wr_as_0 = {29'b???????????????0????????????0};
	      wildcard bins bit_12_wr_as_1 = {29'b???????????????1????????????0};
	      wildcard bins bit_12_rd_as_0 = {29'b???????????????0????????????1};
	      wildcard bins bit_12_rd_as_1 = {29'b???????????????1????????????1};
	      wildcard bins bit_13_wr_as_0 = {29'b??????????????0?????????????0};
	      wildcard bins bit_13_wr_as_1 = {29'b??????????????1?????????????0};
	      wildcard bins bit_13_rd_as_0 = {29'b??????????????0?????????????1};
	      wildcard bins bit_13_rd_as_1 = {29'b??????????????1?????????????1};
	      wildcard bins bit_14_wr_as_0 = {29'b?????????????0??????????????0};
	      wildcard bins bit_14_wr_as_1 = {29'b?????????????1??????????????0};
	      wildcard bins bit_14_rd_as_0 = {29'b?????????????0??????????????1};
	      wildcard bins bit_14_rd_as_1 = {29'b?????????????1??????????????1};
	      wildcard bins bit_15_wr_as_0 = {29'b????????????0???????????????0};
	      wildcard bins bit_15_wr_as_1 = {29'b????????????1???????????????0};
	      wildcard bins bit_15_rd_as_0 = {29'b????????????0???????????????1};
	      wildcard bins bit_15_rd_as_1 = {29'b????????????1???????????????1};
	      wildcard bins bit_16_wr_as_0 = {29'b???????????0????????????????0};
	      wildcard bins bit_16_wr_as_1 = {29'b???????????1????????????????0};
	      wildcard bins bit_16_rd_as_0 = {29'b???????????0????????????????1};
	      wildcard bins bit_16_rd_as_1 = {29'b???????????1????????????????1};
	      wildcard bins bit_17_wr_as_0 = {29'b??????????0?????????????????0};
	      wildcard bins bit_17_wr_as_1 = {29'b??????????1?????????????????0};
	      wildcard bins bit_17_rd_as_0 = {29'b??????????0?????????????????1};
	      wildcard bins bit_17_rd_as_1 = {29'b??????????1?????????????????1};
	      wildcard bins bit_18_wr_as_0 = {29'b?????????0??????????????????0};
	      wildcard bins bit_18_wr_as_1 = {29'b?????????1??????????????????0};
	      wildcard bins bit_18_rd_as_0 = {29'b?????????0??????????????????1};
	      wildcard bins bit_18_rd_as_1 = {29'b?????????1??????????????????1};
	      wildcard bins bit_19_wr_as_0 = {29'b????????0???????????????????0};
	      wildcard bins bit_19_wr_as_1 = {29'b????????1???????????????????0};
	      wildcard bins bit_19_rd_as_0 = {29'b????????0???????????????????1};
	      wildcard bins bit_19_rd_as_1 = {29'b????????1???????????????????1};
	      wildcard bins bit_20_wr_as_0 = {29'b???????0????????????????????0};
	      wildcard bins bit_20_wr_as_1 = {29'b???????1????????????????????0};
	      wildcard bins bit_20_rd_as_0 = {29'b???????0????????????????????1};
	      wildcard bins bit_20_rd_as_1 = {29'b???????1????????????????????1};
	      wildcard bins bit_21_wr_as_0 = {29'b??????0?????????????????????0};
	      wildcard bins bit_21_wr_as_1 = {29'b??????1?????????????????????0};
	      wildcard bins bit_21_rd_as_0 = {29'b??????0?????????????????????1};
	      wildcard bins bit_21_rd_as_1 = {29'b??????1?????????????????????1};
	      wildcard bins bit_22_wr_as_0 = {29'b?????0??????????????????????0};
	      wildcard bins bit_22_wr_as_1 = {29'b?????1??????????????????????0};
	      wildcard bins bit_22_rd_as_0 = {29'b?????0??????????????????????1};
	      wildcard bins bit_22_rd_as_1 = {29'b?????1??????????????????????1};
	      wildcard bins bit_23_wr_as_0 = {29'b????0???????????????????????0};
	      wildcard bins bit_23_wr_as_1 = {29'b????1???????????????????????0};
	      wildcard bins bit_23_rd_as_0 = {29'b????0???????????????????????1};
	      wildcard bins bit_23_rd_as_1 = {29'b????1???????????????????????1};
	      wildcard bins bit_24_wr_as_0 = {29'b???0????????????????????????0};
	      wildcard bins bit_24_wr_as_1 = {29'b???1????????????????????????0};
	      wildcard bins bit_24_rd_as_0 = {29'b???0????????????????????????1};
	      wildcard bins bit_24_rd_as_1 = {29'b???1????????????????????????1};
	      wildcard bins bit_25_wr_as_0 = {29'b??0?????????????????????????0};
	      wildcard bins bit_25_wr_as_1 = {29'b??1?????????????????????????0};
	      wildcard bins bit_25_rd_as_0 = {29'b??0?????????????????????????1};
	      wildcard bins bit_25_rd_as_1 = {29'b??1?????????????????????????1};
	      wildcard bins bit_26_wr_as_0 = {29'b?0??????????????????????????0};
	      wildcard bins bit_26_wr_as_1 = {29'b?1??????????????????????????0};
	      wildcard bins bit_26_rd_as_0 = {29'b?0??????????????????????????1};
	      wildcard bins bit_26_rd_as_1 = {29'b?1??????????????????????????1};
	      wildcard bins bit_27_wr_as_0 = {29'b0???????????????????????????0};
	      wildcard bins bit_27_wr_as_1 = {29'b1???????????????????????????0};
	      wildcard bins bit_27_rd_as_0 = {29'b0???????????????????????????1};
	      wildcard bins bit_27_rd_as_1 = {29'b1???????????????????????????1};
	      option.weight = 112;
	   }
	endgroup
	function new(string name = "CHN_AM1");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.ADDRESS_MASK = uvm_reg_field::type_id::create("ADDRESS_MASK",,get_full_name());
      this.ADDRESS_MASK.configure(this, 28, 0, "RW", 0, 28'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_CHN_AM1)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CHN_AM1


class ral_reg_CHN_DESC extends uvm_reg;
	rand uvm_reg_field ADDRESS_MASK;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   ADDRESS_MASK: coverpoint {m_data[27:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {29'b???????????????????????????00};
	      wildcard bins bit_0_wr_as_1 = {29'b???????????????????????????10};
	      wildcard bins bit_0_rd_as_0 = {29'b???????????????????????????01};
	      wildcard bins bit_0_rd_as_1 = {29'b???????????????????????????11};
	      wildcard bins bit_1_wr_as_0 = {29'b??????????????????????????0?0};
	      wildcard bins bit_1_wr_as_1 = {29'b??????????????????????????1?0};
	      wildcard bins bit_1_rd_as_0 = {29'b??????????????????????????0?1};
	      wildcard bins bit_1_rd_as_1 = {29'b??????????????????????????1?1};
	      wildcard bins bit_2_wr_as_0 = {29'b?????????????????????????0??0};
	      wildcard bins bit_2_wr_as_1 = {29'b?????????????????????????1??0};
	      wildcard bins bit_2_rd_as_0 = {29'b?????????????????????????0??1};
	      wildcard bins bit_2_rd_as_1 = {29'b?????????????????????????1??1};
	      wildcard bins bit_3_wr_as_0 = {29'b????????????????????????0???0};
	      wildcard bins bit_3_wr_as_1 = {29'b????????????????????????1???0};
	      wildcard bins bit_3_rd_as_0 = {29'b????????????????????????0???1};
	      wildcard bins bit_3_rd_as_1 = {29'b????????????????????????1???1};
	      wildcard bins bit_4_wr_as_0 = {29'b???????????????????????0????0};
	      wildcard bins bit_4_wr_as_1 = {29'b???????????????????????1????0};
	      wildcard bins bit_4_rd_as_0 = {29'b???????????????????????0????1};
	      wildcard bins bit_4_rd_as_1 = {29'b???????????????????????1????1};
	      wildcard bins bit_5_wr_as_0 = {29'b??????????????????????0?????0};
	      wildcard bins bit_5_wr_as_1 = {29'b??????????????????????1?????0};
	      wildcard bins bit_5_rd_as_0 = {29'b??????????????????????0?????1};
	      wildcard bins bit_5_rd_as_1 = {29'b??????????????????????1?????1};
	      wildcard bins bit_6_wr_as_0 = {29'b?????????????????????0??????0};
	      wildcard bins bit_6_wr_as_1 = {29'b?????????????????????1??????0};
	      wildcard bins bit_6_rd_as_0 = {29'b?????????????????????0??????1};
	      wildcard bins bit_6_rd_as_1 = {29'b?????????????????????1??????1};
	      wildcard bins bit_7_wr_as_0 = {29'b????????????????????0???????0};
	      wildcard bins bit_7_wr_as_1 = {29'b????????????????????1???????0};
	      wildcard bins bit_7_rd_as_0 = {29'b????????????????????0???????1};
	      wildcard bins bit_7_rd_as_1 = {29'b????????????????????1???????1};
	      wildcard bins bit_8_wr_as_0 = {29'b???????????????????0????????0};
	      wildcard bins bit_8_wr_as_1 = {29'b???????????????????1????????0};
	      wildcard bins bit_8_rd_as_0 = {29'b???????????????????0????????1};
	      wildcard bins bit_8_rd_as_1 = {29'b???????????????????1????????1};
	      wildcard bins bit_9_wr_as_0 = {29'b??????????????????0?????????0};
	      wildcard bins bit_9_wr_as_1 = {29'b??????????????????1?????????0};
	      wildcard bins bit_9_rd_as_0 = {29'b??????????????????0?????????1};
	      wildcard bins bit_9_rd_as_1 = {29'b??????????????????1?????????1};
	      wildcard bins bit_10_wr_as_0 = {29'b?????????????????0??????????0};
	      wildcard bins bit_10_wr_as_1 = {29'b?????????????????1??????????0};
	      wildcard bins bit_10_rd_as_0 = {29'b?????????????????0??????????1};
	      wildcard bins bit_10_rd_as_1 = {29'b?????????????????1??????????1};
	      wildcard bins bit_11_wr_as_0 = {29'b????????????????0???????????0};
	      wildcard bins bit_11_wr_as_1 = {29'b????????????????1???????????0};
	      wildcard bins bit_11_rd_as_0 = {29'b????????????????0???????????1};
	      wildcard bins bit_11_rd_as_1 = {29'b????????????????1???????????1};
	      wildcard bins bit_12_wr_as_0 = {29'b???????????????0????????????0};
	      wildcard bins bit_12_wr_as_1 = {29'b???????????????1????????????0};
	      wildcard bins bit_12_rd_as_0 = {29'b???????????????0????????????1};
	      wildcard bins bit_12_rd_as_1 = {29'b???????????????1????????????1};
	      wildcard bins bit_13_wr_as_0 = {29'b??????????????0?????????????0};
	      wildcard bins bit_13_wr_as_1 = {29'b??????????????1?????????????0};
	      wildcard bins bit_13_rd_as_0 = {29'b??????????????0?????????????1};
	      wildcard bins bit_13_rd_as_1 = {29'b??????????????1?????????????1};
	      wildcard bins bit_14_wr_as_0 = {29'b?????????????0??????????????0};
	      wildcard bins bit_14_wr_as_1 = {29'b?????????????1??????????????0};
	      wildcard bins bit_14_rd_as_0 = {29'b?????????????0??????????????1};
	      wildcard bins bit_14_rd_as_1 = {29'b?????????????1??????????????1};
	      wildcard bins bit_15_wr_as_0 = {29'b????????????0???????????????0};
	      wildcard bins bit_15_wr_as_1 = {29'b????????????1???????????????0};
	      wildcard bins bit_15_rd_as_0 = {29'b????????????0???????????????1};
	      wildcard bins bit_15_rd_as_1 = {29'b????????????1???????????????1};
	      wildcard bins bit_16_wr_as_0 = {29'b???????????0????????????????0};
	      wildcard bins bit_16_wr_as_1 = {29'b???????????1????????????????0};
	      wildcard bins bit_16_rd_as_0 = {29'b???????????0????????????????1};
	      wildcard bins bit_16_rd_as_1 = {29'b???????????1????????????????1};
	      wildcard bins bit_17_wr_as_0 = {29'b??????????0?????????????????0};
	      wildcard bins bit_17_wr_as_1 = {29'b??????????1?????????????????0};
	      wildcard bins bit_17_rd_as_0 = {29'b??????????0?????????????????1};
	      wildcard bins bit_17_rd_as_1 = {29'b??????????1?????????????????1};
	      wildcard bins bit_18_wr_as_0 = {29'b?????????0??????????????????0};
	      wildcard bins bit_18_wr_as_1 = {29'b?????????1??????????????????0};
	      wildcard bins bit_18_rd_as_0 = {29'b?????????0??????????????????1};
	      wildcard bins bit_18_rd_as_1 = {29'b?????????1??????????????????1};
	      wildcard bins bit_19_wr_as_0 = {29'b????????0???????????????????0};
	      wildcard bins bit_19_wr_as_1 = {29'b????????1???????????????????0};
	      wildcard bins bit_19_rd_as_0 = {29'b????????0???????????????????1};
	      wildcard bins bit_19_rd_as_1 = {29'b????????1???????????????????1};
	      wildcard bins bit_20_wr_as_0 = {29'b???????0????????????????????0};
	      wildcard bins bit_20_wr_as_1 = {29'b???????1????????????????????0};
	      wildcard bins bit_20_rd_as_0 = {29'b???????0????????????????????1};
	      wildcard bins bit_20_rd_as_1 = {29'b???????1????????????????????1};
	      wildcard bins bit_21_wr_as_0 = {29'b??????0?????????????????????0};
	      wildcard bins bit_21_wr_as_1 = {29'b??????1?????????????????????0};
	      wildcard bins bit_21_rd_as_0 = {29'b??????0?????????????????????1};
	      wildcard bins bit_21_rd_as_1 = {29'b??????1?????????????????????1};
	      wildcard bins bit_22_wr_as_0 = {29'b?????0??????????????????????0};
	      wildcard bins bit_22_wr_as_1 = {29'b?????1??????????????????????0};
	      wildcard bins bit_22_rd_as_0 = {29'b?????0??????????????????????1};
	      wildcard bins bit_22_rd_as_1 = {29'b?????1??????????????????????1};
	      wildcard bins bit_23_wr_as_0 = {29'b????0???????????????????????0};
	      wildcard bins bit_23_wr_as_1 = {29'b????1???????????????????????0};
	      wildcard bins bit_23_rd_as_0 = {29'b????0???????????????????????1};
	      wildcard bins bit_23_rd_as_1 = {29'b????1???????????????????????1};
	      wildcard bins bit_24_wr_as_0 = {29'b???0????????????????????????0};
	      wildcard bins bit_24_wr_as_1 = {29'b???1????????????????????????0};
	      wildcard bins bit_24_rd_as_0 = {29'b???0????????????????????????1};
	      wildcard bins bit_24_rd_as_1 = {29'b???1????????????????????????1};
	      wildcard bins bit_25_wr_as_0 = {29'b??0?????????????????????????0};
	      wildcard bins bit_25_wr_as_1 = {29'b??1?????????????????????????0};
	      wildcard bins bit_25_rd_as_0 = {29'b??0?????????????????????????1};
	      wildcard bins bit_25_rd_as_1 = {29'b??1?????????????????????????1};
	      wildcard bins bit_26_wr_as_0 = {29'b?0??????????????????????????0};
	      wildcard bins bit_26_wr_as_1 = {29'b?1??????????????????????????0};
	      wildcard bins bit_26_rd_as_0 = {29'b?0??????????????????????????1};
	      wildcard bins bit_26_rd_as_1 = {29'b?1??????????????????????????1};
	      wildcard bins bit_27_wr_as_0 = {29'b0???????????????????????????0};
	      wildcard bins bit_27_wr_as_1 = {29'b1???????????????????????????0};
	      wildcard bins bit_27_rd_as_0 = {29'b0???????????????????????????1};
	      wildcard bins bit_27_rd_as_1 = {29'b1???????????????????????????1};
	      option.weight = 112;
	   }
	endgroup
	function new(string name = "CHN_DESC");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.ADDRESS_MASK = uvm_reg_field::type_id::create("ADDRESS_MASK",,get_full_name());
      this.ADDRESS_MASK.configure(this, 28, 0, "RW", 0, 28'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_CHN_DESC)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CHN_DESC


class ral_reg_CHN_SWPTR extends uvm_reg;
	rand uvm_reg_field SWPTR_EN;
	rand uvm_reg_field SW_POINTER;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   SWPTR_EN: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   SW_POINTER: coverpoint {m_data[29:1], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {30'b????????????????????????????00};
	      wildcard bins bit_0_wr_as_1 = {30'b????????????????????????????10};
	      wildcard bins bit_0_rd_as_0 = {30'b????????????????????????????01};
	      wildcard bins bit_0_rd_as_1 = {30'b????????????????????????????11};
	      wildcard bins bit_1_wr_as_0 = {30'b???????????????????????????0?0};
	      wildcard bins bit_1_wr_as_1 = {30'b???????????????????????????1?0};
	      wildcard bins bit_1_rd_as_0 = {30'b???????????????????????????0?1};
	      wildcard bins bit_1_rd_as_1 = {30'b???????????????????????????1?1};
	      wildcard bins bit_2_wr_as_0 = {30'b??????????????????????????0??0};
	      wildcard bins bit_2_wr_as_1 = {30'b??????????????????????????1??0};
	      wildcard bins bit_2_rd_as_0 = {30'b??????????????????????????0??1};
	      wildcard bins bit_2_rd_as_1 = {30'b??????????????????????????1??1};
	      wildcard bins bit_3_wr_as_0 = {30'b?????????????????????????0???0};
	      wildcard bins bit_3_wr_as_1 = {30'b?????????????????????????1???0};
	      wildcard bins bit_3_rd_as_0 = {30'b?????????????????????????0???1};
	      wildcard bins bit_3_rd_as_1 = {30'b?????????????????????????1???1};
	      wildcard bins bit_4_wr_as_0 = {30'b????????????????????????0????0};
	      wildcard bins bit_4_wr_as_1 = {30'b????????????????????????1????0};
	      wildcard bins bit_4_rd_as_0 = {30'b????????????????????????0????1};
	      wildcard bins bit_4_rd_as_1 = {30'b????????????????????????1????1};
	      wildcard bins bit_5_wr_as_0 = {30'b???????????????????????0?????0};
	      wildcard bins bit_5_wr_as_1 = {30'b???????????????????????1?????0};
	      wildcard bins bit_5_rd_as_0 = {30'b???????????????????????0?????1};
	      wildcard bins bit_5_rd_as_1 = {30'b???????????????????????1?????1};
	      wildcard bins bit_6_wr_as_0 = {30'b??????????????????????0??????0};
	      wildcard bins bit_6_wr_as_1 = {30'b??????????????????????1??????0};
	      wildcard bins bit_6_rd_as_0 = {30'b??????????????????????0??????1};
	      wildcard bins bit_6_rd_as_1 = {30'b??????????????????????1??????1};
	      wildcard bins bit_7_wr_as_0 = {30'b?????????????????????0???????0};
	      wildcard bins bit_7_wr_as_1 = {30'b?????????????????????1???????0};
	      wildcard bins bit_7_rd_as_0 = {30'b?????????????????????0???????1};
	      wildcard bins bit_7_rd_as_1 = {30'b?????????????????????1???????1};
	      wildcard bins bit_8_wr_as_0 = {30'b????????????????????0????????0};
	      wildcard bins bit_8_wr_as_1 = {30'b????????????????????1????????0};
	      wildcard bins bit_8_rd_as_0 = {30'b????????????????????0????????1};
	      wildcard bins bit_8_rd_as_1 = {30'b????????????????????1????????1};
	      wildcard bins bit_9_wr_as_0 = {30'b???????????????????0?????????0};
	      wildcard bins bit_9_wr_as_1 = {30'b???????????????????1?????????0};
	      wildcard bins bit_9_rd_as_0 = {30'b???????????????????0?????????1};
	      wildcard bins bit_9_rd_as_1 = {30'b???????????????????1?????????1};
	      wildcard bins bit_10_wr_as_0 = {30'b??????????????????0??????????0};
	      wildcard bins bit_10_wr_as_1 = {30'b??????????????????1??????????0};
	      wildcard bins bit_10_rd_as_0 = {30'b??????????????????0??????????1};
	      wildcard bins bit_10_rd_as_1 = {30'b??????????????????1??????????1};
	      wildcard bins bit_11_wr_as_0 = {30'b?????????????????0???????????0};
	      wildcard bins bit_11_wr_as_1 = {30'b?????????????????1???????????0};
	      wildcard bins bit_11_rd_as_0 = {30'b?????????????????0???????????1};
	      wildcard bins bit_11_rd_as_1 = {30'b?????????????????1???????????1};
	      wildcard bins bit_12_wr_as_0 = {30'b????????????????0????????????0};
	      wildcard bins bit_12_wr_as_1 = {30'b????????????????1????????????0};
	      wildcard bins bit_12_rd_as_0 = {30'b????????????????0????????????1};
	      wildcard bins bit_12_rd_as_1 = {30'b????????????????1????????????1};
	      wildcard bins bit_13_wr_as_0 = {30'b???????????????0?????????????0};
	      wildcard bins bit_13_wr_as_1 = {30'b???????????????1?????????????0};
	      wildcard bins bit_13_rd_as_0 = {30'b???????????????0?????????????1};
	      wildcard bins bit_13_rd_as_1 = {30'b???????????????1?????????????1};
	      wildcard bins bit_14_wr_as_0 = {30'b??????????????0??????????????0};
	      wildcard bins bit_14_wr_as_1 = {30'b??????????????1??????????????0};
	      wildcard bins bit_14_rd_as_0 = {30'b??????????????0??????????????1};
	      wildcard bins bit_14_rd_as_1 = {30'b??????????????1??????????????1};
	      wildcard bins bit_15_wr_as_0 = {30'b?????????????0???????????????0};
	      wildcard bins bit_15_wr_as_1 = {30'b?????????????1???????????????0};
	      wildcard bins bit_15_rd_as_0 = {30'b?????????????0???????????????1};
	      wildcard bins bit_15_rd_as_1 = {30'b?????????????1???????????????1};
	      wildcard bins bit_16_wr_as_0 = {30'b????????????0????????????????0};
	      wildcard bins bit_16_wr_as_1 = {30'b????????????1????????????????0};
	      wildcard bins bit_16_rd_as_0 = {30'b????????????0????????????????1};
	      wildcard bins bit_16_rd_as_1 = {30'b????????????1????????????????1};
	      wildcard bins bit_17_wr_as_0 = {30'b???????????0?????????????????0};
	      wildcard bins bit_17_wr_as_1 = {30'b???????????1?????????????????0};
	      wildcard bins bit_17_rd_as_0 = {30'b???????????0?????????????????1};
	      wildcard bins bit_17_rd_as_1 = {30'b???????????1?????????????????1};
	      wildcard bins bit_18_wr_as_0 = {30'b??????????0??????????????????0};
	      wildcard bins bit_18_wr_as_1 = {30'b??????????1??????????????????0};
	      wildcard bins bit_18_rd_as_0 = {30'b??????????0??????????????????1};
	      wildcard bins bit_18_rd_as_1 = {30'b??????????1??????????????????1};
	      wildcard bins bit_19_wr_as_0 = {30'b?????????0???????????????????0};
	      wildcard bins bit_19_wr_as_1 = {30'b?????????1???????????????????0};
	      wildcard bins bit_19_rd_as_0 = {30'b?????????0???????????????????1};
	      wildcard bins bit_19_rd_as_1 = {30'b?????????1???????????????????1};
	      wildcard bins bit_20_wr_as_0 = {30'b????????0????????????????????0};
	      wildcard bins bit_20_wr_as_1 = {30'b????????1????????????????????0};
	      wildcard bins bit_20_rd_as_0 = {30'b????????0????????????????????1};
	      wildcard bins bit_20_rd_as_1 = {30'b????????1????????????????????1};
	      wildcard bins bit_21_wr_as_0 = {30'b???????0?????????????????????0};
	      wildcard bins bit_21_wr_as_1 = {30'b???????1?????????????????????0};
	      wildcard bins bit_21_rd_as_0 = {30'b???????0?????????????????????1};
	      wildcard bins bit_21_rd_as_1 = {30'b???????1?????????????????????1};
	      wildcard bins bit_22_wr_as_0 = {30'b??????0??????????????????????0};
	      wildcard bins bit_22_wr_as_1 = {30'b??????1??????????????????????0};
	      wildcard bins bit_22_rd_as_0 = {30'b??????0??????????????????????1};
	      wildcard bins bit_22_rd_as_1 = {30'b??????1??????????????????????1};
	      wildcard bins bit_23_wr_as_0 = {30'b?????0???????????????????????0};
	      wildcard bins bit_23_wr_as_1 = {30'b?????1???????????????????????0};
	      wildcard bins bit_23_rd_as_0 = {30'b?????0???????????????????????1};
	      wildcard bins bit_23_rd_as_1 = {30'b?????1???????????????????????1};
	      wildcard bins bit_24_wr_as_0 = {30'b????0????????????????????????0};
	      wildcard bins bit_24_wr_as_1 = {30'b????1????????????????????????0};
	      wildcard bins bit_24_rd_as_0 = {30'b????0????????????????????????1};
	      wildcard bins bit_24_rd_as_1 = {30'b????1????????????????????????1};
	      wildcard bins bit_25_wr_as_0 = {30'b???0?????????????????????????0};
	      wildcard bins bit_25_wr_as_1 = {30'b???1?????????????????????????0};
	      wildcard bins bit_25_rd_as_0 = {30'b???0?????????????????????????1};
	      wildcard bins bit_25_rd_as_1 = {30'b???1?????????????????????????1};
	      wildcard bins bit_26_wr_as_0 = {30'b??0??????????????????????????0};
	      wildcard bins bit_26_wr_as_1 = {30'b??1??????????????????????????0};
	      wildcard bins bit_26_rd_as_0 = {30'b??0??????????????????????????1};
	      wildcard bins bit_26_rd_as_1 = {30'b??1??????????????????????????1};
	      wildcard bins bit_27_wr_as_0 = {30'b?0???????????????????????????0};
	      wildcard bins bit_27_wr_as_1 = {30'b?1???????????????????????????0};
	      wildcard bins bit_27_rd_as_0 = {30'b?0???????????????????????????1};
	      wildcard bins bit_27_rd_as_1 = {30'b?1???????????????????????????1};
	      wildcard bins bit_28_wr_as_0 = {30'b0????????????????????????????0};
	      wildcard bins bit_28_wr_as_1 = {30'b1????????????????????????????0};
	      wildcard bins bit_28_rd_as_0 = {30'b0????????????????????????????1};
	      wildcard bins bit_28_rd_as_1 = {30'b1????????????????????????????1};
	      option.weight = 116;
	   }
	endgroup
	function new(string name = "CHN_SWPTR");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.SWPTR_EN = uvm_reg_field::type_id::create("SWPTR_EN",,get_full_name());
      this.SWPTR_EN.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 0);
      this.SW_POINTER = uvm_reg_field::type_id::create("SW_POINTER",,get_full_name());
      this.SW_POINTER.configure(this, 29, 1, "RW", 0, 29'h0, 0, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_CHN_SWPTR)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CHN_SWPTR


class ral_reg_CHN_CSR extends uvm_reg;
	rand uvm_reg_field CH_EN;
	rand uvm_reg_field DST_SEL;
	rand uvm_reg_field SRC_SEL;
	rand uvm_reg_field INC_DST;
	rand uvm_reg_field INC_SRC;
	rand uvm_reg_field MODE;
	rand uvm_reg_field ARS;
	rand uvm_reg_field USE_ED;
	rand uvm_reg_field SZ_WB;
	rand uvm_reg_field STOP;
	uvm_reg_field BUSY;
	uvm_reg_field DONE;
	rand uvm_reg_field ERR;
	rand uvm_reg_field PARITY;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   CH_EN: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   DST_SEL: coverpoint {m_data[1:1], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   SRC_SEL: coverpoint {m_data[2:2], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   INC_DST: coverpoint {m_data[3:3], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   INC_SRC: coverpoint {m_data[4:4], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   MODE: coverpoint {m_data[5:5], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   ARS: coverpoint {m_data[6:6], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   USE_ED: coverpoint {m_data[7:7], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   SZ_WB: coverpoint {m_data[8:8], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   STOP: coverpoint {m_data[9:9], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      option.weight = 2;
	   }
	   BUSY: coverpoint {m_data[10:10], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd = {2'b?1};
	      option.weight = 3;
	   }
	   DONE: coverpoint {m_data[11:11], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd = {2'b?1};
	      option.weight = 3;
	   }
	   ERR: coverpoint {m_data[12:12], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {2'b00};
	      wildcard bins bit_0_wr_as_1 = {2'b10};
	      wildcard bins bit_0_rd_as_0 = {2'b01};
	      wildcard bins bit_0_rd_as_1 = {2'b11};
	      option.weight = 4;
	   }
	   PARITY: coverpoint {m_data[15:13], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {4'b??00};
	      wildcard bins bit_0_wr_as_1 = {4'b??10};
	      wildcard bins bit_0_rd_as_0 = {4'b??01};
	      wildcard bins bit_0_rd_as_1 = {4'b??11};
	      wildcard bins bit_1_wr_as_0 = {4'b?0?0};
	      wildcard bins bit_1_wr_as_1 = {4'b?1?0};
	      wildcard bins bit_1_rd_as_0 = {4'b?0?1};
	      wildcard bins bit_1_rd_as_1 = {4'b?1?1};
	      wildcard bins bit_2_wr_as_0 = {4'b0??0};
	      wildcard bins bit_2_wr_as_1 = {4'b1??0};
	      wildcard bins bit_2_rd_as_0 = {4'b0??1};
	      wildcard bins bit_2_rd_as_1 = {4'b1??1};
	      option.weight = 12;
	   }
	endgroup
	function new(string name = "CHN_CSR");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.CH_EN = uvm_reg_field::type_id::create("CH_EN",,get_full_name());
      this.CH_EN.configure(this, 1, 0, "RW", 0, 1'h0, 1, 0, 0);
      this.DST_SEL = uvm_reg_field::type_id::create("DST_SEL",,get_full_name());
      this.DST_SEL.configure(this, 1, 1, "RW", 0, 1'h0, 1, 0, 0);
      this.SRC_SEL = uvm_reg_field::type_id::create("SRC_SEL",,get_full_name());
      this.SRC_SEL.configure(this, 1, 2, "RW", 0, 1'h0, 1, 0, 0);
      this.INC_DST = uvm_reg_field::type_id::create("INC_DST",,get_full_name());
      this.INC_DST.configure(this, 1, 3, "RW", 0, 1'h0, 1, 0, 0);
      this.INC_SRC = uvm_reg_field::type_id::create("INC_SRC",,get_full_name());
      this.INC_SRC.configure(this, 1, 4, "RW", 0, 1'h0, 1, 0, 0);
      this.MODE = uvm_reg_field::type_id::create("MODE",,get_full_name());
      this.MODE.configure(this, 1, 5, "RW", 0, 1'h0, 1, 0, 0);
      this.ARS = uvm_reg_field::type_id::create("ARS",,get_full_name());
      this.ARS.configure(this, 1, 6, "RW", 0, 1'h0, 1, 0, 0);
      this.USE_ED = uvm_reg_field::type_id::create("USE_ED",,get_full_name());
      this.USE_ED.configure(this, 1, 7, "RW", 0, 1'h0, 1, 0, 0);
      this.SZ_WB = uvm_reg_field::type_id::create("SZ_WB",,get_full_name());
      this.SZ_WB.configure(this, 1, 8, "RW", 0, 1'h0, 1, 0, 0);
      this.STOP = uvm_reg_field::type_id::create("STOP",,get_full_name());
      this.STOP.configure(this, 1, 9, "WO", 0, 1'h0, 1, 0, 0);
      this.BUSY = uvm_reg_field::type_id::create("BUSY",,get_full_name());
      this.BUSY.configure(this, 1, 10, "RO", 0, 1'h0, 1, 0, 0);
      this.DONE = uvm_reg_field::type_id::create("DONE",,get_full_name());
      this.DONE.configure(this, 1, 11, "RO", 0, 1'h0, 1, 0, 0);
      this.ERR = uvm_reg_field::type_id::create("ERR",,get_full_name());
      this.ERR.configure(this, 1, 12, "RC", 0, 1'h0, 1, 0, 0);
      this.PARITY = uvm_reg_field::type_id::create("PARITY",,get_full_name());
      this.PARITY.configure(this, 3, 13, "RW", 0, 3'h0, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_CHN_CSR)


	virtual function void sample(uvm_reg_data_t data,
	                             uvm_reg_data_t byte_en,
	                             bit            is_read,
	                             uvm_reg_map    map);
	   if (get_coverage(UVM_CVR_REG_BITS)) begin
	      m_data    = data;
	      m_be      = byte_en;
	      m_is_read = is_read;
	      cg_bits.sample();
	   end
	endfunction
endclass : ral_reg_CHN_CSR


class ral_block_wb_dma extends uvm_reg_block;
	rand ral_reg_CSR CSR;
	rand ral_reg_INT_MASKA INT_MASKA;
	rand ral_reg_INT_MASKB INT_MASKB;
	rand ral_reg_INT_SRCA INT_SRCA;
	rand ral_reg_INT_SRCB INT_SRCB;
	rand ral_reg_CH0_CSR CH0_CSR;
	rand ral_reg_CHN_SZ ch0_sz;
	rand ral_reg_CHN_A0 ch0_a0;
	rand ral_reg_CHN_AM0 ch0_am0;
	rand ral_reg_CHN_A1 ch0_a1;
	rand ral_reg_CHN_AM1 ch0_am1;
	rand ral_reg_CHN_DESC ch0_desc;
	rand ral_reg_CHN_SWPTR ch0_swptr;
	rand ral_reg_CHN_CSR ch1_csr;
	rand ral_reg_CHN_SZ ch1_sz;
	rand ral_reg_CHN_A0 ch1_a0;
	rand ral_reg_CHN_AM0 ch1_am0;
	rand ral_reg_CHN_A1 ch1_a1;
	rand ral_reg_CHN_AM1 ch1_am1;
	rand ral_reg_CHN_DESC ch1_desc;
	rand ral_reg_CHN_SWPTR ch1_swptr;
	rand ral_reg_CHN_CSR ch2_csr;
	rand ral_reg_CHN_SZ ch2_sz;
	rand ral_reg_CHN_A0 ch2_a0;
	rand ral_reg_CHN_AM0 ch2_am0;
	rand ral_reg_CHN_A1 ch2_a1;
	rand ral_reg_CHN_AM1 ch2_am1;
	rand ral_reg_CHN_DESC ch2_desc;
	rand ral_reg_CHN_SWPTR ch2_swptr;
	rand ral_reg_CHN_CSR ch3_csr;
	rand ral_reg_CHN_SZ ch3_sz;
	rand ral_reg_CHN_A0 ch3_a0;
	rand ral_reg_CHN_AM0 ch3_am0;
	rand ral_reg_CHN_A1 ch3_a1;
	rand ral_reg_CHN_AM1 ch3_am1;
	rand ral_reg_CHN_DESC ch3_desc;
	rand ral_reg_CHN_SWPTR ch3_swptr;
	rand ral_reg_CHN_CSR ch4_csr;
	rand ral_reg_CHN_SZ ch4_sz;
	rand ral_reg_CHN_A0 ch4_a0;
	rand ral_reg_CHN_AM0 ch4_am0;
	rand ral_reg_CHN_A1 ch4_a1;
	rand ral_reg_CHN_AM1 ch4_am1;
	rand ral_reg_CHN_DESC ch4_desc;
	rand ral_reg_CHN_SWPTR ch4_swptr;
	rand ral_reg_CHN_CSR ch5_csr;
	rand ral_reg_CHN_SZ ch5_sz;
	rand ral_reg_CHN_A0 ch5_a0;
	rand ral_reg_CHN_AM0 ch5_am0;
	rand ral_reg_CHN_A1 ch5_a1;
	rand ral_reg_CHN_AM1 ch5_am1;
	rand ral_reg_CHN_DESC ch5_desc;
	rand ral_reg_CHN_SWPTR ch5_swptr;
	rand ral_reg_CHN_CSR ch6_csr;
	rand ral_reg_CHN_SZ ch6_sz;
	rand ral_reg_CHN_A0 ch6_a0;
	rand ral_reg_CHN_AM0 ch6_am0;
	rand ral_reg_CHN_A1 ch6_a1;
	rand ral_reg_CHN_AM1 ch6_am1;
	rand ral_reg_CHN_DESC ch6_desc;
	rand ral_reg_CHN_SWPTR ch6_swptr;
	rand ral_reg_CHN_CSR ch7_csr;
	rand ral_reg_CHN_SZ ch7_sz;
	rand ral_reg_CHN_A0 ch7_a0;
	rand ral_reg_CHN_AM0 ch7_am0;
	rand ral_reg_CHN_A1 ch7_a1;
	rand ral_reg_CHN_AM1 ch7_am1;
	rand ral_reg_CHN_DESC ch7_desc;
	rand ral_reg_CHN_SWPTR ch7_swptr;
	rand ral_reg_CHN_CSR ch8_csr;
	rand ral_reg_CHN_SZ ch8_sz;
	rand ral_reg_CHN_A0 ch8_a0;
	rand ral_reg_CHN_AM0 ch8_am0;
	rand ral_reg_CHN_A1 ch8_a1;
	rand ral_reg_CHN_AM1 ch8_am1;
	rand ral_reg_CHN_DESC ch8_desc;
	rand ral_reg_CHN_SWPTR ch8_swptr;
	rand ral_reg_CHN_CSR ch9_csr;
	rand ral_reg_CHN_SZ ch9_sz;
	rand ral_reg_CHN_A0 ch9_a0;
	rand ral_reg_CHN_AM0 ch9_am0;
	rand ral_reg_CHN_A1 ch9_a1;
	rand ral_reg_CHN_AM1 ch9_am1;
	rand ral_reg_CHN_DESC ch9_desc;
	rand ral_reg_CHN_SWPTR ch9_swptr;
	rand ral_reg_CHN_CSR ch10_csr;
	rand ral_reg_CHN_SZ ch10_sz;
	rand ral_reg_CHN_A0 ch10_a0;
	rand ral_reg_CHN_AM0 ch10_am0;
	rand ral_reg_CHN_A1 ch10_a1;
	rand ral_reg_CHN_AM1 ch10_am1;
	rand ral_reg_CHN_DESC ch10_desc;
	rand ral_reg_CHN_SWPTR ch10_swptr;
	rand ral_reg_CHN_CSR ch11_csr;
	rand ral_reg_CHN_SZ ch11_sz;
	rand ral_reg_CHN_A0 ch11_a0;
	rand ral_reg_CHN_AM0 ch11_am0;
	rand ral_reg_CHN_A1 ch11_a1;
	rand ral_reg_CHN_AM1 ch11_am1;
	rand ral_reg_CHN_DESC ch11_desc;
	rand ral_reg_CHN_SWPTR ch11_swptr;
	rand ral_reg_CHN_CSR ch12_csr;
	rand ral_reg_CHN_SZ ch12_sz;
	rand ral_reg_CHN_A0 ch12_a0;
	rand ral_reg_CHN_AM0 ch12_am0;
	rand ral_reg_CHN_A1 ch12_a1;
	rand ral_reg_CHN_AM1 ch12_am1;
	rand ral_reg_CHN_DESC ch12_desc;
	rand ral_reg_CHN_SWPTR ch12_swptr;
	rand ral_reg_CHN_CSR ch13_csr;
	rand ral_reg_CHN_SZ ch13_sz;
	rand ral_reg_CHN_A0 ch13_a0;
	rand ral_reg_CHN_AM0 ch13_am0;
	rand ral_reg_CHN_A1 ch13_a1;
	rand ral_reg_CHN_AM1 ch13_am1;
	rand ral_reg_CHN_DESC ch13_desc;
	rand ral_reg_CHN_SWPTR ch13_swptr;
	rand ral_reg_CHN_CSR ch14_csr;
	rand ral_reg_CHN_SZ ch14_sz;
	rand ral_reg_CHN_A0 ch14_a0;
	rand ral_reg_CHN_AM0 ch14_am0;
	rand ral_reg_CHN_A1 ch14_a1;
	rand ral_reg_CHN_AM1 ch14_am1;
	rand ral_reg_CHN_DESC ch14_desc;
	rand ral_reg_CHN_SWPTR ch14_swptr;
	rand ral_reg_CHN_CSR ch15_csr;
	rand ral_reg_CHN_SZ ch15_sz;
	rand ral_reg_CHN_A0 ch15_a0;
	rand ral_reg_CHN_AM0 ch15_am0;
	rand ral_reg_CHN_A1 ch15_a1;
	rand ral_reg_CHN_AM1 ch15_am1;
	rand ral_reg_CHN_DESC ch15_desc;
	rand ral_reg_CHN_SWPTR ch15_swptr;
	rand ral_reg_CHN_CSR ch16_csr;
	rand ral_reg_CHN_SZ ch16_sz;
	rand ral_reg_CHN_A0 ch16_a0;
	rand ral_reg_CHN_AM0 ch16_am0;
	rand ral_reg_CHN_A1 ch16_a1;
	rand ral_reg_CHN_AM1 ch16_am1;
	rand ral_reg_CHN_DESC ch16_desc;
	rand ral_reg_CHN_SWPTR ch16_swptr;
	rand ral_reg_CHN_CSR ch17_csr;
	rand ral_reg_CHN_SZ ch17_sz;
	rand ral_reg_CHN_A0 ch17_a0;
	rand ral_reg_CHN_AM0 ch17_am0;
	rand ral_reg_CHN_A1 ch17_a1;
	rand ral_reg_CHN_AM1 ch17_am1;
	rand ral_reg_CHN_DESC ch17_desc;
	rand ral_reg_CHN_SWPTR ch17_swptr;
	rand ral_reg_CHN_CSR ch18_csr;
	rand ral_reg_CHN_SZ ch18_sz;
	rand ral_reg_CHN_A0 ch18_a0;
	rand ral_reg_CHN_AM0 ch18_am0;
	rand ral_reg_CHN_A1 ch18_a1;
	rand ral_reg_CHN_AM1 ch18_am1;
	rand ral_reg_CHN_DESC ch18_desc;
	rand ral_reg_CHN_SWPTR ch18_swptr;
	rand ral_reg_CHN_CSR ch19_csr;
	rand ral_reg_CHN_SZ ch19_sz;
	rand ral_reg_CHN_A0 ch19_a0;
	rand ral_reg_CHN_AM0 ch19_am0;
	rand ral_reg_CHN_A1 ch19_a1;
	rand ral_reg_CHN_AM1 ch19_am1;
	rand ral_reg_CHN_DESC ch19_desc;
	rand ral_reg_CHN_SWPTR ch19_swptr;
	rand ral_reg_CHN_CSR ch20_csr;
	rand ral_reg_CHN_SZ ch20_sz;
	rand ral_reg_CHN_A0 ch20_a0;
	rand ral_reg_CHN_AM0 ch20_am0;
	rand ral_reg_CHN_A1 ch20_a1;
	rand ral_reg_CHN_AM1 ch20_am1;
	rand ral_reg_CHN_DESC ch20_desc;
	rand ral_reg_CHN_SWPTR ch20_swptr;
	rand ral_reg_CHN_CSR ch21_csr;
	rand ral_reg_CHN_SZ ch21_sz;
	rand ral_reg_CHN_A0 ch21_a0;
	rand ral_reg_CHN_AM0 ch21_am0;
	rand ral_reg_CHN_A1 ch21_a1;
	rand ral_reg_CHN_AM1 ch21_am1;
	rand ral_reg_CHN_DESC ch21_desc;
	rand ral_reg_CHN_SWPTR ch21_swptr;
	rand ral_reg_CHN_CSR ch22_csr;
	rand ral_reg_CHN_SZ ch22_sz;
	rand ral_reg_CHN_A0 ch22_a0;
	rand ral_reg_CHN_AM0 ch22_am0;
	rand ral_reg_CHN_A1 ch22_a1;
	rand ral_reg_CHN_AM1 ch22_am1;
	rand ral_reg_CHN_DESC ch22_desc;
	rand ral_reg_CHN_SWPTR ch22_swptr;
	rand ral_reg_CHN_CSR ch23_csr;
	rand ral_reg_CHN_SZ ch23_sz;
	rand ral_reg_CHN_A0 ch23_a0;
	rand ral_reg_CHN_AM0 ch23_am0;
	rand ral_reg_CHN_A1 ch23_a1;
	rand ral_reg_CHN_AM1 ch23_am1;
	rand ral_reg_CHN_DESC ch23_desc;
	rand ral_reg_CHN_SWPTR ch23_swptr;
	rand ral_reg_CHN_CSR ch24_csr;
	rand ral_reg_CHN_SZ ch24_sz;
	rand ral_reg_CHN_A0 ch24_a0;
	rand ral_reg_CHN_AM0 ch24_am0;
	rand ral_reg_CHN_A1 ch24_a1;
	rand ral_reg_CHN_AM1 ch24_am1;
	rand ral_reg_CHN_DESC ch24_desc;
	rand ral_reg_CHN_SWPTR ch24_swptr;
	rand ral_reg_CHN_CSR ch25_csr;
	rand ral_reg_CHN_SZ ch25_sz;
	rand ral_reg_CHN_A0 ch25_a0;
	rand ral_reg_CHN_AM0 ch25_am0;
	rand ral_reg_CHN_A1 ch25_a1;
	rand ral_reg_CHN_AM1 ch25_am1;
	rand ral_reg_CHN_DESC ch25_desc;
	rand ral_reg_CHN_SWPTR ch25_swptr;
	rand ral_reg_CHN_CSR ch26_csr;
	rand ral_reg_CHN_SZ ch26_sz;
	rand ral_reg_CHN_A0 ch26_a0;
	rand ral_reg_CHN_AM0 ch26_am0;
	rand ral_reg_CHN_A1 ch26_a1;
	rand ral_reg_CHN_AM1 ch26_am1;
	rand ral_reg_CHN_DESC ch26_desc;
	rand ral_reg_CHN_SWPTR ch26_swptr;
	rand ral_reg_CHN_CSR ch27_csr;
	rand ral_reg_CHN_SZ ch27_sz;
	rand ral_reg_CHN_A0 ch27_a0;
	rand ral_reg_CHN_AM0 ch27_am0;
	rand ral_reg_CHN_A1 ch27_a1;
	rand ral_reg_CHN_AM1 ch27_am1;
	rand ral_reg_CHN_DESC ch27_desc;
	rand ral_reg_CHN_SWPTR ch27_swptr;
	rand ral_reg_CHN_CSR ch28_csr;
	rand ral_reg_CHN_SZ ch28_sz;
	rand ral_reg_CHN_A0 ch28_a0;
	rand ral_reg_CHN_AM0 ch28_am0;
	rand ral_reg_CHN_A1 ch28_a1;
	rand ral_reg_CHN_AM1 ch28_am1;
	rand ral_reg_CHN_DESC ch28_desc;
	rand ral_reg_CHN_SWPTR ch28_swptr;
	rand ral_reg_CHN_CSR ch29_csr;
	rand ral_reg_CHN_SZ ch29_sz;
	rand ral_reg_CHN_A0 ch29_a0;
	rand ral_reg_CHN_AM0 ch29_am0;
	rand ral_reg_CHN_A1 ch29_a1;
	rand ral_reg_CHN_AM1 ch29_am1;
	rand ral_reg_CHN_DESC ch29_desc;
	rand ral_reg_CHN_SWPTR ch29_swptr;
	rand ral_reg_CHN_CSR ch30_csr;
	rand ral_reg_CHN_SZ ch30_sz;
	rand ral_reg_CHN_A0 ch30_a0;
	rand ral_reg_CHN_AM0 ch30_am0;
	rand ral_reg_CHN_A1 ch30_a1;
	rand ral_reg_CHN_AM1 ch30_am1;
	rand ral_reg_CHN_DESC ch30_desc;
	rand ral_reg_CHN_SWPTR ch30_swptr;
   local uvm_reg_data_t m_offset;
	rand uvm_reg_field CSR_PAUSE;
	rand uvm_reg_field PAUSE;
	rand uvm_reg_field INT_MASKA_f_mask0;
	rand uvm_reg_field INT_MASKA_f_mask1;
	rand uvm_reg_field INT_MASKA_f_mask2;
	rand uvm_reg_field INT_MASKA_f_mask3;
	rand uvm_reg_field INT_MASKA_f_mask4;
	rand uvm_reg_field INT_MASKA_f_mask5;
	rand uvm_reg_field INT_MASKA_f_mask6;
	rand uvm_reg_field INT_MASKA_f_mask7;
	rand uvm_reg_field INT_MASKA_f_mask8;
	rand uvm_reg_field INT_MASKA_f_mask9;
	rand uvm_reg_field INT_MASKA_f_mask10;
	rand uvm_reg_field INT_MASKA_f_mask11;
	rand uvm_reg_field INT_MASKA_f_mask12;
	rand uvm_reg_field INT_MASKA_f_mask13;
	rand uvm_reg_field INT_MASKA_f_mask14;
	rand uvm_reg_field INT_MASKA_f_mask15;
	rand uvm_reg_field INT_MASKA_f_mask16;
	rand uvm_reg_field INT_MASKA_f_mask17;
	rand uvm_reg_field INT_MASKA_f_mask18;
	rand uvm_reg_field INT_MASKA_f_mask19;
	rand uvm_reg_field INT_MASKA_f_mask20;
	rand uvm_reg_field INT_MASKA_f_mask21;
	rand uvm_reg_field INT_MASKA_f_mask22;
	rand uvm_reg_field INT_MASKA_f_mask23;
	rand uvm_reg_field INT_MASKA_f_mask24;
	rand uvm_reg_field INT_MASKA_f_mask25;
	rand uvm_reg_field INT_MASKA_f_mask26;
	rand uvm_reg_field INT_MASKA_f_mask27;
	rand uvm_reg_field INT_MASKA_f_mask28;
	rand uvm_reg_field INT_MASKA_f_mask29;
	rand uvm_reg_field INT_MASKA_f_mask30;
	rand uvm_reg_field INT_MASKA_f_mask31;
	rand uvm_reg_field INT_MASKB_f_mask0;
	rand uvm_reg_field INT_MASKB_f_mask1;
	rand uvm_reg_field INT_MASKB_f_mask2;
	rand uvm_reg_field INT_MASKB_f_mask3;
	rand uvm_reg_field INT_MASKB_f_mask4;
	rand uvm_reg_field INT_MASKB_f_mask5;
	rand uvm_reg_field INT_MASKB_f_mask6;
	rand uvm_reg_field INT_MASKB_f_mask7;
	rand uvm_reg_field INT_MASKB_f_mask8;
	rand uvm_reg_field INT_MASKB_f_mask9;
	rand uvm_reg_field INT_MASKB_f_mask10;
	rand uvm_reg_field INT_MASKB_f_mask11;
	rand uvm_reg_field INT_MASKB_f_mask12;
	rand uvm_reg_field INT_MASKB_f_mask13;
	rand uvm_reg_field INT_MASKB_f_mask14;
	rand uvm_reg_field INT_MASKB_f_mask15;
	rand uvm_reg_field INT_MASKB_f_mask16;
	rand uvm_reg_field INT_MASKB_f_mask17;
	rand uvm_reg_field INT_MASKB_f_mask18;
	rand uvm_reg_field INT_MASKB_f_mask19;
	rand uvm_reg_field INT_MASKB_f_mask20;
	rand uvm_reg_field INT_MASKB_f_mask21;
	rand uvm_reg_field INT_MASKB_f_mask22;
	rand uvm_reg_field INT_MASKB_f_mask23;
	rand uvm_reg_field INT_MASKB_f_mask24;
	rand uvm_reg_field INT_MASKB_f_mask25;
	rand uvm_reg_field INT_MASKB_f_mask26;
	rand uvm_reg_field INT_MASKB_f_mask27;
	rand uvm_reg_field INT_MASKB_f_mask28;
	rand uvm_reg_field INT_MASKB_f_mask29;
	rand uvm_reg_field INT_MASKB_f_mask30;
	rand uvm_reg_field INT_MASKB_f_mask31;
	rand uvm_reg_field INT_SRCA_f_mask0;
	rand uvm_reg_field INT_SRCA_f_mask1;
	rand uvm_reg_field INT_SRCA_f_mask2;
	rand uvm_reg_field INT_SRCA_f_mask3;
	rand uvm_reg_field INT_SRCA_f_mask4;
	rand uvm_reg_field INT_SRCA_f_mask5;
	rand uvm_reg_field INT_SRCA_f_mask6;
	rand uvm_reg_field INT_SRCA_f_mask7;
	rand uvm_reg_field INT_SRCA_f_mask8;
	rand uvm_reg_field INT_SRCA_f_mask9;
	rand uvm_reg_field INT_SRCA_f_mask10;
	rand uvm_reg_field INT_SRCA_f_mask11;
	rand uvm_reg_field INT_SRCA_f_mask12;
	rand uvm_reg_field INT_SRCA_f_mask13;
	rand uvm_reg_field INT_SRCA_f_mask14;
	rand uvm_reg_field INT_SRCA_f_mask15;
	rand uvm_reg_field INT_SRCA_f_mask16;
	rand uvm_reg_field INT_SRCA_f_mask17;
	rand uvm_reg_field INT_SRCA_f_mask18;
	rand uvm_reg_field INT_SRCA_f_mask19;
	rand uvm_reg_field INT_SRCA_f_mask20;
	rand uvm_reg_field INT_SRCA_f_mask21;
	rand uvm_reg_field INT_SRCA_f_mask22;
	rand uvm_reg_field INT_SRCA_f_mask23;
	rand uvm_reg_field INT_SRCA_f_mask24;
	rand uvm_reg_field INT_SRCA_f_mask25;
	rand uvm_reg_field INT_SRCA_f_mask26;
	rand uvm_reg_field INT_SRCA_f_mask27;
	rand uvm_reg_field INT_SRCA_f_mask28;
	rand uvm_reg_field INT_SRCA_f_mask29;
	rand uvm_reg_field INT_SRCA_f_mask30;
	rand uvm_reg_field INT_SRCA_f_mask31;
	rand uvm_reg_field INT_SRCB_f_mask0;
	rand uvm_reg_field INT_SRCB_f_mask1;
	rand uvm_reg_field INT_SRCB_f_mask2;
	rand uvm_reg_field INT_SRCB_f_mask3;
	rand uvm_reg_field INT_SRCB_f_mask4;
	rand uvm_reg_field INT_SRCB_f_mask5;
	rand uvm_reg_field INT_SRCB_f_mask6;
	rand uvm_reg_field INT_SRCB_f_mask7;
	rand uvm_reg_field INT_SRCB_f_mask8;
	rand uvm_reg_field INT_SRCB_f_mask9;
	rand uvm_reg_field INT_SRCB_f_mask10;
	rand uvm_reg_field INT_SRCB_f_mask11;
	rand uvm_reg_field INT_SRCB_f_mask12;
	rand uvm_reg_field INT_SRCB_f_mask13;
	rand uvm_reg_field INT_SRCB_f_mask14;
	rand uvm_reg_field INT_SRCB_f_mask15;
	rand uvm_reg_field INT_SRCB_f_mask16;
	rand uvm_reg_field INT_SRCB_f_mask17;
	rand uvm_reg_field INT_SRCB_f_mask18;
	rand uvm_reg_field INT_SRCB_f_mask19;
	rand uvm_reg_field INT_SRCB_f_mask20;
	rand uvm_reg_field INT_SRCB_f_mask21;
	rand uvm_reg_field INT_SRCB_f_mask22;
	rand uvm_reg_field INT_SRCB_f_mask23;
	rand uvm_reg_field INT_SRCB_f_mask24;
	rand uvm_reg_field INT_SRCB_f_mask25;
	rand uvm_reg_field INT_SRCB_f_mask26;
	rand uvm_reg_field INT_SRCB_f_mask27;
	rand uvm_reg_field INT_SRCB_f_mask28;
	rand uvm_reg_field INT_SRCB_f_mask29;
	rand uvm_reg_field INT_SRCB_f_mask30;
	rand uvm_reg_field INT_SRCB_f_mask31;
	rand uvm_reg_field CH0_CSR_CH_EN;
	rand uvm_reg_field CH0_CSR_DST_SEL;
	rand uvm_reg_field CH0_CSR_SRC_SEL;
	rand uvm_reg_field CH0_CSR_INC_DST;
	rand uvm_reg_field CH0_CSR_INC_SRC;
	rand uvm_reg_field CH0_CSR_MODE;
	rand uvm_reg_field CH0_CSR_ARS;
	rand uvm_reg_field CH0_CSR_USE_ED;
	rand uvm_reg_field CH0_CSR_SZ_WB;
	rand uvm_reg_field CH0_CSR_STOP;
	uvm_reg_field CH0_CSR_BUSY;
	uvm_reg_field CH0_CSR_DONE;
	rand uvm_reg_field CH0_CSR_ERR;
	rand uvm_reg_field CH0_CSR_PARITY;
	rand uvm_reg_field ch0_sz_CHK_SZ;
	rand uvm_reg_field ch0_sz_TOT_SZ;
	rand uvm_reg_field ch0_a0_ADDRESS;
	rand uvm_reg_field ch0_am0_ADDRESS_MASK;
	rand uvm_reg_field ch0_a1_ADDRESS;
	rand uvm_reg_field ch0_am1_ADDRESS_MASK;
	rand uvm_reg_field ch0_desc_ADDRESS_MASK;
	rand uvm_reg_field ch0_swptr_SWPTR_EN;
	rand uvm_reg_field ch0_swptr_SW_POINTER;
	rand uvm_reg_field ch1_csr_CH_EN;
	rand uvm_reg_field ch1_csr_DST_SEL;
	rand uvm_reg_field ch1_csr_SRC_SEL;
	rand uvm_reg_field ch1_csr_INC_DST;
	rand uvm_reg_field ch1_csr_INC_SRC;
	rand uvm_reg_field ch1_csr_MODE;
	rand uvm_reg_field ch1_csr_ARS;
	rand uvm_reg_field ch1_csr_USE_ED;
	rand uvm_reg_field ch1_csr_SZ_WB;
	rand uvm_reg_field ch1_csr_STOP;
	uvm_reg_field ch1_csr_BUSY;
	uvm_reg_field ch1_csr_DONE;
	rand uvm_reg_field ch1_csr_ERR;
	rand uvm_reg_field ch1_csr_PARITY;
	rand uvm_reg_field ch1_sz_CHK_SZ;
	rand uvm_reg_field ch1_sz_TOT_SZ;
	rand uvm_reg_field ch1_a0_ADDRESS;
	rand uvm_reg_field ch1_am0_ADDRESS_MASK;
	rand uvm_reg_field ch1_a1_ADDRESS;
	rand uvm_reg_field ch1_am1_ADDRESS_MASK;
	rand uvm_reg_field ch1_desc_ADDRESS_MASK;
	rand uvm_reg_field ch1_swptr_SWPTR_EN;
	rand uvm_reg_field ch1_swptr_SW_POINTER;
	rand uvm_reg_field ch2_csr_CH_EN;
	rand uvm_reg_field ch2_csr_DST_SEL;
	rand uvm_reg_field ch2_csr_SRC_SEL;
	rand uvm_reg_field ch2_csr_INC_DST;
	rand uvm_reg_field ch2_csr_INC_SRC;
	rand uvm_reg_field ch2_csr_MODE;
	rand uvm_reg_field ch2_csr_ARS;
	rand uvm_reg_field ch2_csr_USE_ED;
	rand uvm_reg_field ch2_csr_SZ_WB;
	rand uvm_reg_field ch2_csr_STOP;
	uvm_reg_field ch2_csr_BUSY;
	uvm_reg_field ch2_csr_DONE;
	rand uvm_reg_field ch2_csr_ERR;
	rand uvm_reg_field ch2_csr_PARITY;
	rand uvm_reg_field ch2_sz_CHK_SZ;
	rand uvm_reg_field ch2_sz_TOT_SZ;
	rand uvm_reg_field ch2_a0_ADDRESS;
	rand uvm_reg_field ch2_am0_ADDRESS_MASK;
	rand uvm_reg_field ch2_a1_ADDRESS;
	rand uvm_reg_field ch2_am1_ADDRESS_MASK;
	rand uvm_reg_field ch2_desc_ADDRESS_MASK;
	rand uvm_reg_field ch2_swptr_SWPTR_EN;
	rand uvm_reg_field ch2_swptr_SW_POINTER;
	rand uvm_reg_field ch3_csr_CH_EN;
	rand uvm_reg_field ch3_csr_DST_SEL;
	rand uvm_reg_field ch3_csr_SRC_SEL;
	rand uvm_reg_field ch3_csr_INC_DST;
	rand uvm_reg_field ch3_csr_INC_SRC;
	rand uvm_reg_field ch3_csr_MODE;
	rand uvm_reg_field ch3_csr_ARS;
	rand uvm_reg_field ch3_csr_USE_ED;
	rand uvm_reg_field ch3_csr_SZ_WB;
	rand uvm_reg_field ch3_csr_STOP;
	uvm_reg_field ch3_csr_BUSY;
	uvm_reg_field ch3_csr_DONE;
	rand uvm_reg_field ch3_csr_ERR;
	rand uvm_reg_field ch3_csr_PARITY;
	rand uvm_reg_field ch3_sz_CHK_SZ;
	rand uvm_reg_field ch3_sz_TOT_SZ;
	rand uvm_reg_field ch3_a0_ADDRESS;
	rand uvm_reg_field ch3_am0_ADDRESS_MASK;
	rand uvm_reg_field ch3_a1_ADDRESS;
	rand uvm_reg_field ch3_am1_ADDRESS_MASK;
	rand uvm_reg_field ch3_desc_ADDRESS_MASK;
	rand uvm_reg_field ch3_swptr_SWPTR_EN;
	rand uvm_reg_field ch3_swptr_SW_POINTER;
	rand uvm_reg_field ch4_csr_CH_EN;
	rand uvm_reg_field ch4_csr_DST_SEL;
	rand uvm_reg_field ch4_csr_SRC_SEL;
	rand uvm_reg_field ch4_csr_INC_DST;
	rand uvm_reg_field ch4_csr_INC_SRC;
	rand uvm_reg_field ch4_csr_MODE;
	rand uvm_reg_field ch4_csr_ARS;
	rand uvm_reg_field ch4_csr_USE_ED;
	rand uvm_reg_field ch4_csr_SZ_WB;
	rand uvm_reg_field ch4_csr_STOP;
	uvm_reg_field ch4_csr_BUSY;
	uvm_reg_field ch4_csr_DONE;
	rand uvm_reg_field ch4_csr_ERR;
	rand uvm_reg_field ch4_csr_PARITY;
	rand uvm_reg_field ch4_sz_CHK_SZ;
	rand uvm_reg_field ch4_sz_TOT_SZ;
	rand uvm_reg_field ch4_a0_ADDRESS;
	rand uvm_reg_field ch4_am0_ADDRESS_MASK;
	rand uvm_reg_field ch4_a1_ADDRESS;
	rand uvm_reg_field ch4_am1_ADDRESS_MASK;
	rand uvm_reg_field ch4_desc_ADDRESS_MASK;
	rand uvm_reg_field ch4_swptr_SWPTR_EN;
	rand uvm_reg_field ch4_swptr_SW_POINTER;
	rand uvm_reg_field ch5_csr_CH_EN;
	rand uvm_reg_field ch5_csr_DST_SEL;
	rand uvm_reg_field ch5_csr_SRC_SEL;
	rand uvm_reg_field ch5_csr_INC_DST;
	rand uvm_reg_field ch5_csr_INC_SRC;
	rand uvm_reg_field ch5_csr_MODE;
	rand uvm_reg_field ch5_csr_ARS;
	rand uvm_reg_field ch5_csr_USE_ED;
	rand uvm_reg_field ch5_csr_SZ_WB;
	rand uvm_reg_field ch5_csr_STOP;
	uvm_reg_field ch5_csr_BUSY;
	uvm_reg_field ch5_csr_DONE;
	rand uvm_reg_field ch5_csr_ERR;
	rand uvm_reg_field ch5_csr_PARITY;
	rand uvm_reg_field ch5_sz_CHK_SZ;
	rand uvm_reg_field ch5_sz_TOT_SZ;
	rand uvm_reg_field ch5_a0_ADDRESS;
	rand uvm_reg_field ch5_am0_ADDRESS_MASK;
	rand uvm_reg_field ch5_a1_ADDRESS;
	rand uvm_reg_field ch5_am1_ADDRESS_MASK;
	rand uvm_reg_field ch5_desc_ADDRESS_MASK;
	rand uvm_reg_field ch5_swptr_SWPTR_EN;
	rand uvm_reg_field ch5_swptr_SW_POINTER;
	rand uvm_reg_field ch6_csr_CH_EN;
	rand uvm_reg_field ch6_csr_DST_SEL;
	rand uvm_reg_field ch6_csr_SRC_SEL;
	rand uvm_reg_field ch6_csr_INC_DST;
	rand uvm_reg_field ch6_csr_INC_SRC;
	rand uvm_reg_field ch6_csr_MODE;
	rand uvm_reg_field ch6_csr_ARS;
	rand uvm_reg_field ch6_csr_USE_ED;
	rand uvm_reg_field ch6_csr_SZ_WB;
	rand uvm_reg_field ch6_csr_STOP;
	uvm_reg_field ch6_csr_BUSY;
	uvm_reg_field ch6_csr_DONE;
	rand uvm_reg_field ch6_csr_ERR;
	rand uvm_reg_field ch6_csr_PARITY;
	rand uvm_reg_field ch6_sz_CHK_SZ;
	rand uvm_reg_field ch6_sz_TOT_SZ;
	rand uvm_reg_field ch6_a0_ADDRESS;
	rand uvm_reg_field ch6_am0_ADDRESS_MASK;
	rand uvm_reg_field ch6_a1_ADDRESS;
	rand uvm_reg_field ch6_am1_ADDRESS_MASK;
	rand uvm_reg_field ch6_desc_ADDRESS_MASK;
	rand uvm_reg_field ch6_swptr_SWPTR_EN;
	rand uvm_reg_field ch6_swptr_SW_POINTER;
	rand uvm_reg_field ch7_csr_CH_EN;
	rand uvm_reg_field ch7_csr_DST_SEL;
	rand uvm_reg_field ch7_csr_SRC_SEL;
	rand uvm_reg_field ch7_csr_INC_DST;
	rand uvm_reg_field ch7_csr_INC_SRC;
	rand uvm_reg_field ch7_csr_MODE;
	rand uvm_reg_field ch7_csr_ARS;
	rand uvm_reg_field ch7_csr_USE_ED;
	rand uvm_reg_field ch7_csr_SZ_WB;
	rand uvm_reg_field ch7_csr_STOP;
	uvm_reg_field ch7_csr_BUSY;
	uvm_reg_field ch7_csr_DONE;
	rand uvm_reg_field ch7_csr_ERR;
	rand uvm_reg_field ch7_csr_PARITY;
	rand uvm_reg_field ch7_sz_CHK_SZ;
	rand uvm_reg_field ch7_sz_TOT_SZ;
	rand uvm_reg_field ch7_a0_ADDRESS;
	rand uvm_reg_field ch7_am0_ADDRESS_MASK;
	rand uvm_reg_field ch7_a1_ADDRESS;
	rand uvm_reg_field ch7_am1_ADDRESS_MASK;
	rand uvm_reg_field ch7_desc_ADDRESS_MASK;
	rand uvm_reg_field ch7_swptr_SWPTR_EN;
	rand uvm_reg_field ch7_swptr_SW_POINTER;
	rand uvm_reg_field ch8_csr_CH_EN;
	rand uvm_reg_field ch8_csr_DST_SEL;
	rand uvm_reg_field ch8_csr_SRC_SEL;
	rand uvm_reg_field ch8_csr_INC_DST;
	rand uvm_reg_field ch8_csr_INC_SRC;
	rand uvm_reg_field ch8_csr_MODE;
	rand uvm_reg_field ch8_csr_ARS;
	rand uvm_reg_field ch8_csr_USE_ED;
	rand uvm_reg_field ch8_csr_SZ_WB;
	rand uvm_reg_field ch8_csr_STOP;
	uvm_reg_field ch8_csr_BUSY;
	uvm_reg_field ch8_csr_DONE;
	rand uvm_reg_field ch8_csr_ERR;
	rand uvm_reg_field ch8_csr_PARITY;
	rand uvm_reg_field ch8_sz_CHK_SZ;
	rand uvm_reg_field ch8_sz_TOT_SZ;
	rand uvm_reg_field ch8_a0_ADDRESS;
	rand uvm_reg_field ch8_am0_ADDRESS_MASK;
	rand uvm_reg_field ch8_a1_ADDRESS;
	rand uvm_reg_field ch8_am1_ADDRESS_MASK;
	rand uvm_reg_field ch8_desc_ADDRESS_MASK;
	rand uvm_reg_field ch8_swptr_SWPTR_EN;
	rand uvm_reg_field ch8_swptr_SW_POINTER;
	rand uvm_reg_field ch9_csr_CH_EN;
	rand uvm_reg_field ch9_csr_DST_SEL;
	rand uvm_reg_field ch9_csr_SRC_SEL;
	rand uvm_reg_field ch9_csr_INC_DST;
	rand uvm_reg_field ch9_csr_INC_SRC;
	rand uvm_reg_field ch9_csr_MODE;
	rand uvm_reg_field ch9_csr_ARS;
	rand uvm_reg_field ch9_csr_USE_ED;
	rand uvm_reg_field ch9_csr_SZ_WB;
	rand uvm_reg_field ch9_csr_STOP;
	uvm_reg_field ch9_csr_BUSY;
	uvm_reg_field ch9_csr_DONE;
	rand uvm_reg_field ch9_csr_ERR;
	rand uvm_reg_field ch9_csr_PARITY;
	rand uvm_reg_field ch9_sz_CHK_SZ;
	rand uvm_reg_field ch9_sz_TOT_SZ;
	rand uvm_reg_field ch9_a0_ADDRESS;
	rand uvm_reg_field ch9_am0_ADDRESS_MASK;
	rand uvm_reg_field ch9_a1_ADDRESS;
	rand uvm_reg_field ch9_am1_ADDRESS_MASK;
	rand uvm_reg_field ch9_desc_ADDRESS_MASK;
	rand uvm_reg_field ch9_swptr_SWPTR_EN;
	rand uvm_reg_field ch9_swptr_SW_POINTER;
	rand uvm_reg_field ch10_csr_CH_EN;
	rand uvm_reg_field ch10_csr_DST_SEL;
	rand uvm_reg_field ch10_csr_SRC_SEL;
	rand uvm_reg_field ch10_csr_INC_DST;
	rand uvm_reg_field ch10_csr_INC_SRC;
	rand uvm_reg_field ch10_csr_MODE;
	rand uvm_reg_field ch10_csr_ARS;
	rand uvm_reg_field ch10_csr_USE_ED;
	rand uvm_reg_field ch10_csr_SZ_WB;
	rand uvm_reg_field ch10_csr_STOP;
	uvm_reg_field ch10_csr_BUSY;
	uvm_reg_field ch10_csr_DONE;
	rand uvm_reg_field ch10_csr_ERR;
	rand uvm_reg_field ch10_csr_PARITY;
	rand uvm_reg_field ch10_sz_CHK_SZ;
	rand uvm_reg_field ch10_sz_TOT_SZ;
	rand uvm_reg_field ch10_a0_ADDRESS;
	rand uvm_reg_field ch10_am0_ADDRESS_MASK;
	rand uvm_reg_field ch10_a1_ADDRESS;
	rand uvm_reg_field ch10_am1_ADDRESS_MASK;
	rand uvm_reg_field ch10_desc_ADDRESS_MASK;
	rand uvm_reg_field ch10_swptr_SWPTR_EN;
	rand uvm_reg_field ch10_swptr_SW_POINTER;
	rand uvm_reg_field ch11_csr_CH_EN;
	rand uvm_reg_field ch11_csr_DST_SEL;
	rand uvm_reg_field ch11_csr_SRC_SEL;
	rand uvm_reg_field ch11_csr_INC_DST;
	rand uvm_reg_field ch11_csr_INC_SRC;
	rand uvm_reg_field ch11_csr_MODE;
	rand uvm_reg_field ch11_csr_ARS;
	rand uvm_reg_field ch11_csr_USE_ED;
	rand uvm_reg_field ch11_csr_SZ_WB;
	rand uvm_reg_field ch11_csr_STOP;
	uvm_reg_field ch11_csr_BUSY;
	uvm_reg_field ch11_csr_DONE;
	rand uvm_reg_field ch11_csr_ERR;
	rand uvm_reg_field ch11_csr_PARITY;
	rand uvm_reg_field ch11_sz_CHK_SZ;
	rand uvm_reg_field ch11_sz_TOT_SZ;
	rand uvm_reg_field ch11_a0_ADDRESS;
	rand uvm_reg_field ch11_am0_ADDRESS_MASK;
	rand uvm_reg_field ch11_a1_ADDRESS;
	rand uvm_reg_field ch11_am1_ADDRESS_MASK;
	rand uvm_reg_field ch11_desc_ADDRESS_MASK;
	rand uvm_reg_field ch11_swptr_SWPTR_EN;
	rand uvm_reg_field ch11_swptr_SW_POINTER;
	rand uvm_reg_field ch12_csr_CH_EN;
	rand uvm_reg_field ch12_csr_DST_SEL;
	rand uvm_reg_field ch12_csr_SRC_SEL;
	rand uvm_reg_field ch12_csr_INC_DST;
	rand uvm_reg_field ch12_csr_INC_SRC;
	rand uvm_reg_field ch12_csr_MODE;
	rand uvm_reg_field ch12_csr_ARS;
	rand uvm_reg_field ch12_csr_USE_ED;
	rand uvm_reg_field ch12_csr_SZ_WB;
	rand uvm_reg_field ch12_csr_STOP;
	uvm_reg_field ch12_csr_BUSY;
	uvm_reg_field ch12_csr_DONE;
	rand uvm_reg_field ch12_csr_ERR;
	rand uvm_reg_field ch12_csr_PARITY;
	rand uvm_reg_field ch12_sz_CHK_SZ;
	rand uvm_reg_field ch12_sz_TOT_SZ;
	rand uvm_reg_field ch12_a0_ADDRESS;
	rand uvm_reg_field ch12_am0_ADDRESS_MASK;
	rand uvm_reg_field ch12_a1_ADDRESS;
	rand uvm_reg_field ch12_am1_ADDRESS_MASK;
	rand uvm_reg_field ch12_desc_ADDRESS_MASK;
	rand uvm_reg_field ch12_swptr_SWPTR_EN;
	rand uvm_reg_field ch12_swptr_SW_POINTER;
	rand uvm_reg_field ch13_csr_CH_EN;
	rand uvm_reg_field ch13_csr_DST_SEL;
	rand uvm_reg_field ch13_csr_SRC_SEL;
	rand uvm_reg_field ch13_csr_INC_DST;
	rand uvm_reg_field ch13_csr_INC_SRC;
	rand uvm_reg_field ch13_csr_MODE;
	rand uvm_reg_field ch13_csr_ARS;
	rand uvm_reg_field ch13_csr_USE_ED;
	rand uvm_reg_field ch13_csr_SZ_WB;
	rand uvm_reg_field ch13_csr_STOP;
	uvm_reg_field ch13_csr_BUSY;
	uvm_reg_field ch13_csr_DONE;
	rand uvm_reg_field ch13_csr_ERR;
	rand uvm_reg_field ch13_csr_PARITY;
	rand uvm_reg_field ch13_sz_CHK_SZ;
	rand uvm_reg_field ch13_sz_TOT_SZ;
	rand uvm_reg_field ch13_a0_ADDRESS;
	rand uvm_reg_field ch13_am0_ADDRESS_MASK;
	rand uvm_reg_field ch13_a1_ADDRESS;
	rand uvm_reg_field ch13_am1_ADDRESS_MASK;
	rand uvm_reg_field ch13_desc_ADDRESS_MASK;
	rand uvm_reg_field ch13_swptr_SWPTR_EN;
	rand uvm_reg_field ch13_swptr_SW_POINTER;
	rand uvm_reg_field ch14_csr_CH_EN;
	rand uvm_reg_field ch14_csr_DST_SEL;
	rand uvm_reg_field ch14_csr_SRC_SEL;
	rand uvm_reg_field ch14_csr_INC_DST;
	rand uvm_reg_field ch14_csr_INC_SRC;
	rand uvm_reg_field ch14_csr_MODE;
	rand uvm_reg_field ch14_csr_ARS;
	rand uvm_reg_field ch14_csr_USE_ED;
	rand uvm_reg_field ch14_csr_SZ_WB;
	rand uvm_reg_field ch14_csr_STOP;
	uvm_reg_field ch14_csr_BUSY;
	uvm_reg_field ch14_csr_DONE;
	rand uvm_reg_field ch14_csr_ERR;
	rand uvm_reg_field ch14_csr_PARITY;
	rand uvm_reg_field ch14_sz_CHK_SZ;
	rand uvm_reg_field ch14_sz_TOT_SZ;
	rand uvm_reg_field ch14_a0_ADDRESS;
	rand uvm_reg_field ch14_am0_ADDRESS_MASK;
	rand uvm_reg_field ch14_a1_ADDRESS;
	rand uvm_reg_field ch14_am1_ADDRESS_MASK;
	rand uvm_reg_field ch14_desc_ADDRESS_MASK;
	rand uvm_reg_field ch14_swptr_SWPTR_EN;
	rand uvm_reg_field ch14_swptr_SW_POINTER;
	rand uvm_reg_field ch15_csr_CH_EN;
	rand uvm_reg_field ch15_csr_DST_SEL;
	rand uvm_reg_field ch15_csr_SRC_SEL;
	rand uvm_reg_field ch15_csr_INC_DST;
	rand uvm_reg_field ch15_csr_INC_SRC;
	rand uvm_reg_field ch15_csr_MODE;
	rand uvm_reg_field ch15_csr_ARS;
	rand uvm_reg_field ch15_csr_USE_ED;
	rand uvm_reg_field ch15_csr_SZ_WB;
	rand uvm_reg_field ch15_csr_STOP;
	uvm_reg_field ch15_csr_BUSY;
	uvm_reg_field ch15_csr_DONE;
	rand uvm_reg_field ch15_csr_ERR;
	rand uvm_reg_field ch15_csr_PARITY;
	rand uvm_reg_field ch15_sz_CHK_SZ;
	rand uvm_reg_field ch15_sz_TOT_SZ;
	rand uvm_reg_field ch15_a0_ADDRESS;
	rand uvm_reg_field ch15_am0_ADDRESS_MASK;
	rand uvm_reg_field ch15_a1_ADDRESS;
	rand uvm_reg_field ch15_am1_ADDRESS_MASK;
	rand uvm_reg_field ch15_desc_ADDRESS_MASK;
	rand uvm_reg_field ch15_swptr_SWPTR_EN;
	rand uvm_reg_field ch15_swptr_SW_POINTER;
	rand uvm_reg_field ch16_csr_CH_EN;
	rand uvm_reg_field ch16_csr_DST_SEL;
	rand uvm_reg_field ch16_csr_SRC_SEL;
	rand uvm_reg_field ch16_csr_INC_DST;
	rand uvm_reg_field ch16_csr_INC_SRC;
	rand uvm_reg_field ch16_csr_MODE;
	rand uvm_reg_field ch16_csr_ARS;
	rand uvm_reg_field ch16_csr_USE_ED;
	rand uvm_reg_field ch16_csr_SZ_WB;
	rand uvm_reg_field ch16_csr_STOP;
	uvm_reg_field ch16_csr_BUSY;
	uvm_reg_field ch16_csr_DONE;
	rand uvm_reg_field ch16_csr_ERR;
	rand uvm_reg_field ch16_csr_PARITY;
	rand uvm_reg_field ch16_sz_CHK_SZ;
	rand uvm_reg_field ch16_sz_TOT_SZ;
	rand uvm_reg_field ch16_a0_ADDRESS;
	rand uvm_reg_field ch16_am0_ADDRESS_MASK;
	rand uvm_reg_field ch16_a1_ADDRESS;
	rand uvm_reg_field ch16_am1_ADDRESS_MASK;
	rand uvm_reg_field ch16_desc_ADDRESS_MASK;
	rand uvm_reg_field ch16_swptr_SWPTR_EN;
	rand uvm_reg_field ch16_swptr_SW_POINTER;
	rand uvm_reg_field ch17_csr_CH_EN;
	rand uvm_reg_field ch17_csr_DST_SEL;
	rand uvm_reg_field ch17_csr_SRC_SEL;
	rand uvm_reg_field ch17_csr_INC_DST;
	rand uvm_reg_field ch17_csr_INC_SRC;
	rand uvm_reg_field ch17_csr_MODE;
	rand uvm_reg_field ch17_csr_ARS;
	rand uvm_reg_field ch17_csr_USE_ED;
	rand uvm_reg_field ch17_csr_SZ_WB;
	rand uvm_reg_field ch17_csr_STOP;
	uvm_reg_field ch17_csr_BUSY;
	uvm_reg_field ch17_csr_DONE;
	rand uvm_reg_field ch17_csr_ERR;
	rand uvm_reg_field ch17_csr_PARITY;
	rand uvm_reg_field ch17_sz_CHK_SZ;
	rand uvm_reg_field ch17_sz_TOT_SZ;
	rand uvm_reg_field ch17_a0_ADDRESS;
	rand uvm_reg_field ch17_am0_ADDRESS_MASK;
	rand uvm_reg_field ch17_a1_ADDRESS;
	rand uvm_reg_field ch17_am1_ADDRESS_MASK;
	rand uvm_reg_field ch17_desc_ADDRESS_MASK;
	rand uvm_reg_field ch17_swptr_SWPTR_EN;
	rand uvm_reg_field ch17_swptr_SW_POINTER;
	rand uvm_reg_field ch18_csr_CH_EN;
	rand uvm_reg_field ch18_csr_DST_SEL;
	rand uvm_reg_field ch18_csr_SRC_SEL;
	rand uvm_reg_field ch18_csr_INC_DST;
	rand uvm_reg_field ch18_csr_INC_SRC;
	rand uvm_reg_field ch18_csr_MODE;
	rand uvm_reg_field ch18_csr_ARS;
	rand uvm_reg_field ch18_csr_USE_ED;
	rand uvm_reg_field ch18_csr_SZ_WB;
	rand uvm_reg_field ch18_csr_STOP;
	uvm_reg_field ch18_csr_BUSY;
	uvm_reg_field ch18_csr_DONE;
	rand uvm_reg_field ch18_csr_ERR;
	rand uvm_reg_field ch18_csr_PARITY;
	rand uvm_reg_field ch18_sz_CHK_SZ;
	rand uvm_reg_field ch18_sz_TOT_SZ;
	rand uvm_reg_field ch18_a0_ADDRESS;
	rand uvm_reg_field ch18_am0_ADDRESS_MASK;
	rand uvm_reg_field ch18_a1_ADDRESS;
	rand uvm_reg_field ch18_am1_ADDRESS_MASK;
	rand uvm_reg_field ch18_desc_ADDRESS_MASK;
	rand uvm_reg_field ch18_swptr_SWPTR_EN;
	rand uvm_reg_field ch18_swptr_SW_POINTER;
	rand uvm_reg_field ch19_csr_CH_EN;
	rand uvm_reg_field ch19_csr_DST_SEL;
	rand uvm_reg_field ch19_csr_SRC_SEL;
	rand uvm_reg_field ch19_csr_INC_DST;
	rand uvm_reg_field ch19_csr_INC_SRC;
	rand uvm_reg_field ch19_csr_MODE;
	rand uvm_reg_field ch19_csr_ARS;
	rand uvm_reg_field ch19_csr_USE_ED;
	rand uvm_reg_field ch19_csr_SZ_WB;
	rand uvm_reg_field ch19_csr_STOP;
	uvm_reg_field ch19_csr_BUSY;
	uvm_reg_field ch19_csr_DONE;
	rand uvm_reg_field ch19_csr_ERR;
	rand uvm_reg_field ch19_csr_PARITY;
	rand uvm_reg_field ch19_sz_CHK_SZ;
	rand uvm_reg_field ch19_sz_TOT_SZ;
	rand uvm_reg_field ch19_a0_ADDRESS;
	rand uvm_reg_field ch19_am0_ADDRESS_MASK;
	rand uvm_reg_field ch19_a1_ADDRESS;
	rand uvm_reg_field ch19_am1_ADDRESS_MASK;
	rand uvm_reg_field ch19_desc_ADDRESS_MASK;
	rand uvm_reg_field ch19_swptr_SWPTR_EN;
	rand uvm_reg_field ch19_swptr_SW_POINTER;
	rand uvm_reg_field ch20_csr_CH_EN;
	rand uvm_reg_field ch20_csr_DST_SEL;
	rand uvm_reg_field ch20_csr_SRC_SEL;
	rand uvm_reg_field ch20_csr_INC_DST;
	rand uvm_reg_field ch20_csr_INC_SRC;
	rand uvm_reg_field ch20_csr_MODE;
	rand uvm_reg_field ch20_csr_ARS;
	rand uvm_reg_field ch20_csr_USE_ED;
	rand uvm_reg_field ch20_csr_SZ_WB;
	rand uvm_reg_field ch20_csr_STOP;
	uvm_reg_field ch20_csr_BUSY;
	uvm_reg_field ch20_csr_DONE;
	rand uvm_reg_field ch20_csr_ERR;
	rand uvm_reg_field ch20_csr_PARITY;
	rand uvm_reg_field ch20_sz_CHK_SZ;
	rand uvm_reg_field ch20_sz_TOT_SZ;
	rand uvm_reg_field ch20_a0_ADDRESS;
	rand uvm_reg_field ch20_am0_ADDRESS_MASK;
	rand uvm_reg_field ch20_a1_ADDRESS;
	rand uvm_reg_field ch20_am1_ADDRESS_MASK;
	rand uvm_reg_field ch20_desc_ADDRESS_MASK;
	rand uvm_reg_field ch20_swptr_SWPTR_EN;
	rand uvm_reg_field ch20_swptr_SW_POINTER;
	rand uvm_reg_field ch21_csr_CH_EN;
	rand uvm_reg_field ch21_csr_DST_SEL;
	rand uvm_reg_field ch21_csr_SRC_SEL;
	rand uvm_reg_field ch21_csr_INC_DST;
	rand uvm_reg_field ch21_csr_INC_SRC;
	rand uvm_reg_field ch21_csr_MODE;
	rand uvm_reg_field ch21_csr_ARS;
	rand uvm_reg_field ch21_csr_USE_ED;
	rand uvm_reg_field ch21_csr_SZ_WB;
	rand uvm_reg_field ch21_csr_STOP;
	uvm_reg_field ch21_csr_BUSY;
	uvm_reg_field ch21_csr_DONE;
	rand uvm_reg_field ch21_csr_ERR;
	rand uvm_reg_field ch21_csr_PARITY;
	rand uvm_reg_field ch21_sz_CHK_SZ;
	rand uvm_reg_field ch21_sz_TOT_SZ;
	rand uvm_reg_field ch21_a0_ADDRESS;
	rand uvm_reg_field ch21_am0_ADDRESS_MASK;
	rand uvm_reg_field ch21_a1_ADDRESS;
	rand uvm_reg_field ch21_am1_ADDRESS_MASK;
	rand uvm_reg_field ch21_desc_ADDRESS_MASK;
	rand uvm_reg_field ch21_swptr_SWPTR_EN;
	rand uvm_reg_field ch21_swptr_SW_POINTER;
	rand uvm_reg_field ch22_csr_CH_EN;
	rand uvm_reg_field ch22_csr_DST_SEL;
	rand uvm_reg_field ch22_csr_SRC_SEL;
	rand uvm_reg_field ch22_csr_INC_DST;
	rand uvm_reg_field ch22_csr_INC_SRC;
	rand uvm_reg_field ch22_csr_MODE;
	rand uvm_reg_field ch22_csr_ARS;
	rand uvm_reg_field ch22_csr_USE_ED;
	rand uvm_reg_field ch22_csr_SZ_WB;
	rand uvm_reg_field ch22_csr_STOP;
	uvm_reg_field ch22_csr_BUSY;
	uvm_reg_field ch22_csr_DONE;
	rand uvm_reg_field ch22_csr_ERR;
	rand uvm_reg_field ch22_csr_PARITY;
	rand uvm_reg_field ch22_sz_CHK_SZ;
	rand uvm_reg_field ch22_sz_TOT_SZ;
	rand uvm_reg_field ch22_a0_ADDRESS;
	rand uvm_reg_field ch22_am0_ADDRESS_MASK;
	rand uvm_reg_field ch22_a1_ADDRESS;
	rand uvm_reg_field ch22_am1_ADDRESS_MASK;
	rand uvm_reg_field ch22_desc_ADDRESS_MASK;
	rand uvm_reg_field ch22_swptr_SWPTR_EN;
	rand uvm_reg_field ch22_swptr_SW_POINTER;
	rand uvm_reg_field ch23_csr_CH_EN;
	rand uvm_reg_field ch23_csr_DST_SEL;
	rand uvm_reg_field ch23_csr_SRC_SEL;
	rand uvm_reg_field ch23_csr_INC_DST;
	rand uvm_reg_field ch23_csr_INC_SRC;
	rand uvm_reg_field ch23_csr_MODE;
	rand uvm_reg_field ch23_csr_ARS;
	rand uvm_reg_field ch23_csr_USE_ED;
	rand uvm_reg_field ch23_csr_SZ_WB;
	rand uvm_reg_field ch23_csr_STOP;
	uvm_reg_field ch23_csr_BUSY;
	uvm_reg_field ch23_csr_DONE;
	rand uvm_reg_field ch23_csr_ERR;
	rand uvm_reg_field ch23_csr_PARITY;
	rand uvm_reg_field ch23_sz_CHK_SZ;
	rand uvm_reg_field ch23_sz_TOT_SZ;
	rand uvm_reg_field ch23_a0_ADDRESS;
	rand uvm_reg_field ch23_am0_ADDRESS_MASK;
	rand uvm_reg_field ch23_a1_ADDRESS;
	rand uvm_reg_field ch23_am1_ADDRESS_MASK;
	rand uvm_reg_field ch23_desc_ADDRESS_MASK;
	rand uvm_reg_field ch23_swptr_SWPTR_EN;
	rand uvm_reg_field ch23_swptr_SW_POINTER;
	rand uvm_reg_field ch24_csr_CH_EN;
	rand uvm_reg_field ch24_csr_DST_SEL;
	rand uvm_reg_field ch24_csr_SRC_SEL;
	rand uvm_reg_field ch24_csr_INC_DST;
	rand uvm_reg_field ch24_csr_INC_SRC;
	rand uvm_reg_field ch24_csr_MODE;
	rand uvm_reg_field ch24_csr_ARS;
	rand uvm_reg_field ch24_csr_USE_ED;
	rand uvm_reg_field ch24_csr_SZ_WB;
	rand uvm_reg_field ch24_csr_STOP;
	uvm_reg_field ch24_csr_BUSY;
	uvm_reg_field ch24_csr_DONE;
	rand uvm_reg_field ch24_csr_ERR;
	rand uvm_reg_field ch24_csr_PARITY;
	rand uvm_reg_field ch24_sz_CHK_SZ;
	rand uvm_reg_field ch24_sz_TOT_SZ;
	rand uvm_reg_field ch24_a0_ADDRESS;
	rand uvm_reg_field ch24_am0_ADDRESS_MASK;
	rand uvm_reg_field ch24_a1_ADDRESS;
	rand uvm_reg_field ch24_am1_ADDRESS_MASK;
	rand uvm_reg_field ch24_desc_ADDRESS_MASK;
	rand uvm_reg_field ch24_swptr_SWPTR_EN;
	rand uvm_reg_field ch24_swptr_SW_POINTER;
	rand uvm_reg_field ch25_csr_CH_EN;
	rand uvm_reg_field ch25_csr_DST_SEL;
	rand uvm_reg_field ch25_csr_SRC_SEL;
	rand uvm_reg_field ch25_csr_INC_DST;
	rand uvm_reg_field ch25_csr_INC_SRC;
	rand uvm_reg_field ch25_csr_MODE;
	rand uvm_reg_field ch25_csr_ARS;
	rand uvm_reg_field ch25_csr_USE_ED;
	rand uvm_reg_field ch25_csr_SZ_WB;
	rand uvm_reg_field ch25_csr_STOP;
	uvm_reg_field ch25_csr_BUSY;
	uvm_reg_field ch25_csr_DONE;
	rand uvm_reg_field ch25_csr_ERR;
	rand uvm_reg_field ch25_csr_PARITY;
	rand uvm_reg_field ch25_sz_CHK_SZ;
	rand uvm_reg_field ch25_sz_TOT_SZ;
	rand uvm_reg_field ch25_a0_ADDRESS;
	rand uvm_reg_field ch25_am0_ADDRESS_MASK;
	rand uvm_reg_field ch25_a1_ADDRESS;
	rand uvm_reg_field ch25_am1_ADDRESS_MASK;
	rand uvm_reg_field ch25_desc_ADDRESS_MASK;
	rand uvm_reg_field ch25_swptr_SWPTR_EN;
	rand uvm_reg_field ch25_swptr_SW_POINTER;
	rand uvm_reg_field ch26_csr_CH_EN;
	rand uvm_reg_field ch26_csr_DST_SEL;
	rand uvm_reg_field ch26_csr_SRC_SEL;
	rand uvm_reg_field ch26_csr_INC_DST;
	rand uvm_reg_field ch26_csr_INC_SRC;
	rand uvm_reg_field ch26_csr_MODE;
	rand uvm_reg_field ch26_csr_ARS;
	rand uvm_reg_field ch26_csr_USE_ED;
	rand uvm_reg_field ch26_csr_SZ_WB;
	rand uvm_reg_field ch26_csr_STOP;
	uvm_reg_field ch26_csr_BUSY;
	uvm_reg_field ch26_csr_DONE;
	rand uvm_reg_field ch26_csr_ERR;
	rand uvm_reg_field ch26_csr_PARITY;
	rand uvm_reg_field ch26_sz_CHK_SZ;
	rand uvm_reg_field ch26_sz_TOT_SZ;
	rand uvm_reg_field ch26_a0_ADDRESS;
	rand uvm_reg_field ch26_am0_ADDRESS_MASK;
	rand uvm_reg_field ch26_a1_ADDRESS;
	rand uvm_reg_field ch26_am1_ADDRESS_MASK;
	rand uvm_reg_field ch26_desc_ADDRESS_MASK;
	rand uvm_reg_field ch26_swptr_SWPTR_EN;
	rand uvm_reg_field ch26_swptr_SW_POINTER;
	rand uvm_reg_field ch27_csr_CH_EN;
	rand uvm_reg_field ch27_csr_DST_SEL;
	rand uvm_reg_field ch27_csr_SRC_SEL;
	rand uvm_reg_field ch27_csr_INC_DST;
	rand uvm_reg_field ch27_csr_INC_SRC;
	rand uvm_reg_field ch27_csr_MODE;
	rand uvm_reg_field ch27_csr_ARS;
	rand uvm_reg_field ch27_csr_USE_ED;
	rand uvm_reg_field ch27_csr_SZ_WB;
	rand uvm_reg_field ch27_csr_STOP;
	uvm_reg_field ch27_csr_BUSY;
	uvm_reg_field ch27_csr_DONE;
	rand uvm_reg_field ch27_csr_ERR;
	rand uvm_reg_field ch27_csr_PARITY;
	rand uvm_reg_field ch27_sz_CHK_SZ;
	rand uvm_reg_field ch27_sz_TOT_SZ;
	rand uvm_reg_field ch27_a0_ADDRESS;
	rand uvm_reg_field ch27_am0_ADDRESS_MASK;
	rand uvm_reg_field ch27_a1_ADDRESS;
	rand uvm_reg_field ch27_am1_ADDRESS_MASK;
	rand uvm_reg_field ch27_desc_ADDRESS_MASK;
	rand uvm_reg_field ch27_swptr_SWPTR_EN;
	rand uvm_reg_field ch27_swptr_SW_POINTER;
	rand uvm_reg_field ch28_csr_CH_EN;
	rand uvm_reg_field ch28_csr_DST_SEL;
	rand uvm_reg_field ch28_csr_SRC_SEL;
	rand uvm_reg_field ch28_csr_INC_DST;
	rand uvm_reg_field ch28_csr_INC_SRC;
	rand uvm_reg_field ch28_csr_MODE;
	rand uvm_reg_field ch28_csr_ARS;
	rand uvm_reg_field ch28_csr_USE_ED;
	rand uvm_reg_field ch28_csr_SZ_WB;
	rand uvm_reg_field ch28_csr_STOP;
	uvm_reg_field ch28_csr_BUSY;
	uvm_reg_field ch28_csr_DONE;
	rand uvm_reg_field ch28_csr_ERR;
	rand uvm_reg_field ch28_csr_PARITY;
	rand uvm_reg_field ch28_sz_CHK_SZ;
	rand uvm_reg_field ch28_sz_TOT_SZ;
	rand uvm_reg_field ch28_a0_ADDRESS;
	rand uvm_reg_field ch28_am0_ADDRESS_MASK;
	rand uvm_reg_field ch28_a1_ADDRESS;
	rand uvm_reg_field ch28_am1_ADDRESS_MASK;
	rand uvm_reg_field ch28_desc_ADDRESS_MASK;
	rand uvm_reg_field ch28_swptr_SWPTR_EN;
	rand uvm_reg_field ch28_swptr_SW_POINTER;
	rand uvm_reg_field ch29_csr_CH_EN;
	rand uvm_reg_field ch29_csr_DST_SEL;
	rand uvm_reg_field ch29_csr_SRC_SEL;
	rand uvm_reg_field ch29_csr_INC_DST;
	rand uvm_reg_field ch29_csr_INC_SRC;
	rand uvm_reg_field ch29_csr_MODE;
	rand uvm_reg_field ch29_csr_ARS;
	rand uvm_reg_field ch29_csr_USE_ED;
	rand uvm_reg_field ch29_csr_SZ_WB;
	rand uvm_reg_field ch29_csr_STOP;
	uvm_reg_field ch29_csr_BUSY;
	uvm_reg_field ch29_csr_DONE;
	rand uvm_reg_field ch29_csr_ERR;
	rand uvm_reg_field ch29_csr_PARITY;
	rand uvm_reg_field ch29_sz_CHK_SZ;
	rand uvm_reg_field ch29_sz_TOT_SZ;
	rand uvm_reg_field ch29_a0_ADDRESS;
	rand uvm_reg_field ch29_am0_ADDRESS_MASK;
	rand uvm_reg_field ch29_a1_ADDRESS;
	rand uvm_reg_field ch29_am1_ADDRESS_MASK;
	rand uvm_reg_field ch29_desc_ADDRESS_MASK;
	rand uvm_reg_field ch29_swptr_SWPTR_EN;
	rand uvm_reg_field ch29_swptr_SW_POINTER;
	rand uvm_reg_field ch30_csr_CH_EN;
	rand uvm_reg_field ch30_csr_DST_SEL;
	rand uvm_reg_field ch30_csr_SRC_SEL;
	rand uvm_reg_field ch30_csr_INC_DST;
	rand uvm_reg_field ch30_csr_INC_SRC;
	rand uvm_reg_field ch30_csr_MODE;
	rand uvm_reg_field ch30_csr_ARS;
	rand uvm_reg_field ch30_csr_USE_ED;
	rand uvm_reg_field ch30_csr_SZ_WB;
	rand uvm_reg_field ch30_csr_STOP;
	uvm_reg_field ch30_csr_BUSY;
	uvm_reg_field ch30_csr_DONE;
	rand uvm_reg_field ch30_csr_ERR;
	rand uvm_reg_field ch30_csr_PARITY;
	rand uvm_reg_field ch30_sz_CHK_SZ;
	rand uvm_reg_field ch30_sz_TOT_SZ;
	rand uvm_reg_field ch30_a0_ADDRESS;
	rand uvm_reg_field ch30_am0_ADDRESS_MASK;
	rand uvm_reg_field ch30_a1_ADDRESS;
	rand uvm_reg_field ch30_am1_ADDRESS_MASK;
	rand uvm_reg_field ch30_desc_ADDRESS_MASK;
	rand uvm_reg_field ch30_swptr_SWPTR_EN;
	rand uvm_reg_field ch30_swptr_SW_POINTER;


covergroup cg_addr (input string name);
	option.per_instance = 1;
option.name = get_name();

	CSR : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}

	INT_MASKA : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h4 };
		option.weight = 1;
	}

	INT_MASKB : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h8 };
		option.weight = 1;
	}

	INT_SRCA : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hC };
		option.weight = 1;
	}

	INT_SRCB : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h10 };
		option.weight = 1;
	}

	CH0_CSR : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h20 };
		option.weight = 1;
	}

	ch0_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h24 };
		option.weight = 1;
	}

	ch0_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h28 };
		option.weight = 1;
	}

	ch0_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2C };
		option.weight = 1;
	}

	ch0_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h30 };
		option.weight = 1;
	}

	ch0_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h34 };
		option.weight = 1;
	}

	ch0_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h38 };
		option.weight = 1;
	}

	ch0_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3C };
		option.weight = 1;
	}

	ch1_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h40 };
		option.weight = 1;
	}

	ch1_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h44 };
		option.weight = 1;
	}

	ch1_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h48 };
		option.weight = 1;
	}

	ch1_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h4C };
		option.weight = 1;
	}

	ch1_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h50 };
		option.weight = 1;
	}

	ch1_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h54 };
		option.weight = 1;
	}

	ch1_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h58 };
		option.weight = 1;
	}

	ch1_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h5C };
		option.weight = 1;
	}

	ch2_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h60 };
		option.weight = 1;
	}

	ch2_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h64 };
		option.weight = 1;
	}

	ch2_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h68 };
		option.weight = 1;
	}

	ch2_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h6C };
		option.weight = 1;
	}

	ch2_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h70 };
		option.weight = 1;
	}

	ch2_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h74 };
		option.weight = 1;
	}

	ch2_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h78 };
		option.weight = 1;
	}

	ch2_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h7C };
		option.weight = 1;
	}

	ch3_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h80 };
		option.weight = 1;
	}

	ch3_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h84 };
		option.weight = 1;
	}

	ch3_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h88 };
		option.weight = 1;
	}

	ch3_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h8C };
		option.weight = 1;
	}

	ch3_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h90 };
		option.weight = 1;
	}

	ch3_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h94 };
		option.weight = 1;
	}

	ch3_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h98 };
		option.weight = 1;
	}

	ch3_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h9C };
		option.weight = 1;
	}

	ch4_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hA0 };
		option.weight = 1;
	}

	ch4_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hA4 };
		option.weight = 1;
	}

	ch4_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hA8 };
		option.weight = 1;
	}

	ch4_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hAC };
		option.weight = 1;
	}

	ch4_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hB0 };
		option.weight = 1;
	}

	ch4_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hB4 };
		option.weight = 1;
	}

	ch4_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hB8 };
		option.weight = 1;
	}

	ch4_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hBC };
		option.weight = 1;
	}

	ch5_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hC0 };
		option.weight = 1;
	}

	ch5_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hC4 };
		option.weight = 1;
	}

	ch5_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hC8 };
		option.weight = 1;
	}

	ch5_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hCC };
		option.weight = 1;
	}

	ch5_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hD0 };
		option.weight = 1;
	}

	ch5_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hD4 };
		option.weight = 1;
	}

	ch5_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hD8 };
		option.weight = 1;
	}

	ch5_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hDC };
		option.weight = 1;
	}

	ch6_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hE0 };
		option.weight = 1;
	}

	ch6_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hE4 };
		option.weight = 1;
	}

	ch6_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hE8 };
		option.weight = 1;
	}

	ch6_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hEC };
		option.weight = 1;
	}

	ch6_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hF0 };
		option.weight = 1;
	}

	ch6_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hF4 };
		option.weight = 1;
	}

	ch6_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hF8 };
		option.weight = 1;
	}

	ch6_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'hFC };
		option.weight = 1;
	}

	ch7_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h100 };
		option.weight = 1;
	}

	ch7_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h104 };
		option.weight = 1;
	}

	ch7_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h108 };
		option.weight = 1;
	}

	ch7_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h10C };
		option.weight = 1;
	}

	ch7_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h110 };
		option.weight = 1;
	}

	ch7_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h114 };
		option.weight = 1;
	}

	ch7_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h118 };
		option.weight = 1;
	}

	ch7_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h11C };
		option.weight = 1;
	}

	ch8_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h120 };
		option.weight = 1;
	}

	ch8_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h124 };
		option.weight = 1;
	}

	ch8_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h128 };
		option.weight = 1;
	}

	ch8_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h12C };
		option.weight = 1;
	}

	ch8_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h130 };
		option.weight = 1;
	}

	ch8_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h134 };
		option.weight = 1;
	}

	ch8_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h138 };
		option.weight = 1;
	}

	ch8_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h13C };
		option.weight = 1;
	}

	ch9_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h140 };
		option.weight = 1;
	}

	ch9_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h144 };
		option.weight = 1;
	}

	ch9_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h148 };
		option.weight = 1;
	}

	ch9_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h14C };
		option.weight = 1;
	}

	ch9_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h150 };
		option.weight = 1;
	}

	ch9_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h154 };
		option.weight = 1;
	}

	ch9_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h158 };
		option.weight = 1;
	}

	ch9_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h15C };
		option.weight = 1;
	}

	ch10_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h160 };
		option.weight = 1;
	}

	ch10_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h164 };
		option.weight = 1;
	}

	ch10_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h168 };
		option.weight = 1;
	}

	ch10_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h16C };
		option.weight = 1;
	}

	ch10_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h170 };
		option.weight = 1;
	}

	ch10_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h174 };
		option.weight = 1;
	}

	ch10_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h178 };
		option.weight = 1;
	}

	ch10_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h17C };
		option.weight = 1;
	}

	ch11_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h180 };
		option.weight = 1;
	}

	ch11_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h184 };
		option.weight = 1;
	}

	ch11_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h188 };
		option.weight = 1;
	}

	ch11_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h18C };
		option.weight = 1;
	}

	ch11_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h190 };
		option.weight = 1;
	}

	ch11_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h194 };
		option.weight = 1;
	}

	ch11_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h198 };
		option.weight = 1;
	}

	ch11_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h19C };
		option.weight = 1;
	}

	ch12_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1A0 };
		option.weight = 1;
	}

	ch12_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1A4 };
		option.weight = 1;
	}

	ch12_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1A8 };
		option.weight = 1;
	}

	ch12_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1AC };
		option.weight = 1;
	}

	ch12_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1B0 };
		option.weight = 1;
	}

	ch12_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1B4 };
		option.weight = 1;
	}

	ch12_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1B8 };
		option.weight = 1;
	}

	ch12_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1BC };
		option.weight = 1;
	}

	ch13_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1C0 };
		option.weight = 1;
	}

	ch13_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1C4 };
		option.weight = 1;
	}

	ch13_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1C8 };
		option.weight = 1;
	}

	ch13_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1CC };
		option.weight = 1;
	}

	ch13_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1D0 };
		option.weight = 1;
	}

	ch13_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1D4 };
		option.weight = 1;
	}

	ch13_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1D8 };
		option.weight = 1;
	}

	ch13_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1DC };
		option.weight = 1;
	}

	ch14_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1E0 };
		option.weight = 1;
	}

	ch14_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1E4 };
		option.weight = 1;
	}

	ch14_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1E8 };
		option.weight = 1;
	}

	ch14_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1EC };
		option.weight = 1;
	}

	ch14_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1F0 };
		option.weight = 1;
	}

	ch14_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1F4 };
		option.weight = 1;
	}

	ch14_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1F8 };
		option.weight = 1;
	}

	ch14_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h1FC };
		option.weight = 1;
	}

	ch15_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h200 };
		option.weight = 1;
	}

	ch15_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h204 };
		option.weight = 1;
	}

	ch15_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h208 };
		option.weight = 1;
	}

	ch15_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h20C };
		option.weight = 1;
	}

	ch15_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h210 };
		option.weight = 1;
	}

	ch15_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h214 };
		option.weight = 1;
	}

	ch15_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h218 };
		option.weight = 1;
	}

	ch15_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h21C };
		option.weight = 1;
	}

	ch16_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h220 };
		option.weight = 1;
	}

	ch16_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h224 };
		option.weight = 1;
	}

	ch16_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h228 };
		option.weight = 1;
	}

	ch16_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h22C };
		option.weight = 1;
	}

	ch16_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h230 };
		option.weight = 1;
	}

	ch16_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h234 };
		option.weight = 1;
	}

	ch16_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h238 };
		option.weight = 1;
	}

	ch16_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h23C };
		option.weight = 1;
	}

	ch17_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h240 };
		option.weight = 1;
	}

	ch17_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h244 };
		option.weight = 1;
	}

	ch17_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h248 };
		option.weight = 1;
	}

	ch17_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h24C };
		option.weight = 1;
	}

	ch17_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h250 };
		option.weight = 1;
	}

	ch17_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h254 };
		option.weight = 1;
	}

	ch17_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h258 };
		option.weight = 1;
	}

	ch17_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h25C };
		option.weight = 1;
	}

	ch18_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h260 };
		option.weight = 1;
	}

	ch18_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h264 };
		option.weight = 1;
	}

	ch18_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h268 };
		option.weight = 1;
	}

	ch18_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h26C };
		option.weight = 1;
	}

	ch18_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h270 };
		option.weight = 1;
	}

	ch18_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h274 };
		option.weight = 1;
	}

	ch18_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h278 };
		option.weight = 1;
	}

	ch18_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h27C };
		option.weight = 1;
	}

	ch19_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h280 };
		option.weight = 1;
	}

	ch19_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h284 };
		option.weight = 1;
	}

	ch19_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h288 };
		option.weight = 1;
	}

	ch19_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h28C };
		option.weight = 1;
	}

	ch19_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h290 };
		option.weight = 1;
	}

	ch19_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h294 };
		option.weight = 1;
	}

	ch19_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h298 };
		option.weight = 1;
	}

	ch19_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h29C };
		option.weight = 1;
	}

	ch20_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2A0 };
		option.weight = 1;
	}

	ch20_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2A4 };
		option.weight = 1;
	}

	ch20_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2A8 };
		option.weight = 1;
	}

	ch20_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2AC };
		option.weight = 1;
	}

	ch20_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2B0 };
		option.weight = 1;
	}

	ch20_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2B4 };
		option.weight = 1;
	}

	ch20_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2B8 };
		option.weight = 1;
	}

	ch20_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2BC };
		option.weight = 1;
	}

	ch21_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2C0 };
		option.weight = 1;
	}

	ch21_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2C4 };
		option.weight = 1;
	}

	ch21_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2C8 };
		option.weight = 1;
	}

	ch21_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2CC };
		option.weight = 1;
	}

	ch21_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2D0 };
		option.weight = 1;
	}

	ch21_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2D4 };
		option.weight = 1;
	}

	ch21_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2D8 };
		option.weight = 1;
	}

	ch21_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2DC };
		option.weight = 1;
	}

	ch22_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2E0 };
		option.weight = 1;
	}

	ch22_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2E4 };
		option.weight = 1;
	}

	ch22_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2E8 };
		option.weight = 1;
	}

	ch22_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2EC };
		option.weight = 1;
	}

	ch22_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2F0 };
		option.weight = 1;
	}

	ch22_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2F4 };
		option.weight = 1;
	}

	ch22_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2F8 };
		option.weight = 1;
	}

	ch22_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h2FC };
		option.weight = 1;
	}

	ch23_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h300 };
		option.weight = 1;
	}

	ch23_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h304 };
		option.weight = 1;
	}

	ch23_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h308 };
		option.weight = 1;
	}

	ch23_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h30C };
		option.weight = 1;
	}

	ch23_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h310 };
		option.weight = 1;
	}

	ch23_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h314 };
		option.weight = 1;
	}

	ch23_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h318 };
		option.weight = 1;
	}

	ch23_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h31C };
		option.weight = 1;
	}

	ch24_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h320 };
		option.weight = 1;
	}

	ch24_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h324 };
		option.weight = 1;
	}

	ch24_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h328 };
		option.weight = 1;
	}

	ch24_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h32C };
		option.weight = 1;
	}

	ch24_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h330 };
		option.weight = 1;
	}

	ch24_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h334 };
		option.weight = 1;
	}

	ch24_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h338 };
		option.weight = 1;
	}

	ch24_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h33C };
		option.weight = 1;
	}

	ch25_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h340 };
		option.weight = 1;
	}

	ch25_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h344 };
		option.weight = 1;
	}

	ch25_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h348 };
		option.weight = 1;
	}

	ch25_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h34C };
		option.weight = 1;
	}

	ch25_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h350 };
		option.weight = 1;
	}

	ch25_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h354 };
		option.weight = 1;
	}

	ch25_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h358 };
		option.weight = 1;
	}

	ch25_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h35C };
		option.weight = 1;
	}

	ch26_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h360 };
		option.weight = 1;
	}

	ch26_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h364 };
		option.weight = 1;
	}

	ch26_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h368 };
		option.weight = 1;
	}

	ch26_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h36C };
		option.weight = 1;
	}

	ch26_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h370 };
		option.weight = 1;
	}

	ch26_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h374 };
		option.weight = 1;
	}

	ch26_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h378 };
		option.weight = 1;
	}

	ch26_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h37C };
		option.weight = 1;
	}

	ch27_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h380 };
		option.weight = 1;
	}

	ch27_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h384 };
		option.weight = 1;
	}

	ch27_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h388 };
		option.weight = 1;
	}

	ch27_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h38C };
		option.weight = 1;
	}

	ch27_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h390 };
		option.weight = 1;
	}

	ch27_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h394 };
		option.weight = 1;
	}

	ch27_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h398 };
		option.weight = 1;
	}

	ch27_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h39C };
		option.weight = 1;
	}

	ch28_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3A0 };
		option.weight = 1;
	}

	ch28_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3A4 };
		option.weight = 1;
	}

	ch28_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3A8 };
		option.weight = 1;
	}

	ch28_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3AC };
		option.weight = 1;
	}

	ch28_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3B0 };
		option.weight = 1;
	}

	ch28_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3B4 };
		option.weight = 1;
	}

	ch28_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3B8 };
		option.weight = 1;
	}

	ch28_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3BC };
		option.weight = 1;
	}

	ch29_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3C0 };
		option.weight = 1;
	}

	ch29_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3C4 };
		option.weight = 1;
	}

	ch29_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3C8 };
		option.weight = 1;
	}

	ch29_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3CC };
		option.weight = 1;
	}

	ch29_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3D0 };
		option.weight = 1;
	}

	ch29_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3D4 };
		option.weight = 1;
	}

	ch29_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3D8 };
		option.weight = 1;
	}

	ch29_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3DC };
		option.weight = 1;
	}

	ch30_csr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3E0 };
		option.weight = 1;
	}

	ch30_sz : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3E4 };
		option.weight = 1;
	}

	ch30_a0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3E8 };
		option.weight = 1;
	}

	ch30_am0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3EC };
		option.weight = 1;
	}

	ch30_a1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3F0 };
		option.weight = 1;
	}

	ch30_am1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3F4 };
		option.weight = 1;
	}

	ch30_desc : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3F8 };
		option.weight = 1;
	}

	ch30_swptr : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h3FC };
		option.weight = 1;
	}
endgroup
	function new(string name = "wb_dma");
		super.new(name, build_coverage(UVM_CVR_ADDR_MAP));
		if (has_coverage(UVM_CVR_ADDR_MAP))
			cg_addr = new("cg_addr");
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 4096, UVM_LITTLE_ENDIAN, 0);
      this.CSR = ral_reg_CSR::type_id::create("CSR",,get_full_name());
      if(this.CSR.has_coverage(UVM_CVR_REG_BITS))
      	this.CSR.cg_bits.option.name = "CSR_bits";
      this.CSR.configure(this, null, "");
      this.CSR.build();
      this.default_map.add_reg(this.CSR, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.CSR_PAUSE = this.CSR.PAUSE;
		this.PAUSE = this.CSR.PAUSE;
      this.INT_MASKA = ral_reg_INT_MASKA::type_id::create("INT_MASKA",,get_full_name());
      if(this.INT_MASKA.has_coverage(UVM_CVR_REG_BITS))
      	this.INT_MASKA.cg_bits.option.name = "INT_MASKA_bits";
      this.INT_MASKA.configure(this, null, "");
      this.INT_MASKA.build();
      this.default_map.add_reg(this.INT_MASKA, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
		this.INT_MASKA_f_mask0 = this.INT_MASKA.f_mask0;
		this.INT_MASKA_f_mask1 = this.INT_MASKA.f_mask1;
		this.INT_MASKA_f_mask2 = this.INT_MASKA.f_mask2;
		this.INT_MASKA_f_mask3 = this.INT_MASKA.f_mask3;
		this.INT_MASKA_f_mask4 = this.INT_MASKA.f_mask4;
		this.INT_MASKA_f_mask5 = this.INT_MASKA.f_mask5;
		this.INT_MASKA_f_mask6 = this.INT_MASKA.f_mask6;
		this.INT_MASKA_f_mask7 = this.INT_MASKA.f_mask7;
		this.INT_MASKA_f_mask8 = this.INT_MASKA.f_mask8;
		this.INT_MASKA_f_mask9 = this.INT_MASKA.f_mask9;
		this.INT_MASKA_f_mask10 = this.INT_MASKA.f_mask10;
		this.INT_MASKA_f_mask11 = this.INT_MASKA.f_mask11;
		this.INT_MASKA_f_mask12 = this.INT_MASKA.f_mask12;
		this.INT_MASKA_f_mask13 = this.INT_MASKA.f_mask13;
		this.INT_MASKA_f_mask14 = this.INT_MASKA.f_mask14;
		this.INT_MASKA_f_mask15 = this.INT_MASKA.f_mask15;
		this.INT_MASKA_f_mask16 = this.INT_MASKA.f_mask16;
		this.INT_MASKA_f_mask17 = this.INT_MASKA.f_mask17;
		this.INT_MASKA_f_mask18 = this.INT_MASKA.f_mask18;
		this.INT_MASKA_f_mask19 = this.INT_MASKA.f_mask19;
		this.INT_MASKA_f_mask20 = this.INT_MASKA.f_mask20;
		this.INT_MASKA_f_mask21 = this.INT_MASKA.f_mask21;
		this.INT_MASKA_f_mask22 = this.INT_MASKA.f_mask22;
		this.INT_MASKA_f_mask23 = this.INT_MASKA.f_mask23;
		this.INT_MASKA_f_mask24 = this.INT_MASKA.f_mask24;
		this.INT_MASKA_f_mask25 = this.INT_MASKA.f_mask25;
		this.INT_MASKA_f_mask26 = this.INT_MASKA.f_mask26;
		this.INT_MASKA_f_mask27 = this.INT_MASKA.f_mask27;
		this.INT_MASKA_f_mask28 = this.INT_MASKA.f_mask28;
		this.INT_MASKA_f_mask29 = this.INT_MASKA.f_mask29;
		this.INT_MASKA_f_mask30 = this.INT_MASKA.f_mask30;
		this.INT_MASKA_f_mask31 = this.INT_MASKA.f_mask31;
      this.INT_MASKB = ral_reg_INT_MASKB::type_id::create("INT_MASKB",,get_full_name());
      if(this.INT_MASKB.has_coverage(UVM_CVR_REG_BITS))
      	this.INT_MASKB.cg_bits.option.name = "INT_MASKB_bits";
      this.INT_MASKB.configure(this, null, "");
      this.INT_MASKB.build();
      this.default_map.add_reg(this.INT_MASKB, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
		this.INT_MASKB_f_mask0 = this.INT_MASKB.f_mask0;
		this.INT_MASKB_f_mask1 = this.INT_MASKB.f_mask1;
		this.INT_MASKB_f_mask2 = this.INT_MASKB.f_mask2;
		this.INT_MASKB_f_mask3 = this.INT_MASKB.f_mask3;
		this.INT_MASKB_f_mask4 = this.INT_MASKB.f_mask4;
		this.INT_MASKB_f_mask5 = this.INT_MASKB.f_mask5;
		this.INT_MASKB_f_mask6 = this.INT_MASKB.f_mask6;
		this.INT_MASKB_f_mask7 = this.INT_MASKB.f_mask7;
		this.INT_MASKB_f_mask8 = this.INT_MASKB.f_mask8;
		this.INT_MASKB_f_mask9 = this.INT_MASKB.f_mask9;
		this.INT_MASKB_f_mask10 = this.INT_MASKB.f_mask10;
		this.INT_MASKB_f_mask11 = this.INT_MASKB.f_mask11;
		this.INT_MASKB_f_mask12 = this.INT_MASKB.f_mask12;
		this.INT_MASKB_f_mask13 = this.INT_MASKB.f_mask13;
		this.INT_MASKB_f_mask14 = this.INT_MASKB.f_mask14;
		this.INT_MASKB_f_mask15 = this.INT_MASKB.f_mask15;
		this.INT_MASKB_f_mask16 = this.INT_MASKB.f_mask16;
		this.INT_MASKB_f_mask17 = this.INT_MASKB.f_mask17;
		this.INT_MASKB_f_mask18 = this.INT_MASKB.f_mask18;
		this.INT_MASKB_f_mask19 = this.INT_MASKB.f_mask19;
		this.INT_MASKB_f_mask20 = this.INT_MASKB.f_mask20;
		this.INT_MASKB_f_mask21 = this.INT_MASKB.f_mask21;
		this.INT_MASKB_f_mask22 = this.INT_MASKB.f_mask22;
		this.INT_MASKB_f_mask23 = this.INT_MASKB.f_mask23;
		this.INT_MASKB_f_mask24 = this.INT_MASKB.f_mask24;
		this.INT_MASKB_f_mask25 = this.INT_MASKB.f_mask25;
		this.INT_MASKB_f_mask26 = this.INT_MASKB.f_mask26;
		this.INT_MASKB_f_mask27 = this.INT_MASKB.f_mask27;
		this.INT_MASKB_f_mask28 = this.INT_MASKB.f_mask28;
		this.INT_MASKB_f_mask29 = this.INT_MASKB.f_mask29;
		this.INT_MASKB_f_mask30 = this.INT_MASKB.f_mask30;
		this.INT_MASKB_f_mask31 = this.INT_MASKB.f_mask31;
      this.INT_SRCA = ral_reg_INT_SRCA::type_id::create("INT_SRCA",,get_full_name());
      if(this.INT_SRCA.has_coverage(UVM_CVR_REG_BITS))
      	this.INT_SRCA.cg_bits.option.name = "INT_SRCA_bits";
      this.INT_SRCA.configure(this, null, "");
      this.INT_SRCA.build();
      this.default_map.add_reg(this.INT_SRCA, `UVM_REG_ADDR_WIDTH'hC, "RW", 0);
		this.INT_SRCA_f_mask0 = this.INT_SRCA.f_mask0;
		this.INT_SRCA_f_mask1 = this.INT_SRCA.f_mask1;
		this.INT_SRCA_f_mask2 = this.INT_SRCA.f_mask2;
		this.INT_SRCA_f_mask3 = this.INT_SRCA.f_mask3;
		this.INT_SRCA_f_mask4 = this.INT_SRCA.f_mask4;
		this.INT_SRCA_f_mask5 = this.INT_SRCA.f_mask5;
		this.INT_SRCA_f_mask6 = this.INT_SRCA.f_mask6;
		this.INT_SRCA_f_mask7 = this.INT_SRCA.f_mask7;
		this.INT_SRCA_f_mask8 = this.INT_SRCA.f_mask8;
		this.INT_SRCA_f_mask9 = this.INT_SRCA.f_mask9;
		this.INT_SRCA_f_mask10 = this.INT_SRCA.f_mask10;
		this.INT_SRCA_f_mask11 = this.INT_SRCA.f_mask11;
		this.INT_SRCA_f_mask12 = this.INT_SRCA.f_mask12;
		this.INT_SRCA_f_mask13 = this.INT_SRCA.f_mask13;
		this.INT_SRCA_f_mask14 = this.INT_SRCA.f_mask14;
		this.INT_SRCA_f_mask15 = this.INT_SRCA.f_mask15;
		this.INT_SRCA_f_mask16 = this.INT_SRCA.f_mask16;
		this.INT_SRCA_f_mask17 = this.INT_SRCA.f_mask17;
		this.INT_SRCA_f_mask18 = this.INT_SRCA.f_mask18;
		this.INT_SRCA_f_mask19 = this.INT_SRCA.f_mask19;
		this.INT_SRCA_f_mask20 = this.INT_SRCA.f_mask20;
		this.INT_SRCA_f_mask21 = this.INT_SRCA.f_mask21;
		this.INT_SRCA_f_mask22 = this.INT_SRCA.f_mask22;
		this.INT_SRCA_f_mask23 = this.INT_SRCA.f_mask23;
		this.INT_SRCA_f_mask24 = this.INT_SRCA.f_mask24;
		this.INT_SRCA_f_mask25 = this.INT_SRCA.f_mask25;
		this.INT_SRCA_f_mask26 = this.INT_SRCA.f_mask26;
		this.INT_SRCA_f_mask27 = this.INT_SRCA.f_mask27;
		this.INT_SRCA_f_mask28 = this.INT_SRCA.f_mask28;
		this.INT_SRCA_f_mask29 = this.INT_SRCA.f_mask29;
		this.INT_SRCA_f_mask30 = this.INT_SRCA.f_mask30;
		this.INT_SRCA_f_mask31 = this.INT_SRCA.f_mask31;
      this.INT_SRCB = ral_reg_INT_SRCB::type_id::create("INT_SRCB",,get_full_name());
      if(this.INT_SRCB.has_coverage(UVM_CVR_REG_BITS))
      	this.INT_SRCB.cg_bits.option.name = "INT_SRCB_bits";
      this.INT_SRCB.configure(this, null, "");
      this.INT_SRCB.build();
      this.default_map.add_reg(this.INT_SRCB, `UVM_REG_ADDR_WIDTH'h10, "RW", 0);
		this.INT_SRCB_f_mask0 = this.INT_SRCB.f_mask0;
		this.INT_SRCB_f_mask1 = this.INT_SRCB.f_mask1;
		this.INT_SRCB_f_mask2 = this.INT_SRCB.f_mask2;
		this.INT_SRCB_f_mask3 = this.INT_SRCB.f_mask3;
		this.INT_SRCB_f_mask4 = this.INT_SRCB.f_mask4;
		this.INT_SRCB_f_mask5 = this.INT_SRCB.f_mask5;
		this.INT_SRCB_f_mask6 = this.INT_SRCB.f_mask6;
		this.INT_SRCB_f_mask7 = this.INT_SRCB.f_mask7;
		this.INT_SRCB_f_mask8 = this.INT_SRCB.f_mask8;
		this.INT_SRCB_f_mask9 = this.INT_SRCB.f_mask9;
		this.INT_SRCB_f_mask10 = this.INT_SRCB.f_mask10;
		this.INT_SRCB_f_mask11 = this.INT_SRCB.f_mask11;
		this.INT_SRCB_f_mask12 = this.INT_SRCB.f_mask12;
		this.INT_SRCB_f_mask13 = this.INT_SRCB.f_mask13;
		this.INT_SRCB_f_mask14 = this.INT_SRCB.f_mask14;
		this.INT_SRCB_f_mask15 = this.INT_SRCB.f_mask15;
		this.INT_SRCB_f_mask16 = this.INT_SRCB.f_mask16;
		this.INT_SRCB_f_mask17 = this.INT_SRCB.f_mask17;
		this.INT_SRCB_f_mask18 = this.INT_SRCB.f_mask18;
		this.INT_SRCB_f_mask19 = this.INT_SRCB.f_mask19;
		this.INT_SRCB_f_mask20 = this.INT_SRCB.f_mask20;
		this.INT_SRCB_f_mask21 = this.INT_SRCB.f_mask21;
		this.INT_SRCB_f_mask22 = this.INT_SRCB.f_mask22;
		this.INT_SRCB_f_mask23 = this.INT_SRCB.f_mask23;
		this.INT_SRCB_f_mask24 = this.INT_SRCB.f_mask24;
		this.INT_SRCB_f_mask25 = this.INT_SRCB.f_mask25;
		this.INT_SRCB_f_mask26 = this.INT_SRCB.f_mask26;
		this.INT_SRCB_f_mask27 = this.INT_SRCB.f_mask27;
		this.INT_SRCB_f_mask28 = this.INT_SRCB.f_mask28;
		this.INT_SRCB_f_mask29 = this.INT_SRCB.f_mask29;
		this.INT_SRCB_f_mask30 = this.INT_SRCB.f_mask30;
		this.INT_SRCB_f_mask31 = this.INT_SRCB.f_mask31;
      this.CH0_CSR = ral_reg_CH0_CSR::type_id::create("CH0_CSR",,get_full_name());
      if(this.CH0_CSR.has_coverage(UVM_CVR_REG_BITS))
      	this.CH0_CSR.cg_bits.option.name = "CH0_CSR_bits";
      this.CH0_CSR.configure(this, null, "");
      this.CH0_CSR.build();
      this.default_map.add_reg(this.CH0_CSR, `UVM_REG_ADDR_WIDTH'h20, "RW", 0);
		this.CH0_CSR_CH_EN = this.CH0_CSR.CH_EN;
		this.CH0_CSR_DST_SEL = this.CH0_CSR.DST_SEL;
		this.CH0_CSR_SRC_SEL = this.CH0_CSR.SRC_SEL;
		this.CH0_CSR_INC_DST = this.CH0_CSR.INC_DST;
		this.CH0_CSR_INC_SRC = this.CH0_CSR.INC_SRC;
		this.CH0_CSR_MODE = this.CH0_CSR.MODE;
		this.CH0_CSR_ARS = this.CH0_CSR.ARS;
		this.CH0_CSR_USE_ED = this.CH0_CSR.USE_ED;
		this.CH0_CSR_SZ_WB = this.CH0_CSR.SZ_WB;
		this.CH0_CSR_STOP = this.CH0_CSR.STOP;
		this.CH0_CSR_BUSY = this.CH0_CSR.BUSY;
		this.CH0_CSR_DONE = this.CH0_CSR.DONE;
		this.CH0_CSR_ERR = this.CH0_CSR.ERR;
		this.CH0_CSR_PARITY = this.CH0_CSR.PARITY;
      this.ch0_sz = ral_reg_CHN_SZ::type_id::create("ch0_sz",,get_full_name());
      if(this.ch0_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch0_sz.cg_bits.option.name = "ch0_sz_bits";
      this.ch0_sz.configure(this, null, "");
      this.ch0_sz.build();
      this.default_map.add_reg(this.ch0_sz, `UVM_REG_ADDR_WIDTH'h24, "RW", 0);
		this.ch0_sz_CHK_SZ = this.ch0_sz.CHK_SZ;
		this.ch0_sz_TOT_SZ = this.ch0_sz.TOT_SZ;
      this.ch0_a0 = ral_reg_CHN_A0::type_id::create("ch0_a0",,get_full_name());
      if(this.ch0_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch0_a0.cg_bits.option.name = "ch0_a0_bits";
      this.ch0_a0.configure(this, null, "");
      this.ch0_a0.build();
      this.default_map.add_reg(this.ch0_a0, `UVM_REG_ADDR_WIDTH'h28, "RW", 0);
		this.ch0_a0_ADDRESS = this.ch0_a0.ADDRESS;
      this.ch0_am0 = ral_reg_CHN_AM0::type_id::create("ch0_am0",,get_full_name());
      if(this.ch0_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch0_am0.cg_bits.option.name = "ch0_am0_bits";
      this.ch0_am0.configure(this, null, "");
      this.ch0_am0.build();
      this.default_map.add_reg(this.ch0_am0, `UVM_REG_ADDR_WIDTH'h2C, "RW", 0);
		this.ch0_am0_ADDRESS_MASK = this.ch0_am0.ADDRESS_MASK;
      this.ch0_a1 = ral_reg_CHN_A1::type_id::create("ch0_a1",,get_full_name());
      if(this.ch0_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch0_a1.cg_bits.option.name = "ch0_a1_bits";
      this.ch0_a1.configure(this, null, "");
      this.ch0_a1.build();
      this.default_map.add_reg(this.ch0_a1, `UVM_REG_ADDR_WIDTH'h30, "RW", 0);
		this.ch0_a1_ADDRESS = this.ch0_a1.ADDRESS;
      this.ch0_am1 = ral_reg_CHN_AM1::type_id::create("ch0_am1",,get_full_name());
      if(this.ch0_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch0_am1.cg_bits.option.name = "ch0_am1_bits";
      this.ch0_am1.configure(this, null, "");
      this.ch0_am1.build();
      this.default_map.add_reg(this.ch0_am1, `UVM_REG_ADDR_WIDTH'h34, "RW", 0);
		this.ch0_am1_ADDRESS_MASK = this.ch0_am1.ADDRESS_MASK;
      this.ch0_desc = ral_reg_CHN_DESC::type_id::create("ch0_desc",,get_full_name());
      if(this.ch0_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch0_desc.cg_bits.option.name = "ch0_desc_bits";
      this.ch0_desc.configure(this, null, "");
      this.ch0_desc.build();
      this.default_map.add_reg(this.ch0_desc, `UVM_REG_ADDR_WIDTH'h38, "RW", 0);
		this.ch0_desc_ADDRESS_MASK = this.ch0_desc.ADDRESS_MASK;
      this.ch0_swptr = ral_reg_CHN_SWPTR::type_id::create("ch0_swptr",,get_full_name());
      if(this.ch0_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch0_swptr.cg_bits.option.name = "ch0_swptr_bits";
      this.ch0_swptr.configure(this, null, "");
      this.ch0_swptr.build();
      this.default_map.add_reg(this.ch0_swptr, `UVM_REG_ADDR_WIDTH'h3C, "RW", 0);
		this.ch0_swptr_SWPTR_EN = this.ch0_swptr.SWPTR_EN;
		this.ch0_swptr_SW_POINTER = this.ch0_swptr.SW_POINTER;
      this.ch1_csr = ral_reg_CHN_CSR::type_id::create("ch1_csr",,get_full_name());
      if(this.ch1_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch1_csr.cg_bits.option.name = "ch1_csr_bits";
      this.ch1_csr.configure(this, null, "");
      this.ch1_csr.build();
      this.default_map.add_reg(this.ch1_csr, `UVM_REG_ADDR_WIDTH'h40, "RW", 0);
		this.ch1_csr_CH_EN = this.ch1_csr.CH_EN;
		this.ch1_csr_DST_SEL = this.ch1_csr.DST_SEL;
		this.ch1_csr_SRC_SEL = this.ch1_csr.SRC_SEL;
		this.ch1_csr_INC_DST = this.ch1_csr.INC_DST;
		this.ch1_csr_INC_SRC = this.ch1_csr.INC_SRC;
		this.ch1_csr_MODE = this.ch1_csr.MODE;
		this.ch1_csr_ARS = this.ch1_csr.ARS;
		this.ch1_csr_USE_ED = this.ch1_csr.USE_ED;
		this.ch1_csr_SZ_WB = this.ch1_csr.SZ_WB;
		this.ch1_csr_STOP = this.ch1_csr.STOP;
		this.ch1_csr_BUSY = this.ch1_csr.BUSY;
		this.ch1_csr_DONE = this.ch1_csr.DONE;
		this.ch1_csr_ERR = this.ch1_csr.ERR;
		this.ch1_csr_PARITY = this.ch1_csr.PARITY;
      this.ch1_sz = ral_reg_CHN_SZ::type_id::create("ch1_sz",,get_full_name());
      if(this.ch1_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch1_sz.cg_bits.option.name = "ch1_sz_bits";
      this.ch1_sz.configure(this, null, "");
      this.ch1_sz.build();
      this.default_map.add_reg(this.ch1_sz, `UVM_REG_ADDR_WIDTH'h44, "RW", 0);
		this.ch1_sz_CHK_SZ = this.ch1_sz.CHK_SZ;
		this.ch1_sz_TOT_SZ = this.ch1_sz.TOT_SZ;
      this.ch1_a0 = ral_reg_CHN_A0::type_id::create("ch1_a0",,get_full_name());
      if(this.ch1_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch1_a0.cg_bits.option.name = "ch1_a0_bits";
      this.ch1_a0.configure(this, null, "");
      this.ch1_a0.build();
      this.default_map.add_reg(this.ch1_a0, `UVM_REG_ADDR_WIDTH'h48, "RW", 0);
		this.ch1_a0_ADDRESS = this.ch1_a0.ADDRESS;
      this.ch1_am0 = ral_reg_CHN_AM0::type_id::create("ch1_am0",,get_full_name());
      if(this.ch1_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch1_am0.cg_bits.option.name = "ch1_am0_bits";
      this.ch1_am0.configure(this, null, "");
      this.ch1_am0.build();
      this.default_map.add_reg(this.ch1_am0, `UVM_REG_ADDR_WIDTH'h4C, "RW", 0);
		this.ch1_am0_ADDRESS_MASK = this.ch1_am0.ADDRESS_MASK;
      this.ch1_a1 = ral_reg_CHN_A1::type_id::create("ch1_a1",,get_full_name());
      if(this.ch1_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch1_a1.cg_bits.option.name = "ch1_a1_bits";
      this.ch1_a1.configure(this, null, "");
      this.ch1_a1.build();
      this.default_map.add_reg(this.ch1_a1, `UVM_REG_ADDR_WIDTH'h50, "RW", 0);
		this.ch1_a1_ADDRESS = this.ch1_a1.ADDRESS;
      this.ch1_am1 = ral_reg_CHN_AM1::type_id::create("ch1_am1",,get_full_name());
      if(this.ch1_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch1_am1.cg_bits.option.name = "ch1_am1_bits";
      this.ch1_am1.configure(this, null, "");
      this.ch1_am1.build();
      this.default_map.add_reg(this.ch1_am1, `UVM_REG_ADDR_WIDTH'h54, "RW", 0);
		this.ch1_am1_ADDRESS_MASK = this.ch1_am1.ADDRESS_MASK;
      this.ch1_desc = ral_reg_CHN_DESC::type_id::create("ch1_desc",,get_full_name());
      if(this.ch1_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch1_desc.cg_bits.option.name = "ch1_desc_bits";
      this.ch1_desc.configure(this, null, "");
      this.ch1_desc.build();
      this.default_map.add_reg(this.ch1_desc, `UVM_REG_ADDR_WIDTH'h58, "RW", 0);
		this.ch1_desc_ADDRESS_MASK = this.ch1_desc.ADDRESS_MASK;
      this.ch1_swptr = ral_reg_CHN_SWPTR::type_id::create("ch1_swptr",,get_full_name());
      if(this.ch1_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch1_swptr.cg_bits.option.name = "ch1_swptr_bits";
      this.ch1_swptr.configure(this, null, "");
      this.ch1_swptr.build();
      this.default_map.add_reg(this.ch1_swptr, `UVM_REG_ADDR_WIDTH'h5C, "RW", 0);
		this.ch1_swptr_SWPTR_EN = this.ch1_swptr.SWPTR_EN;
		this.ch1_swptr_SW_POINTER = this.ch1_swptr.SW_POINTER;
      this.ch2_csr = ral_reg_CHN_CSR::type_id::create("ch2_csr",,get_full_name());
      if(this.ch2_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch2_csr.cg_bits.option.name = "ch2_csr_bits";
      this.ch2_csr.configure(this, null, "");
      this.ch2_csr.build();
      this.default_map.add_reg(this.ch2_csr, `UVM_REG_ADDR_WIDTH'h60, "RW", 0);
		this.ch2_csr_CH_EN = this.ch2_csr.CH_EN;
		this.ch2_csr_DST_SEL = this.ch2_csr.DST_SEL;
		this.ch2_csr_SRC_SEL = this.ch2_csr.SRC_SEL;
		this.ch2_csr_INC_DST = this.ch2_csr.INC_DST;
		this.ch2_csr_INC_SRC = this.ch2_csr.INC_SRC;
		this.ch2_csr_MODE = this.ch2_csr.MODE;
		this.ch2_csr_ARS = this.ch2_csr.ARS;
		this.ch2_csr_USE_ED = this.ch2_csr.USE_ED;
		this.ch2_csr_SZ_WB = this.ch2_csr.SZ_WB;
		this.ch2_csr_STOP = this.ch2_csr.STOP;
		this.ch2_csr_BUSY = this.ch2_csr.BUSY;
		this.ch2_csr_DONE = this.ch2_csr.DONE;
		this.ch2_csr_ERR = this.ch2_csr.ERR;
		this.ch2_csr_PARITY = this.ch2_csr.PARITY;
      this.ch2_sz = ral_reg_CHN_SZ::type_id::create("ch2_sz",,get_full_name());
      if(this.ch2_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch2_sz.cg_bits.option.name = "ch2_sz_bits";
      this.ch2_sz.configure(this, null, "");
      this.ch2_sz.build();
      this.default_map.add_reg(this.ch2_sz, `UVM_REG_ADDR_WIDTH'h64, "RW", 0);
		this.ch2_sz_CHK_SZ = this.ch2_sz.CHK_SZ;
		this.ch2_sz_TOT_SZ = this.ch2_sz.TOT_SZ;
      this.ch2_a0 = ral_reg_CHN_A0::type_id::create("ch2_a0",,get_full_name());
      if(this.ch2_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch2_a0.cg_bits.option.name = "ch2_a0_bits";
      this.ch2_a0.configure(this, null, "");
      this.ch2_a0.build();
      this.default_map.add_reg(this.ch2_a0, `UVM_REG_ADDR_WIDTH'h68, "RW", 0);
		this.ch2_a0_ADDRESS = this.ch2_a0.ADDRESS;
      this.ch2_am0 = ral_reg_CHN_AM0::type_id::create("ch2_am0",,get_full_name());
      if(this.ch2_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch2_am0.cg_bits.option.name = "ch2_am0_bits";
      this.ch2_am0.configure(this, null, "");
      this.ch2_am0.build();
      this.default_map.add_reg(this.ch2_am0, `UVM_REG_ADDR_WIDTH'h6C, "RW", 0);
		this.ch2_am0_ADDRESS_MASK = this.ch2_am0.ADDRESS_MASK;
      this.ch2_a1 = ral_reg_CHN_A1::type_id::create("ch2_a1",,get_full_name());
      if(this.ch2_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch2_a1.cg_bits.option.name = "ch2_a1_bits";
      this.ch2_a1.configure(this, null, "");
      this.ch2_a1.build();
      this.default_map.add_reg(this.ch2_a1, `UVM_REG_ADDR_WIDTH'h70, "RW", 0);
		this.ch2_a1_ADDRESS = this.ch2_a1.ADDRESS;
      this.ch2_am1 = ral_reg_CHN_AM1::type_id::create("ch2_am1",,get_full_name());
      if(this.ch2_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch2_am1.cg_bits.option.name = "ch2_am1_bits";
      this.ch2_am1.configure(this, null, "");
      this.ch2_am1.build();
      this.default_map.add_reg(this.ch2_am1, `UVM_REG_ADDR_WIDTH'h74, "RW", 0);
		this.ch2_am1_ADDRESS_MASK = this.ch2_am1.ADDRESS_MASK;
      this.ch2_desc = ral_reg_CHN_DESC::type_id::create("ch2_desc",,get_full_name());
      if(this.ch2_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch2_desc.cg_bits.option.name = "ch2_desc_bits";
      this.ch2_desc.configure(this, null, "");
      this.ch2_desc.build();
      this.default_map.add_reg(this.ch2_desc, `UVM_REG_ADDR_WIDTH'h78, "RW", 0);
		this.ch2_desc_ADDRESS_MASK = this.ch2_desc.ADDRESS_MASK;
      this.ch2_swptr = ral_reg_CHN_SWPTR::type_id::create("ch2_swptr",,get_full_name());
      if(this.ch2_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch2_swptr.cg_bits.option.name = "ch2_swptr_bits";
      this.ch2_swptr.configure(this, null, "");
      this.ch2_swptr.build();
      this.default_map.add_reg(this.ch2_swptr, `UVM_REG_ADDR_WIDTH'h7C, "RW", 0);
		this.ch2_swptr_SWPTR_EN = this.ch2_swptr.SWPTR_EN;
		this.ch2_swptr_SW_POINTER = this.ch2_swptr.SW_POINTER;
      this.ch3_csr = ral_reg_CHN_CSR::type_id::create("ch3_csr",,get_full_name());
      if(this.ch3_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch3_csr.cg_bits.option.name = "ch3_csr_bits";
      this.ch3_csr.configure(this, null, "");
      this.ch3_csr.build();
      this.default_map.add_reg(this.ch3_csr, `UVM_REG_ADDR_WIDTH'h80, "RW", 0);
		this.ch3_csr_CH_EN = this.ch3_csr.CH_EN;
		this.ch3_csr_DST_SEL = this.ch3_csr.DST_SEL;
		this.ch3_csr_SRC_SEL = this.ch3_csr.SRC_SEL;
		this.ch3_csr_INC_DST = this.ch3_csr.INC_DST;
		this.ch3_csr_INC_SRC = this.ch3_csr.INC_SRC;
		this.ch3_csr_MODE = this.ch3_csr.MODE;
		this.ch3_csr_ARS = this.ch3_csr.ARS;
		this.ch3_csr_USE_ED = this.ch3_csr.USE_ED;
		this.ch3_csr_SZ_WB = this.ch3_csr.SZ_WB;
		this.ch3_csr_STOP = this.ch3_csr.STOP;
		this.ch3_csr_BUSY = this.ch3_csr.BUSY;
		this.ch3_csr_DONE = this.ch3_csr.DONE;
		this.ch3_csr_ERR = this.ch3_csr.ERR;
		this.ch3_csr_PARITY = this.ch3_csr.PARITY;
      this.ch3_sz = ral_reg_CHN_SZ::type_id::create("ch3_sz",,get_full_name());
      if(this.ch3_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch3_sz.cg_bits.option.name = "ch3_sz_bits";
      this.ch3_sz.configure(this, null, "");
      this.ch3_sz.build();
      this.default_map.add_reg(this.ch3_sz, `UVM_REG_ADDR_WIDTH'h84, "RW", 0);
		this.ch3_sz_CHK_SZ = this.ch3_sz.CHK_SZ;
		this.ch3_sz_TOT_SZ = this.ch3_sz.TOT_SZ;
      this.ch3_a0 = ral_reg_CHN_A0::type_id::create("ch3_a0",,get_full_name());
      if(this.ch3_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch3_a0.cg_bits.option.name = "ch3_a0_bits";
      this.ch3_a0.configure(this, null, "");
      this.ch3_a0.build();
      this.default_map.add_reg(this.ch3_a0, `UVM_REG_ADDR_WIDTH'h88, "RW", 0);
		this.ch3_a0_ADDRESS = this.ch3_a0.ADDRESS;
      this.ch3_am0 = ral_reg_CHN_AM0::type_id::create("ch3_am0",,get_full_name());
      if(this.ch3_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch3_am0.cg_bits.option.name = "ch3_am0_bits";
      this.ch3_am0.configure(this, null, "");
      this.ch3_am0.build();
      this.default_map.add_reg(this.ch3_am0, `UVM_REG_ADDR_WIDTH'h8C, "RW", 0);
		this.ch3_am0_ADDRESS_MASK = this.ch3_am0.ADDRESS_MASK;
      this.ch3_a1 = ral_reg_CHN_A1::type_id::create("ch3_a1",,get_full_name());
      if(this.ch3_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch3_a1.cg_bits.option.name = "ch3_a1_bits";
      this.ch3_a1.configure(this, null, "");
      this.ch3_a1.build();
      this.default_map.add_reg(this.ch3_a1, `UVM_REG_ADDR_WIDTH'h90, "RW", 0);
		this.ch3_a1_ADDRESS = this.ch3_a1.ADDRESS;
      this.ch3_am1 = ral_reg_CHN_AM1::type_id::create("ch3_am1",,get_full_name());
      if(this.ch3_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch3_am1.cg_bits.option.name = "ch3_am1_bits";
      this.ch3_am1.configure(this, null, "");
      this.ch3_am1.build();
      this.default_map.add_reg(this.ch3_am1, `UVM_REG_ADDR_WIDTH'h94, "RW", 0);
		this.ch3_am1_ADDRESS_MASK = this.ch3_am1.ADDRESS_MASK;
      this.ch3_desc = ral_reg_CHN_DESC::type_id::create("ch3_desc",,get_full_name());
      if(this.ch3_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch3_desc.cg_bits.option.name = "ch3_desc_bits";
      this.ch3_desc.configure(this, null, "");
      this.ch3_desc.build();
      this.default_map.add_reg(this.ch3_desc, `UVM_REG_ADDR_WIDTH'h98, "RW", 0);
		this.ch3_desc_ADDRESS_MASK = this.ch3_desc.ADDRESS_MASK;
      this.ch3_swptr = ral_reg_CHN_SWPTR::type_id::create("ch3_swptr",,get_full_name());
      if(this.ch3_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch3_swptr.cg_bits.option.name = "ch3_swptr_bits";
      this.ch3_swptr.configure(this, null, "");
      this.ch3_swptr.build();
      this.default_map.add_reg(this.ch3_swptr, `UVM_REG_ADDR_WIDTH'h9C, "RW", 0);
		this.ch3_swptr_SWPTR_EN = this.ch3_swptr.SWPTR_EN;
		this.ch3_swptr_SW_POINTER = this.ch3_swptr.SW_POINTER;
      this.ch4_csr = ral_reg_CHN_CSR::type_id::create("ch4_csr",,get_full_name());
      if(this.ch4_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch4_csr.cg_bits.option.name = "ch4_csr_bits";
      this.ch4_csr.configure(this, null, "");
      this.ch4_csr.build();
      this.default_map.add_reg(this.ch4_csr, `UVM_REG_ADDR_WIDTH'hA0, "RW", 0);
		this.ch4_csr_CH_EN = this.ch4_csr.CH_EN;
		this.ch4_csr_DST_SEL = this.ch4_csr.DST_SEL;
		this.ch4_csr_SRC_SEL = this.ch4_csr.SRC_SEL;
		this.ch4_csr_INC_DST = this.ch4_csr.INC_DST;
		this.ch4_csr_INC_SRC = this.ch4_csr.INC_SRC;
		this.ch4_csr_MODE = this.ch4_csr.MODE;
		this.ch4_csr_ARS = this.ch4_csr.ARS;
		this.ch4_csr_USE_ED = this.ch4_csr.USE_ED;
		this.ch4_csr_SZ_WB = this.ch4_csr.SZ_WB;
		this.ch4_csr_STOP = this.ch4_csr.STOP;
		this.ch4_csr_BUSY = this.ch4_csr.BUSY;
		this.ch4_csr_DONE = this.ch4_csr.DONE;
		this.ch4_csr_ERR = this.ch4_csr.ERR;
		this.ch4_csr_PARITY = this.ch4_csr.PARITY;
      this.ch4_sz = ral_reg_CHN_SZ::type_id::create("ch4_sz",,get_full_name());
      if(this.ch4_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch4_sz.cg_bits.option.name = "ch4_sz_bits";
      this.ch4_sz.configure(this, null, "");
      this.ch4_sz.build();
      this.default_map.add_reg(this.ch4_sz, `UVM_REG_ADDR_WIDTH'hA4, "RW", 0);
		this.ch4_sz_CHK_SZ = this.ch4_sz.CHK_SZ;
		this.ch4_sz_TOT_SZ = this.ch4_sz.TOT_SZ;
      this.ch4_a0 = ral_reg_CHN_A0::type_id::create("ch4_a0",,get_full_name());
      if(this.ch4_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch4_a0.cg_bits.option.name = "ch4_a0_bits";
      this.ch4_a0.configure(this, null, "");
      this.ch4_a0.build();
      this.default_map.add_reg(this.ch4_a0, `UVM_REG_ADDR_WIDTH'hA8, "RW", 0);
		this.ch4_a0_ADDRESS = this.ch4_a0.ADDRESS;
      this.ch4_am0 = ral_reg_CHN_AM0::type_id::create("ch4_am0",,get_full_name());
      if(this.ch4_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch4_am0.cg_bits.option.name = "ch4_am0_bits";
      this.ch4_am0.configure(this, null, "");
      this.ch4_am0.build();
      this.default_map.add_reg(this.ch4_am0, `UVM_REG_ADDR_WIDTH'hAC, "RW", 0);
		this.ch4_am0_ADDRESS_MASK = this.ch4_am0.ADDRESS_MASK;
      this.ch4_a1 = ral_reg_CHN_A1::type_id::create("ch4_a1",,get_full_name());
      if(this.ch4_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch4_a1.cg_bits.option.name = "ch4_a1_bits";
      this.ch4_a1.configure(this, null, "");
      this.ch4_a1.build();
      this.default_map.add_reg(this.ch4_a1, `UVM_REG_ADDR_WIDTH'hB0, "RW", 0);
		this.ch4_a1_ADDRESS = this.ch4_a1.ADDRESS;
      this.ch4_am1 = ral_reg_CHN_AM1::type_id::create("ch4_am1",,get_full_name());
      if(this.ch4_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch4_am1.cg_bits.option.name = "ch4_am1_bits";
      this.ch4_am1.configure(this, null, "");
      this.ch4_am1.build();
      this.default_map.add_reg(this.ch4_am1, `UVM_REG_ADDR_WIDTH'hB4, "RW", 0);
		this.ch4_am1_ADDRESS_MASK = this.ch4_am1.ADDRESS_MASK;
      this.ch4_desc = ral_reg_CHN_DESC::type_id::create("ch4_desc",,get_full_name());
      if(this.ch4_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch4_desc.cg_bits.option.name = "ch4_desc_bits";
      this.ch4_desc.configure(this, null, "");
      this.ch4_desc.build();
      this.default_map.add_reg(this.ch4_desc, `UVM_REG_ADDR_WIDTH'hB8, "RW", 0);
		this.ch4_desc_ADDRESS_MASK = this.ch4_desc.ADDRESS_MASK;
      this.ch4_swptr = ral_reg_CHN_SWPTR::type_id::create("ch4_swptr",,get_full_name());
      if(this.ch4_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch4_swptr.cg_bits.option.name = "ch4_swptr_bits";
      this.ch4_swptr.configure(this, null, "");
      this.ch4_swptr.build();
      this.default_map.add_reg(this.ch4_swptr, `UVM_REG_ADDR_WIDTH'hBC, "RW", 0);
		this.ch4_swptr_SWPTR_EN = this.ch4_swptr.SWPTR_EN;
		this.ch4_swptr_SW_POINTER = this.ch4_swptr.SW_POINTER;
      this.ch5_csr = ral_reg_CHN_CSR::type_id::create("ch5_csr",,get_full_name());
      if(this.ch5_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch5_csr.cg_bits.option.name = "ch5_csr_bits";
      this.ch5_csr.configure(this, null, "");
      this.ch5_csr.build();
      this.default_map.add_reg(this.ch5_csr, `UVM_REG_ADDR_WIDTH'hC0, "RW", 0);
		this.ch5_csr_CH_EN = this.ch5_csr.CH_EN;
		this.ch5_csr_DST_SEL = this.ch5_csr.DST_SEL;
		this.ch5_csr_SRC_SEL = this.ch5_csr.SRC_SEL;
		this.ch5_csr_INC_DST = this.ch5_csr.INC_DST;
		this.ch5_csr_INC_SRC = this.ch5_csr.INC_SRC;
		this.ch5_csr_MODE = this.ch5_csr.MODE;
		this.ch5_csr_ARS = this.ch5_csr.ARS;
		this.ch5_csr_USE_ED = this.ch5_csr.USE_ED;
		this.ch5_csr_SZ_WB = this.ch5_csr.SZ_WB;
		this.ch5_csr_STOP = this.ch5_csr.STOP;
		this.ch5_csr_BUSY = this.ch5_csr.BUSY;
		this.ch5_csr_DONE = this.ch5_csr.DONE;
		this.ch5_csr_ERR = this.ch5_csr.ERR;
		this.ch5_csr_PARITY = this.ch5_csr.PARITY;
      this.ch5_sz = ral_reg_CHN_SZ::type_id::create("ch5_sz",,get_full_name());
      if(this.ch5_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch5_sz.cg_bits.option.name = "ch5_sz_bits";
      this.ch5_sz.configure(this, null, "");
      this.ch5_sz.build();
      this.default_map.add_reg(this.ch5_sz, `UVM_REG_ADDR_WIDTH'hC4, "RW", 0);
		this.ch5_sz_CHK_SZ = this.ch5_sz.CHK_SZ;
		this.ch5_sz_TOT_SZ = this.ch5_sz.TOT_SZ;
      this.ch5_a0 = ral_reg_CHN_A0::type_id::create("ch5_a0",,get_full_name());
      if(this.ch5_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch5_a0.cg_bits.option.name = "ch5_a0_bits";
      this.ch5_a0.configure(this, null, "");
      this.ch5_a0.build();
      this.default_map.add_reg(this.ch5_a0, `UVM_REG_ADDR_WIDTH'hC8, "RW", 0);
		this.ch5_a0_ADDRESS = this.ch5_a0.ADDRESS;
      this.ch5_am0 = ral_reg_CHN_AM0::type_id::create("ch5_am0",,get_full_name());
      if(this.ch5_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch5_am0.cg_bits.option.name = "ch5_am0_bits";
      this.ch5_am0.configure(this, null, "");
      this.ch5_am0.build();
      this.default_map.add_reg(this.ch5_am0, `UVM_REG_ADDR_WIDTH'hCC, "RW", 0);
		this.ch5_am0_ADDRESS_MASK = this.ch5_am0.ADDRESS_MASK;
      this.ch5_a1 = ral_reg_CHN_A1::type_id::create("ch5_a1",,get_full_name());
      if(this.ch5_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch5_a1.cg_bits.option.name = "ch5_a1_bits";
      this.ch5_a1.configure(this, null, "");
      this.ch5_a1.build();
      this.default_map.add_reg(this.ch5_a1, `UVM_REG_ADDR_WIDTH'hD0, "RW", 0);
		this.ch5_a1_ADDRESS = this.ch5_a1.ADDRESS;
      this.ch5_am1 = ral_reg_CHN_AM1::type_id::create("ch5_am1",,get_full_name());
      if(this.ch5_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch5_am1.cg_bits.option.name = "ch5_am1_bits";
      this.ch5_am1.configure(this, null, "");
      this.ch5_am1.build();
      this.default_map.add_reg(this.ch5_am1, `UVM_REG_ADDR_WIDTH'hD4, "RW", 0);
		this.ch5_am1_ADDRESS_MASK = this.ch5_am1.ADDRESS_MASK;
      this.ch5_desc = ral_reg_CHN_DESC::type_id::create("ch5_desc",,get_full_name());
      if(this.ch5_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch5_desc.cg_bits.option.name = "ch5_desc_bits";
      this.ch5_desc.configure(this, null, "");
      this.ch5_desc.build();
      this.default_map.add_reg(this.ch5_desc, `UVM_REG_ADDR_WIDTH'hD8, "RW", 0);
		this.ch5_desc_ADDRESS_MASK = this.ch5_desc.ADDRESS_MASK;
      this.ch5_swptr = ral_reg_CHN_SWPTR::type_id::create("ch5_swptr",,get_full_name());
      if(this.ch5_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch5_swptr.cg_bits.option.name = "ch5_swptr_bits";
      this.ch5_swptr.configure(this, null, "");
      this.ch5_swptr.build();
      this.default_map.add_reg(this.ch5_swptr, `UVM_REG_ADDR_WIDTH'hDC, "RW", 0);
		this.ch5_swptr_SWPTR_EN = this.ch5_swptr.SWPTR_EN;
		this.ch5_swptr_SW_POINTER = this.ch5_swptr.SW_POINTER;
      this.ch6_csr = ral_reg_CHN_CSR::type_id::create("ch6_csr",,get_full_name());
      if(this.ch6_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch6_csr.cg_bits.option.name = "ch6_csr_bits";
      this.ch6_csr.configure(this, null, "");
      this.ch6_csr.build();
      this.default_map.add_reg(this.ch6_csr, `UVM_REG_ADDR_WIDTH'hE0, "RW", 0);
		this.ch6_csr_CH_EN = this.ch6_csr.CH_EN;
		this.ch6_csr_DST_SEL = this.ch6_csr.DST_SEL;
		this.ch6_csr_SRC_SEL = this.ch6_csr.SRC_SEL;
		this.ch6_csr_INC_DST = this.ch6_csr.INC_DST;
		this.ch6_csr_INC_SRC = this.ch6_csr.INC_SRC;
		this.ch6_csr_MODE = this.ch6_csr.MODE;
		this.ch6_csr_ARS = this.ch6_csr.ARS;
		this.ch6_csr_USE_ED = this.ch6_csr.USE_ED;
		this.ch6_csr_SZ_WB = this.ch6_csr.SZ_WB;
		this.ch6_csr_STOP = this.ch6_csr.STOP;
		this.ch6_csr_BUSY = this.ch6_csr.BUSY;
		this.ch6_csr_DONE = this.ch6_csr.DONE;
		this.ch6_csr_ERR = this.ch6_csr.ERR;
		this.ch6_csr_PARITY = this.ch6_csr.PARITY;
      this.ch6_sz = ral_reg_CHN_SZ::type_id::create("ch6_sz",,get_full_name());
      if(this.ch6_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch6_sz.cg_bits.option.name = "ch6_sz_bits";
      this.ch6_sz.configure(this, null, "");
      this.ch6_sz.build();
      this.default_map.add_reg(this.ch6_sz, `UVM_REG_ADDR_WIDTH'hE4, "RW", 0);
		this.ch6_sz_CHK_SZ = this.ch6_sz.CHK_SZ;
		this.ch6_sz_TOT_SZ = this.ch6_sz.TOT_SZ;
      this.ch6_a0 = ral_reg_CHN_A0::type_id::create("ch6_a0",,get_full_name());
      if(this.ch6_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch6_a0.cg_bits.option.name = "ch6_a0_bits";
      this.ch6_a0.configure(this, null, "");
      this.ch6_a0.build();
      this.default_map.add_reg(this.ch6_a0, `UVM_REG_ADDR_WIDTH'hE8, "RW", 0);
		this.ch6_a0_ADDRESS = this.ch6_a0.ADDRESS;
      this.ch6_am0 = ral_reg_CHN_AM0::type_id::create("ch6_am0",,get_full_name());
      if(this.ch6_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch6_am0.cg_bits.option.name = "ch6_am0_bits";
      this.ch6_am0.configure(this, null, "");
      this.ch6_am0.build();
      this.default_map.add_reg(this.ch6_am0, `UVM_REG_ADDR_WIDTH'hEC, "RW", 0);
		this.ch6_am0_ADDRESS_MASK = this.ch6_am0.ADDRESS_MASK;
      this.ch6_a1 = ral_reg_CHN_A1::type_id::create("ch6_a1",,get_full_name());
      if(this.ch6_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch6_a1.cg_bits.option.name = "ch6_a1_bits";
      this.ch6_a1.configure(this, null, "");
      this.ch6_a1.build();
      this.default_map.add_reg(this.ch6_a1, `UVM_REG_ADDR_WIDTH'hF0, "RW", 0);
		this.ch6_a1_ADDRESS = this.ch6_a1.ADDRESS;
      this.ch6_am1 = ral_reg_CHN_AM1::type_id::create("ch6_am1",,get_full_name());
      if(this.ch6_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch6_am1.cg_bits.option.name = "ch6_am1_bits";
      this.ch6_am1.configure(this, null, "");
      this.ch6_am1.build();
      this.default_map.add_reg(this.ch6_am1, `UVM_REG_ADDR_WIDTH'hF4, "RW", 0);
		this.ch6_am1_ADDRESS_MASK = this.ch6_am1.ADDRESS_MASK;
      this.ch6_desc = ral_reg_CHN_DESC::type_id::create("ch6_desc",,get_full_name());
      if(this.ch6_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch6_desc.cg_bits.option.name = "ch6_desc_bits";
      this.ch6_desc.configure(this, null, "");
      this.ch6_desc.build();
      this.default_map.add_reg(this.ch6_desc, `UVM_REG_ADDR_WIDTH'hF8, "RW", 0);
		this.ch6_desc_ADDRESS_MASK = this.ch6_desc.ADDRESS_MASK;
      this.ch6_swptr = ral_reg_CHN_SWPTR::type_id::create("ch6_swptr",,get_full_name());
      if(this.ch6_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch6_swptr.cg_bits.option.name = "ch6_swptr_bits";
      this.ch6_swptr.configure(this, null, "");
      this.ch6_swptr.build();
      this.default_map.add_reg(this.ch6_swptr, `UVM_REG_ADDR_WIDTH'hFC, "RW", 0);
		this.ch6_swptr_SWPTR_EN = this.ch6_swptr.SWPTR_EN;
		this.ch6_swptr_SW_POINTER = this.ch6_swptr.SW_POINTER;
      this.ch7_csr = ral_reg_CHN_CSR::type_id::create("ch7_csr",,get_full_name());
      if(this.ch7_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch7_csr.cg_bits.option.name = "ch7_csr_bits";
      this.ch7_csr.configure(this, null, "");
      this.ch7_csr.build();
      this.default_map.add_reg(this.ch7_csr, `UVM_REG_ADDR_WIDTH'h100, "RW", 0);
		this.ch7_csr_CH_EN = this.ch7_csr.CH_EN;
		this.ch7_csr_DST_SEL = this.ch7_csr.DST_SEL;
		this.ch7_csr_SRC_SEL = this.ch7_csr.SRC_SEL;
		this.ch7_csr_INC_DST = this.ch7_csr.INC_DST;
		this.ch7_csr_INC_SRC = this.ch7_csr.INC_SRC;
		this.ch7_csr_MODE = this.ch7_csr.MODE;
		this.ch7_csr_ARS = this.ch7_csr.ARS;
		this.ch7_csr_USE_ED = this.ch7_csr.USE_ED;
		this.ch7_csr_SZ_WB = this.ch7_csr.SZ_WB;
		this.ch7_csr_STOP = this.ch7_csr.STOP;
		this.ch7_csr_BUSY = this.ch7_csr.BUSY;
		this.ch7_csr_DONE = this.ch7_csr.DONE;
		this.ch7_csr_ERR = this.ch7_csr.ERR;
		this.ch7_csr_PARITY = this.ch7_csr.PARITY;
      this.ch7_sz = ral_reg_CHN_SZ::type_id::create("ch7_sz",,get_full_name());
      if(this.ch7_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch7_sz.cg_bits.option.name = "ch7_sz_bits";
      this.ch7_sz.configure(this, null, "");
      this.ch7_sz.build();
      this.default_map.add_reg(this.ch7_sz, `UVM_REG_ADDR_WIDTH'h104, "RW", 0);
		this.ch7_sz_CHK_SZ = this.ch7_sz.CHK_SZ;
		this.ch7_sz_TOT_SZ = this.ch7_sz.TOT_SZ;
      this.ch7_a0 = ral_reg_CHN_A0::type_id::create("ch7_a0",,get_full_name());
      if(this.ch7_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch7_a0.cg_bits.option.name = "ch7_a0_bits";
      this.ch7_a0.configure(this, null, "");
      this.ch7_a0.build();
      this.default_map.add_reg(this.ch7_a0, `UVM_REG_ADDR_WIDTH'h108, "RW", 0);
		this.ch7_a0_ADDRESS = this.ch7_a0.ADDRESS;
      this.ch7_am0 = ral_reg_CHN_AM0::type_id::create("ch7_am0",,get_full_name());
      if(this.ch7_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch7_am0.cg_bits.option.name = "ch7_am0_bits";
      this.ch7_am0.configure(this, null, "");
      this.ch7_am0.build();
      this.default_map.add_reg(this.ch7_am0, `UVM_REG_ADDR_WIDTH'h10C, "RW", 0);
		this.ch7_am0_ADDRESS_MASK = this.ch7_am0.ADDRESS_MASK;
      this.ch7_a1 = ral_reg_CHN_A1::type_id::create("ch7_a1",,get_full_name());
      if(this.ch7_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch7_a1.cg_bits.option.name = "ch7_a1_bits";
      this.ch7_a1.configure(this, null, "");
      this.ch7_a1.build();
      this.default_map.add_reg(this.ch7_a1, `UVM_REG_ADDR_WIDTH'h110, "RW", 0);
		this.ch7_a1_ADDRESS = this.ch7_a1.ADDRESS;
      this.ch7_am1 = ral_reg_CHN_AM1::type_id::create("ch7_am1",,get_full_name());
      if(this.ch7_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch7_am1.cg_bits.option.name = "ch7_am1_bits";
      this.ch7_am1.configure(this, null, "");
      this.ch7_am1.build();
      this.default_map.add_reg(this.ch7_am1, `UVM_REG_ADDR_WIDTH'h114, "RW", 0);
		this.ch7_am1_ADDRESS_MASK = this.ch7_am1.ADDRESS_MASK;
      this.ch7_desc = ral_reg_CHN_DESC::type_id::create("ch7_desc",,get_full_name());
      if(this.ch7_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch7_desc.cg_bits.option.name = "ch7_desc_bits";
      this.ch7_desc.configure(this, null, "");
      this.ch7_desc.build();
      this.default_map.add_reg(this.ch7_desc, `UVM_REG_ADDR_WIDTH'h118, "RW", 0);
		this.ch7_desc_ADDRESS_MASK = this.ch7_desc.ADDRESS_MASK;
      this.ch7_swptr = ral_reg_CHN_SWPTR::type_id::create("ch7_swptr",,get_full_name());
      if(this.ch7_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch7_swptr.cg_bits.option.name = "ch7_swptr_bits";
      this.ch7_swptr.configure(this, null, "");
      this.ch7_swptr.build();
      this.default_map.add_reg(this.ch7_swptr, `UVM_REG_ADDR_WIDTH'h11C, "RW", 0);
		this.ch7_swptr_SWPTR_EN = this.ch7_swptr.SWPTR_EN;
		this.ch7_swptr_SW_POINTER = this.ch7_swptr.SW_POINTER;
      this.ch8_csr = ral_reg_CHN_CSR::type_id::create("ch8_csr",,get_full_name());
      if(this.ch8_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch8_csr.cg_bits.option.name = "ch8_csr_bits";
      this.ch8_csr.configure(this, null, "");
      this.ch8_csr.build();
      this.default_map.add_reg(this.ch8_csr, `UVM_REG_ADDR_WIDTH'h120, "RW", 0);
		this.ch8_csr_CH_EN = this.ch8_csr.CH_EN;
		this.ch8_csr_DST_SEL = this.ch8_csr.DST_SEL;
		this.ch8_csr_SRC_SEL = this.ch8_csr.SRC_SEL;
		this.ch8_csr_INC_DST = this.ch8_csr.INC_DST;
		this.ch8_csr_INC_SRC = this.ch8_csr.INC_SRC;
		this.ch8_csr_MODE = this.ch8_csr.MODE;
		this.ch8_csr_ARS = this.ch8_csr.ARS;
		this.ch8_csr_USE_ED = this.ch8_csr.USE_ED;
		this.ch8_csr_SZ_WB = this.ch8_csr.SZ_WB;
		this.ch8_csr_STOP = this.ch8_csr.STOP;
		this.ch8_csr_BUSY = this.ch8_csr.BUSY;
		this.ch8_csr_DONE = this.ch8_csr.DONE;
		this.ch8_csr_ERR = this.ch8_csr.ERR;
		this.ch8_csr_PARITY = this.ch8_csr.PARITY;
      this.ch8_sz = ral_reg_CHN_SZ::type_id::create("ch8_sz",,get_full_name());
      if(this.ch8_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch8_sz.cg_bits.option.name = "ch8_sz_bits";
      this.ch8_sz.configure(this, null, "");
      this.ch8_sz.build();
      this.default_map.add_reg(this.ch8_sz, `UVM_REG_ADDR_WIDTH'h124, "RW", 0);
		this.ch8_sz_CHK_SZ = this.ch8_sz.CHK_SZ;
		this.ch8_sz_TOT_SZ = this.ch8_sz.TOT_SZ;
      this.ch8_a0 = ral_reg_CHN_A0::type_id::create("ch8_a0",,get_full_name());
      if(this.ch8_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch8_a0.cg_bits.option.name = "ch8_a0_bits";
      this.ch8_a0.configure(this, null, "");
      this.ch8_a0.build();
      this.default_map.add_reg(this.ch8_a0, `UVM_REG_ADDR_WIDTH'h128, "RW", 0);
		this.ch8_a0_ADDRESS = this.ch8_a0.ADDRESS;
      this.ch8_am0 = ral_reg_CHN_AM0::type_id::create("ch8_am0",,get_full_name());
      if(this.ch8_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch8_am0.cg_bits.option.name = "ch8_am0_bits";
      this.ch8_am0.configure(this, null, "");
      this.ch8_am0.build();
      this.default_map.add_reg(this.ch8_am0, `UVM_REG_ADDR_WIDTH'h12C, "RW", 0);
		this.ch8_am0_ADDRESS_MASK = this.ch8_am0.ADDRESS_MASK;
      this.ch8_a1 = ral_reg_CHN_A1::type_id::create("ch8_a1",,get_full_name());
      if(this.ch8_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch8_a1.cg_bits.option.name = "ch8_a1_bits";
      this.ch8_a1.configure(this, null, "");
      this.ch8_a1.build();
      this.default_map.add_reg(this.ch8_a1, `UVM_REG_ADDR_WIDTH'h130, "RW", 0);
		this.ch8_a1_ADDRESS = this.ch8_a1.ADDRESS;
      this.ch8_am1 = ral_reg_CHN_AM1::type_id::create("ch8_am1",,get_full_name());
      if(this.ch8_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch8_am1.cg_bits.option.name = "ch8_am1_bits";
      this.ch8_am1.configure(this, null, "");
      this.ch8_am1.build();
      this.default_map.add_reg(this.ch8_am1, `UVM_REG_ADDR_WIDTH'h134, "RW", 0);
		this.ch8_am1_ADDRESS_MASK = this.ch8_am1.ADDRESS_MASK;
      this.ch8_desc = ral_reg_CHN_DESC::type_id::create("ch8_desc",,get_full_name());
      if(this.ch8_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch8_desc.cg_bits.option.name = "ch8_desc_bits";
      this.ch8_desc.configure(this, null, "");
      this.ch8_desc.build();
      this.default_map.add_reg(this.ch8_desc, `UVM_REG_ADDR_WIDTH'h138, "RW", 0);
		this.ch8_desc_ADDRESS_MASK = this.ch8_desc.ADDRESS_MASK;
      this.ch8_swptr = ral_reg_CHN_SWPTR::type_id::create("ch8_swptr",,get_full_name());
      if(this.ch8_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch8_swptr.cg_bits.option.name = "ch8_swptr_bits";
      this.ch8_swptr.configure(this, null, "");
      this.ch8_swptr.build();
      this.default_map.add_reg(this.ch8_swptr, `UVM_REG_ADDR_WIDTH'h13C, "RW", 0);
		this.ch8_swptr_SWPTR_EN = this.ch8_swptr.SWPTR_EN;
		this.ch8_swptr_SW_POINTER = this.ch8_swptr.SW_POINTER;
      this.ch9_csr = ral_reg_CHN_CSR::type_id::create("ch9_csr",,get_full_name());
      if(this.ch9_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch9_csr.cg_bits.option.name = "ch9_csr_bits";
      this.ch9_csr.configure(this, null, "");
      this.ch9_csr.build();
      this.default_map.add_reg(this.ch9_csr, `UVM_REG_ADDR_WIDTH'h140, "RW", 0);
		this.ch9_csr_CH_EN = this.ch9_csr.CH_EN;
		this.ch9_csr_DST_SEL = this.ch9_csr.DST_SEL;
		this.ch9_csr_SRC_SEL = this.ch9_csr.SRC_SEL;
		this.ch9_csr_INC_DST = this.ch9_csr.INC_DST;
		this.ch9_csr_INC_SRC = this.ch9_csr.INC_SRC;
		this.ch9_csr_MODE = this.ch9_csr.MODE;
		this.ch9_csr_ARS = this.ch9_csr.ARS;
		this.ch9_csr_USE_ED = this.ch9_csr.USE_ED;
		this.ch9_csr_SZ_WB = this.ch9_csr.SZ_WB;
		this.ch9_csr_STOP = this.ch9_csr.STOP;
		this.ch9_csr_BUSY = this.ch9_csr.BUSY;
		this.ch9_csr_DONE = this.ch9_csr.DONE;
		this.ch9_csr_ERR = this.ch9_csr.ERR;
		this.ch9_csr_PARITY = this.ch9_csr.PARITY;
      this.ch9_sz = ral_reg_CHN_SZ::type_id::create("ch9_sz",,get_full_name());
      if(this.ch9_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch9_sz.cg_bits.option.name = "ch9_sz_bits";
      this.ch9_sz.configure(this, null, "");
      this.ch9_sz.build();
      this.default_map.add_reg(this.ch9_sz, `UVM_REG_ADDR_WIDTH'h144, "RW", 0);
		this.ch9_sz_CHK_SZ = this.ch9_sz.CHK_SZ;
		this.ch9_sz_TOT_SZ = this.ch9_sz.TOT_SZ;
      this.ch9_a0 = ral_reg_CHN_A0::type_id::create("ch9_a0",,get_full_name());
      if(this.ch9_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch9_a0.cg_bits.option.name = "ch9_a0_bits";
      this.ch9_a0.configure(this, null, "");
      this.ch9_a0.build();
      this.default_map.add_reg(this.ch9_a0, `UVM_REG_ADDR_WIDTH'h148, "RW", 0);
		this.ch9_a0_ADDRESS = this.ch9_a0.ADDRESS;
      this.ch9_am0 = ral_reg_CHN_AM0::type_id::create("ch9_am0",,get_full_name());
      if(this.ch9_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch9_am0.cg_bits.option.name = "ch9_am0_bits";
      this.ch9_am0.configure(this, null, "");
      this.ch9_am0.build();
      this.default_map.add_reg(this.ch9_am0, `UVM_REG_ADDR_WIDTH'h14C, "RW", 0);
		this.ch9_am0_ADDRESS_MASK = this.ch9_am0.ADDRESS_MASK;
      this.ch9_a1 = ral_reg_CHN_A1::type_id::create("ch9_a1",,get_full_name());
      if(this.ch9_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch9_a1.cg_bits.option.name = "ch9_a1_bits";
      this.ch9_a1.configure(this, null, "");
      this.ch9_a1.build();
      this.default_map.add_reg(this.ch9_a1, `UVM_REG_ADDR_WIDTH'h150, "RW", 0);
		this.ch9_a1_ADDRESS = this.ch9_a1.ADDRESS;
      this.ch9_am1 = ral_reg_CHN_AM1::type_id::create("ch9_am1",,get_full_name());
      if(this.ch9_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch9_am1.cg_bits.option.name = "ch9_am1_bits";
      this.ch9_am1.configure(this, null, "");
      this.ch9_am1.build();
      this.default_map.add_reg(this.ch9_am1, `UVM_REG_ADDR_WIDTH'h154, "RW", 0);
		this.ch9_am1_ADDRESS_MASK = this.ch9_am1.ADDRESS_MASK;
      this.ch9_desc = ral_reg_CHN_DESC::type_id::create("ch9_desc",,get_full_name());
      if(this.ch9_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch9_desc.cg_bits.option.name = "ch9_desc_bits";
      this.ch9_desc.configure(this, null, "");
      this.ch9_desc.build();
      this.default_map.add_reg(this.ch9_desc, `UVM_REG_ADDR_WIDTH'h158, "RW", 0);
		this.ch9_desc_ADDRESS_MASK = this.ch9_desc.ADDRESS_MASK;
      this.ch9_swptr = ral_reg_CHN_SWPTR::type_id::create("ch9_swptr",,get_full_name());
      if(this.ch9_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch9_swptr.cg_bits.option.name = "ch9_swptr_bits";
      this.ch9_swptr.configure(this, null, "");
      this.ch9_swptr.build();
      this.default_map.add_reg(this.ch9_swptr, `UVM_REG_ADDR_WIDTH'h15C, "RW", 0);
		this.ch9_swptr_SWPTR_EN = this.ch9_swptr.SWPTR_EN;
		this.ch9_swptr_SW_POINTER = this.ch9_swptr.SW_POINTER;
      this.ch10_csr = ral_reg_CHN_CSR::type_id::create("ch10_csr",,get_full_name());
      if(this.ch10_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch10_csr.cg_bits.option.name = "ch10_csr_bits";
      this.ch10_csr.configure(this, null, "");
      this.ch10_csr.build();
      this.default_map.add_reg(this.ch10_csr, `UVM_REG_ADDR_WIDTH'h160, "RW", 0);
		this.ch10_csr_CH_EN = this.ch10_csr.CH_EN;
		this.ch10_csr_DST_SEL = this.ch10_csr.DST_SEL;
		this.ch10_csr_SRC_SEL = this.ch10_csr.SRC_SEL;
		this.ch10_csr_INC_DST = this.ch10_csr.INC_DST;
		this.ch10_csr_INC_SRC = this.ch10_csr.INC_SRC;
		this.ch10_csr_MODE = this.ch10_csr.MODE;
		this.ch10_csr_ARS = this.ch10_csr.ARS;
		this.ch10_csr_USE_ED = this.ch10_csr.USE_ED;
		this.ch10_csr_SZ_WB = this.ch10_csr.SZ_WB;
		this.ch10_csr_STOP = this.ch10_csr.STOP;
		this.ch10_csr_BUSY = this.ch10_csr.BUSY;
		this.ch10_csr_DONE = this.ch10_csr.DONE;
		this.ch10_csr_ERR = this.ch10_csr.ERR;
		this.ch10_csr_PARITY = this.ch10_csr.PARITY;
      this.ch10_sz = ral_reg_CHN_SZ::type_id::create("ch10_sz",,get_full_name());
      if(this.ch10_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch10_sz.cg_bits.option.name = "ch10_sz_bits";
      this.ch10_sz.configure(this, null, "");
      this.ch10_sz.build();
      this.default_map.add_reg(this.ch10_sz, `UVM_REG_ADDR_WIDTH'h164, "RW", 0);
		this.ch10_sz_CHK_SZ = this.ch10_sz.CHK_SZ;
		this.ch10_sz_TOT_SZ = this.ch10_sz.TOT_SZ;
      this.ch10_a0 = ral_reg_CHN_A0::type_id::create("ch10_a0",,get_full_name());
      if(this.ch10_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch10_a0.cg_bits.option.name = "ch10_a0_bits";
      this.ch10_a0.configure(this, null, "");
      this.ch10_a0.build();
      this.default_map.add_reg(this.ch10_a0, `UVM_REG_ADDR_WIDTH'h168, "RW", 0);
		this.ch10_a0_ADDRESS = this.ch10_a0.ADDRESS;
      this.ch10_am0 = ral_reg_CHN_AM0::type_id::create("ch10_am0",,get_full_name());
      if(this.ch10_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch10_am0.cg_bits.option.name = "ch10_am0_bits";
      this.ch10_am0.configure(this, null, "");
      this.ch10_am0.build();
      this.default_map.add_reg(this.ch10_am0, `UVM_REG_ADDR_WIDTH'h16C, "RW", 0);
		this.ch10_am0_ADDRESS_MASK = this.ch10_am0.ADDRESS_MASK;
      this.ch10_a1 = ral_reg_CHN_A1::type_id::create("ch10_a1",,get_full_name());
      if(this.ch10_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch10_a1.cg_bits.option.name = "ch10_a1_bits";
      this.ch10_a1.configure(this, null, "");
      this.ch10_a1.build();
      this.default_map.add_reg(this.ch10_a1, `UVM_REG_ADDR_WIDTH'h170, "RW", 0);
		this.ch10_a1_ADDRESS = this.ch10_a1.ADDRESS;
      this.ch10_am1 = ral_reg_CHN_AM1::type_id::create("ch10_am1",,get_full_name());
      if(this.ch10_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch10_am1.cg_bits.option.name = "ch10_am1_bits";
      this.ch10_am1.configure(this, null, "");
      this.ch10_am1.build();
      this.default_map.add_reg(this.ch10_am1, `UVM_REG_ADDR_WIDTH'h174, "RW", 0);
		this.ch10_am1_ADDRESS_MASK = this.ch10_am1.ADDRESS_MASK;
      this.ch10_desc = ral_reg_CHN_DESC::type_id::create("ch10_desc",,get_full_name());
      if(this.ch10_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch10_desc.cg_bits.option.name = "ch10_desc_bits";
      this.ch10_desc.configure(this, null, "");
      this.ch10_desc.build();
      this.default_map.add_reg(this.ch10_desc, `UVM_REG_ADDR_WIDTH'h178, "RW", 0);
		this.ch10_desc_ADDRESS_MASK = this.ch10_desc.ADDRESS_MASK;
      this.ch10_swptr = ral_reg_CHN_SWPTR::type_id::create("ch10_swptr",,get_full_name());
      if(this.ch10_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch10_swptr.cg_bits.option.name = "ch10_swptr_bits";
      this.ch10_swptr.configure(this, null, "");
      this.ch10_swptr.build();
      this.default_map.add_reg(this.ch10_swptr, `UVM_REG_ADDR_WIDTH'h17C, "RW", 0);
		this.ch10_swptr_SWPTR_EN = this.ch10_swptr.SWPTR_EN;
		this.ch10_swptr_SW_POINTER = this.ch10_swptr.SW_POINTER;
      this.ch11_csr = ral_reg_CHN_CSR::type_id::create("ch11_csr",,get_full_name());
      if(this.ch11_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch11_csr.cg_bits.option.name = "ch11_csr_bits";
      this.ch11_csr.configure(this, null, "");
      this.ch11_csr.build();
      this.default_map.add_reg(this.ch11_csr, `UVM_REG_ADDR_WIDTH'h180, "RW", 0);
		this.ch11_csr_CH_EN = this.ch11_csr.CH_EN;
		this.ch11_csr_DST_SEL = this.ch11_csr.DST_SEL;
		this.ch11_csr_SRC_SEL = this.ch11_csr.SRC_SEL;
		this.ch11_csr_INC_DST = this.ch11_csr.INC_DST;
		this.ch11_csr_INC_SRC = this.ch11_csr.INC_SRC;
		this.ch11_csr_MODE = this.ch11_csr.MODE;
		this.ch11_csr_ARS = this.ch11_csr.ARS;
		this.ch11_csr_USE_ED = this.ch11_csr.USE_ED;
		this.ch11_csr_SZ_WB = this.ch11_csr.SZ_WB;
		this.ch11_csr_STOP = this.ch11_csr.STOP;
		this.ch11_csr_BUSY = this.ch11_csr.BUSY;
		this.ch11_csr_DONE = this.ch11_csr.DONE;
		this.ch11_csr_ERR = this.ch11_csr.ERR;
		this.ch11_csr_PARITY = this.ch11_csr.PARITY;
      this.ch11_sz = ral_reg_CHN_SZ::type_id::create("ch11_sz",,get_full_name());
      if(this.ch11_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch11_sz.cg_bits.option.name = "ch11_sz_bits";
      this.ch11_sz.configure(this, null, "");
      this.ch11_sz.build();
      this.default_map.add_reg(this.ch11_sz, `UVM_REG_ADDR_WIDTH'h184, "RW", 0);
		this.ch11_sz_CHK_SZ = this.ch11_sz.CHK_SZ;
		this.ch11_sz_TOT_SZ = this.ch11_sz.TOT_SZ;
      this.ch11_a0 = ral_reg_CHN_A0::type_id::create("ch11_a0",,get_full_name());
      if(this.ch11_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch11_a0.cg_bits.option.name = "ch11_a0_bits";
      this.ch11_a0.configure(this, null, "");
      this.ch11_a0.build();
      this.default_map.add_reg(this.ch11_a0, `UVM_REG_ADDR_WIDTH'h188, "RW", 0);
		this.ch11_a0_ADDRESS = this.ch11_a0.ADDRESS;
      this.ch11_am0 = ral_reg_CHN_AM0::type_id::create("ch11_am0",,get_full_name());
      if(this.ch11_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch11_am0.cg_bits.option.name = "ch11_am0_bits";
      this.ch11_am0.configure(this, null, "");
      this.ch11_am0.build();
      this.default_map.add_reg(this.ch11_am0, `UVM_REG_ADDR_WIDTH'h18C, "RW", 0);
		this.ch11_am0_ADDRESS_MASK = this.ch11_am0.ADDRESS_MASK;
      this.ch11_a1 = ral_reg_CHN_A1::type_id::create("ch11_a1",,get_full_name());
      if(this.ch11_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch11_a1.cg_bits.option.name = "ch11_a1_bits";
      this.ch11_a1.configure(this, null, "");
      this.ch11_a1.build();
      this.default_map.add_reg(this.ch11_a1, `UVM_REG_ADDR_WIDTH'h190, "RW", 0);
		this.ch11_a1_ADDRESS = this.ch11_a1.ADDRESS;
      this.ch11_am1 = ral_reg_CHN_AM1::type_id::create("ch11_am1",,get_full_name());
      if(this.ch11_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch11_am1.cg_bits.option.name = "ch11_am1_bits";
      this.ch11_am1.configure(this, null, "");
      this.ch11_am1.build();
      this.default_map.add_reg(this.ch11_am1, `UVM_REG_ADDR_WIDTH'h194, "RW", 0);
		this.ch11_am1_ADDRESS_MASK = this.ch11_am1.ADDRESS_MASK;
      this.ch11_desc = ral_reg_CHN_DESC::type_id::create("ch11_desc",,get_full_name());
      if(this.ch11_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch11_desc.cg_bits.option.name = "ch11_desc_bits";
      this.ch11_desc.configure(this, null, "");
      this.ch11_desc.build();
      this.default_map.add_reg(this.ch11_desc, `UVM_REG_ADDR_WIDTH'h198, "RW", 0);
		this.ch11_desc_ADDRESS_MASK = this.ch11_desc.ADDRESS_MASK;
      this.ch11_swptr = ral_reg_CHN_SWPTR::type_id::create("ch11_swptr",,get_full_name());
      if(this.ch11_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch11_swptr.cg_bits.option.name = "ch11_swptr_bits";
      this.ch11_swptr.configure(this, null, "");
      this.ch11_swptr.build();
      this.default_map.add_reg(this.ch11_swptr, `UVM_REG_ADDR_WIDTH'h19C, "RW", 0);
		this.ch11_swptr_SWPTR_EN = this.ch11_swptr.SWPTR_EN;
		this.ch11_swptr_SW_POINTER = this.ch11_swptr.SW_POINTER;
      this.ch12_csr = ral_reg_CHN_CSR::type_id::create("ch12_csr",,get_full_name());
      if(this.ch12_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch12_csr.cg_bits.option.name = "ch12_csr_bits";
      this.ch12_csr.configure(this, null, "");
      this.ch12_csr.build();
      this.default_map.add_reg(this.ch12_csr, `UVM_REG_ADDR_WIDTH'h1A0, "RW", 0);
		this.ch12_csr_CH_EN = this.ch12_csr.CH_EN;
		this.ch12_csr_DST_SEL = this.ch12_csr.DST_SEL;
		this.ch12_csr_SRC_SEL = this.ch12_csr.SRC_SEL;
		this.ch12_csr_INC_DST = this.ch12_csr.INC_DST;
		this.ch12_csr_INC_SRC = this.ch12_csr.INC_SRC;
		this.ch12_csr_MODE = this.ch12_csr.MODE;
		this.ch12_csr_ARS = this.ch12_csr.ARS;
		this.ch12_csr_USE_ED = this.ch12_csr.USE_ED;
		this.ch12_csr_SZ_WB = this.ch12_csr.SZ_WB;
		this.ch12_csr_STOP = this.ch12_csr.STOP;
		this.ch12_csr_BUSY = this.ch12_csr.BUSY;
		this.ch12_csr_DONE = this.ch12_csr.DONE;
		this.ch12_csr_ERR = this.ch12_csr.ERR;
		this.ch12_csr_PARITY = this.ch12_csr.PARITY;
      this.ch12_sz = ral_reg_CHN_SZ::type_id::create("ch12_sz",,get_full_name());
      if(this.ch12_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch12_sz.cg_bits.option.name = "ch12_sz_bits";
      this.ch12_sz.configure(this, null, "");
      this.ch12_sz.build();
      this.default_map.add_reg(this.ch12_sz, `UVM_REG_ADDR_WIDTH'h1A4, "RW", 0);
		this.ch12_sz_CHK_SZ = this.ch12_sz.CHK_SZ;
		this.ch12_sz_TOT_SZ = this.ch12_sz.TOT_SZ;
      this.ch12_a0 = ral_reg_CHN_A0::type_id::create("ch12_a0",,get_full_name());
      if(this.ch12_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch12_a0.cg_bits.option.name = "ch12_a0_bits";
      this.ch12_a0.configure(this, null, "");
      this.ch12_a0.build();
      this.default_map.add_reg(this.ch12_a0, `UVM_REG_ADDR_WIDTH'h1A8, "RW", 0);
		this.ch12_a0_ADDRESS = this.ch12_a0.ADDRESS;
      this.ch12_am0 = ral_reg_CHN_AM0::type_id::create("ch12_am0",,get_full_name());
      if(this.ch12_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch12_am0.cg_bits.option.name = "ch12_am0_bits";
      this.ch12_am0.configure(this, null, "");
      this.ch12_am0.build();
      this.default_map.add_reg(this.ch12_am0, `UVM_REG_ADDR_WIDTH'h1AC, "RW", 0);
		this.ch12_am0_ADDRESS_MASK = this.ch12_am0.ADDRESS_MASK;
      this.ch12_a1 = ral_reg_CHN_A1::type_id::create("ch12_a1",,get_full_name());
      if(this.ch12_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch12_a1.cg_bits.option.name = "ch12_a1_bits";
      this.ch12_a1.configure(this, null, "");
      this.ch12_a1.build();
      this.default_map.add_reg(this.ch12_a1, `UVM_REG_ADDR_WIDTH'h1B0, "RW", 0);
		this.ch12_a1_ADDRESS = this.ch12_a1.ADDRESS;
      this.ch12_am1 = ral_reg_CHN_AM1::type_id::create("ch12_am1",,get_full_name());
      if(this.ch12_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch12_am1.cg_bits.option.name = "ch12_am1_bits";
      this.ch12_am1.configure(this, null, "");
      this.ch12_am1.build();
      this.default_map.add_reg(this.ch12_am1, `UVM_REG_ADDR_WIDTH'h1B4, "RW", 0);
		this.ch12_am1_ADDRESS_MASK = this.ch12_am1.ADDRESS_MASK;
      this.ch12_desc = ral_reg_CHN_DESC::type_id::create("ch12_desc",,get_full_name());
      if(this.ch12_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch12_desc.cg_bits.option.name = "ch12_desc_bits";
      this.ch12_desc.configure(this, null, "");
      this.ch12_desc.build();
      this.default_map.add_reg(this.ch12_desc, `UVM_REG_ADDR_WIDTH'h1B8, "RW", 0);
		this.ch12_desc_ADDRESS_MASK = this.ch12_desc.ADDRESS_MASK;
      this.ch12_swptr = ral_reg_CHN_SWPTR::type_id::create("ch12_swptr",,get_full_name());
      if(this.ch12_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch12_swptr.cg_bits.option.name = "ch12_swptr_bits";
      this.ch12_swptr.configure(this, null, "");
      this.ch12_swptr.build();
      this.default_map.add_reg(this.ch12_swptr, `UVM_REG_ADDR_WIDTH'h1BC, "RW", 0);
		this.ch12_swptr_SWPTR_EN = this.ch12_swptr.SWPTR_EN;
		this.ch12_swptr_SW_POINTER = this.ch12_swptr.SW_POINTER;
      this.ch13_csr = ral_reg_CHN_CSR::type_id::create("ch13_csr",,get_full_name());
      if(this.ch13_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch13_csr.cg_bits.option.name = "ch13_csr_bits";
      this.ch13_csr.configure(this, null, "");
      this.ch13_csr.build();
      this.default_map.add_reg(this.ch13_csr, `UVM_REG_ADDR_WIDTH'h1C0, "RW", 0);
		this.ch13_csr_CH_EN = this.ch13_csr.CH_EN;
		this.ch13_csr_DST_SEL = this.ch13_csr.DST_SEL;
		this.ch13_csr_SRC_SEL = this.ch13_csr.SRC_SEL;
		this.ch13_csr_INC_DST = this.ch13_csr.INC_DST;
		this.ch13_csr_INC_SRC = this.ch13_csr.INC_SRC;
		this.ch13_csr_MODE = this.ch13_csr.MODE;
		this.ch13_csr_ARS = this.ch13_csr.ARS;
		this.ch13_csr_USE_ED = this.ch13_csr.USE_ED;
		this.ch13_csr_SZ_WB = this.ch13_csr.SZ_WB;
		this.ch13_csr_STOP = this.ch13_csr.STOP;
		this.ch13_csr_BUSY = this.ch13_csr.BUSY;
		this.ch13_csr_DONE = this.ch13_csr.DONE;
		this.ch13_csr_ERR = this.ch13_csr.ERR;
		this.ch13_csr_PARITY = this.ch13_csr.PARITY;
      this.ch13_sz = ral_reg_CHN_SZ::type_id::create("ch13_sz",,get_full_name());
      if(this.ch13_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch13_sz.cg_bits.option.name = "ch13_sz_bits";
      this.ch13_sz.configure(this, null, "");
      this.ch13_sz.build();
      this.default_map.add_reg(this.ch13_sz, `UVM_REG_ADDR_WIDTH'h1C4, "RW", 0);
		this.ch13_sz_CHK_SZ = this.ch13_sz.CHK_SZ;
		this.ch13_sz_TOT_SZ = this.ch13_sz.TOT_SZ;
      this.ch13_a0 = ral_reg_CHN_A0::type_id::create("ch13_a0",,get_full_name());
      if(this.ch13_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch13_a0.cg_bits.option.name = "ch13_a0_bits";
      this.ch13_a0.configure(this, null, "");
      this.ch13_a0.build();
      this.default_map.add_reg(this.ch13_a0, `UVM_REG_ADDR_WIDTH'h1C8, "RW", 0);
		this.ch13_a0_ADDRESS = this.ch13_a0.ADDRESS;
      this.ch13_am0 = ral_reg_CHN_AM0::type_id::create("ch13_am0",,get_full_name());
      if(this.ch13_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch13_am0.cg_bits.option.name = "ch13_am0_bits";
      this.ch13_am0.configure(this, null, "");
      this.ch13_am0.build();
      this.default_map.add_reg(this.ch13_am0, `UVM_REG_ADDR_WIDTH'h1CC, "RW", 0);
		this.ch13_am0_ADDRESS_MASK = this.ch13_am0.ADDRESS_MASK;
      this.ch13_a1 = ral_reg_CHN_A1::type_id::create("ch13_a1",,get_full_name());
      if(this.ch13_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch13_a1.cg_bits.option.name = "ch13_a1_bits";
      this.ch13_a1.configure(this, null, "");
      this.ch13_a1.build();
      this.default_map.add_reg(this.ch13_a1, `UVM_REG_ADDR_WIDTH'h1D0, "RW", 0);
		this.ch13_a1_ADDRESS = this.ch13_a1.ADDRESS;
      this.ch13_am1 = ral_reg_CHN_AM1::type_id::create("ch13_am1",,get_full_name());
      if(this.ch13_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch13_am1.cg_bits.option.name = "ch13_am1_bits";
      this.ch13_am1.configure(this, null, "");
      this.ch13_am1.build();
      this.default_map.add_reg(this.ch13_am1, `UVM_REG_ADDR_WIDTH'h1D4, "RW", 0);
		this.ch13_am1_ADDRESS_MASK = this.ch13_am1.ADDRESS_MASK;
      this.ch13_desc = ral_reg_CHN_DESC::type_id::create("ch13_desc",,get_full_name());
      if(this.ch13_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch13_desc.cg_bits.option.name = "ch13_desc_bits";
      this.ch13_desc.configure(this, null, "");
      this.ch13_desc.build();
      this.default_map.add_reg(this.ch13_desc, `UVM_REG_ADDR_WIDTH'h1D8, "RW", 0);
		this.ch13_desc_ADDRESS_MASK = this.ch13_desc.ADDRESS_MASK;
      this.ch13_swptr = ral_reg_CHN_SWPTR::type_id::create("ch13_swptr",,get_full_name());
      if(this.ch13_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch13_swptr.cg_bits.option.name = "ch13_swptr_bits";
      this.ch13_swptr.configure(this, null, "");
      this.ch13_swptr.build();
      this.default_map.add_reg(this.ch13_swptr, `UVM_REG_ADDR_WIDTH'h1DC, "RW", 0);
		this.ch13_swptr_SWPTR_EN = this.ch13_swptr.SWPTR_EN;
		this.ch13_swptr_SW_POINTER = this.ch13_swptr.SW_POINTER;
      this.ch14_csr = ral_reg_CHN_CSR::type_id::create("ch14_csr",,get_full_name());
      if(this.ch14_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch14_csr.cg_bits.option.name = "ch14_csr_bits";
      this.ch14_csr.configure(this, null, "");
      this.ch14_csr.build();
      this.default_map.add_reg(this.ch14_csr, `UVM_REG_ADDR_WIDTH'h1E0, "RW", 0);
		this.ch14_csr_CH_EN = this.ch14_csr.CH_EN;
		this.ch14_csr_DST_SEL = this.ch14_csr.DST_SEL;
		this.ch14_csr_SRC_SEL = this.ch14_csr.SRC_SEL;
		this.ch14_csr_INC_DST = this.ch14_csr.INC_DST;
		this.ch14_csr_INC_SRC = this.ch14_csr.INC_SRC;
		this.ch14_csr_MODE = this.ch14_csr.MODE;
		this.ch14_csr_ARS = this.ch14_csr.ARS;
		this.ch14_csr_USE_ED = this.ch14_csr.USE_ED;
		this.ch14_csr_SZ_WB = this.ch14_csr.SZ_WB;
		this.ch14_csr_STOP = this.ch14_csr.STOP;
		this.ch14_csr_BUSY = this.ch14_csr.BUSY;
		this.ch14_csr_DONE = this.ch14_csr.DONE;
		this.ch14_csr_ERR = this.ch14_csr.ERR;
		this.ch14_csr_PARITY = this.ch14_csr.PARITY;
      this.ch14_sz = ral_reg_CHN_SZ::type_id::create("ch14_sz",,get_full_name());
      if(this.ch14_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch14_sz.cg_bits.option.name = "ch14_sz_bits";
      this.ch14_sz.configure(this, null, "");
      this.ch14_sz.build();
      this.default_map.add_reg(this.ch14_sz, `UVM_REG_ADDR_WIDTH'h1E4, "RW", 0);
		this.ch14_sz_CHK_SZ = this.ch14_sz.CHK_SZ;
		this.ch14_sz_TOT_SZ = this.ch14_sz.TOT_SZ;
      this.ch14_a0 = ral_reg_CHN_A0::type_id::create("ch14_a0",,get_full_name());
      if(this.ch14_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch14_a0.cg_bits.option.name = "ch14_a0_bits";
      this.ch14_a0.configure(this, null, "");
      this.ch14_a0.build();
      this.default_map.add_reg(this.ch14_a0, `UVM_REG_ADDR_WIDTH'h1E8, "RW", 0);
		this.ch14_a0_ADDRESS = this.ch14_a0.ADDRESS;
      this.ch14_am0 = ral_reg_CHN_AM0::type_id::create("ch14_am0",,get_full_name());
      if(this.ch14_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch14_am0.cg_bits.option.name = "ch14_am0_bits";
      this.ch14_am0.configure(this, null, "");
      this.ch14_am0.build();
      this.default_map.add_reg(this.ch14_am0, `UVM_REG_ADDR_WIDTH'h1EC, "RW", 0);
		this.ch14_am0_ADDRESS_MASK = this.ch14_am0.ADDRESS_MASK;
      this.ch14_a1 = ral_reg_CHN_A1::type_id::create("ch14_a1",,get_full_name());
      if(this.ch14_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch14_a1.cg_bits.option.name = "ch14_a1_bits";
      this.ch14_a1.configure(this, null, "");
      this.ch14_a1.build();
      this.default_map.add_reg(this.ch14_a1, `UVM_REG_ADDR_WIDTH'h1F0, "RW", 0);
		this.ch14_a1_ADDRESS = this.ch14_a1.ADDRESS;
      this.ch14_am1 = ral_reg_CHN_AM1::type_id::create("ch14_am1",,get_full_name());
      if(this.ch14_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch14_am1.cg_bits.option.name = "ch14_am1_bits";
      this.ch14_am1.configure(this, null, "");
      this.ch14_am1.build();
      this.default_map.add_reg(this.ch14_am1, `UVM_REG_ADDR_WIDTH'h1F4, "RW", 0);
		this.ch14_am1_ADDRESS_MASK = this.ch14_am1.ADDRESS_MASK;
      this.ch14_desc = ral_reg_CHN_DESC::type_id::create("ch14_desc",,get_full_name());
      if(this.ch14_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch14_desc.cg_bits.option.name = "ch14_desc_bits";
      this.ch14_desc.configure(this, null, "");
      this.ch14_desc.build();
      this.default_map.add_reg(this.ch14_desc, `UVM_REG_ADDR_WIDTH'h1F8, "RW", 0);
		this.ch14_desc_ADDRESS_MASK = this.ch14_desc.ADDRESS_MASK;
      this.ch14_swptr = ral_reg_CHN_SWPTR::type_id::create("ch14_swptr",,get_full_name());
      if(this.ch14_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch14_swptr.cg_bits.option.name = "ch14_swptr_bits";
      this.ch14_swptr.configure(this, null, "");
      this.ch14_swptr.build();
      this.default_map.add_reg(this.ch14_swptr, `UVM_REG_ADDR_WIDTH'h1FC, "RW", 0);
		this.ch14_swptr_SWPTR_EN = this.ch14_swptr.SWPTR_EN;
		this.ch14_swptr_SW_POINTER = this.ch14_swptr.SW_POINTER;
      this.ch15_csr = ral_reg_CHN_CSR::type_id::create("ch15_csr",,get_full_name());
      if(this.ch15_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch15_csr.cg_bits.option.name = "ch15_csr_bits";
      this.ch15_csr.configure(this, null, "");
      this.ch15_csr.build();
      this.default_map.add_reg(this.ch15_csr, `UVM_REG_ADDR_WIDTH'h200, "RW", 0);
		this.ch15_csr_CH_EN = this.ch15_csr.CH_EN;
		this.ch15_csr_DST_SEL = this.ch15_csr.DST_SEL;
		this.ch15_csr_SRC_SEL = this.ch15_csr.SRC_SEL;
		this.ch15_csr_INC_DST = this.ch15_csr.INC_DST;
		this.ch15_csr_INC_SRC = this.ch15_csr.INC_SRC;
		this.ch15_csr_MODE = this.ch15_csr.MODE;
		this.ch15_csr_ARS = this.ch15_csr.ARS;
		this.ch15_csr_USE_ED = this.ch15_csr.USE_ED;
		this.ch15_csr_SZ_WB = this.ch15_csr.SZ_WB;
		this.ch15_csr_STOP = this.ch15_csr.STOP;
		this.ch15_csr_BUSY = this.ch15_csr.BUSY;
		this.ch15_csr_DONE = this.ch15_csr.DONE;
		this.ch15_csr_ERR = this.ch15_csr.ERR;
		this.ch15_csr_PARITY = this.ch15_csr.PARITY;
      this.ch15_sz = ral_reg_CHN_SZ::type_id::create("ch15_sz",,get_full_name());
      if(this.ch15_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch15_sz.cg_bits.option.name = "ch15_sz_bits";
      this.ch15_sz.configure(this, null, "");
      this.ch15_sz.build();
      this.default_map.add_reg(this.ch15_sz, `UVM_REG_ADDR_WIDTH'h204, "RW", 0);
		this.ch15_sz_CHK_SZ = this.ch15_sz.CHK_SZ;
		this.ch15_sz_TOT_SZ = this.ch15_sz.TOT_SZ;
      this.ch15_a0 = ral_reg_CHN_A0::type_id::create("ch15_a0",,get_full_name());
      if(this.ch15_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch15_a0.cg_bits.option.name = "ch15_a0_bits";
      this.ch15_a0.configure(this, null, "");
      this.ch15_a0.build();
      this.default_map.add_reg(this.ch15_a0, `UVM_REG_ADDR_WIDTH'h208, "RW", 0);
		this.ch15_a0_ADDRESS = this.ch15_a0.ADDRESS;
      this.ch15_am0 = ral_reg_CHN_AM0::type_id::create("ch15_am0",,get_full_name());
      if(this.ch15_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch15_am0.cg_bits.option.name = "ch15_am0_bits";
      this.ch15_am0.configure(this, null, "");
      this.ch15_am0.build();
      this.default_map.add_reg(this.ch15_am0, `UVM_REG_ADDR_WIDTH'h20C, "RW", 0);
		this.ch15_am0_ADDRESS_MASK = this.ch15_am0.ADDRESS_MASK;
      this.ch15_a1 = ral_reg_CHN_A1::type_id::create("ch15_a1",,get_full_name());
      if(this.ch15_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch15_a1.cg_bits.option.name = "ch15_a1_bits";
      this.ch15_a1.configure(this, null, "");
      this.ch15_a1.build();
      this.default_map.add_reg(this.ch15_a1, `UVM_REG_ADDR_WIDTH'h210, "RW", 0);
		this.ch15_a1_ADDRESS = this.ch15_a1.ADDRESS;
      this.ch15_am1 = ral_reg_CHN_AM1::type_id::create("ch15_am1",,get_full_name());
      if(this.ch15_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch15_am1.cg_bits.option.name = "ch15_am1_bits";
      this.ch15_am1.configure(this, null, "");
      this.ch15_am1.build();
      this.default_map.add_reg(this.ch15_am1, `UVM_REG_ADDR_WIDTH'h214, "RW", 0);
		this.ch15_am1_ADDRESS_MASK = this.ch15_am1.ADDRESS_MASK;
      this.ch15_desc = ral_reg_CHN_DESC::type_id::create("ch15_desc",,get_full_name());
      if(this.ch15_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch15_desc.cg_bits.option.name = "ch15_desc_bits";
      this.ch15_desc.configure(this, null, "");
      this.ch15_desc.build();
      this.default_map.add_reg(this.ch15_desc, `UVM_REG_ADDR_WIDTH'h218, "RW", 0);
		this.ch15_desc_ADDRESS_MASK = this.ch15_desc.ADDRESS_MASK;
      this.ch15_swptr = ral_reg_CHN_SWPTR::type_id::create("ch15_swptr",,get_full_name());
      if(this.ch15_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch15_swptr.cg_bits.option.name = "ch15_swptr_bits";
      this.ch15_swptr.configure(this, null, "");
      this.ch15_swptr.build();
      this.default_map.add_reg(this.ch15_swptr, `UVM_REG_ADDR_WIDTH'h21C, "RW", 0);
		this.ch15_swptr_SWPTR_EN = this.ch15_swptr.SWPTR_EN;
		this.ch15_swptr_SW_POINTER = this.ch15_swptr.SW_POINTER;
      this.ch16_csr = ral_reg_CHN_CSR::type_id::create("ch16_csr",,get_full_name());
      if(this.ch16_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch16_csr.cg_bits.option.name = "ch16_csr_bits";
      this.ch16_csr.configure(this, null, "");
      this.ch16_csr.build();
      this.default_map.add_reg(this.ch16_csr, `UVM_REG_ADDR_WIDTH'h220, "RW", 0);
		this.ch16_csr_CH_EN = this.ch16_csr.CH_EN;
		this.ch16_csr_DST_SEL = this.ch16_csr.DST_SEL;
		this.ch16_csr_SRC_SEL = this.ch16_csr.SRC_SEL;
		this.ch16_csr_INC_DST = this.ch16_csr.INC_DST;
		this.ch16_csr_INC_SRC = this.ch16_csr.INC_SRC;
		this.ch16_csr_MODE = this.ch16_csr.MODE;
		this.ch16_csr_ARS = this.ch16_csr.ARS;
		this.ch16_csr_USE_ED = this.ch16_csr.USE_ED;
		this.ch16_csr_SZ_WB = this.ch16_csr.SZ_WB;
		this.ch16_csr_STOP = this.ch16_csr.STOP;
		this.ch16_csr_BUSY = this.ch16_csr.BUSY;
		this.ch16_csr_DONE = this.ch16_csr.DONE;
		this.ch16_csr_ERR = this.ch16_csr.ERR;
		this.ch16_csr_PARITY = this.ch16_csr.PARITY;
      this.ch16_sz = ral_reg_CHN_SZ::type_id::create("ch16_sz",,get_full_name());
      if(this.ch16_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch16_sz.cg_bits.option.name = "ch16_sz_bits";
      this.ch16_sz.configure(this, null, "");
      this.ch16_sz.build();
      this.default_map.add_reg(this.ch16_sz, `UVM_REG_ADDR_WIDTH'h224, "RW", 0);
		this.ch16_sz_CHK_SZ = this.ch16_sz.CHK_SZ;
		this.ch16_sz_TOT_SZ = this.ch16_sz.TOT_SZ;
      this.ch16_a0 = ral_reg_CHN_A0::type_id::create("ch16_a0",,get_full_name());
      if(this.ch16_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch16_a0.cg_bits.option.name = "ch16_a0_bits";
      this.ch16_a0.configure(this, null, "");
      this.ch16_a0.build();
      this.default_map.add_reg(this.ch16_a0, `UVM_REG_ADDR_WIDTH'h228, "RW", 0);
		this.ch16_a0_ADDRESS = this.ch16_a0.ADDRESS;
      this.ch16_am0 = ral_reg_CHN_AM0::type_id::create("ch16_am0",,get_full_name());
      if(this.ch16_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch16_am0.cg_bits.option.name = "ch16_am0_bits";
      this.ch16_am0.configure(this, null, "");
      this.ch16_am0.build();
      this.default_map.add_reg(this.ch16_am0, `UVM_REG_ADDR_WIDTH'h22C, "RW", 0);
		this.ch16_am0_ADDRESS_MASK = this.ch16_am0.ADDRESS_MASK;
      this.ch16_a1 = ral_reg_CHN_A1::type_id::create("ch16_a1",,get_full_name());
      if(this.ch16_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch16_a1.cg_bits.option.name = "ch16_a1_bits";
      this.ch16_a1.configure(this, null, "");
      this.ch16_a1.build();
      this.default_map.add_reg(this.ch16_a1, `UVM_REG_ADDR_WIDTH'h230, "RW", 0);
		this.ch16_a1_ADDRESS = this.ch16_a1.ADDRESS;
      this.ch16_am1 = ral_reg_CHN_AM1::type_id::create("ch16_am1",,get_full_name());
      if(this.ch16_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch16_am1.cg_bits.option.name = "ch16_am1_bits";
      this.ch16_am1.configure(this, null, "");
      this.ch16_am1.build();
      this.default_map.add_reg(this.ch16_am1, `UVM_REG_ADDR_WIDTH'h234, "RW", 0);
		this.ch16_am1_ADDRESS_MASK = this.ch16_am1.ADDRESS_MASK;
      this.ch16_desc = ral_reg_CHN_DESC::type_id::create("ch16_desc",,get_full_name());
      if(this.ch16_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch16_desc.cg_bits.option.name = "ch16_desc_bits";
      this.ch16_desc.configure(this, null, "");
      this.ch16_desc.build();
      this.default_map.add_reg(this.ch16_desc, `UVM_REG_ADDR_WIDTH'h238, "RW", 0);
		this.ch16_desc_ADDRESS_MASK = this.ch16_desc.ADDRESS_MASK;
      this.ch16_swptr = ral_reg_CHN_SWPTR::type_id::create("ch16_swptr",,get_full_name());
      if(this.ch16_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch16_swptr.cg_bits.option.name = "ch16_swptr_bits";
      this.ch16_swptr.configure(this, null, "");
      this.ch16_swptr.build();
      this.default_map.add_reg(this.ch16_swptr, `UVM_REG_ADDR_WIDTH'h23C, "RW", 0);
		this.ch16_swptr_SWPTR_EN = this.ch16_swptr.SWPTR_EN;
		this.ch16_swptr_SW_POINTER = this.ch16_swptr.SW_POINTER;
      this.ch17_csr = ral_reg_CHN_CSR::type_id::create("ch17_csr",,get_full_name());
      if(this.ch17_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch17_csr.cg_bits.option.name = "ch17_csr_bits";
      this.ch17_csr.configure(this, null, "");
      this.ch17_csr.build();
      this.default_map.add_reg(this.ch17_csr, `UVM_REG_ADDR_WIDTH'h240, "RW", 0);
		this.ch17_csr_CH_EN = this.ch17_csr.CH_EN;
		this.ch17_csr_DST_SEL = this.ch17_csr.DST_SEL;
		this.ch17_csr_SRC_SEL = this.ch17_csr.SRC_SEL;
		this.ch17_csr_INC_DST = this.ch17_csr.INC_DST;
		this.ch17_csr_INC_SRC = this.ch17_csr.INC_SRC;
		this.ch17_csr_MODE = this.ch17_csr.MODE;
		this.ch17_csr_ARS = this.ch17_csr.ARS;
		this.ch17_csr_USE_ED = this.ch17_csr.USE_ED;
		this.ch17_csr_SZ_WB = this.ch17_csr.SZ_WB;
		this.ch17_csr_STOP = this.ch17_csr.STOP;
		this.ch17_csr_BUSY = this.ch17_csr.BUSY;
		this.ch17_csr_DONE = this.ch17_csr.DONE;
		this.ch17_csr_ERR = this.ch17_csr.ERR;
		this.ch17_csr_PARITY = this.ch17_csr.PARITY;
      this.ch17_sz = ral_reg_CHN_SZ::type_id::create("ch17_sz",,get_full_name());
      if(this.ch17_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch17_sz.cg_bits.option.name = "ch17_sz_bits";
      this.ch17_sz.configure(this, null, "");
      this.ch17_sz.build();
      this.default_map.add_reg(this.ch17_sz, `UVM_REG_ADDR_WIDTH'h244, "RW", 0);
		this.ch17_sz_CHK_SZ = this.ch17_sz.CHK_SZ;
		this.ch17_sz_TOT_SZ = this.ch17_sz.TOT_SZ;
      this.ch17_a0 = ral_reg_CHN_A0::type_id::create("ch17_a0",,get_full_name());
      if(this.ch17_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch17_a0.cg_bits.option.name = "ch17_a0_bits";
      this.ch17_a0.configure(this, null, "");
      this.ch17_a0.build();
      this.default_map.add_reg(this.ch17_a0, `UVM_REG_ADDR_WIDTH'h248, "RW", 0);
		this.ch17_a0_ADDRESS = this.ch17_a0.ADDRESS;
      this.ch17_am0 = ral_reg_CHN_AM0::type_id::create("ch17_am0",,get_full_name());
      if(this.ch17_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch17_am0.cg_bits.option.name = "ch17_am0_bits";
      this.ch17_am0.configure(this, null, "");
      this.ch17_am0.build();
      this.default_map.add_reg(this.ch17_am0, `UVM_REG_ADDR_WIDTH'h24C, "RW", 0);
		this.ch17_am0_ADDRESS_MASK = this.ch17_am0.ADDRESS_MASK;
      this.ch17_a1 = ral_reg_CHN_A1::type_id::create("ch17_a1",,get_full_name());
      if(this.ch17_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch17_a1.cg_bits.option.name = "ch17_a1_bits";
      this.ch17_a1.configure(this, null, "");
      this.ch17_a1.build();
      this.default_map.add_reg(this.ch17_a1, `UVM_REG_ADDR_WIDTH'h250, "RW", 0);
		this.ch17_a1_ADDRESS = this.ch17_a1.ADDRESS;
      this.ch17_am1 = ral_reg_CHN_AM1::type_id::create("ch17_am1",,get_full_name());
      if(this.ch17_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch17_am1.cg_bits.option.name = "ch17_am1_bits";
      this.ch17_am1.configure(this, null, "");
      this.ch17_am1.build();
      this.default_map.add_reg(this.ch17_am1, `UVM_REG_ADDR_WIDTH'h254, "RW", 0);
		this.ch17_am1_ADDRESS_MASK = this.ch17_am1.ADDRESS_MASK;
      this.ch17_desc = ral_reg_CHN_DESC::type_id::create("ch17_desc",,get_full_name());
      if(this.ch17_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch17_desc.cg_bits.option.name = "ch17_desc_bits";
      this.ch17_desc.configure(this, null, "");
      this.ch17_desc.build();
      this.default_map.add_reg(this.ch17_desc, `UVM_REG_ADDR_WIDTH'h258, "RW", 0);
		this.ch17_desc_ADDRESS_MASK = this.ch17_desc.ADDRESS_MASK;
      this.ch17_swptr = ral_reg_CHN_SWPTR::type_id::create("ch17_swptr",,get_full_name());
      if(this.ch17_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch17_swptr.cg_bits.option.name = "ch17_swptr_bits";
      this.ch17_swptr.configure(this, null, "");
      this.ch17_swptr.build();
      this.default_map.add_reg(this.ch17_swptr, `UVM_REG_ADDR_WIDTH'h25C, "RW", 0);
		this.ch17_swptr_SWPTR_EN = this.ch17_swptr.SWPTR_EN;
		this.ch17_swptr_SW_POINTER = this.ch17_swptr.SW_POINTER;
      this.ch18_csr = ral_reg_CHN_CSR::type_id::create("ch18_csr",,get_full_name());
      if(this.ch18_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch18_csr.cg_bits.option.name = "ch18_csr_bits";
      this.ch18_csr.configure(this, null, "");
      this.ch18_csr.build();
      this.default_map.add_reg(this.ch18_csr, `UVM_REG_ADDR_WIDTH'h260, "RW", 0);
		this.ch18_csr_CH_EN = this.ch18_csr.CH_EN;
		this.ch18_csr_DST_SEL = this.ch18_csr.DST_SEL;
		this.ch18_csr_SRC_SEL = this.ch18_csr.SRC_SEL;
		this.ch18_csr_INC_DST = this.ch18_csr.INC_DST;
		this.ch18_csr_INC_SRC = this.ch18_csr.INC_SRC;
		this.ch18_csr_MODE = this.ch18_csr.MODE;
		this.ch18_csr_ARS = this.ch18_csr.ARS;
		this.ch18_csr_USE_ED = this.ch18_csr.USE_ED;
		this.ch18_csr_SZ_WB = this.ch18_csr.SZ_WB;
		this.ch18_csr_STOP = this.ch18_csr.STOP;
		this.ch18_csr_BUSY = this.ch18_csr.BUSY;
		this.ch18_csr_DONE = this.ch18_csr.DONE;
		this.ch18_csr_ERR = this.ch18_csr.ERR;
		this.ch18_csr_PARITY = this.ch18_csr.PARITY;
      this.ch18_sz = ral_reg_CHN_SZ::type_id::create("ch18_sz",,get_full_name());
      if(this.ch18_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch18_sz.cg_bits.option.name = "ch18_sz_bits";
      this.ch18_sz.configure(this, null, "");
      this.ch18_sz.build();
      this.default_map.add_reg(this.ch18_sz, `UVM_REG_ADDR_WIDTH'h264, "RW", 0);
		this.ch18_sz_CHK_SZ = this.ch18_sz.CHK_SZ;
		this.ch18_sz_TOT_SZ = this.ch18_sz.TOT_SZ;
      this.ch18_a0 = ral_reg_CHN_A0::type_id::create("ch18_a0",,get_full_name());
      if(this.ch18_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch18_a0.cg_bits.option.name = "ch18_a0_bits";
      this.ch18_a0.configure(this, null, "");
      this.ch18_a0.build();
      this.default_map.add_reg(this.ch18_a0, `UVM_REG_ADDR_WIDTH'h268, "RW", 0);
		this.ch18_a0_ADDRESS = this.ch18_a0.ADDRESS;
      this.ch18_am0 = ral_reg_CHN_AM0::type_id::create("ch18_am0",,get_full_name());
      if(this.ch18_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch18_am0.cg_bits.option.name = "ch18_am0_bits";
      this.ch18_am0.configure(this, null, "");
      this.ch18_am0.build();
      this.default_map.add_reg(this.ch18_am0, `UVM_REG_ADDR_WIDTH'h26C, "RW", 0);
		this.ch18_am0_ADDRESS_MASK = this.ch18_am0.ADDRESS_MASK;
      this.ch18_a1 = ral_reg_CHN_A1::type_id::create("ch18_a1",,get_full_name());
      if(this.ch18_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch18_a1.cg_bits.option.name = "ch18_a1_bits";
      this.ch18_a1.configure(this, null, "");
      this.ch18_a1.build();
      this.default_map.add_reg(this.ch18_a1, `UVM_REG_ADDR_WIDTH'h270, "RW", 0);
		this.ch18_a1_ADDRESS = this.ch18_a1.ADDRESS;
      this.ch18_am1 = ral_reg_CHN_AM1::type_id::create("ch18_am1",,get_full_name());
      if(this.ch18_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch18_am1.cg_bits.option.name = "ch18_am1_bits";
      this.ch18_am1.configure(this, null, "");
      this.ch18_am1.build();
      this.default_map.add_reg(this.ch18_am1, `UVM_REG_ADDR_WIDTH'h274, "RW", 0);
		this.ch18_am1_ADDRESS_MASK = this.ch18_am1.ADDRESS_MASK;
      this.ch18_desc = ral_reg_CHN_DESC::type_id::create("ch18_desc",,get_full_name());
      if(this.ch18_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch18_desc.cg_bits.option.name = "ch18_desc_bits";
      this.ch18_desc.configure(this, null, "");
      this.ch18_desc.build();
      this.default_map.add_reg(this.ch18_desc, `UVM_REG_ADDR_WIDTH'h278, "RW", 0);
		this.ch18_desc_ADDRESS_MASK = this.ch18_desc.ADDRESS_MASK;
      this.ch18_swptr = ral_reg_CHN_SWPTR::type_id::create("ch18_swptr",,get_full_name());
      if(this.ch18_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch18_swptr.cg_bits.option.name = "ch18_swptr_bits";
      this.ch18_swptr.configure(this, null, "");
      this.ch18_swptr.build();
      this.default_map.add_reg(this.ch18_swptr, `UVM_REG_ADDR_WIDTH'h27C, "RW", 0);
		this.ch18_swptr_SWPTR_EN = this.ch18_swptr.SWPTR_EN;
		this.ch18_swptr_SW_POINTER = this.ch18_swptr.SW_POINTER;
      this.ch19_csr = ral_reg_CHN_CSR::type_id::create("ch19_csr",,get_full_name());
      if(this.ch19_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch19_csr.cg_bits.option.name = "ch19_csr_bits";
      this.ch19_csr.configure(this, null, "");
      this.ch19_csr.build();
      this.default_map.add_reg(this.ch19_csr, `UVM_REG_ADDR_WIDTH'h280, "RW", 0);
		this.ch19_csr_CH_EN = this.ch19_csr.CH_EN;
		this.ch19_csr_DST_SEL = this.ch19_csr.DST_SEL;
		this.ch19_csr_SRC_SEL = this.ch19_csr.SRC_SEL;
		this.ch19_csr_INC_DST = this.ch19_csr.INC_DST;
		this.ch19_csr_INC_SRC = this.ch19_csr.INC_SRC;
		this.ch19_csr_MODE = this.ch19_csr.MODE;
		this.ch19_csr_ARS = this.ch19_csr.ARS;
		this.ch19_csr_USE_ED = this.ch19_csr.USE_ED;
		this.ch19_csr_SZ_WB = this.ch19_csr.SZ_WB;
		this.ch19_csr_STOP = this.ch19_csr.STOP;
		this.ch19_csr_BUSY = this.ch19_csr.BUSY;
		this.ch19_csr_DONE = this.ch19_csr.DONE;
		this.ch19_csr_ERR = this.ch19_csr.ERR;
		this.ch19_csr_PARITY = this.ch19_csr.PARITY;
      this.ch19_sz = ral_reg_CHN_SZ::type_id::create("ch19_sz",,get_full_name());
      if(this.ch19_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch19_sz.cg_bits.option.name = "ch19_sz_bits";
      this.ch19_sz.configure(this, null, "");
      this.ch19_sz.build();
      this.default_map.add_reg(this.ch19_sz, `UVM_REG_ADDR_WIDTH'h284, "RW", 0);
		this.ch19_sz_CHK_SZ = this.ch19_sz.CHK_SZ;
		this.ch19_sz_TOT_SZ = this.ch19_sz.TOT_SZ;
      this.ch19_a0 = ral_reg_CHN_A0::type_id::create("ch19_a0",,get_full_name());
      if(this.ch19_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch19_a0.cg_bits.option.name = "ch19_a0_bits";
      this.ch19_a0.configure(this, null, "");
      this.ch19_a0.build();
      this.default_map.add_reg(this.ch19_a0, `UVM_REG_ADDR_WIDTH'h288, "RW", 0);
		this.ch19_a0_ADDRESS = this.ch19_a0.ADDRESS;
      this.ch19_am0 = ral_reg_CHN_AM0::type_id::create("ch19_am0",,get_full_name());
      if(this.ch19_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch19_am0.cg_bits.option.name = "ch19_am0_bits";
      this.ch19_am0.configure(this, null, "");
      this.ch19_am0.build();
      this.default_map.add_reg(this.ch19_am0, `UVM_REG_ADDR_WIDTH'h28C, "RW", 0);
		this.ch19_am0_ADDRESS_MASK = this.ch19_am0.ADDRESS_MASK;
      this.ch19_a1 = ral_reg_CHN_A1::type_id::create("ch19_a1",,get_full_name());
      if(this.ch19_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch19_a1.cg_bits.option.name = "ch19_a1_bits";
      this.ch19_a1.configure(this, null, "");
      this.ch19_a1.build();
      this.default_map.add_reg(this.ch19_a1, `UVM_REG_ADDR_WIDTH'h290, "RW", 0);
		this.ch19_a1_ADDRESS = this.ch19_a1.ADDRESS;
      this.ch19_am1 = ral_reg_CHN_AM1::type_id::create("ch19_am1",,get_full_name());
      if(this.ch19_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch19_am1.cg_bits.option.name = "ch19_am1_bits";
      this.ch19_am1.configure(this, null, "");
      this.ch19_am1.build();
      this.default_map.add_reg(this.ch19_am1, `UVM_REG_ADDR_WIDTH'h294, "RW", 0);
		this.ch19_am1_ADDRESS_MASK = this.ch19_am1.ADDRESS_MASK;
      this.ch19_desc = ral_reg_CHN_DESC::type_id::create("ch19_desc",,get_full_name());
      if(this.ch19_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch19_desc.cg_bits.option.name = "ch19_desc_bits";
      this.ch19_desc.configure(this, null, "");
      this.ch19_desc.build();
      this.default_map.add_reg(this.ch19_desc, `UVM_REG_ADDR_WIDTH'h298, "RW", 0);
		this.ch19_desc_ADDRESS_MASK = this.ch19_desc.ADDRESS_MASK;
      this.ch19_swptr = ral_reg_CHN_SWPTR::type_id::create("ch19_swptr",,get_full_name());
      if(this.ch19_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch19_swptr.cg_bits.option.name = "ch19_swptr_bits";
      this.ch19_swptr.configure(this, null, "");
      this.ch19_swptr.build();
      this.default_map.add_reg(this.ch19_swptr, `UVM_REG_ADDR_WIDTH'h29C, "RW", 0);
		this.ch19_swptr_SWPTR_EN = this.ch19_swptr.SWPTR_EN;
		this.ch19_swptr_SW_POINTER = this.ch19_swptr.SW_POINTER;
      this.ch20_csr = ral_reg_CHN_CSR::type_id::create("ch20_csr",,get_full_name());
      if(this.ch20_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch20_csr.cg_bits.option.name = "ch20_csr_bits";
      this.ch20_csr.configure(this, null, "");
      this.ch20_csr.build();
      this.default_map.add_reg(this.ch20_csr, `UVM_REG_ADDR_WIDTH'h2A0, "RW", 0);
		this.ch20_csr_CH_EN = this.ch20_csr.CH_EN;
		this.ch20_csr_DST_SEL = this.ch20_csr.DST_SEL;
		this.ch20_csr_SRC_SEL = this.ch20_csr.SRC_SEL;
		this.ch20_csr_INC_DST = this.ch20_csr.INC_DST;
		this.ch20_csr_INC_SRC = this.ch20_csr.INC_SRC;
		this.ch20_csr_MODE = this.ch20_csr.MODE;
		this.ch20_csr_ARS = this.ch20_csr.ARS;
		this.ch20_csr_USE_ED = this.ch20_csr.USE_ED;
		this.ch20_csr_SZ_WB = this.ch20_csr.SZ_WB;
		this.ch20_csr_STOP = this.ch20_csr.STOP;
		this.ch20_csr_BUSY = this.ch20_csr.BUSY;
		this.ch20_csr_DONE = this.ch20_csr.DONE;
		this.ch20_csr_ERR = this.ch20_csr.ERR;
		this.ch20_csr_PARITY = this.ch20_csr.PARITY;
      this.ch20_sz = ral_reg_CHN_SZ::type_id::create("ch20_sz",,get_full_name());
      if(this.ch20_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch20_sz.cg_bits.option.name = "ch20_sz_bits";
      this.ch20_sz.configure(this, null, "");
      this.ch20_sz.build();
      this.default_map.add_reg(this.ch20_sz, `UVM_REG_ADDR_WIDTH'h2A4, "RW", 0);
		this.ch20_sz_CHK_SZ = this.ch20_sz.CHK_SZ;
		this.ch20_sz_TOT_SZ = this.ch20_sz.TOT_SZ;
      this.ch20_a0 = ral_reg_CHN_A0::type_id::create("ch20_a0",,get_full_name());
      if(this.ch20_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch20_a0.cg_bits.option.name = "ch20_a0_bits";
      this.ch20_a0.configure(this, null, "");
      this.ch20_a0.build();
      this.default_map.add_reg(this.ch20_a0, `UVM_REG_ADDR_WIDTH'h2A8, "RW", 0);
		this.ch20_a0_ADDRESS = this.ch20_a0.ADDRESS;
      this.ch20_am0 = ral_reg_CHN_AM0::type_id::create("ch20_am0",,get_full_name());
      if(this.ch20_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch20_am0.cg_bits.option.name = "ch20_am0_bits";
      this.ch20_am0.configure(this, null, "");
      this.ch20_am0.build();
      this.default_map.add_reg(this.ch20_am0, `UVM_REG_ADDR_WIDTH'h2AC, "RW", 0);
		this.ch20_am0_ADDRESS_MASK = this.ch20_am0.ADDRESS_MASK;
      this.ch20_a1 = ral_reg_CHN_A1::type_id::create("ch20_a1",,get_full_name());
      if(this.ch20_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch20_a1.cg_bits.option.name = "ch20_a1_bits";
      this.ch20_a1.configure(this, null, "");
      this.ch20_a1.build();
      this.default_map.add_reg(this.ch20_a1, `UVM_REG_ADDR_WIDTH'h2B0, "RW", 0);
		this.ch20_a1_ADDRESS = this.ch20_a1.ADDRESS;
      this.ch20_am1 = ral_reg_CHN_AM1::type_id::create("ch20_am1",,get_full_name());
      if(this.ch20_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch20_am1.cg_bits.option.name = "ch20_am1_bits";
      this.ch20_am1.configure(this, null, "");
      this.ch20_am1.build();
      this.default_map.add_reg(this.ch20_am1, `UVM_REG_ADDR_WIDTH'h2B4, "RW", 0);
		this.ch20_am1_ADDRESS_MASK = this.ch20_am1.ADDRESS_MASK;
      this.ch20_desc = ral_reg_CHN_DESC::type_id::create("ch20_desc",,get_full_name());
      if(this.ch20_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch20_desc.cg_bits.option.name = "ch20_desc_bits";
      this.ch20_desc.configure(this, null, "");
      this.ch20_desc.build();
      this.default_map.add_reg(this.ch20_desc, `UVM_REG_ADDR_WIDTH'h2B8, "RW", 0);
		this.ch20_desc_ADDRESS_MASK = this.ch20_desc.ADDRESS_MASK;
      this.ch20_swptr = ral_reg_CHN_SWPTR::type_id::create("ch20_swptr",,get_full_name());
      if(this.ch20_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch20_swptr.cg_bits.option.name = "ch20_swptr_bits";
      this.ch20_swptr.configure(this, null, "");
      this.ch20_swptr.build();
      this.default_map.add_reg(this.ch20_swptr, `UVM_REG_ADDR_WIDTH'h2BC, "RW", 0);
		this.ch20_swptr_SWPTR_EN = this.ch20_swptr.SWPTR_EN;
		this.ch20_swptr_SW_POINTER = this.ch20_swptr.SW_POINTER;
      this.ch21_csr = ral_reg_CHN_CSR::type_id::create("ch21_csr",,get_full_name());
      if(this.ch21_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch21_csr.cg_bits.option.name = "ch21_csr_bits";
      this.ch21_csr.configure(this, null, "");
      this.ch21_csr.build();
      this.default_map.add_reg(this.ch21_csr, `UVM_REG_ADDR_WIDTH'h2C0, "RW", 0);
		this.ch21_csr_CH_EN = this.ch21_csr.CH_EN;
		this.ch21_csr_DST_SEL = this.ch21_csr.DST_SEL;
		this.ch21_csr_SRC_SEL = this.ch21_csr.SRC_SEL;
		this.ch21_csr_INC_DST = this.ch21_csr.INC_DST;
		this.ch21_csr_INC_SRC = this.ch21_csr.INC_SRC;
		this.ch21_csr_MODE = this.ch21_csr.MODE;
		this.ch21_csr_ARS = this.ch21_csr.ARS;
		this.ch21_csr_USE_ED = this.ch21_csr.USE_ED;
		this.ch21_csr_SZ_WB = this.ch21_csr.SZ_WB;
		this.ch21_csr_STOP = this.ch21_csr.STOP;
		this.ch21_csr_BUSY = this.ch21_csr.BUSY;
		this.ch21_csr_DONE = this.ch21_csr.DONE;
		this.ch21_csr_ERR = this.ch21_csr.ERR;
		this.ch21_csr_PARITY = this.ch21_csr.PARITY;
      this.ch21_sz = ral_reg_CHN_SZ::type_id::create("ch21_sz",,get_full_name());
      if(this.ch21_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch21_sz.cg_bits.option.name = "ch21_sz_bits";
      this.ch21_sz.configure(this, null, "");
      this.ch21_sz.build();
      this.default_map.add_reg(this.ch21_sz, `UVM_REG_ADDR_WIDTH'h2C4, "RW", 0);
		this.ch21_sz_CHK_SZ = this.ch21_sz.CHK_SZ;
		this.ch21_sz_TOT_SZ = this.ch21_sz.TOT_SZ;
      this.ch21_a0 = ral_reg_CHN_A0::type_id::create("ch21_a0",,get_full_name());
      if(this.ch21_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch21_a0.cg_bits.option.name = "ch21_a0_bits";
      this.ch21_a0.configure(this, null, "");
      this.ch21_a0.build();
      this.default_map.add_reg(this.ch21_a0, `UVM_REG_ADDR_WIDTH'h2C8, "RW", 0);
		this.ch21_a0_ADDRESS = this.ch21_a0.ADDRESS;
      this.ch21_am0 = ral_reg_CHN_AM0::type_id::create("ch21_am0",,get_full_name());
      if(this.ch21_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch21_am0.cg_bits.option.name = "ch21_am0_bits";
      this.ch21_am0.configure(this, null, "");
      this.ch21_am0.build();
      this.default_map.add_reg(this.ch21_am0, `UVM_REG_ADDR_WIDTH'h2CC, "RW", 0);
		this.ch21_am0_ADDRESS_MASK = this.ch21_am0.ADDRESS_MASK;
      this.ch21_a1 = ral_reg_CHN_A1::type_id::create("ch21_a1",,get_full_name());
      if(this.ch21_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch21_a1.cg_bits.option.name = "ch21_a1_bits";
      this.ch21_a1.configure(this, null, "");
      this.ch21_a1.build();
      this.default_map.add_reg(this.ch21_a1, `UVM_REG_ADDR_WIDTH'h2D0, "RW", 0);
		this.ch21_a1_ADDRESS = this.ch21_a1.ADDRESS;
      this.ch21_am1 = ral_reg_CHN_AM1::type_id::create("ch21_am1",,get_full_name());
      if(this.ch21_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch21_am1.cg_bits.option.name = "ch21_am1_bits";
      this.ch21_am1.configure(this, null, "");
      this.ch21_am1.build();
      this.default_map.add_reg(this.ch21_am1, `UVM_REG_ADDR_WIDTH'h2D4, "RW", 0);
		this.ch21_am1_ADDRESS_MASK = this.ch21_am1.ADDRESS_MASK;
      this.ch21_desc = ral_reg_CHN_DESC::type_id::create("ch21_desc",,get_full_name());
      if(this.ch21_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch21_desc.cg_bits.option.name = "ch21_desc_bits";
      this.ch21_desc.configure(this, null, "");
      this.ch21_desc.build();
      this.default_map.add_reg(this.ch21_desc, `UVM_REG_ADDR_WIDTH'h2D8, "RW", 0);
		this.ch21_desc_ADDRESS_MASK = this.ch21_desc.ADDRESS_MASK;
      this.ch21_swptr = ral_reg_CHN_SWPTR::type_id::create("ch21_swptr",,get_full_name());
      if(this.ch21_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch21_swptr.cg_bits.option.name = "ch21_swptr_bits";
      this.ch21_swptr.configure(this, null, "");
      this.ch21_swptr.build();
      this.default_map.add_reg(this.ch21_swptr, `UVM_REG_ADDR_WIDTH'h2DC, "RW", 0);
		this.ch21_swptr_SWPTR_EN = this.ch21_swptr.SWPTR_EN;
		this.ch21_swptr_SW_POINTER = this.ch21_swptr.SW_POINTER;
      this.ch22_csr = ral_reg_CHN_CSR::type_id::create("ch22_csr",,get_full_name());
      if(this.ch22_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch22_csr.cg_bits.option.name = "ch22_csr_bits";
      this.ch22_csr.configure(this, null, "");
      this.ch22_csr.build();
      this.default_map.add_reg(this.ch22_csr, `UVM_REG_ADDR_WIDTH'h2E0, "RW", 0);
		this.ch22_csr_CH_EN = this.ch22_csr.CH_EN;
		this.ch22_csr_DST_SEL = this.ch22_csr.DST_SEL;
		this.ch22_csr_SRC_SEL = this.ch22_csr.SRC_SEL;
		this.ch22_csr_INC_DST = this.ch22_csr.INC_DST;
		this.ch22_csr_INC_SRC = this.ch22_csr.INC_SRC;
		this.ch22_csr_MODE = this.ch22_csr.MODE;
		this.ch22_csr_ARS = this.ch22_csr.ARS;
		this.ch22_csr_USE_ED = this.ch22_csr.USE_ED;
		this.ch22_csr_SZ_WB = this.ch22_csr.SZ_WB;
		this.ch22_csr_STOP = this.ch22_csr.STOP;
		this.ch22_csr_BUSY = this.ch22_csr.BUSY;
		this.ch22_csr_DONE = this.ch22_csr.DONE;
		this.ch22_csr_ERR = this.ch22_csr.ERR;
		this.ch22_csr_PARITY = this.ch22_csr.PARITY;
      this.ch22_sz = ral_reg_CHN_SZ::type_id::create("ch22_sz",,get_full_name());
      if(this.ch22_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch22_sz.cg_bits.option.name = "ch22_sz_bits";
      this.ch22_sz.configure(this, null, "");
      this.ch22_sz.build();
      this.default_map.add_reg(this.ch22_sz, `UVM_REG_ADDR_WIDTH'h2E4, "RW", 0);
		this.ch22_sz_CHK_SZ = this.ch22_sz.CHK_SZ;
		this.ch22_sz_TOT_SZ = this.ch22_sz.TOT_SZ;
      this.ch22_a0 = ral_reg_CHN_A0::type_id::create("ch22_a0",,get_full_name());
      if(this.ch22_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch22_a0.cg_bits.option.name = "ch22_a0_bits";
      this.ch22_a0.configure(this, null, "");
      this.ch22_a0.build();
      this.default_map.add_reg(this.ch22_a0, `UVM_REG_ADDR_WIDTH'h2E8, "RW", 0);
		this.ch22_a0_ADDRESS = this.ch22_a0.ADDRESS;
      this.ch22_am0 = ral_reg_CHN_AM0::type_id::create("ch22_am0",,get_full_name());
      if(this.ch22_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch22_am0.cg_bits.option.name = "ch22_am0_bits";
      this.ch22_am0.configure(this, null, "");
      this.ch22_am0.build();
      this.default_map.add_reg(this.ch22_am0, `UVM_REG_ADDR_WIDTH'h2EC, "RW", 0);
		this.ch22_am0_ADDRESS_MASK = this.ch22_am0.ADDRESS_MASK;
      this.ch22_a1 = ral_reg_CHN_A1::type_id::create("ch22_a1",,get_full_name());
      if(this.ch22_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch22_a1.cg_bits.option.name = "ch22_a1_bits";
      this.ch22_a1.configure(this, null, "");
      this.ch22_a1.build();
      this.default_map.add_reg(this.ch22_a1, `UVM_REG_ADDR_WIDTH'h2F0, "RW", 0);
		this.ch22_a1_ADDRESS = this.ch22_a1.ADDRESS;
      this.ch22_am1 = ral_reg_CHN_AM1::type_id::create("ch22_am1",,get_full_name());
      if(this.ch22_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch22_am1.cg_bits.option.name = "ch22_am1_bits";
      this.ch22_am1.configure(this, null, "");
      this.ch22_am1.build();
      this.default_map.add_reg(this.ch22_am1, `UVM_REG_ADDR_WIDTH'h2F4, "RW", 0);
		this.ch22_am1_ADDRESS_MASK = this.ch22_am1.ADDRESS_MASK;
      this.ch22_desc = ral_reg_CHN_DESC::type_id::create("ch22_desc",,get_full_name());
      if(this.ch22_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch22_desc.cg_bits.option.name = "ch22_desc_bits";
      this.ch22_desc.configure(this, null, "");
      this.ch22_desc.build();
      this.default_map.add_reg(this.ch22_desc, `UVM_REG_ADDR_WIDTH'h2F8, "RW", 0);
		this.ch22_desc_ADDRESS_MASK = this.ch22_desc.ADDRESS_MASK;
      this.ch22_swptr = ral_reg_CHN_SWPTR::type_id::create("ch22_swptr",,get_full_name());
      if(this.ch22_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch22_swptr.cg_bits.option.name = "ch22_swptr_bits";
      this.ch22_swptr.configure(this, null, "");
      this.ch22_swptr.build();
      this.default_map.add_reg(this.ch22_swptr, `UVM_REG_ADDR_WIDTH'h2FC, "RW", 0);
		this.ch22_swptr_SWPTR_EN = this.ch22_swptr.SWPTR_EN;
		this.ch22_swptr_SW_POINTER = this.ch22_swptr.SW_POINTER;
      this.ch23_csr = ral_reg_CHN_CSR::type_id::create("ch23_csr",,get_full_name());
      if(this.ch23_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch23_csr.cg_bits.option.name = "ch23_csr_bits";
      this.ch23_csr.configure(this, null, "");
      this.ch23_csr.build();
      this.default_map.add_reg(this.ch23_csr, `UVM_REG_ADDR_WIDTH'h300, "RW", 0);
		this.ch23_csr_CH_EN = this.ch23_csr.CH_EN;
		this.ch23_csr_DST_SEL = this.ch23_csr.DST_SEL;
		this.ch23_csr_SRC_SEL = this.ch23_csr.SRC_SEL;
		this.ch23_csr_INC_DST = this.ch23_csr.INC_DST;
		this.ch23_csr_INC_SRC = this.ch23_csr.INC_SRC;
		this.ch23_csr_MODE = this.ch23_csr.MODE;
		this.ch23_csr_ARS = this.ch23_csr.ARS;
		this.ch23_csr_USE_ED = this.ch23_csr.USE_ED;
		this.ch23_csr_SZ_WB = this.ch23_csr.SZ_WB;
		this.ch23_csr_STOP = this.ch23_csr.STOP;
		this.ch23_csr_BUSY = this.ch23_csr.BUSY;
		this.ch23_csr_DONE = this.ch23_csr.DONE;
		this.ch23_csr_ERR = this.ch23_csr.ERR;
		this.ch23_csr_PARITY = this.ch23_csr.PARITY;
      this.ch23_sz = ral_reg_CHN_SZ::type_id::create("ch23_sz",,get_full_name());
      if(this.ch23_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch23_sz.cg_bits.option.name = "ch23_sz_bits";
      this.ch23_sz.configure(this, null, "");
      this.ch23_sz.build();
      this.default_map.add_reg(this.ch23_sz, `UVM_REG_ADDR_WIDTH'h304, "RW", 0);
		this.ch23_sz_CHK_SZ = this.ch23_sz.CHK_SZ;
		this.ch23_sz_TOT_SZ = this.ch23_sz.TOT_SZ;
      this.ch23_a0 = ral_reg_CHN_A0::type_id::create("ch23_a0",,get_full_name());
      if(this.ch23_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch23_a0.cg_bits.option.name = "ch23_a0_bits";
      this.ch23_a0.configure(this, null, "");
      this.ch23_a0.build();
      this.default_map.add_reg(this.ch23_a0, `UVM_REG_ADDR_WIDTH'h308, "RW", 0);
		this.ch23_a0_ADDRESS = this.ch23_a0.ADDRESS;
      this.ch23_am0 = ral_reg_CHN_AM0::type_id::create("ch23_am0",,get_full_name());
      if(this.ch23_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch23_am0.cg_bits.option.name = "ch23_am0_bits";
      this.ch23_am0.configure(this, null, "");
      this.ch23_am0.build();
      this.default_map.add_reg(this.ch23_am0, `UVM_REG_ADDR_WIDTH'h30C, "RW", 0);
		this.ch23_am0_ADDRESS_MASK = this.ch23_am0.ADDRESS_MASK;
      this.ch23_a1 = ral_reg_CHN_A1::type_id::create("ch23_a1",,get_full_name());
      if(this.ch23_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch23_a1.cg_bits.option.name = "ch23_a1_bits";
      this.ch23_a1.configure(this, null, "");
      this.ch23_a1.build();
      this.default_map.add_reg(this.ch23_a1, `UVM_REG_ADDR_WIDTH'h310, "RW", 0);
		this.ch23_a1_ADDRESS = this.ch23_a1.ADDRESS;
      this.ch23_am1 = ral_reg_CHN_AM1::type_id::create("ch23_am1",,get_full_name());
      if(this.ch23_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch23_am1.cg_bits.option.name = "ch23_am1_bits";
      this.ch23_am1.configure(this, null, "");
      this.ch23_am1.build();
      this.default_map.add_reg(this.ch23_am1, `UVM_REG_ADDR_WIDTH'h314, "RW", 0);
		this.ch23_am1_ADDRESS_MASK = this.ch23_am1.ADDRESS_MASK;
      this.ch23_desc = ral_reg_CHN_DESC::type_id::create("ch23_desc",,get_full_name());
      if(this.ch23_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch23_desc.cg_bits.option.name = "ch23_desc_bits";
      this.ch23_desc.configure(this, null, "");
      this.ch23_desc.build();
      this.default_map.add_reg(this.ch23_desc, `UVM_REG_ADDR_WIDTH'h318, "RW", 0);
		this.ch23_desc_ADDRESS_MASK = this.ch23_desc.ADDRESS_MASK;
      this.ch23_swptr = ral_reg_CHN_SWPTR::type_id::create("ch23_swptr",,get_full_name());
      if(this.ch23_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch23_swptr.cg_bits.option.name = "ch23_swptr_bits";
      this.ch23_swptr.configure(this, null, "");
      this.ch23_swptr.build();
      this.default_map.add_reg(this.ch23_swptr, `UVM_REG_ADDR_WIDTH'h31C, "RW", 0);
		this.ch23_swptr_SWPTR_EN = this.ch23_swptr.SWPTR_EN;
		this.ch23_swptr_SW_POINTER = this.ch23_swptr.SW_POINTER;
      this.ch24_csr = ral_reg_CHN_CSR::type_id::create("ch24_csr",,get_full_name());
      if(this.ch24_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch24_csr.cg_bits.option.name = "ch24_csr_bits";
      this.ch24_csr.configure(this, null, "");
      this.ch24_csr.build();
      this.default_map.add_reg(this.ch24_csr, `UVM_REG_ADDR_WIDTH'h320, "RW", 0);
		this.ch24_csr_CH_EN = this.ch24_csr.CH_EN;
		this.ch24_csr_DST_SEL = this.ch24_csr.DST_SEL;
		this.ch24_csr_SRC_SEL = this.ch24_csr.SRC_SEL;
		this.ch24_csr_INC_DST = this.ch24_csr.INC_DST;
		this.ch24_csr_INC_SRC = this.ch24_csr.INC_SRC;
		this.ch24_csr_MODE = this.ch24_csr.MODE;
		this.ch24_csr_ARS = this.ch24_csr.ARS;
		this.ch24_csr_USE_ED = this.ch24_csr.USE_ED;
		this.ch24_csr_SZ_WB = this.ch24_csr.SZ_WB;
		this.ch24_csr_STOP = this.ch24_csr.STOP;
		this.ch24_csr_BUSY = this.ch24_csr.BUSY;
		this.ch24_csr_DONE = this.ch24_csr.DONE;
		this.ch24_csr_ERR = this.ch24_csr.ERR;
		this.ch24_csr_PARITY = this.ch24_csr.PARITY;
      this.ch24_sz = ral_reg_CHN_SZ::type_id::create("ch24_sz",,get_full_name());
      if(this.ch24_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch24_sz.cg_bits.option.name = "ch24_sz_bits";
      this.ch24_sz.configure(this, null, "");
      this.ch24_sz.build();
      this.default_map.add_reg(this.ch24_sz, `UVM_REG_ADDR_WIDTH'h324, "RW", 0);
		this.ch24_sz_CHK_SZ = this.ch24_sz.CHK_SZ;
		this.ch24_sz_TOT_SZ = this.ch24_sz.TOT_SZ;
      this.ch24_a0 = ral_reg_CHN_A0::type_id::create("ch24_a0",,get_full_name());
      if(this.ch24_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch24_a0.cg_bits.option.name = "ch24_a0_bits";
      this.ch24_a0.configure(this, null, "");
      this.ch24_a0.build();
      this.default_map.add_reg(this.ch24_a0, `UVM_REG_ADDR_WIDTH'h328, "RW", 0);
		this.ch24_a0_ADDRESS = this.ch24_a0.ADDRESS;
      this.ch24_am0 = ral_reg_CHN_AM0::type_id::create("ch24_am0",,get_full_name());
      if(this.ch24_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch24_am0.cg_bits.option.name = "ch24_am0_bits";
      this.ch24_am0.configure(this, null, "");
      this.ch24_am0.build();
      this.default_map.add_reg(this.ch24_am0, `UVM_REG_ADDR_WIDTH'h32C, "RW", 0);
		this.ch24_am0_ADDRESS_MASK = this.ch24_am0.ADDRESS_MASK;
      this.ch24_a1 = ral_reg_CHN_A1::type_id::create("ch24_a1",,get_full_name());
      if(this.ch24_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch24_a1.cg_bits.option.name = "ch24_a1_bits";
      this.ch24_a1.configure(this, null, "");
      this.ch24_a1.build();
      this.default_map.add_reg(this.ch24_a1, `UVM_REG_ADDR_WIDTH'h330, "RW", 0);
		this.ch24_a1_ADDRESS = this.ch24_a1.ADDRESS;
      this.ch24_am1 = ral_reg_CHN_AM1::type_id::create("ch24_am1",,get_full_name());
      if(this.ch24_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch24_am1.cg_bits.option.name = "ch24_am1_bits";
      this.ch24_am1.configure(this, null, "");
      this.ch24_am1.build();
      this.default_map.add_reg(this.ch24_am1, `UVM_REG_ADDR_WIDTH'h334, "RW", 0);
		this.ch24_am1_ADDRESS_MASK = this.ch24_am1.ADDRESS_MASK;
      this.ch24_desc = ral_reg_CHN_DESC::type_id::create("ch24_desc",,get_full_name());
      if(this.ch24_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch24_desc.cg_bits.option.name = "ch24_desc_bits";
      this.ch24_desc.configure(this, null, "");
      this.ch24_desc.build();
      this.default_map.add_reg(this.ch24_desc, `UVM_REG_ADDR_WIDTH'h338, "RW", 0);
		this.ch24_desc_ADDRESS_MASK = this.ch24_desc.ADDRESS_MASK;
      this.ch24_swptr = ral_reg_CHN_SWPTR::type_id::create("ch24_swptr",,get_full_name());
      if(this.ch24_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch24_swptr.cg_bits.option.name = "ch24_swptr_bits";
      this.ch24_swptr.configure(this, null, "");
      this.ch24_swptr.build();
      this.default_map.add_reg(this.ch24_swptr, `UVM_REG_ADDR_WIDTH'h33C, "RW", 0);
		this.ch24_swptr_SWPTR_EN = this.ch24_swptr.SWPTR_EN;
		this.ch24_swptr_SW_POINTER = this.ch24_swptr.SW_POINTER;
      this.ch25_csr = ral_reg_CHN_CSR::type_id::create("ch25_csr",,get_full_name());
      if(this.ch25_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch25_csr.cg_bits.option.name = "ch25_csr_bits";
      this.ch25_csr.configure(this, null, "");
      this.ch25_csr.build();
      this.default_map.add_reg(this.ch25_csr, `UVM_REG_ADDR_WIDTH'h340, "RW", 0);
		this.ch25_csr_CH_EN = this.ch25_csr.CH_EN;
		this.ch25_csr_DST_SEL = this.ch25_csr.DST_SEL;
		this.ch25_csr_SRC_SEL = this.ch25_csr.SRC_SEL;
		this.ch25_csr_INC_DST = this.ch25_csr.INC_DST;
		this.ch25_csr_INC_SRC = this.ch25_csr.INC_SRC;
		this.ch25_csr_MODE = this.ch25_csr.MODE;
		this.ch25_csr_ARS = this.ch25_csr.ARS;
		this.ch25_csr_USE_ED = this.ch25_csr.USE_ED;
		this.ch25_csr_SZ_WB = this.ch25_csr.SZ_WB;
		this.ch25_csr_STOP = this.ch25_csr.STOP;
		this.ch25_csr_BUSY = this.ch25_csr.BUSY;
		this.ch25_csr_DONE = this.ch25_csr.DONE;
		this.ch25_csr_ERR = this.ch25_csr.ERR;
		this.ch25_csr_PARITY = this.ch25_csr.PARITY;
      this.ch25_sz = ral_reg_CHN_SZ::type_id::create("ch25_sz",,get_full_name());
      if(this.ch25_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch25_sz.cg_bits.option.name = "ch25_sz_bits";
      this.ch25_sz.configure(this, null, "");
      this.ch25_sz.build();
      this.default_map.add_reg(this.ch25_sz, `UVM_REG_ADDR_WIDTH'h344, "RW", 0);
		this.ch25_sz_CHK_SZ = this.ch25_sz.CHK_SZ;
		this.ch25_sz_TOT_SZ = this.ch25_sz.TOT_SZ;
      this.ch25_a0 = ral_reg_CHN_A0::type_id::create("ch25_a0",,get_full_name());
      if(this.ch25_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch25_a0.cg_bits.option.name = "ch25_a0_bits";
      this.ch25_a0.configure(this, null, "");
      this.ch25_a0.build();
      this.default_map.add_reg(this.ch25_a0, `UVM_REG_ADDR_WIDTH'h348, "RW", 0);
		this.ch25_a0_ADDRESS = this.ch25_a0.ADDRESS;
      this.ch25_am0 = ral_reg_CHN_AM0::type_id::create("ch25_am0",,get_full_name());
      if(this.ch25_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch25_am0.cg_bits.option.name = "ch25_am0_bits";
      this.ch25_am0.configure(this, null, "");
      this.ch25_am0.build();
      this.default_map.add_reg(this.ch25_am0, `UVM_REG_ADDR_WIDTH'h34C, "RW", 0);
		this.ch25_am0_ADDRESS_MASK = this.ch25_am0.ADDRESS_MASK;
      this.ch25_a1 = ral_reg_CHN_A1::type_id::create("ch25_a1",,get_full_name());
      if(this.ch25_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch25_a1.cg_bits.option.name = "ch25_a1_bits";
      this.ch25_a1.configure(this, null, "");
      this.ch25_a1.build();
      this.default_map.add_reg(this.ch25_a1, `UVM_REG_ADDR_WIDTH'h350, "RW", 0);
		this.ch25_a1_ADDRESS = this.ch25_a1.ADDRESS;
      this.ch25_am1 = ral_reg_CHN_AM1::type_id::create("ch25_am1",,get_full_name());
      if(this.ch25_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch25_am1.cg_bits.option.name = "ch25_am1_bits";
      this.ch25_am1.configure(this, null, "");
      this.ch25_am1.build();
      this.default_map.add_reg(this.ch25_am1, `UVM_REG_ADDR_WIDTH'h354, "RW", 0);
		this.ch25_am1_ADDRESS_MASK = this.ch25_am1.ADDRESS_MASK;
      this.ch25_desc = ral_reg_CHN_DESC::type_id::create("ch25_desc",,get_full_name());
      if(this.ch25_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch25_desc.cg_bits.option.name = "ch25_desc_bits";
      this.ch25_desc.configure(this, null, "");
      this.ch25_desc.build();
      this.default_map.add_reg(this.ch25_desc, `UVM_REG_ADDR_WIDTH'h358, "RW", 0);
		this.ch25_desc_ADDRESS_MASK = this.ch25_desc.ADDRESS_MASK;
      this.ch25_swptr = ral_reg_CHN_SWPTR::type_id::create("ch25_swptr",,get_full_name());
      if(this.ch25_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch25_swptr.cg_bits.option.name = "ch25_swptr_bits";
      this.ch25_swptr.configure(this, null, "");
      this.ch25_swptr.build();
      this.default_map.add_reg(this.ch25_swptr, `UVM_REG_ADDR_WIDTH'h35C, "RW", 0);
		this.ch25_swptr_SWPTR_EN = this.ch25_swptr.SWPTR_EN;
		this.ch25_swptr_SW_POINTER = this.ch25_swptr.SW_POINTER;
      this.ch26_csr = ral_reg_CHN_CSR::type_id::create("ch26_csr",,get_full_name());
      if(this.ch26_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch26_csr.cg_bits.option.name = "ch26_csr_bits";
      this.ch26_csr.configure(this, null, "");
      this.ch26_csr.build();
      this.default_map.add_reg(this.ch26_csr, `UVM_REG_ADDR_WIDTH'h360, "RW", 0);
		this.ch26_csr_CH_EN = this.ch26_csr.CH_EN;
		this.ch26_csr_DST_SEL = this.ch26_csr.DST_SEL;
		this.ch26_csr_SRC_SEL = this.ch26_csr.SRC_SEL;
		this.ch26_csr_INC_DST = this.ch26_csr.INC_DST;
		this.ch26_csr_INC_SRC = this.ch26_csr.INC_SRC;
		this.ch26_csr_MODE = this.ch26_csr.MODE;
		this.ch26_csr_ARS = this.ch26_csr.ARS;
		this.ch26_csr_USE_ED = this.ch26_csr.USE_ED;
		this.ch26_csr_SZ_WB = this.ch26_csr.SZ_WB;
		this.ch26_csr_STOP = this.ch26_csr.STOP;
		this.ch26_csr_BUSY = this.ch26_csr.BUSY;
		this.ch26_csr_DONE = this.ch26_csr.DONE;
		this.ch26_csr_ERR = this.ch26_csr.ERR;
		this.ch26_csr_PARITY = this.ch26_csr.PARITY;
      this.ch26_sz = ral_reg_CHN_SZ::type_id::create("ch26_sz",,get_full_name());
      if(this.ch26_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch26_sz.cg_bits.option.name = "ch26_sz_bits";
      this.ch26_sz.configure(this, null, "");
      this.ch26_sz.build();
      this.default_map.add_reg(this.ch26_sz, `UVM_REG_ADDR_WIDTH'h364, "RW", 0);
		this.ch26_sz_CHK_SZ = this.ch26_sz.CHK_SZ;
		this.ch26_sz_TOT_SZ = this.ch26_sz.TOT_SZ;
      this.ch26_a0 = ral_reg_CHN_A0::type_id::create("ch26_a0",,get_full_name());
      if(this.ch26_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch26_a0.cg_bits.option.name = "ch26_a0_bits";
      this.ch26_a0.configure(this, null, "");
      this.ch26_a0.build();
      this.default_map.add_reg(this.ch26_a0, `UVM_REG_ADDR_WIDTH'h368, "RW", 0);
		this.ch26_a0_ADDRESS = this.ch26_a0.ADDRESS;
      this.ch26_am0 = ral_reg_CHN_AM0::type_id::create("ch26_am0",,get_full_name());
      if(this.ch26_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch26_am0.cg_bits.option.name = "ch26_am0_bits";
      this.ch26_am0.configure(this, null, "");
      this.ch26_am0.build();
      this.default_map.add_reg(this.ch26_am0, `UVM_REG_ADDR_WIDTH'h36C, "RW", 0);
		this.ch26_am0_ADDRESS_MASK = this.ch26_am0.ADDRESS_MASK;
      this.ch26_a1 = ral_reg_CHN_A1::type_id::create("ch26_a1",,get_full_name());
      if(this.ch26_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch26_a1.cg_bits.option.name = "ch26_a1_bits";
      this.ch26_a1.configure(this, null, "");
      this.ch26_a1.build();
      this.default_map.add_reg(this.ch26_a1, `UVM_REG_ADDR_WIDTH'h370, "RW", 0);
		this.ch26_a1_ADDRESS = this.ch26_a1.ADDRESS;
      this.ch26_am1 = ral_reg_CHN_AM1::type_id::create("ch26_am1",,get_full_name());
      if(this.ch26_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch26_am1.cg_bits.option.name = "ch26_am1_bits";
      this.ch26_am1.configure(this, null, "");
      this.ch26_am1.build();
      this.default_map.add_reg(this.ch26_am1, `UVM_REG_ADDR_WIDTH'h374, "RW", 0);
		this.ch26_am1_ADDRESS_MASK = this.ch26_am1.ADDRESS_MASK;
      this.ch26_desc = ral_reg_CHN_DESC::type_id::create("ch26_desc",,get_full_name());
      if(this.ch26_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch26_desc.cg_bits.option.name = "ch26_desc_bits";
      this.ch26_desc.configure(this, null, "");
      this.ch26_desc.build();
      this.default_map.add_reg(this.ch26_desc, `UVM_REG_ADDR_WIDTH'h378, "RW", 0);
		this.ch26_desc_ADDRESS_MASK = this.ch26_desc.ADDRESS_MASK;
      this.ch26_swptr = ral_reg_CHN_SWPTR::type_id::create("ch26_swptr",,get_full_name());
      if(this.ch26_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch26_swptr.cg_bits.option.name = "ch26_swptr_bits";
      this.ch26_swptr.configure(this, null, "");
      this.ch26_swptr.build();
      this.default_map.add_reg(this.ch26_swptr, `UVM_REG_ADDR_WIDTH'h37C, "RW", 0);
		this.ch26_swptr_SWPTR_EN = this.ch26_swptr.SWPTR_EN;
		this.ch26_swptr_SW_POINTER = this.ch26_swptr.SW_POINTER;
      this.ch27_csr = ral_reg_CHN_CSR::type_id::create("ch27_csr",,get_full_name());
      if(this.ch27_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch27_csr.cg_bits.option.name = "ch27_csr_bits";
      this.ch27_csr.configure(this, null, "");
      this.ch27_csr.build();
      this.default_map.add_reg(this.ch27_csr, `UVM_REG_ADDR_WIDTH'h380, "RW", 0);
		this.ch27_csr_CH_EN = this.ch27_csr.CH_EN;
		this.ch27_csr_DST_SEL = this.ch27_csr.DST_SEL;
		this.ch27_csr_SRC_SEL = this.ch27_csr.SRC_SEL;
		this.ch27_csr_INC_DST = this.ch27_csr.INC_DST;
		this.ch27_csr_INC_SRC = this.ch27_csr.INC_SRC;
		this.ch27_csr_MODE = this.ch27_csr.MODE;
		this.ch27_csr_ARS = this.ch27_csr.ARS;
		this.ch27_csr_USE_ED = this.ch27_csr.USE_ED;
		this.ch27_csr_SZ_WB = this.ch27_csr.SZ_WB;
		this.ch27_csr_STOP = this.ch27_csr.STOP;
		this.ch27_csr_BUSY = this.ch27_csr.BUSY;
		this.ch27_csr_DONE = this.ch27_csr.DONE;
		this.ch27_csr_ERR = this.ch27_csr.ERR;
		this.ch27_csr_PARITY = this.ch27_csr.PARITY;
      this.ch27_sz = ral_reg_CHN_SZ::type_id::create("ch27_sz",,get_full_name());
      if(this.ch27_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch27_sz.cg_bits.option.name = "ch27_sz_bits";
      this.ch27_sz.configure(this, null, "");
      this.ch27_sz.build();
      this.default_map.add_reg(this.ch27_sz, `UVM_REG_ADDR_WIDTH'h384, "RW", 0);
		this.ch27_sz_CHK_SZ = this.ch27_sz.CHK_SZ;
		this.ch27_sz_TOT_SZ = this.ch27_sz.TOT_SZ;
      this.ch27_a0 = ral_reg_CHN_A0::type_id::create("ch27_a0",,get_full_name());
      if(this.ch27_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch27_a0.cg_bits.option.name = "ch27_a0_bits";
      this.ch27_a0.configure(this, null, "");
      this.ch27_a0.build();
      this.default_map.add_reg(this.ch27_a0, `UVM_REG_ADDR_WIDTH'h388, "RW", 0);
		this.ch27_a0_ADDRESS = this.ch27_a0.ADDRESS;
      this.ch27_am0 = ral_reg_CHN_AM0::type_id::create("ch27_am0",,get_full_name());
      if(this.ch27_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch27_am0.cg_bits.option.name = "ch27_am0_bits";
      this.ch27_am0.configure(this, null, "");
      this.ch27_am0.build();
      this.default_map.add_reg(this.ch27_am0, `UVM_REG_ADDR_WIDTH'h38C, "RW", 0);
		this.ch27_am0_ADDRESS_MASK = this.ch27_am0.ADDRESS_MASK;
      this.ch27_a1 = ral_reg_CHN_A1::type_id::create("ch27_a1",,get_full_name());
      if(this.ch27_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch27_a1.cg_bits.option.name = "ch27_a1_bits";
      this.ch27_a1.configure(this, null, "");
      this.ch27_a1.build();
      this.default_map.add_reg(this.ch27_a1, `UVM_REG_ADDR_WIDTH'h390, "RW", 0);
		this.ch27_a1_ADDRESS = this.ch27_a1.ADDRESS;
      this.ch27_am1 = ral_reg_CHN_AM1::type_id::create("ch27_am1",,get_full_name());
      if(this.ch27_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch27_am1.cg_bits.option.name = "ch27_am1_bits";
      this.ch27_am1.configure(this, null, "");
      this.ch27_am1.build();
      this.default_map.add_reg(this.ch27_am1, `UVM_REG_ADDR_WIDTH'h394, "RW", 0);
		this.ch27_am1_ADDRESS_MASK = this.ch27_am1.ADDRESS_MASK;
      this.ch27_desc = ral_reg_CHN_DESC::type_id::create("ch27_desc",,get_full_name());
      if(this.ch27_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch27_desc.cg_bits.option.name = "ch27_desc_bits";
      this.ch27_desc.configure(this, null, "");
      this.ch27_desc.build();
      this.default_map.add_reg(this.ch27_desc, `UVM_REG_ADDR_WIDTH'h398, "RW", 0);
		this.ch27_desc_ADDRESS_MASK = this.ch27_desc.ADDRESS_MASK;
      this.ch27_swptr = ral_reg_CHN_SWPTR::type_id::create("ch27_swptr",,get_full_name());
      if(this.ch27_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch27_swptr.cg_bits.option.name = "ch27_swptr_bits";
      this.ch27_swptr.configure(this, null, "");
      this.ch27_swptr.build();
      this.default_map.add_reg(this.ch27_swptr, `UVM_REG_ADDR_WIDTH'h39C, "RW", 0);
		this.ch27_swptr_SWPTR_EN = this.ch27_swptr.SWPTR_EN;
		this.ch27_swptr_SW_POINTER = this.ch27_swptr.SW_POINTER;
      this.ch28_csr = ral_reg_CHN_CSR::type_id::create("ch28_csr",,get_full_name());
      if(this.ch28_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch28_csr.cg_bits.option.name = "ch28_csr_bits";
      this.ch28_csr.configure(this, null, "");
      this.ch28_csr.build();
      this.default_map.add_reg(this.ch28_csr, `UVM_REG_ADDR_WIDTH'h3A0, "RW", 0);
		this.ch28_csr_CH_EN = this.ch28_csr.CH_EN;
		this.ch28_csr_DST_SEL = this.ch28_csr.DST_SEL;
		this.ch28_csr_SRC_SEL = this.ch28_csr.SRC_SEL;
		this.ch28_csr_INC_DST = this.ch28_csr.INC_DST;
		this.ch28_csr_INC_SRC = this.ch28_csr.INC_SRC;
		this.ch28_csr_MODE = this.ch28_csr.MODE;
		this.ch28_csr_ARS = this.ch28_csr.ARS;
		this.ch28_csr_USE_ED = this.ch28_csr.USE_ED;
		this.ch28_csr_SZ_WB = this.ch28_csr.SZ_WB;
		this.ch28_csr_STOP = this.ch28_csr.STOP;
		this.ch28_csr_BUSY = this.ch28_csr.BUSY;
		this.ch28_csr_DONE = this.ch28_csr.DONE;
		this.ch28_csr_ERR = this.ch28_csr.ERR;
		this.ch28_csr_PARITY = this.ch28_csr.PARITY;
      this.ch28_sz = ral_reg_CHN_SZ::type_id::create("ch28_sz",,get_full_name());
      if(this.ch28_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch28_sz.cg_bits.option.name = "ch28_sz_bits";
      this.ch28_sz.configure(this, null, "");
      this.ch28_sz.build();
      this.default_map.add_reg(this.ch28_sz, `UVM_REG_ADDR_WIDTH'h3A4, "RW", 0);
		this.ch28_sz_CHK_SZ = this.ch28_sz.CHK_SZ;
		this.ch28_sz_TOT_SZ = this.ch28_sz.TOT_SZ;
      this.ch28_a0 = ral_reg_CHN_A0::type_id::create("ch28_a0",,get_full_name());
      if(this.ch28_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch28_a0.cg_bits.option.name = "ch28_a0_bits";
      this.ch28_a0.configure(this, null, "");
      this.ch28_a0.build();
      this.default_map.add_reg(this.ch28_a0, `UVM_REG_ADDR_WIDTH'h3A8, "RW", 0);
		this.ch28_a0_ADDRESS = this.ch28_a0.ADDRESS;
      this.ch28_am0 = ral_reg_CHN_AM0::type_id::create("ch28_am0",,get_full_name());
      if(this.ch28_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch28_am0.cg_bits.option.name = "ch28_am0_bits";
      this.ch28_am0.configure(this, null, "");
      this.ch28_am0.build();
      this.default_map.add_reg(this.ch28_am0, `UVM_REG_ADDR_WIDTH'h3AC, "RW", 0);
		this.ch28_am0_ADDRESS_MASK = this.ch28_am0.ADDRESS_MASK;
      this.ch28_a1 = ral_reg_CHN_A1::type_id::create("ch28_a1",,get_full_name());
      if(this.ch28_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch28_a1.cg_bits.option.name = "ch28_a1_bits";
      this.ch28_a1.configure(this, null, "");
      this.ch28_a1.build();
      this.default_map.add_reg(this.ch28_a1, `UVM_REG_ADDR_WIDTH'h3B0, "RW", 0);
		this.ch28_a1_ADDRESS = this.ch28_a1.ADDRESS;
      this.ch28_am1 = ral_reg_CHN_AM1::type_id::create("ch28_am1",,get_full_name());
      if(this.ch28_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch28_am1.cg_bits.option.name = "ch28_am1_bits";
      this.ch28_am1.configure(this, null, "");
      this.ch28_am1.build();
      this.default_map.add_reg(this.ch28_am1, `UVM_REG_ADDR_WIDTH'h3B4, "RW", 0);
		this.ch28_am1_ADDRESS_MASK = this.ch28_am1.ADDRESS_MASK;
      this.ch28_desc = ral_reg_CHN_DESC::type_id::create("ch28_desc",,get_full_name());
      if(this.ch28_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch28_desc.cg_bits.option.name = "ch28_desc_bits";
      this.ch28_desc.configure(this, null, "");
      this.ch28_desc.build();
      this.default_map.add_reg(this.ch28_desc, `UVM_REG_ADDR_WIDTH'h3B8, "RW", 0);
		this.ch28_desc_ADDRESS_MASK = this.ch28_desc.ADDRESS_MASK;
      this.ch28_swptr = ral_reg_CHN_SWPTR::type_id::create("ch28_swptr",,get_full_name());
      if(this.ch28_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch28_swptr.cg_bits.option.name = "ch28_swptr_bits";
      this.ch28_swptr.configure(this, null, "");
      this.ch28_swptr.build();
      this.default_map.add_reg(this.ch28_swptr, `UVM_REG_ADDR_WIDTH'h3BC, "RW", 0);
		this.ch28_swptr_SWPTR_EN = this.ch28_swptr.SWPTR_EN;
		this.ch28_swptr_SW_POINTER = this.ch28_swptr.SW_POINTER;
      this.ch29_csr = ral_reg_CHN_CSR::type_id::create("ch29_csr",,get_full_name());
      if(this.ch29_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch29_csr.cg_bits.option.name = "ch29_csr_bits";
      this.ch29_csr.configure(this, null, "");
      this.ch29_csr.build();
      this.default_map.add_reg(this.ch29_csr, `UVM_REG_ADDR_WIDTH'h3C0, "RW", 0);
		this.ch29_csr_CH_EN = this.ch29_csr.CH_EN;
		this.ch29_csr_DST_SEL = this.ch29_csr.DST_SEL;
		this.ch29_csr_SRC_SEL = this.ch29_csr.SRC_SEL;
		this.ch29_csr_INC_DST = this.ch29_csr.INC_DST;
		this.ch29_csr_INC_SRC = this.ch29_csr.INC_SRC;
		this.ch29_csr_MODE = this.ch29_csr.MODE;
		this.ch29_csr_ARS = this.ch29_csr.ARS;
		this.ch29_csr_USE_ED = this.ch29_csr.USE_ED;
		this.ch29_csr_SZ_WB = this.ch29_csr.SZ_WB;
		this.ch29_csr_STOP = this.ch29_csr.STOP;
		this.ch29_csr_BUSY = this.ch29_csr.BUSY;
		this.ch29_csr_DONE = this.ch29_csr.DONE;
		this.ch29_csr_ERR = this.ch29_csr.ERR;
		this.ch29_csr_PARITY = this.ch29_csr.PARITY;
      this.ch29_sz = ral_reg_CHN_SZ::type_id::create("ch29_sz",,get_full_name());
      if(this.ch29_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch29_sz.cg_bits.option.name = "ch29_sz_bits";
      this.ch29_sz.configure(this, null, "");
      this.ch29_sz.build();
      this.default_map.add_reg(this.ch29_sz, `UVM_REG_ADDR_WIDTH'h3C4, "RW", 0);
		this.ch29_sz_CHK_SZ = this.ch29_sz.CHK_SZ;
		this.ch29_sz_TOT_SZ = this.ch29_sz.TOT_SZ;
      this.ch29_a0 = ral_reg_CHN_A0::type_id::create("ch29_a0",,get_full_name());
      if(this.ch29_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch29_a0.cg_bits.option.name = "ch29_a0_bits";
      this.ch29_a0.configure(this, null, "");
      this.ch29_a0.build();
      this.default_map.add_reg(this.ch29_a0, `UVM_REG_ADDR_WIDTH'h3C8, "RW", 0);
		this.ch29_a0_ADDRESS = this.ch29_a0.ADDRESS;
      this.ch29_am0 = ral_reg_CHN_AM0::type_id::create("ch29_am0",,get_full_name());
      if(this.ch29_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch29_am0.cg_bits.option.name = "ch29_am0_bits";
      this.ch29_am0.configure(this, null, "");
      this.ch29_am0.build();
      this.default_map.add_reg(this.ch29_am0, `UVM_REG_ADDR_WIDTH'h3CC, "RW", 0);
		this.ch29_am0_ADDRESS_MASK = this.ch29_am0.ADDRESS_MASK;
      this.ch29_a1 = ral_reg_CHN_A1::type_id::create("ch29_a1",,get_full_name());
      if(this.ch29_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch29_a1.cg_bits.option.name = "ch29_a1_bits";
      this.ch29_a1.configure(this, null, "");
      this.ch29_a1.build();
      this.default_map.add_reg(this.ch29_a1, `UVM_REG_ADDR_WIDTH'h3D0, "RW", 0);
		this.ch29_a1_ADDRESS = this.ch29_a1.ADDRESS;
      this.ch29_am1 = ral_reg_CHN_AM1::type_id::create("ch29_am1",,get_full_name());
      if(this.ch29_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch29_am1.cg_bits.option.name = "ch29_am1_bits";
      this.ch29_am1.configure(this, null, "");
      this.ch29_am1.build();
      this.default_map.add_reg(this.ch29_am1, `UVM_REG_ADDR_WIDTH'h3D4, "RW", 0);
		this.ch29_am1_ADDRESS_MASK = this.ch29_am1.ADDRESS_MASK;
      this.ch29_desc = ral_reg_CHN_DESC::type_id::create("ch29_desc",,get_full_name());
      if(this.ch29_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch29_desc.cg_bits.option.name = "ch29_desc_bits";
      this.ch29_desc.configure(this, null, "");
      this.ch29_desc.build();
      this.default_map.add_reg(this.ch29_desc, `UVM_REG_ADDR_WIDTH'h3D8, "RW", 0);
		this.ch29_desc_ADDRESS_MASK = this.ch29_desc.ADDRESS_MASK;
      this.ch29_swptr = ral_reg_CHN_SWPTR::type_id::create("ch29_swptr",,get_full_name());
      if(this.ch29_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch29_swptr.cg_bits.option.name = "ch29_swptr_bits";
      this.ch29_swptr.configure(this, null, "");
      this.ch29_swptr.build();
      this.default_map.add_reg(this.ch29_swptr, `UVM_REG_ADDR_WIDTH'h3DC, "RW", 0);
		this.ch29_swptr_SWPTR_EN = this.ch29_swptr.SWPTR_EN;
		this.ch29_swptr_SW_POINTER = this.ch29_swptr.SW_POINTER;
      this.ch30_csr = ral_reg_CHN_CSR::type_id::create("ch30_csr",,get_full_name());
      if(this.ch30_csr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch30_csr.cg_bits.option.name = "ch30_csr_bits";
      this.ch30_csr.configure(this, null, "");
      this.ch30_csr.build();
      this.default_map.add_reg(this.ch30_csr, `UVM_REG_ADDR_WIDTH'h3E0, "RW", 0);
		this.ch30_csr_CH_EN = this.ch30_csr.CH_EN;
		this.ch30_csr_DST_SEL = this.ch30_csr.DST_SEL;
		this.ch30_csr_SRC_SEL = this.ch30_csr.SRC_SEL;
		this.ch30_csr_INC_DST = this.ch30_csr.INC_DST;
		this.ch30_csr_INC_SRC = this.ch30_csr.INC_SRC;
		this.ch30_csr_MODE = this.ch30_csr.MODE;
		this.ch30_csr_ARS = this.ch30_csr.ARS;
		this.ch30_csr_USE_ED = this.ch30_csr.USE_ED;
		this.ch30_csr_SZ_WB = this.ch30_csr.SZ_WB;
		this.ch30_csr_STOP = this.ch30_csr.STOP;
		this.ch30_csr_BUSY = this.ch30_csr.BUSY;
		this.ch30_csr_DONE = this.ch30_csr.DONE;
		this.ch30_csr_ERR = this.ch30_csr.ERR;
		this.ch30_csr_PARITY = this.ch30_csr.PARITY;
      this.ch30_sz = ral_reg_CHN_SZ::type_id::create("ch30_sz",,get_full_name());
      if(this.ch30_sz.has_coverage(UVM_CVR_REG_BITS))
      	this.ch30_sz.cg_bits.option.name = "ch30_sz_bits";
      this.ch30_sz.configure(this, null, "");
      this.ch30_sz.build();
      this.default_map.add_reg(this.ch30_sz, `UVM_REG_ADDR_WIDTH'h3E4, "RW", 0);
		this.ch30_sz_CHK_SZ = this.ch30_sz.CHK_SZ;
		this.ch30_sz_TOT_SZ = this.ch30_sz.TOT_SZ;
      this.ch30_a0 = ral_reg_CHN_A0::type_id::create("ch30_a0",,get_full_name());
      if(this.ch30_a0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch30_a0.cg_bits.option.name = "ch30_a0_bits";
      this.ch30_a0.configure(this, null, "");
      this.ch30_a0.build();
      this.default_map.add_reg(this.ch30_a0, `UVM_REG_ADDR_WIDTH'h3E8, "RW", 0);
		this.ch30_a0_ADDRESS = this.ch30_a0.ADDRESS;
      this.ch30_am0 = ral_reg_CHN_AM0::type_id::create("ch30_am0",,get_full_name());
      if(this.ch30_am0.has_coverage(UVM_CVR_REG_BITS))
      	this.ch30_am0.cg_bits.option.name = "ch30_am0_bits";
      this.ch30_am0.configure(this, null, "");
      this.ch30_am0.build();
      this.default_map.add_reg(this.ch30_am0, `UVM_REG_ADDR_WIDTH'h3EC, "RW", 0);
		this.ch30_am0_ADDRESS_MASK = this.ch30_am0.ADDRESS_MASK;
      this.ch30_a1 = ral_reg_CHN_A1::type_id::create("ch30_a1",,get_full_name());
      if(this.ch30_a1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch30_a1.cg_bits.option.name = "ch30_a1_bits";
      this.ch30_a1.configure(this, null, "");
      this.ch30_a1.build();
      this.default_map.add_reg(this.ch30_a1, `UVM_REG_ADDR_WIDTH'h3F0, "RW", 0);
		this.ch30_a1_ADDRESS = this.ch30_a1.ADDRESS;
      this.ch30_am1 = ral_reg_CHN_AM1::type_id::create("ch30_am1",,get_full_name());
      if(this.ch30_am1.has_coverage(UVM_CVR_REG_BITS))
      	this.ch30_am1.cg_bits.option.name = "ch30_am1_bits";
      this.ch30_am1.configure(this, null, "");
      this.ch30_am1.build();
      this.default_map.add_reg(this.ch30_am1, `UVM_REG_ADDR_WIDTH'h3F4, "RW", 0);
		this.ch30_am1_ADDRESS_MASK = this.ch30_am1.ADDRESS_MASK;
      this.ch30_desc = ral_reg_CHN_DESC::type_id::create("ch30_desc",,get_full_name());
      if(this.ch30_desc.has_coverage(UVM_CVR_REG_BITS))
      	this.ch30_desc.cg_bits.option.name = "ch30_desc_bits";
      this.ch30_desc.configure(this, null, "");
      this.ch30_desc.build();
      this.default_map.add_reg(this.ch30_desc, `UVM_REG_ADDR_WIDTH'h3F8, "RW", 0);
		this.ch30_desc_ADDRESS_MASK = this.ch30_desc.ADDRESS_MASK;
      this.ch30_swptr = ral_reg_CHN_SWPTR::type_id::create("ch30_swptr",,get_full_name());
      if(this.ch30_swptr.has_coverage(UVM_CVR_REG_BITS))
      	this.ch30_swptr.cg_bits.option.name = "ch30_swptr_bits";
      this.ch30_swptr.configure(this, null, "");
      this.ch30_swptr.build();
      this.default_map.add_reg(this.ch30_swptr, `UVM_REG_ADDR_WIDTH'h3FC, "RW", 0);
		this.ch30_swptr_SWPTR_EN = this.ch30_swptr.SWPTR_EN;
		this.ch30_swptr_SW_POINTER = this.ch30_swptr.SW_POINTER;
   endfunction : build

	`uvm_object_utils(ral_block_wb_dma)


function void sample(uvm_reg_addr_t offset,
                     bit            is_read,
                     uvm_reg_map    map);
  if (get_coverage(UVM_CVR_ADDR_MAP)) begin
    m_offset = offset;
    cg_addr.sample();
  end
endfunction
endclass : ral_block_wb_dma



`endif
