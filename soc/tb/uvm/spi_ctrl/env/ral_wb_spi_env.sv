`ifndef RAL_WB_SPI_ENV
`define RAL_WB_SPI_ENV

import uvm_pkg::*;

class ral_reg_wb_spi_env_CHIP_ID extends uvm_reg;
	uvm_reg_field REVISION_ID;
	uvm_reg_field CHIP_ID;
	uvm_reg_field PRODUCT_ID;
   local uvm_reg_data_t m_data;
   local uvm_reg_data_t m_be;
   local bit            m_is_read;

	covergroup cg_bits ();
	   option.per_instance = 1;
	   option.name = get_name();
	   REVISION_ID: coverpoint {m_data[7:0], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {9'b???????00};
	      wildcard bins bit_0_wr_as_1 = {9'b???????10};
	      wildcard bins bit_0_rd = {9'b????????1};
	      wildcard bins bit_1_wr_as_0 = {9'b??????0?0};
	      wildcard bins bit_1_wr_as_1 = {9'b??????1?0};
	      wildcard bins bit_1_rd = {9'b????????1};
	      wildcard bins bit_2_wr_as_0 = {9'b?????0??0};
	      wildcard bins bit_2_wr_as_1 = {9'b?????1??0};
	      wildcard bins bit_2_rd = {9'b????????1};
	      wildcard bins bit_3_wr_as_0 = {9'b????0???0};
	      wildcard bins bit_3_wr_as_1 = {9'b????1???0};
	      wildcard bins bit_3_rd = {9'b????????1};
	      wildcard bins bit_4_wr_as_0 = {9'b???0????0};
	      wildcard bins bit_4_wr_as_1 = {9'b???1????0};
	      wildcard bins bit_4_rd = {9'b????????1};
	      wildcard bins bit_5_wr_as_0 = {9'b??0?????0};
	      wildcard bins bit_5_wr_as_1 = {9'b??1?????0};
	      wildcard bins bit_5_rd = {9'b????????1};
	      wildcard bins bit_6_wr_as_0 = {9'b?0??????0};
	      wildcard bins bit_6_wr_as_1 = {9'b?1??????0};
	      wildcard bins bit_6_rd = {9'b????????1};
	      wildcard bins bit_7_wr_as_0 = {9'b0???????0};
	      wildcard bins bit_7_wr_as_1 = {9'b1???????0};
	      wildcard bins bit_7_rd = {9'b????????1};
	      option.weight = 24;
	   }
	   CHIP_ID: coverpoint {m_data[15:8], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {9'b???????00};
	      wildcard bins bit_0_wr_as_1 = {9'b???????10};
	      wildcard bins bit_0_rd = {9'b????????1};
	      wildcard bins bit_1_wr_as_0 = {9'b??????0?0};
	      wildcard bins bit_1_wr_as_1 = {9'b??????1?0};
	      wildcard bins bit_1_rd = {9'b????????1};
	      wildcard bins bit_2_wr_as_0 = {9'b?????0??0};
	      wildcard bins bit_2_wr_as_1 = {9'b?????1??0};
	      wildcard bins bit_2_rd = {9'b????????1};
	      wildcard bins bit_3_wr_as_0 = {9'b????0???0};
	      wildcard bins bit_3_wr_as_1 = {9'b????1???0};
	      wildcard bins bit_3_rd = {9'b????????1};
	      wildcard bins bit_4_wr_as_0 = {9'b???0????0};
	      wildcard bins bit_4_wr_as_1 = {9'b???1????0};
	      wildcard bins bit_4_rd = {9'b????????1};
	      wildcard bins bit_5_wr_as_0 = {9'b??0?????0};
	      wildcard bins bit_5_wr_as_1 = {9'b??1?????0};
	      wildcard bins bit_5_rd = {9'b????????1};
	      wildcard bins bit_6_wr_as_0 = {9'b?0??????0};
	      wildcard bins bit_6_wr_as_1 = {9'b?1??????0};
	      wildcard bins bit_6_rd = {9'b????????1};
	      wildcard bins bit_7_wr_as_0 = {9'b0???????0};
	      wildcard bins bit_7_wr_as_1 = {9'b1???????0};
	      wildcard bins bit_7_rd = {9'b????????1};
	      option.weight = 24;
	   }
	   PRODUCT_ID: coverpoint {m_data[25:16], m_is_read} iff(m_be) {
	      wildcard bins bit_0_wr_as_0 = {11'b?????????00};
	      wildcard bins bit_0_wr_as_1 = {11'b?????????10};
	      wildcard bins bit_0_rd = {11'b??????????1};
	      wildcard bins bit_1_wr_as_0 = {11'b????????0?0};
	      wildcard bins bit_1_wr_as_1 = {11'b????????1?0};
	      wildcard bins bit_1_rd = {11'b??????????1};
	      wildcard bins bit_2_wr_as_0 = {11'b???????0??0};
	      wildcard bins bit_2_wr_as_1 = {11'b???????1??0};
	      wildcard bins bit_2_rd = {11'b??????????1};
	      wildcard bins bit_3_wr_as_0 = {11'b??????0???0};
	      wildcard bins bit_3_wr_as_1 = {11'b??????1???0};
	      wildcard bins bit_3_rd = {11'b??????????1};
	      wildcard bins bit_4_wr_as_0 = {11'b?????0????0};
	      wildcard bins bit_4_wr_as_1 = {11'b?????1????0};
	      wildcard bins bit_4_rd = {11'b??????????1};
	      wildcard bins bit_5_wr_as_0 = {11'b????0?????0};
	      wildcard bins bit_5_wr_as_1 = {11'b????1?????0};
	      wildcard bins bit_5_rd = {11'b??????????1};
	      wildcard bins bit_6_wr_as_0 = {11'b???0??????0};
	      wildcard bins bit_6_wr_as_1 = {11'b???1??????0};
	      wildcard bins bit_6_rd = {11'b??????????1};
	      wildcard bins bit_7_wr_as_0 = {11'b??0???????0};
	      wildcard bins bit_7_wr_as_1 = {11'b??1???????0};
	      wildcard bins bit_7_rd = {11'b??????????1};
	      wildcard bins bit_8_wr_as_0 = {11'b?0????????0};
	      wildcard bins bit_8_wr_as_1 = {11'b?1????????0};
	      wildcard bins bit_8_rd = {11'b??????????1};
	      wildcard bins bit_9_wr_as_0 = {11'b0?????????0};
	      wildcard bins bit_9_wr_as_1 = {11'b1?????????0};
	      wildcard bins bit_9_rd = {11'b??????????1};
	      option.weight = 30;
	   }
	endgroup
	function new(string name = "wb_spi_env_CHIP_ID");
		super.new(name, 32,build_coverage(UVM_CVR_REG_BITS));
		if (has_coverage(UVM_CVR_REG_BITS))
			cg_bits = new();
	endfunction: new
   virtual function void build();
      this.REVISION_ID = uvm_reg_field::type_id::create("REVISION_ID",,get_full_name());
      this.REVISION_ID.configure(this, 8, 0, "RO", 0, 8'h03, 1, 0, 1);
      this.CHIP_ID = uvm_reg_field::type_id::create("CHIP_ID",,get_full_name());
      this.CHIP_ID.configure(this, 8, 8, "RO", 0, 8'h5A, 1, 0, 1);
      this.PRODUCT_ID = uvm_reg_field::type_id::create("PRODUCT_ID",,get_full_name());
      this.PRODUCT_ID.configure(this, 10, 16, "RO", 0, 10'h176, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_wb_spi_env_CHIP_ID)


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
endclass : ral_reg_wb_spi_env_CHIP_ID


class ral_mem_wb_spi_env_wb_spi_env_RAM extends uvm_mem;
   function new(string name = "wb_spi_env_wb_spi_env_RAM");
      super.new(name, `UVM_REG_ADDR_WIDTH'h400, 32, "RW", build_coverage(UVM_CVR_ADDR_MAP));
   endfunction
   virtual function void build();
   endfunction: build

   `uvm_object_utils(ral_mem_wb_spi_env_wb_spi_env_RAM)

endclass : ral_mem_wb_spi_env_wb_spi_env_RAM


class ral_block_wb_spi_env extends uvm_reg_block;
	rand ral_reg_wb_spi_env_CHIP_ID CHIP_ID;
	rand ral_mem_wb_spi_env_wb_spi_env_RAM wb_spi_env_RAM;
   local uvm_reg_data_t m_offset;
	uvm_reg_field CHIP_ID_REVISION_ID;
	uvm_reg_field REVISION_ID;
	uvm_reg_field CHIP_ID_CHIP_ID;
	uvm_reg_field CHIP_ID_PRODUCT_ID;
	uvm_reg_field PRODUCT_ID;


covergroup cg_addr (input string name);
	option.per_instance = 1;
option.name = get_name();

	CHIP_ID : coverpoint m_offset {
		bins accessed = { `UVM_REG_ADDR_WIDTH'h0 };
		option.weight = 1;
	}

	wb_spi_env_RAM : coverpoint m_offset {
		bins first_location_accessed = { `UVM_REG_ADDR_WIDTH'h800 };
		bins last_location_accessed = { `UVM_REG_ADDR_WIDTH'hBFF };
		bins other_locations_accessed = { [`UVM_REG_ADDR_WIDTH'h801:`UVM_REG_ADDR_WIDTH'hBFE] };
		option.weight = 3;
	}
endgroup
	function new(string name = "wb_spi_env");
		super.new(name, build_coverage(UVM_CVR_ADDR_MAP));
		if (has_coverage(UVM_CVR_ADDR_MAP))
			cg_addr = new("cg_addr");
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.CHIP_ID = ral_reg_wb_spi_env_CHIP_ID::type_id::create("CHIP_ID",,get_full_name());
      if(this.CHIP_ID.has_coverage(UVM_CVR_REG_BITS))
      	this.CHIP_ID.cg_bits.option.name = "CHIP_ID";
      this.CHIP_ID.configure(this, null, "");
      this.CHIP_ID.build();
      this.default_map.add_reg(this.CHIP_ID, `UVM_REG_ADDR_WIDTH'h0, "RO", 0);
		this.CHIP_ID_REVISION_ID = this.CHIP_ID.REVISION_ID;
		this.REVISION_ID = this.CHIP_ID.REVISION_ID;
		this.CHIP_ID_CHIP_ID = this.CHIP_ID.CHIP_ID;
		this.CHIP_ID_PRODUCT_ID = this.CHIP_ID.PRODUCT_ID;
		this.PRODUCT_ID = this.CHIP_ID.PRODUCT_ID;
      this.wb_spi_env_RAM = ral_mem_wb_spi_env_wb_spi_env_RAM::type_id::create("wb_spi_env_RAM",,get_full_name());
      this.wb_spi_env_RAM.configure(this, "");
      this.wb_spi_env_RAM.build();
      this.default_map.add_mem(this.wb_spi_env_RAM, `UVM_REG_ADDR_WIDTH'h800, "RW", 0);
   endfunction : build

	`uvm_object_utils(ral_block_wb_spi_env)


function void sample(uvm_reg_addr_t offset,
                     bit            is_read,
                     uvm_reg_map    map);
  if (get_coverage(UVM_CVR_ADDR_MAP)) begin
    m_offset = offset;
    cg_addr.sample();
  end
endfunction
endclass : ral_block_wb_spi_env



`endif
