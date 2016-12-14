`ifndef RAL_WB_CONMAX_ENV_RAL_BLOCK
`define RAL_WB_CONMAX_ENV_RAL_BLOCK

import uvm_pkg::*;

class ral_reg_CFG extends uvm_reg;
	rand uvm_reg_field master0_priority;
	rand uvm_reg_field master1_priority;
	rand uvm_reg_field master2_priority;
	rand uvm_reg_field master3_priority;
	rand uvm_reg_field master4_priority;
	rand uvm_reg_field master5_priority;
	rand uvm_reg_field master6_priority;
	rand uvm_reg_field master7_priority;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   master0_priority: coverpoint {m_data[1:0], m_is_read} iff(m_be) {
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
	   master1_priority: coverpoint {m_data[3:2], m_is_read} iff(m_be) {
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
	   master2_priority: coverpoint {m_data[5:4], m_is_read} iff(m_be) {
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
	   master3_priority: coverpoint {m_data[7:6], m_is_read} iff(m_be) {
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
	   master4_priority: coverpoint {m_data[9:8], m_is_read} iff(m_be) {
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
	   master5_priority: coverpoint {m_data[11:10], m_is_read} iff(m_be) {
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
	   master6_priority: coverpoint {m_data[13:12], m_is_read} iff(m_be) {
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
	   master7_priority: coverpoint {m_data[15:14], m_is_read} iff(m_be) {
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
	endgroup
	function new(string name = "CFG");
		super.new(name, 16,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.master0_priority = uvm_reg_field::type_id::create("master0_priority",,get_full_name());
      this.master0_priority.configure(this, 2, 0, "RW", 0, 2'h00, 1, 0, 0);
      this.master1_priority = uvm_reg_field::type_id::create("master1_priority",,get_full_name());
      this.master1_priority.configure(this, 2, 2, "RW", 0, 2'h00, 1, 0, 0);
      this.master2_priority = uvm_reg_field::type_id::create("master2_priority",,get_full_name());
      this.master2_priority.configure(this, 2, 4, "RW", 0, 2'h00, 1, 0, 0);
      this.master3_priority = uvm_reg_field::type_id::create("master3_priority",,get_full_name());
      this.master3_priority.configure(this, 2, 6, "RW", 0, 2'h00, 1, 0, 0);
      this.master4_priority = uvm_reg_field::type_id::create("master4_priority",,get_full_name());
      this.master4_priority.configure(this, 2, 8, "RW", 0, 2'h00, 1, 0, 0);
      this.master5_priority = uvm_reg_field::type_id::create("master5_priority",,get_full_name());
      this.master5_priority.configure(this, 2, 10, "RW", 0, 2'h00, 1, 0, 0);
      this.master6_priority = uvm_reg_field::type_id::create("master6_priority",,get_full_name());
      this.master6_priority.configure(this, 2, 12, "RW", 0, 2'h00, 1, 0, 0);
      this.master7_priority = uvm_reg_field::type_id::create("master7_priority",,get_full_name());
      this.master7_priority.configure(this, 2, 14, "RW", 0, 2'h00, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_CFG)


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
endclass : ral_reg_CFG


class ral_block_wb_conmax_env_ral_block extends uvm_reg_block;
	uvm_reg_map my_domain0;
	rand ral_reg_CFG cfg_0;
	uvm_reg_map my_domain1;
	rand ral_reg_CFG cfg_1;
	uvm_reg_map my_domain2;
	rand ral_reg_CFG cfg_2;
	uvm_reg_map my_domain3;
	rand ral_reg_CFG cfg_3;
	uvm_reg_map my_domain4;
	rand ral_reg_CFG cfg_4;
	uvm_reg_map my_domain5;
	rand ral_reg_CFG cfg_5;
	uvm_reg_map my_domain6;
	rand ral_reg_CFG cfg_6;
	uvm_reg_map my_domain7;
	rand ral_reg_CFG cfg_7;
   local uvm_reg_data_t m_offset;
	rand uvm_reg_field cfg_0_master0_priority;
	rand uvm_reg_field cfg_0_master1_priority;
	rand uvm_reg_field cfg_0_master2_priority;
	rand uvm_reg_field cfg_0_master3_priority;
	rand uvm_reg_field cfg_0_master4_priority;
	rand uvm_reg_field cfg_0_master5_priority;
	rand uvm_reg_field cfg_0_master6_priority;
	rand uvm_reg_field cfg_0_master7_priority;
	rand uvm_reg_field cfg_1_master0_priority;
	rand uvm_reg_field cfg_1_master1_priority;
	rand uvm_reg_field cfg_1_master2_priority;
	rand uvm_reg_field cfg_1_master3_priority;
	rand uvm_reg_field cfg_1_master4_priority;
	rand uvm_reg_field cfg_1_master5_priority;
	rand uvm_reg_field cfg_1_master6_priority;
	rand uvm_reg_field cfg_1_master7_priority;
	rand uvm_reg_field cfg_2_master0_priority;
	rand uvm_reg_field cfg_2_master1_priority;
	rand uvm_reg_field cfg_2_master2_priority;
	rand uvm_reg_field cfg_2_master3_priority;
	rand uvm_reg_field cfg_2_master4_priority;
	rand uvm_reg_field cfg_2_master5_priority;
	rand uvm_reg_field cfg_2_master6_priority;
	rand uvm_reg_field cfg_2_master7_priority;
	rand uvm_reg_field cfg_3_master0_priority;
	rand uvm_reg_field cfg_3_master1_priority;
	rand uvm_reg_field cfg_3_master2_priority;
	rand uvm_reg_field cfg_3_master3_priority;
	rand uvm_reg_field cfg_3_master4_priority;
	rand uvm_reg_field cfg_3_master5_priority;
	rand uvm_reg_field cfg_3_master6_priority;
	rand uvm_reg_field cfg_3_master7_priority;
	rand uvm_reg_field cfg_4_master0_priority;
	rand uvm_reg_field cfg_4_master1_priority;
	rand uvm_reg_field cfg_4_master2_priority;
	rand uvm_reg_field cfg_4_master3_priority;
	rand uvm_reg_field cfg_4_master4_priority;
	rand uvm_reg_field cfg_4_master5_priority;
	rand uvm_reg_field cfg_4_master6_priority;
	rand uvm_reg_field cfg_4_master7_priority;
	rand uvm_reg_field cfg_5_master0_priority;
	rand uvm_reg_field cfg_5_master1_priority;
	rand uvm_reg_field cfg_5_master2_priority;
	rand uvm_reg_field cfg_5_master3_priority;
	rand uvm_reg_field cfg_5_master4_priority;
	rand uvm_reg_field cfg_5_master5_priority;
	rand uvm_reg_field cfg_5_master6_priority;
	rand uvm_reg_field cfg_5_master7_priority;
	rand uvm_reg_field cfg_6_master0_priority;
	rand uvm_reg_field cfg_6_master1_priority;
	rand uvm_reg_field cfg_6_master2_priority;
	rand uvm_reg_field cfg_6_master3_priority;
	rand uvm_reg_field cfg_6_master4_priority;
	rand uvm_reg_field cfg_6_master5_priority;
	rand uvm_reg_field cfg_6_master6_priority;
	rand uvm_reg_field cfg_6_master7_priority;
	rand uvm_reg_field cfg_7_master0_priority;
	rand uvm_reg_field cfg_7_master1_priority;
	rand uvm_reg_field cfg_7_master2_priority;
	rand uvm_reg_field cfg_7_master3_priority;
	rand uvm_reg_field cfg_7_master4_priority;
	rand uvm_reg_field cfg_7_master5_priority;
	rand uvm_reg_field cfg_7_master6_priority;
	rand uvm_reg_field cfg_7_master7_priority;


covergroup my_domain0_cg_addr(input string name);
	option.per_instance = 1;
option.name = get_name();

	cfg_0 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}
endgroup

covergroup my_domain1_cg_addr(input string name);
	option.per_instance = 1;
option.name = get_name();

	cfg_1 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}
endgroup

covergroup my_domain2_cg_addr(input string name);
	option.per_instance = 1;
option.name = get_name();

	cfg_2 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}
endgroup

covergroup my_domain3_cg_addr(input string name);
	option.per_instance = 1;
option.name = get_name();

	cfg_3 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}
endgroup

covergroup my_domain4_cg_addr(input string name);
	option.per_instance = 1;
option.name = get_name();

	cfg_4 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}
endgroup

covergroup my_domain5_cg_addr(input string name);
	option.per_instance = 1;
option.name = get_name();

	cfg_5 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}
endgroup

covergroup my_domain6_cg_addr(input string name);
	option.per_instance = 1;
option.name = get_name();

	cfg_6 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}
endgroup

covergroup my_domain7_cg_addr(input string name);
	option.per_instance = 1;
option.name = get_name();

	cfg_7 : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}
endgroup
	function new(string name = "wb_conmax_env_ral_block");
		super.new(name, build_coverage(UVM_CVR_ADDR_MAP));
		if (has_coverage(UVM_CVR_ADDR_MAP))
			my_domain0_cg_addr = new("my_domain0_cg_addr");
		if (has_coverage(UVM_CVR_ADDR_MAP))
			my_domain1_cg_addr = new("my_domain1_cg_addr");
		if (has_coverage(UVM_CVR_ADDR_MAP))
			my_domain2_cg_addr = new("my_domain2_cg_addr");
		if (has_coverage(UVM_CVR_ADDR_MAP))
			my_domain3_cg_addr = new("my_domain3_cg_addr");
		if (has_coverage(UVM_CVR_ADDR_MAP))
			my_domain4_cg_addr = new("my_domain4_cg_addr");
		if (has_coverage(UVM_CVR_ADDR_MAP))
			my_domain5_cg_addr = new("my_domain5_cg_addr");
		if (has_coverage(UVM_CVR_ADDR_MAP))
			my_domain6_cg_addr = new("my_domain6_cg_addr");
		if (has_coverage(UVM_CVR_ADDR_MAP))
			my_domain7_cg_addr = new("my_domain7_cg_addr");
	endfunction: new

   virtual function void build();
      this.my_domain0 = create_map("my_domain0", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.default_map = this.my_domain0;
      this.my_domain1 = create_map("my_domain1", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.my_domain2 = create_map("my_domain2", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.my_domain3 = create_map("my_domain3", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.my_domain4 = create_map("my_domain4", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.my_domain5 = create_map("my_domain5", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.my_domain6 = create_map("my_domain6", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.my_domain7 = create_map("my_domain7", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.cfg_0 = ral_reg_CFG::type_id::create("cfg_0",,get_full_name());
      if(this.cfg_0.has_coverage(UVM_CVR_REG_BITS))
      	this.cfg_0.cg_bits.option.name = "cfg_0_bits";
      this.cfg_0.configure(this, null, "");
      this.cfg_0.build();
      this.my_domain0.add_reg(this.cfg_0, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.cfg_0_master0_priority = this.cfg_0.master0_priority;
		this.cfg_0_master1_priority = this.cfg_0.master1_priority;
		this.cfg_0_master2_priority = this.cfg_0.master2_priority;
		this.cfg_0_master3_priority = this.cfg_0.master3_priority;
		this.cfg_0_master4_priority = this.cfg_0.master4_priority;
		this.cfg_0_master5_priority = this.cfg_0.master5_priority;
		this.cfg_0_master6_priority = this.cfg_0.master6_priority;
		this.cfg_0_master7_priority = this.cfg_0.master7_priority;
      this.cfg_1 = ral_reg_CFG::type_id::create("cfg_1",,get_full_name());
      if(this.cfg_1.has_coverage(UVM_CVR_REG_BITS))
      	this.cfg_1.cg_bits.option.name = "cfg_1_bits";
      this.cfg_1.configure(this, null, "");
      this.cfg_1.build();
      this.my_domain1.add_reg(this.cfg_1, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.cfg_1_master0_priority = this.cfg_1.master0_priority;
		this.cfg_1_master1_priority = this.cfg_1.master1_priority;
		this.cfg_1_master2_priority = this.cfg_1.master2_priority;
		this.cfg_1_master3_priority = this.cfg_1.master3_priority;
		this.cfg_1_master4_priority = this.cfg_1.master4_priority;
		this.cfg_1_master5_priority = this.cfg_1.master5_priority;
		this.cfg_1_master6_priority = this.cfg_1.master6_priority;
		this.cfg_1_master7_priority = this.cfg_1.master7_priority;
      this.cfg_2 = ral_reg_CFG::type_id::create("cfg_2",,get_full_name());
      if(this.cfg_2.has_coverage(UVM_CVR_REG_BITS))
      	this.cfg_2.cg_bits.option.name = "cfg_2_bits";
      this.cfg_2.configure(this, null, "");
      this.cfg_2.build();
      this.my_domain2.add_reg(this.cfg_2, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.cfg_2_master0_priority = this.cfg_2.master0_priority;
		this.cfg_2_master1_priority = this.cfg_2.master1_priority;
		this.cfg_2_master2_priority = this.cfg_2.master2_priority;
		this.cfg_2_master3_priority = this.cfg_2.master3_priority;
		this.cfg_2_master4_priority = this.cfg_2.master4_priority;
		this.cfg_2_master5_priority = this.cfg_2.master5_priority;
		this.cfg_2_master6_priority = this.cfg_2.master6_priority;
		this.cfg_2_master7_priority = this.cfg_2.master7_priority;
      this.cfg_3 = ral_reg_CFG::type_id::create("cfg_3",,get_full_name());
      if(this.cfg_3.has_coverage(UVM_CVR_REG_BITS))
      	this.cfg_3.cg_bits.option.name = "cfg_3_bits";
      this.cfg_3.configure(this, null, "");
      this.cfg_3.build();
      this.my_domain3.add_reg(this.cfg_3, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.cfg_3_master0_priority = this.cfg_3.master0_priority;
		this.cfg_3_master1_priority = this.cfg_3.master1_priority;
		this.cfg_3_master2_priority = this.cfg_3.master2_priority;
		this.cfg_3_master3_priority = this.cfg_3.master3_priority;
		this.cfg_3_master4_priority = this.cfg_3.master4_priority;
		this.cfg_3_master5_priority = this.cfg_3.master5_priority;
		this.cfg_3_master6_priority = this.cfg_3.master6_priority;
		this.cfg_3_master7_priority = this.cfg_3.master7_priority;
      this.cfg_4 = ral_reg_CFG::type_id::create("cfg_4",,get_full_name());
      if(this.cfg_4.has_coverage(UVM_CVR_REG_BITS))
      	this.cfg_4.cg_bits.option.name = "cfg_4_bits";
      this.cfg_4.configure(this, null, "");
      this.cfg_4.build();
      this.my_domain4.add_reg(this.cfg_4, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.cfg_4_master0_priority = this.cfg_4.master0_priority;
		this.cfg_4_master1_priority = this.cfg_4.master1_priority;
		this.cfg_4_master2_priority = this.cfg_4.master2_priority;
		this.cfg_4_master3_priority = this.cfg_4.master3_priority;
		this.cfg_4_master4_priority = this.cfg_4.master4_priority;
		this.cfg_4_master5_priority = this.cfg_4.master5_priority;
		this.cfg_4_master6_priority = this.cfg_4.master6_priority;
		this.cfg_4_master7_priority = this.cfg_4.master7_priority;
      this.cfg_5 = ral_reg_CFG::type_id::create("cfg_5",,get_full_name());
      if(this.cfg_5.has_coverage(UVM_CVR_REG_BITS))
      	this.cfg_5.cg_bits.option.name = "cfg_5_bits";
      this.cfg_5.configure(this, null, "");
      this.cfg_5.build();
      this.my_domain5.add_reg(this.cfg_5, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.cfg_5_master0_priority = this.cfg_5.master0_priority;
		this.cfg_5_master1_priority = this.cfg_5.master1_priority;
		this.cfg_5_master2_priority = this.cfg_5.master2_priority;
		this.cfg_5_master3_priority = this.cfg_5.master3_priority;
		this.cfg_5_master4_priority = this.cfg_5.master4_priority;
		this.cfg_5_master5_priority = this.cfg_5.master5_priority;
		this.cfg_5_master6_priority = this.cfg_5.master6_priority;
		this.cfg_5_master7_priority = this.cfg_5.master7_priority;
      this.cfg_6 = ral_reg_CFG::type_id::create("cfg_6",,get_full_name());
      if(this.cfg_6.has_coverage(UVM_CVR_REG_BITS))
      	this.cfg_6.cg_bits.option.name = "cfg_6_bits";
      this.cfg_6.configure(this, null, "");
      this.cfg_6.build();
      this.my_domain6.add_reg(this.cfg_6, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.cfg_6_master0_priority = this.cfg_6.master0_priority;
		this.cfg_6_master1_priority = this.cfg_6.master1_priority;
		this.cfg_6_master2_priority = this.cfg_6.master2_priority;
		this.cfg_6_master3_priority = this.cfg_6.master3_priority;
		this.cfg_6_master4_priority = this.cfg_6.master4_priority;
		this.cfg_6_master5_priority = this.cfg_6.master5_priority;
		this.cfg_6_master6_priority = this.cfg_6.master6_priority;
		this.cfg_6_master7_priority = this.cfg_6.master7_priority;
      this.cfg_7 = ral_reg_CFG::type_id::create("cfg_7",,get_full_name());
      if(this.cfg_7.has_coverage(UVM_CVR_REG_BITS))
      	this.cfg_7.cg_bits.option.name = "cfg_7_bits";
      this.cfg_7.configure(this, null, "");
      this.cfg_7.build();
      this.my_domain7.add_reg(this.cfg_7, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.cfg_7_master0_priority = this.cfg_7.master0_priority;
		this.cfg_7_master1_priority = this.cfg_7.master1_priority;
		this.cfg_7_master2_priority = this.cfg_7.master2_priority;
		this.cfg_7_master3_priority = this.cfg_7.master3_priority;
		this.cfg_7_master4_priority = this.cfg_7.master4_priority;
		this.cfg_7_master5_priority = this.cfg_7.master5_priority;
		this.cfg_7_master6_priority = this.cfg_7.master6_priority;
		this.cfg_7_master7_priority = this.cfg_7.master7_priority;
   endfunction : build

	`uvm_object_utils(ral_block_wb_conmax_env_ral_block)


function void sample(uvm_reg_addr_t offset,
                     bit            is_read,
                     uvm_reg_map    map);
  if (get_coverage(UVM_CVR_ADDR_MAP)) begin
    m_offset = offset;
    if (map.get_name() == "my_domain0")
      my_domain0_cg_addr.sample();
    if (map.get_name() == "my_domain1")
      my_domain1_cg_addr.sample();
    if (map.get_name() == "my_domain2")
      my_domain2_cg_addr.sample();
    if (map.get_name() == "my_domain3")
      my_domain3_cg_addr.sample();
    if (map.get_name() == "my_domain4")
      my_domain4_cg_addr.sample();
    if (map.get_name() == "my_domain5")
      my_domain5_cg_addr.sample();
    if (map.get_name() == "my_domain6")
      my_domain6_cg_addr.sample();
    if (map.get_name() == "my_domain7")
      my_domain7_cg_addr.sample();
  end
endfunction
endclass : ral_block_wb_conmax_env_ral_block



`endif
