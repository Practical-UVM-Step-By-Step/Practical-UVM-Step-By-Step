/***********************************************
 *                                              *
 * Examples for the book Practical UVM          *
 *                                              *
 * Copyright Srivatsa Vasudevan 2010-2016       *
 * All rights reserved                          *
 *                                              *
 * Permission is granted to use this work       * 
 * provided this notice and attached license.txt*
 * are not removed/altered while redistributing *
 * See license.txt for details                  *
 *                                              *
 ************************************************/

/***********************************************
 *                                              *
 * Examples for the book Practical UVM          *
 *                                              *
 * Copyright Srivatsa Vasudevan 2010-2016       *
 * All rights reserved                          *
 *                                              *
 * Permission is granted to use this work       * 
 * provided this notice and attached license.txt*
 * are not removed/altered while redistributing *
 * See license.txt for details                  *
 *                                              *
 ************************************************/

`ifndef RAL_VGA_LCD
 `define RAL_VGA_LCD

import uvm_pkg::*;

class ral_reg_CTRL extends uvm_reg;
   rand uvm_reg_field HC1R;
   rand uvm_reg_field HC1E;
   rand uvm_reg_field HC0R;
   rand uvm_reg_field HCOE;
   rand uvm_reg_field BL;
   rand uvm_reg_field CSL;
   rand uvm_reg_field VSL;
   rand uvm_reg_field HSL;
   rand uvm_reg_field PC;
   rand uvm_reg_field CD;
   rand uvm_reg_field VBL;
   rand uvm_reg_field CBSWE;
   rand uvm_reg_field VBSWE;
   rand uvm_reg_field CBSIE;
   rand uvm_reg_field VBSIE;
   rand uvm_reg_field HIE;
   rand uvm_reg_field VIE;
   rand uvm_reg_field VEN;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

   covergroup cg_bits ();
      option.per_instance = 1;
      option.name = get_name();
      HC1R: coverpoint {m_data[23:23], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      HC1E: coverpoint {m_data[22:22], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      HC0R: coverpoint {m_data[19:19], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      HCOE: coverpoint {m_data[18:18], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      BL: coverpoint {m_data[15:15], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      CSL: coverpoint {m_data[14:14], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      VSL: coverpoint {m_data[13:13], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      HSL: coverpoint {m_data[12:12], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      PC: coverpoint {m_data[11:11], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      CD: coverpoint {m_data[10:9], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {3'b?00};
	 wildcard bins bit_0_wr_as_1 = {3'b?10};
	 wildcard bins bit_0_rd_as_0 = {3'b?01};
	 wildcard bins bit_0_rd_as_1 = {3'b?11};
	 wildcard bins bit_1_wr_as_0 = {3'b0?0};
	 wildcard bins bit_1_wr_as_1 = {3'b1?0};
	 wildcard bins bit_1_rd_as_0 = {3'b0?1};
	 wildcard bins bit_1_rd_as_1 = {3'b1?1};
	 option.weight = 8;
      }
      VBL: coverpoint {m_data[8:7], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {3'b?00};
	 wildcard bins bit_0_wr_as_1 = {3'b?10};
	 wildcard bins bit_0_rd_as_0 = {3'b?01};
	 wildcard bins bit_0_rd_as_1 = {3'b?11};
	 wildcard bins bit_1_wr_as_0 = {3'b0?0};
	 wildcard bins bit_1_wr_as_1 = {3'b1?0};
	 wildcard bins bit_1_rd_as_0 = {3'b0?1};
	 wildcard bins bit_1_rd_as_1 = {3'b1?1};
	 option.weight = 8;
      }
      CBSWE: coverpoint {m_data[6:6], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      VBSWE: coverpoint {m_data[5:5], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      CBSIE: coverpoint {m_data[4:4], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      VBSIE: coverpoint {m_data[3:3], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      HIE: coverpoint {m_data[2:2], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      VIE: coverpoint {m_data[1:1], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      VEN: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
   endgroup
   function new(string name = "CTRL");
      super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
      if (has_coverage(UVM_CVR_REG_BITS))
	cg_bits = new();
   endfunction: new
   virtual 		function void build();
      this.HC1R = uvm_reg_field::type_id::create("HC1R",,get_full_name());
      this.HC1R.configure(this, 1, 23, "RW", 0, 1'h0, 0, 0, 0);
      this.HC1E = uvm_reg_field::type_id::create("HC1E",,get_full_name());
      this.HC1E.configure(this, 1, 22, "RW", 0, 1'h0, 0, 0, 0);
      this.HC0R = uvm_reg_field::type_id::create("HC0R",,get_full_name());
      this.HC0R.configure(this, 1, 19, "RW", 0, 1'h0, 0, 0, 0);
      this.HCOE = uvm_reg_field::type_id::create("HCOE",,get_full_name());
      this.HCOE.configure(this, 1, 18, "RW", 0, 1'h0, 0, 0, 0);
      this.BL = uvm_reg_field::type_id::create("BL",,get_full_name());
      this.BL.configure(this, 1, 15, "RW", 0, 1'h0, 0, 0, 0);
      this.CSL = uvm_reg_field::type_id::create("CSL",,get_full_name());
      this.CSL.configure(this, 1, 14, "RW", 0, 1'h0, 0, 0, 0);
      this.VSL = uvm_reg_field::type_id::create("VSL",,get_full_name());
      this.VSL.configure(this, 1, 13, "RW", 0, 1'h0, 0, 0, 0);
      this.HSL = uvm_reg_field::type_id::create("HSL",,get_full_name());
      this.HSL.configure(this, 1, 12, "RW", 0, 1'h0, 0, 0, 0);
      this.PC = uvm_reg_field::type_id::create("PC",,get_full_name());
      this.PC.configure(this, 1, 11, "RW", 0, 1'h0, 0, 0, 0);
      this.CD = uvm_reg_field::type_id::create("CD",,get_full_name());
      this.CD.configure(this, 2, 9, "RW", 0, 2'h0, 0, 0, 0);
      this.VBL = uvm_reg_field::type_id::create("VBL",,get_full_name());
      this.VBL.configure(this, 2, 7, "RW", 0, 2'h0, 0, 0, 0);
      this.CBSWE = uvm_reg_field::type_id::create("CBSWE",,get_full_name());
      this.CBSWE.configure(this, 1, 6, "RW", 0, 1'h0, 0, 0, 0);
      this.VBSWE = uvm_reg_field::type_id::create("VBSWE",,get_full_name());
      this.VBSWE.configure(this, 1, 5, "RW", 0, 1'h0, 0, 0, 0);
      this.CBSIE = uvm_reg_field::type_id::create("CBSIE",,get_full_name());
      this.CBSIE.configure(this, 1, 4, "RW", 0, 1'h0, 0, 0, 0);
      this.VBSIE = uvm_reg_field::type_id::create("VBSIE",,get_full_name());
      this.VBSIE.configure(this, 1, 3, "RW", 0, 1'h0, 0, 0, 0);
      this.HIE = uvm_reg_field::type_id::create("HIE",,get_full_name());
      this.HIE.configure(this, 1, 2, "RW", 0, 1'h0, 0, 0, 0);
      this.VIE = uvm_reg_field::type_id::create("VIE",,get_full_name());
      this.VIE.configure(this, 1, 1, "RW", 0, 1'h0, 0, 0, 0);
      this.VEN = uvm_reg_field::type_id::create("VEN",,get_full_name());
      this.VEN.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 0);
   endfunction: build

   `uvm_object_utils(ral_reg_CTRL)

   virtual 		function void sample(uvm_reg_data_t data,
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
endclass : ral_reg_CTRL

class ral_reg_STAT extends uvm_reg;
   uvm_reg_field HC1A;
   uvm_reg_field HC0A;
   uvm_reg_field ACMP;
   uvm_reg_field AVMP;
   rand uvm_reg_field CBSINT;
   rand uvm_reg_field VBSINT;
   rand uvm_reg_field HINT;
   rand uvm_reg_field VINT;
   rand uvm_reg_field LUINT;
   rand uvm_reg_field SINT;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

   covergroup cg_bits ();
      option.per_instance = 1;
      option.name = get_name();
      HC1A: coverpoint {m_data[17:17], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd = {2'b?1};
	 option.weight = 3;
      }
      HC0A: coverpoint {m_data[14:14], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd = {2'b?1};
	 option.weight = 3;
      }
      ACMP: coverpoint {m_data[11:11], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd = {2'b?1};
	 option.weight = 3;
      }
      AVMP: coverpoint {m_data[10:10], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd = {2'b?1};
	 option.weight = 3;
      }
      CBSINT: coverpoint {m_data[7:7], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      VBSINT: coverpoint {m_data[6:6], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      HINT: coverpoint {m_data[5:5], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      VINT: coverpoint {m_data[4:4], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      LUINT: coverpoint {m_data[1:1], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
      SINT: coverpoint {m_data[0:0], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {2'b00};
	 wildcard bins bit_0_wr_as_1 = {2'b10};
	 wildcard bins bit_0_rd_as_0 = {2'b01};
	 wildcard bins bit_0_rd_as_1 = {2'b11};
	 option.weight = 4;
      }
   endgroup
   function new(string name = "STAT");
      super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
      if (has_coverage(UVM_CVR_REG_BITS))
	cg_bits = new();
   endfunction: new
   virtual 		function void build();
      this.HC1A = uvm_reg_field::type_id::create("HC1A",,get_full_name());
      this.HC1A.configure(this, 1, 17, "RO", 0, 1'h0, 0, 0, 1);
      this.HC0A = uvm_reg_field::type_id::create("HC0A",,get_full_name());
      this.HC0A.configure(this, 1, 14, "RO", 0, 1'h0, 0, 0, 0);
      this.ACMP = uvm_reg_field::type_id::create("ACMP",,get_full_name());
      this.ACMP.configure(this, 1, 11, "RO", 0, 1'h0, 0, 0, 0);
      this.AVMP = uvm_reg_field::type_id::create("AVMP",,get_full_name());
      this.AVMP.configure(this, 1, 10, "RO", 0, 1'h0, 0, 0, 0);
      this.CBSINT = uvm_reg_field::type_id::create("CBSINT",,get_full_name());
      this.CBSINT.configure(this, 1, 7, "RW", 0, 1'h0, 0, 0, 0);
      this.VBSINT = uvm_reg_field::type_id::create("VBSINT",,get_full_name());
      this.VBSINT.configure(this, 1, 6, "RW", 0, 1'h0, 0, 0, 0);
      this.HINT = uvm_reg_field::type_id::create("HINT",,get_full_name());
      this.HINT.configure(this, 1, 5, "RW", 0, 1'h0, 0, 0, 0);
      this.VINT = uvm_reg_field::type_id::create("VINT",,get_full_name());
      this.VINT.configure(this, 1, 4, "RW", 0, 1'h0, 0, 0, 0);
      this.LUINT = uvm_reg_field::type_id::create("LUINT",,get_full_name());
      this.LUINT.configure(this, 1, 1, "RW", 0, 1'h0, 0, 0, 0);
      this.SINT = uvm_reg_field::type_id::create("SINT",,get_full_name());
      this.SINT.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 0);
   endfunction: build

   `uvm_object_utils(ral_reg_STAT)

   virtual 		function void sample(uvm_reg_data_t data,
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
endclass : ral_reg_STAT

class ral_reg_HTIM extends uvm_reg;
   rand uvm_reg_field THSYNC;
   rand uvm_reg_field THGDEL;
   rand uvm_reg_field THGATE;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

   covergroup cg_bits ();
      option.per_instance = 1;
      option.name = get_name();
      THSYNC: coverpoint {m_data[31:24], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {9'b???????00};
	 wildcard bins bit_0_wr_as_1 = {9'b???????10};
	 wildcard bins bit_0_rd_as_0 = {9'b???????01};
	 wildcard bins bit_0_rd_as_1 = {9'b???????11};
	 wildcard bins bit_1_wr_as_0 = {9'b??????0?0};
	 wildcard bins bit_1_wr_as_1 = {9'b??????1?0};
	 wildcard bins bit_1_rd_as_0 = {9'b??????0?1};
	 wildcard bins bit_1_rd_as_1 = {9'b??????1?1};
	 wildcard bins bit_2_wr_as_0 = {9'b?????0??0};
	 wildcard bins bit_2_wr_as_1 = {9'b?????1??0};
	 wildcard bins bit_2_rd_as_0 = {9'b?????0??1};
	 wildcard bins bit_2_rd_as_1 = {9'b?????1??1};
	 wildcard bins bit_3_wr_as_0 = {9'b????0???0};
	 wildcard bins bit_3_wr_as_1 = {9'b????1???0};
	 wildcard bins bit_3_rd_as_0 = {9'b????0???1};
	 wildcard bins bit_3_rd_as_1 = {9'b????1???1};
	 wildcard bins bit_4_wr_as_0 = {9'b???0????0};
	 wildcard bins bit_4_wr_as_1 = {9'b???1????0};
	 wildcard bins bit_4_rd_as_0 = {9'b???0????1};
	 wildcard bins bit_4_rd_as_1 = {9'b???1????1};
	 wildcard bins bit_5_wr_as_0 = {9'b??0?????0};
	 wildcard bins bit_5_wr_as_1 = {9'b??1?????0};
	 wildcard bins bit_5_rd_as_0 = {9'b??0?????1};
	 wildcard bins bit_5_rd_as_1 = {9'b??1?????1};
	 wildcard bins bit_6_wr_as_0 = {9'b?0??????0};
	 wildcard bins bit_6_wr_as_1 = {9'b?1??????0};
	 wildcard bins bit_6_rd_as_0 = {9'b?0??????1};
	 wildcard bins bit_6_rd_as_1 = {9'b?1??????1};
	 wildcard bins bit_7_wr_as_0 = {9'b0???????0};
	 wildcard bins bit_7_wr_as_1 = {9'b1???????0};
	 wildcard bins bit_7_rd_as_0 = {9'b0???????1};
	 wildcard bins bit_7_rd_as_1 = {9'b1???????1};
	 option.weight = 32;
      }
      THGDEL: coverpoint {m_data[23:16], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {9'b???????00};
	 wildcard bins bit_0_wr_as_1 = {9'b???????10};
	 wildcard bins bit_0_rd_as_0 = {9'b???????01};
	 wildcard bins bit_0_rd_as_1 = {9'b???????11};
	 wildcard bins bit_1_wr_as_0 = {9'b??????0?0};
	 wildcard bins bit_1_wr_as_1 = {9'b??????1?0};
	 wildcard bins bit_1_rd_as_0 = {9'b??????0?1};
	 wildcard bins bit_1_rd_as_1 = {9'b??????1?1};
	 wildcard bins bit_2_wr_as_0 = {9'b?????0??0};
	 wildcard bins bit_2_wr_as_1 = {9'b?????1??0};
	 wildcard bins bit_2_rd_as_0 = {9'b?????0??1};
	 wildcard bins bit_2_rd_as_1 = {9'b?????1??1};
	 wildcard bins bit_3_wr_as_0 = {9'b????0???0};
	 wildcard bins bit_3_wr_as_1 = {9'b????1???0};
	 wildcard bins bit_3_rd_as_0 = {9'b????0???1};
	 wildcard bins bit_3_rd_as_1 = {9'b????1???1};
	 wildcard bins bit_4_wr_as_0 = {9'b???0????0};
	 wildcard bins bit_4_wr_as_1 = {9'b???1????0};
	 wildcard bins bit_4_rd_as_0 = {9'b???0????1};
	 wildcard bins bit_4_rd_as_1 = {9'b???1????1};
	 wildcard bins bit_5_wr_as_0 = {9'b??0?????0};
	 wildcard bins bit_5_wr_as_1 = {9'b??1?????0};
	 wildcard bins bit_5_rd_as_0 = {9'b??0?????1};
	 wildcard bins bit_5_rd_as_1 = {9'b??1?????1};
	 wildcard bins bit_6_wr_as_0 = {9'b?0??????0};
	 wildcard bins bit_6_wr_as_1 = {9'b?1??????0};
	 wildcard bins bit_6_rd_as_0 = {9'b?0??????1};
	 wildcard bins bit_6_rd_as_1 = {9'b?1??????1};
	 wildcard bins bit_7_wr_as_0 = {9'b0???????0};
	 wildcard bins bit_7_wr_as_1 = {9'b1???????0};
	 wildcard bins bit_7_rd_as_0 = {9'b0???????1};
	 wildcard bins bit_7_rd_as_1 = {9'b1???????1};
	 option.weight = 32;
      }
      THGATE: coverpoint {m_data[15:0], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {17'b???????????????00};
	 wildcard bins bit_0_wr_as_1 = {17'b???????????????10};
	 wildcard bins bit_0_rd_as_0 = {17'b???????????????01};
	 wildcard bins bit_0_rd_as_1 = {17'b???????????????11};
	 wildcard bins bit_1_wr_as_0 = {17'b??????????????0?0};
	 wildcard bins bit_1_wr_as_1 = {17'b??????????????1?0};
	 wildcard bins bit_1_rd_as_0 = {17'b??????????????0?1};
	 wildcard bins bit_1_rd_as_1 = {17'b??????????????1?1};
	 wildcard bins bit_2_wr_as_0 = {17'b?????????????0??0};
	 wildcard bins bit_2_wr_as_1 = {17'b?????????????1??0};
	 wildcard bins bit_2_rd_as_0 = {17'b?????????????0??1};
	 wildcard bins bit_2_rd_as_1 = {17'b?????????????1??1};
	 wildcard bins bit_3_wr_as_0 = {17'b????????????0???0};
	 wildcard bins bit_3_wr_as_1 = {17'b????????????1???0};
	 wildcard bins bit_3_rd_as_0 = {17'b????????????0???1};
	 wildcard bins bit_3_rd_as_1 = {17'b????????????1???1};
	 wildcard bins bit_4_wr_as_0 = {17'b???????????0????0};
	 wildcard bins bit_4_wr_as_1 = {17'b???????????1????0};
	 wildcard bins bit_4_rd_as_0 = {17'b???????????0????1};
	 wildcard bins bit_4_rd_as_1 = {17'b???????????1????1};
	 wildcard bins bit_5_wr_as_0 = {17'b??????????0?????0};
	 wildcard bins bit_5_wr_as_1 = {17'b??????????1?????0};
	 wildcard bins bit_5_rd_as_0 = {17'b??????????0?????1};
	 wildcard bins bit_5_rd_as_1 = {17'b??????????1?????1};
	 wildcard bins bit_6_wr_as_0 = {17'b?????????0??????0};
	 wildcard bins bit_6_wr_as_1 = {17'b?????????1??????0};
	 wildcard bins bit_6_rd_as_0 = {17'b?????????0??????1};
	 wildcard bins bit_6_rd_as_1 = {17'b?????????1??????1};
	 wildcard bins bit_7_wr_as_0 = {17'b????????0???????0};
	 wildcard bins bit_7_wr_as_1 = {17'b????????1???????0};
	 wildcard bins bit_7_rd_as_0 = {17'b????????0???????1};
	 wildcard bins bit_7_rd_as_1 = {17'b????????1???????1};
	 wildcard bins bit_8_wr_as_0 = {17'b???????0????????0};
	 wildcard bins bit_8_wr_as_1 = {17'b???????1????????0};
	 wildcard bins bit_8_rd_as_0 = {17'b???????0????????1};
	 wildcard bins bit_8_rd_as_1 = {17'b???????1????????1};
	 wildcard bins bit_9_wr_as_0 = {17'b??????0?????????0};
	 wildcard bins bit_9_wr_as_1 = {17'b??????1?????????0};
	 wildcard bins bit_9_rd_as_0 = {17'b??????0?????????1};
	 wildcard bins bit_9_rd_as_1 = {17'b??????1?????????1};
	 wildcard bins bit_10_wr_as_0 = {17'b?????0??????????0};
	 wildcard bins bit_10_wr_as_1 = {17'b?????1??????????0};
	 wildcard bins bit_10_rd_as_0 = {17'b?????0??????????1};
	 wildcard bins bit_10_rd_as_1 = {17'b?????1??????????1};
	 wildcard bins bit_11_wr_as_0 = {17'b????0???????????0};
	 wildcard bins bit_11_wr_as_1 = {17'b????1???????????0};
	 wildcard bins bit_11_rd_as_0 = {17'b????0???????????1};
	 wildcard bins bit_11_rd_as_1 = {17'b????1???????????1};
	 wildcard bins bit_12_wr_as_0 = {17'b???0????????????0};
	 wildcard bins bit_12_wr_as_1 = {17'b???1????????????0};
	 wildcard bins bit_12_rd_as_0 = {17'b???0????????????1};
	 wildcard bins bit_12_rd_as_1 = {17'b???1????????????1};
	 wildcard bins bit_13_wr_as_0 = {17'b??0?????????????0};
	 wildcard bins bit_13_wr_as_1 = {17'b??1?????????????0};
	 wildcard bins bit_13_rd_as_0 = {17'b??0?????????????1};
	 wildcard bins bit_13_rd_as_1 = {17'b??1?????????????1};
	 wildcard bins bit_14_wr_as_0 = {17'b?0??????????????0};
	 wildcard bins bit_14_wr_as_1 = {17'b?1??????????????0};
	 wildcard bins bit_14_rd_as_0 = {17'b?0??????????????1};
	 wildcard bins bit_14_rd_as_1 = {17'b?1??????????????1};
	 wildcard bins bit_15_wr_as_0 = {17'b0???????????????0};
	 wildcard bins bit_15_wr_as_1 = {17'b1???????????????0};
	 wildcard bins bit_15_rd_as_0 = {17'b0???????????????1};
	 wildcard bins bit_15_rd_as_1 = {17'b1???????????????1};
	 option.weight = 64;
      }
   endgroup
   function new(string name = "HTIM");
      super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
      if (has_coverage(UVM_CVR_REG_BITS))
	cg_bits = new();
   endfunction: new
   virtual 		function void build();
      this.THSYNC = uvm_reg_field::type_id::create("THSYNC",,get_full_name());
      this.THSYNC.configure(this, 8, 24, "RW", 0, 8'h0, 0, 0, 1);
      this.THGDEL = uvm_reg_field::type_id::create("THGDEL",,get_full_name());
      this.THGDEL.configure(this, 8, 16, "RW", 0, 8'h0, 0, 0, 1);
      this.THGATE = uvm_reg_field::type_id::create("THGATE",,get_full_name());
      this.THGATE.configure(this, 16, 0, "RW", 0, 16'h0, 0, 0, 1);
   endfunction: build

   `uvm_object_utils(ral_reg_HTIM)

   virtual 		function void sample(uvm_reg_data_t data,
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
endclass : ral_reg_HTIM

class ral_reg_VTIM extends uvm_reg;
   rand uvm_reg_field TVSYNC;
   rand uvm_reg_field TVGDEL;
   rand uvm_reg_field TVGATE;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

   covergroup cg_bits ();
      option.per_instance = 1;
      option.name = get_name();
      TVSYNC: coverpoint {m_data[31:24], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {9'b???????00};
	 wildcard bins bit_0_wr_as_1 = {9'b???????10};
	 wildcard bins bit_0_rd_as_0 = {9'b???????01};
	 wildcard bins bit_0_rd_as_1 = {9'b???????11};
	 wildcard bins bit_1_wr_as_0 = {9'b??????0?0};
	 wildcard bins bit_1_wr_as_1 = {9'b??????1?0};
	 wildcard bins bit_1_rd_as_0 = {9'b??????0?1};
	 wildcard bins bit_1_rd_as_1 = {9'b??????1?1};
	 wildcard bins bit_2_wr_as_0 = {9'b?????0??0};
	 wildcard bins bit_2_wr_as_1 = {9'b?????1??0};
	 wildcard bins bit_2_rd_as_0 = {9'b?????0??1};
	 wildcard bins bit_2_rd_as_1 = {9'b?????1??1};
	 wildcard bins bit_3_wr_as_0 = {9'b????0???0};
	 wildcard bins bit_3_wr_as_1 = {9'b????1???0};
	 wildcard bins bit_3_rd_as_0 = {9'b????0???1};
	 wildcard bins bit_3_rd_as_1 = {9'b????1???1};
	 wildcard bins bit_4_wr_as_0 = {9'b???0????0};
	 wildcard bins bit_4_wr_as_1 = {9'b???1????0};
	 wildcard bins bit_4_rd_as_0 = {9'b???0????1};
	 wildcard bins bit_4_rd_as_1 = {9'b???1????1};
	 wildcard bins bit_5_wr_as_0 = {9'b??0?????0};
	 wildcard bins bit_5_wr_as_1 = {9'b??1?????0};
	 wildcard bins bit_5_rd_as_0 = {9'b??0?????1};
	 wildcard bins bit_5_rd_as_1 = {9'b??1?????1};
	 wildcard bins bit_6_wr_as_0 = {9'b?0??????0};
	 wildcard bins bit_6_wr_as_1 = {9'b?1??????0};
	 wildcard bins bit_6_rd_as_0 = {9'b?0??????1};
	 wildcard bins bit_6_rd_as_1 = {9'b?1??????1};
	 wildcard bins bit_7_wr_as_0 = {9'b0???????0};
	 wildcard bins bit_7_wr_as_1 = {9'b1???????0};
	 wildcard bins bit_7_rd_as_0 = {9'b0???????1};
	 wildcard bins bit_7_rd_as_1 = {9'b1???????1};
	 option.weight = 32;
      }
      TVGDEL: coverpoint {m_data[23:16], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {9'b???????00};
	 wildcard bins bit_0_wr_as_1 = {9'b???????10};
	 wildcard bins bit_0_rd_as_0 = {9'b???????01};
	 wildcard bins bit_0_rd_as_1 = {9'b???????11};
	 wildcard bins bit_1_wr_as_0 = {9'b??????0?0};
	 wildcard bins bit_1_wr_as_1 = {9'b??????1?0};
	 wildcard bins bit_1_rd_as_0 = {9'b??????0?1};
	 wildcard bins bit_1_rd_as_1 = {9'b??????1?1};
	 wildcard bins bit_2_wr_as_0 = {9'b?????0??0};
	 wildcard bins bit_2_wr_as_1 = {9'b?????1??0};
	 wildcard bins bit_2_rd_as_0 = {9'b?????0??1};
	 wildcard bins bit_2_rd_as_1 = {9'b?????1??1};
	 wildcard bins bit_3_wr_as_0 = {9'b????0???0};
	 wildcard bins bit_3_wr_as_1 = {9'b????1???0};
	 wildcard bins bit_3_rd_as_0 = {9'b????0???1};
	 wildcard bins bit_3_rd_as_1 = {9'b????1???1};
	 wildcard bins bit_4_wr_as_0 = {9'b???0????0};
	 wildcard bins bit_4_wr_as_1 = {9'b???1????0};
	 wildcard bins bit_4_rd_as_0 = {9'b???0????1};
	 wildcard bins bit_4_rd_as_1 = {9'b???1????1};
	 wildcard bins bit_5_wr_as_0 = {9'b??0?????0};
	 wildcard bins bit_5_wr_as_1 = {9'b??1?????0};
	 wildcard bins bit_5_rd_as_0 = {9'b??0?????1};
	 wildcard bins bit_5_rd_as_1 = {9'b??1?????1};
	 wildcard bins bit_6_wr_as_0 = {9'b?0??????0};
	 wildcard bins bit_6_wr_as_1 = {9'b?1??????0};
	 wildcard bins bit_6_rd_as_0 = {9'b?0??????1};
	 wildcard bins bit_6_rd_as_1 = {9'b?1??????1};
	 wildcard bins bit_7_wr_as_0 = {9'b0???????0};
	 wildcard bins bit_7_wr_as_1 = {9'b1???????0};
	 wildcard bins bit_7_rd_as_0 = {9'b0???????1};
	 wildcard bins bit_7_rd_as_1 = {9'b1???????1};
	 option.weight = 32;
      }
      TVGATE: coverpoint {m_data[15:0], m_is_read} iff(m_be) {
	 wildcard bins bit_0_wr_as_0 = {17'b???????????????00};
	 wildcard bins bit_0_wr_as_1 = {17'b???????????????10};
	 wildcard bins bit_0_rd_as_0 = {17'b???????????????01};
	 wildcard bins bit_0_rd_as_1 = {17'b???????????????11};
	 wildcard bins bit_1_wr_as_0 = {17'b??????????????0?0};
	 wildcard bins bit_1_wr_as_1 = {17'b??????????????1?0};
	 wildcard bins bit_1_rd_as_0 = {17'b??????????????0?1};
	 wildcard bins bit_1_rd_as_1 = {17'b??????????????1?1};
	 wildcard bins bit_2_wr_as_0 = {17'b?????????????0??0};
	 wildcard bins bit_2_wr_as_1 = {17'b?????????????1??0};
	 wildcard bins bit_2_rd_as_0 = {17'b?????????????0??1};
	 wildcard bins bit_2_rd_as_1 = {17'b?????????????1??1};
	 wildcard bins bit_3_wr_as_0 = {17'b????????????0???0};
	 wildcard bins bit_3_wr_as_1 = {17'b????????????1???0};
	 wildcard bins bit_3_rd_as_0 = {17'b????????????0???1};
	 wildcard bins bit_3_rd_as_1 = {17'b????????????1???1};
	 wildcard bins bit_4_wr_as_0 = {17'b???????????0????0};
	 wildcard bins bit_4_wr_as_1 = {17'b???????????1????0};
	 wildcard bins bit_4_rd_as_0 = {17'b???????????0????1};
	 wildcard bins bit_4_rd_as_1 = {17'b???????????1????1};
	 wildcard bins bit_5_wr_as_0 = {17'b??????????0?????0};
	 wildcard bins bit_5_wr_as_1 = {17'b??????????1?????0};
	 wildcard bins bit_5_rd_as_0 = {17'b??????????0?????1};
	 wildcard bins bit_5_rd_as_1 = {17'b??????????1?????1};
	 wildcard bins bit_6_wr_as_0 = {17'b?????????0??????0};
	 wildcard bins bit_6_wr_as_1 = {17'b?????????1??????0};
	 wildcard bins bit_6_rd_as_0 = {17'b?????????0??????1};
	 wildcard bins bit_6_rd_as_1 = {17'b?????????1??????1};
	 wildcard bins bit_7_wr_as_0 = {17'b????????0???????0};
	 wildcard bins bit_7_wr_as_1 = {17'b????????1???????0};
	 wildcard bins bit_7_rd_as_0 = {17'b????????0???????1};
	 wildcard bins bit_7_rd_as_1 = {17'b????????1???????1};
	 wildcard bins bit_8_wr_as_0 = {17'b???????0????????0};
	 wildcard bins bit_8_wr_as_1 = {17'b???????1????????0};
	 wildcard bins bit_8_rd_as_0 = {17'b???????0????????1};
	 wildcard bins bit_8_rd_as_1 = {17'b???????1????????1};
	 wildcard bins bit_9_wr_as_0 = {17'b??????0?????????0};
	 wildcard bins bit_9_wr_as_1 = {17'b??????1?????????0};
	 wildcard bins bit_9_rd_as_0 = {17'b??????0?????????1};
	 wildcard bins bit_9_rd_as_1 = {17'b??????1?????????1};
	 wildcard bins bit_10_wr_as_0 = {17'b?????0??????????0};
	 wildcard bins bit_10_wr_as_1 = {17'b?????1??????????0};
	 wildcard bins bit_10_rd_as_0 = {17'b?????0??????????1};
	 wildcard bins bit_10_rd_as_1 = {17'b?????1??????????1};
	 wildcard bins bit_11_wr_as_0 = {17'b????0???????????0};
	 wildcard bins bit_11_wr_as_1 = {17'b????1???????????0};
	 wildcard bins bit_11_rd_as_0 = {17'b????0???????????1};
	 wildcard bins bit_11_rd_as_1 = {17'b????1???????????1};
	 wildcard bins bit_12_wr_as_0 = {17'b???0????????????0};
	 wildcard bins bit_12_wr_as_1 = {17'b???1????????????0};
	 wildcard bins bit_12_rd_as_0 = {17'b???0????????????1};
	 wildcard bins bit_12_rd_as_1 = {17'b???1????????????1};
	 wildcard bins bit_13_wr_as_0 = {17'b??0?????????????0};
	 wildcard bins bit_13_wr_as_1 = {17'b??1?????????????0};
	 wildcard bins bit_13_rd_as_0 = {17'b??0?????????????1};
	 wildcard bins bit_13_rd_as_1 = {17'b??1?????????????1};
	 wildcard bins bit_14_wr_as_0 = {17'b?0??????????????0};
	 wildcard bins bit_14_wr_as_1 = {17'b?1??????????????0};
	 wildcard bins bit_14_rd_as_0 = {17'b?0??????????????1};
	 wildcard bins bit_14_rd_as_1 = {17'b?1??????????????1};
	 wildcard bins bit_15_wr_as_0 = {17'b0???????????????0};
	 wildcard bins bit_15_wr_as_1 = {17'b1???????????????0};
	 wildcard bins bit_15_rd_as_0 = {17'b0???????????????1};
	 wildcard bins bit_15_rd_as_1 = {17'b1???????????????1};
	 option.weight = 64;
      }
   endgroup
   function new(string name = "VTIM");
      super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
      if (has_coverage(UVM_CVR_REG_BITS))
	cg_bits = new();
   endfunction: new
   virtual 		function void build();
      this.TVSYNC = uvm_reg_field::type_id::create("TVSYNC",,get_full_name());
      this.TVSYNC.configure(this, 8, 24, "RW", 0, 8'h0, 0, 0, 1);
      this.TVGDEL = uvm_reg_field::type_id::create("TVGDEL",,get_full_name());
      this.TVGDEL.configure(this, 8, 16, "RW", 0, 8'h0, 0, 0, 1);
      this.TVGATE = uvm_reg_field::type_id::create("TVGATE",,get_full_name());
      this.TVGATE.configure(this, 16, 0, "RW", 0, 16'h0, 0, 0, 1);
   endfunction: build

   `uvm_object_utils(ral_reg_VTIM)

   virtual 		function void sample(uvm_reg_data_t data,
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
endclass : ral_reg_VTIM

class ral_mem_CLUT1 extends uvm_mem;
   function new(string name = "CLUT1");
      super.new(name, `UVM_REG_ADDR_WIDTH'h100, 24, "RW", build_coverage(UVM_CVR_ADDR_MAP));
   endfunction
   virtual function void build();
   endfunction: build

   `uvm_object_utils(ral_mem_CLUT1)

endclass : ral_mem_CLUT1

class ral_block_vga_lcd extends uvm_reg_block;
   rand ral_reg_CTRL CTRL;
   rand ral_reg_STAT STAT;
   rand ral_reg_HTIM HTIM;
   rand ral_reg_VTIM VTIM;
   rand ral_mem_CLUT1 CLUT1;
   local uvm_reg_data_t m_offset;
   rand uvm_reg_field CTRL_HC1R;
   rand uvm_reg_field HC1R;
   rand uvm_reg_field CTRL_HC1E;
   rand uvm_reg_field HC1E;
   rand uvm_reg_field CTRL_HC0R;
   rand uvm_reg_field HC0R;
   rand uvm_reg_field CTRL_HCOE;
   rand uvm_reg_field HCOE;
   rand uvm_reg_field CTRL_BL;
   rand uvm_reg_field BL;
   rand uvm_reg_field CTRL_CSL;
   rand uvm_reg_field CSL;
   rand uvm_reg_field CTRL_VSL;
   rand uvm_reg_field VSL;
   rand uvm_reg_field CTRL_HSL;
   rand uvm_reg_field HSL;
   rand uvm_reg_field CTRL_PC;
   rand uvm_reg_field PC;
   rand uvm_reg_field CTRL_CD;
   rand uvm_reg_field CD;
   rand uvm_reg_field CTRL_VBL;
   rand uvm_reg_field VBL;
   rand uvm_reg_field CTRL_CBSWE;
   rand uvm_reg_field CBSWE;
   rand uvm_reg_field CTRL_VBSWE;
   rand uvm_reg_field VBSWE;
   rand uvm_reg_field CTRL_CBSIE;
   rand uvm_reg_field CBSIE;
   rand uvm_reg_field CTRL_VBSIE;
   rand uvm_reg_field VBSIE;
   rand uvm_reg_field CTRL_HIE;
   rand uvm_reg_field HIE;
   rand uvm_reg_field CTRL_VIE;
   rand uvm_reg_field VIE;
   rand uvm_reg_field CTRL_VEN;
   rand uvm_reg_field VEN;
   uvm_reg_field STAT_HC1A;
   uvm_reg_field HC1A;
   uvm_reg_field STAT_HC0A;
   uvm_reg_field HC0A;
   uvm_reg_field STAT_ACMP;
   uvm_reg_field ACMP;
   uvm_reg_field STAT_AVMP;
   uvm_reg_field AVMP;
   rand uvm_reg_field STAT_CBSINT;
   rand uvm_reg_field CBSINT;
   rand uvm_reg_field STAT_VBSINT;
   rand uvm_reg_field VBSINT;
   rand uvm_reg_field STAT_HINT;
   rand uvm_reg_field HINT;
   rand uvm_reg_field STAT_VINT;
   rand uvm_reg_field VINT;
   rand uvm_reg_field STAT_LUINT;
   rand uvm_reg_field LUINT;
   rand uvm_reg_field STAT_SINT;
   rand uvm_reg_field SINT;
   rand uvm_reg_field HTIM_THSYNC;
   rand uvm_reg_field THSYNC;
   rand uvm_reg_field HTIM_THGDEL;
   rand uvm_reg_field THGDEL;
   rand uvm_reg_field HTIM_THGATE;
   rand uvm_reg_field THGATE;
   rand uvm_reg_field VTIM_TVSYNC;
   rand uvm_reg_field TVSYNC;
   rand uvm_reg_field VTIM_TVGDEL;
   rand uvm_reg_field TVGDEL;
   rand uvm_reg_field VTIM_TVGATE;
   rand uvm_reg_field TVGATE;

   covergroup cg_addr (input string name);
      option.per_instance = 1;
      option.name = get_name();

      CTRL : coverpoint m_offset {
	 bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
	 option.weight = 1;
      }

      STAT : coverpoint m_offset {
	 bins accessed = { `UVM_REG_ADDR_WIDTH'h4 };
	 option.weight = 1;
      }

      HTIM : coverpoint m_offset {
	 bins accessed = { `UVM_REG_ADDR_WIDTH'h8 };
	 option.weight = 1;
      }

      VTIM : coverpoint m_offset {
	 bins accessed = { `UVM_REG_ADDR_WIDTH'hC };
	 option.weight = 1;
      }

      CLUT1 : coverpoint m_offset {
	 bins first_location_accessed = { `UVM_REG_ADDR_WIDTH'hC00 };
	 bins last_location_accessed = { `UVM_REG_ADDR_WIDTH'hCFF };
	 bins other_locations_accessed = { [`UVM_REG_ADDR_WIDTH'hC01:`UVM_REG_ADDR_WIDTH'hCFE] };
	 option.weight = 3;
      }
   endgroup
   function new(string name = "vga_lcd");
      super.new(name, build_coverage(UVM_CVR_ADDR_MAP));
      if (has_coverage(UVM_CVR_ADDR_MAP))
	cg_addr = new("cg_addr");
   endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.add_hdl_path("vga_lcd_env_top.vga_enh_top.u0","RTL");
      this.CTRL = ral_reg_CTRL::type_id::create("CTRL",,get_full_name());
      if(this.CTRL.has_coverage(UVM_CVR_REG_BITS))
      	this.CTRL.cg_bits.option.name = "CTRL";
      this.CTRL.configure(this, null, "");
      this.CTRL.build();
      this.CTRL.add_hdl_path('{
			       '{"wbs.ctrl[31:0]", -1, -1}
			       });
      this.default_map.add_reg(this.CTRL, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
      this.CTRL_HC1R = this.CTRL.HC1R;
      this.HC1R = this.CTRL.HC1R;
      this.CTRL_HC1E = this.CTRL.HC1E;
      this.HC1E = this.CTRL.HC1E;
      this.CTRL_HC0R = this.CTRL.HC0R;
      this.HC0R = this.CTRL.HC0R;
      this.CTRL_HCOE = this.CTRL.HCOE;
      this.HCOE = this.CTRL.HCOE;
      this.CTRL_BL = this.CTRL.BL;
      this.BL = this.CTRL.BL;
      this.CTRL_CSL = this.CTRL.CSL;
      this.CSL = this.CTRL.CSL;
      this.CTRL_VSL = this.CTRL.VSL;
      this.VSL = this.CTRL.VSL;
      this.CTRL_HSL = this.CTRL.HSL;
      this.HSL = this.CTRL.HSL;
      this.CTRL_PC = this.CTRL.PC;
      this.PC = this.CTRL.PC;
      this.CTRL_CD = this.CTRL.CD;
      this.CD = this.CTRL.CD;
      this.CTRL_VBL = this.CTRL.VBL;
      this.VBL = this.CTRL.VBL;
      this.CTRL_CBSWE = this.CTRL.CBSWE;
      this.CBSWE = this.CTRL.CBSWE;
      this.CTRL_VBSWE = this.CTRL.VBSWE;
      this.VBSWE = this.CTRL.VBSWE;
      this.CTRL_CBSIE = this.CTRL.CBSIE;
      this.CBSIE = this.CTRL.CBSIE;
      this.CTRL_VBSIE = this.CTRL.VBSIE;
      this.VBSIE = this.CTRL.VBSIE;
      this.CTRL_HIE = this.CTRL.HIE;
      this.HIE = this.CTRL.HIE;
      this.CTRL_VIE = this.CTRL.VIE;
      this.VIE = this.CTRL.VIE;
      this.CTRL_VEN = this.CTRL.VEN;
      this.VEN = this.CTRL.VEN;
      this.STAT = ral_reg_STAT::type_id::create("STAT",,get_full_name());
      if(this.STAT.has_coverage(UVM_CVR_REG_BITS))
      	this.STAT.cg_bits.option.name = "STAT";
      this.STAT.configure(this, null, "");
      this.STAT.build();
      this.STAT.add_hdl_path('{

			       '{"wbs.stat[31:0]", -1, -1}
			       });
      this.default_map.add_reg(this.STAT, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
      this.STAT_HC1A = this.STAT.HC1A;
      this.HC1A = this.STAT.HC1A;
      this.STAT_HC0A = this.STAT.HC0A;
      this.HC0A = this.STAT.HC0A;
      this.STAT_ACMP = this.STAT.ACMP;
      this.ACMP = this.STAT.ACMP;
      this.STAT_AVMP = this.STAT.AVMP;
      this.AVMP = this.STAT.AVMP;
      this.STAT_CBSINT = this.STAT.CBSINT;
      this.CBSINT = this.STAT.CBSINT;
      this.STAT_VBSINT = this.STAT.VBSINT;
      this.VBSINT = this.STAT.VBSINT;
      this.STAT_HINT = this.STAT.HINT;
      this.HINT = this.STAT.HINT;
      this.STAT_VINT = this.STAT.VINT;
      this.VINT = this.STAT.VINT;
      this.STAT_LUINT = this.STAT.LUINT;
      this.LUINT = this.STAT.LUINT;
      this.STAT_SINT = this.STAT.SINT;
      this.SINT = this.STAT.SINT;
      this.HTIM = ral_reg_HTIM::type_id::create("HTIM",,get_full_name());
      if(this.HTIM.has_coverage(UVM_CVR_REG_BITS))
      	this.HTIM.cg_bits.option.name = "HTIM";
      this.HTIM.configure(this, null, "");
      this.HTIM.build();
      this.HTIM.add_hdl_path('{

			       '{"wbs.htim[31:0]", -1, -1}
			       });
      this.default_map.add_reg(this.HTIM, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
      this.HTIM_THSYNC = this.HTIM.THSYNC;
      this.THSYNC = this.HTIM.THSYNC;
      this.HTIM_THGDEL = this.HTIM.THGDEL;
      this.THGDEL = this.HTIM.THGDEL;
      this.HTIM_THGATE = this.HTIM.THGATE;
      this.THGATE = this.HTIM.THGATE;
      this.VTIM = ral_reg_VTIM::type_id::create("VTIM",,get_full_name());
      if(this.VTIM.has_coverage(UVM_CVR_REG_BITS))
      	this.VTIM.cg_bits.option.name = "VTIM";
      this.VTIM.configure(this, null, "");
      this.VTIM.build();
      this.VTIM.add_hdl_path('{

			       '{"wbs.vtim[31:0]", -1, -1}
			       });
      this.default_map.add_reg(this.VTIM, `UVM_REG_ADDR_WIDTH'hC, "RW", 0);
      this.VTIM_TVSYNC = this.VTIM.TVSYNC;
      this.TVSYNC = this.VTIM.TVSYNC;
      this.VTIM_TVGDEL = this.VTIM.TVGDEL;
      this.TVGDEL = this.VTIM.TVGDEL;
      this.VTIM_TVGATE = this.VTIM.TVGATE;
      this.TVGATE = this.VTIM.TVGATE;
      this.CLUT1 = ral_mem_CLUT1::type_id::create("CLUT1",,get_full_name());
      this.CLUT1.configure(this, "");
      this.CLUT1.build();
      this.default_map.add_mem(this.CLUT1, `UVM_REG_ADDR_WIDTH'hC00, "RW", 0);
   endfunction : build

   `uvm_object_utils(ral_block_vga_lcd)

   function void sample(uvm_reg_addr_t offset,
			bit            is_read,
			uvm_reg_map    map);
      if (get_coverage(UVM_CVR_ADDR_MAP)) begin
	 m_offset = offset;
	 cg_addr.sample();
      end
   endfunction
endclass : ral_block_vga_lcd

`endif
