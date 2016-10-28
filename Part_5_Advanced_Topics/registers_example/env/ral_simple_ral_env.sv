`ifndef RAL_SIMPLE_RAL_ENV
`define RAL_SIMPLE_RAL_ENV

import uvm_pkg::*;

class ral_reg_simple_ral_env_CHIP_ID_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.CHIP_ID;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		rw.status = UVM_NOT_OK;
	endtask
endclass


class ral_reg_simple_ral_env_CHIP_ID extends uvm_reg;
	uvm_reg_field REVISION_ID;
	uvm_reg_field CHIP_ID;
	uvm_reg_field PRODUCT_ID;

	function new(string name = "simple_ral_env_CHIP_ID");
		super.new(name, 56,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.REVISION_ID = uvm_reg_field::type_id::create("REVISION_ID",,get_full_name());
      this.REVISION_ID.configure(this, 38, 0, "RO", 0, 38'h03, 1, 0, 0);
      this.CHIP_ID = uvm_reg_field::type_id::create("CHIP_ID",,get_full_name());
      this.CHIP_ID.configure(this, 8, 38, "RO", 0, 8'h5A, 1, 0, 0);
      this.PRODUCT_ID = uvm_reg_field::type_id::create("PRODUCT_ID",,get_full_name());
      this.PRODUCT_ID.configure(this, 10, 46, "RO", 0, 10'h176, 1, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_CHIP_ID)

endclass : ral_reg_simple_ral_env_CHIP_ID


class ral_reg_simple_ral_env_r_RO_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_RO_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		rw.status = UVM_NOT_OK;
	endtask
endclass


class ral_reg_simple_ral_env_r_RO_register extends uvm_reg;
	uvm_reg_field r_RO_field;

	function new(string name = "simple_ral_env_r_RO_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_RO_field = uvm_reg_field::type_id::create("r_RO_field",,get_full_name());
      this.r_RO_field.configure(this, 15, 0, "RO", 0, 15'h0c, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_RO_register)

endclass : ral_reg_simple_ral_env_r_RO_register


class ral_reg_simple_ral_env_r_RW_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_RW_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_RW_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_RW_register extends uvm_reg;
	rand uvm_reg_field r_RW_field;

	function new(string name = "simple_ral_env_r_RW_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_RW_field = uvm_reg_field::type_id::create("r_RW_field",,get_full_name());
      this.r_RW_field.configure(this, 15, 0, "RW", 0, 15'h10, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_RW_register)

endclass : ral_reg_simple_ral_env_r_RW_register


class ral_reg_simple_ral_env_r_RC_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_RC_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_RC_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_RC_register extends uvm_reg;
	rand uvm_reg_field r_RC_field;

	function new(string name = "simple_ral_env_r_RC_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_RC_field = uvm_reg_field::type_id::create("r_RC_field",,get_full_name());
      this.r_RC_field.configure(this, 15, 0, "RC", 0, 15'h14, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_RC_register)

endclass : ral_reg_simple_ral_env_r_RC_register


class ral_reg_simple_ral_env_r_RS_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_RS_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_RS_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_RS_register extends uvm_reg;
	rand uvm_reg_field r_RS_field;

	function new(string name = "simple_ral_env_r_RS_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_RS_field = uvm_reg_field::type_id::create("r_RS_field",,get_full_name());
      this.r_RS_field.configure(this, 15, 0, "RS", 0, 15'h18, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_RS_register)

endclass : ral_reg_simple_ral_env_r_RS_register


class ral_reg_simple_ral_env_r_WRC_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WRC_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WRC_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WRC_register extends uvm_reg;
	rand uvm_reg_field r_WRC_field;

	function new(string name = "simple_ral_env_r_WRC_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WRC_field = uvm_reg_field::type_id::create("r_WRC_field",,get_full_name());
      this.r_WRC_field.configure(this, 15, 0, "WRC", 0, 15'h1c, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WRC_register)

endclass : ral_reg_simple_ral_env_r_WRC_register


class ral_reg_simple_ral_env_r_WRS_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WRS_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WRS_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WRS_register extends uvm_reg;
	rand uvm_reg_field r_WRS_field;

	function new(string name = "simple_ral_env_r_WRS_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WRS_field = uvm_reg_field::type_id::create("r_WRS_field",,get_full_name());
      this.r_WRS_field.configure(this, 15, 0, "WRS", 0, 15'h20, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WRS_register)

endclass : ral_reg_simple_ral_env_r_WRS_register


class ral_reg_simple_ral_env_r_WC_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WC_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WC_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WC_register extends uvm_reg;
	rand uvm_reg_field r_WC_field;

	function new(string name = "simple_ral_env_r_WC_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WC_field = uvm_reg_field::type_id::create("r_WC_field",,get_full_name());
      this.r_WC_field.configure(this, 15, 0, "WC", 0, 15'h24, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WC_register)

endclass : ral_reg_simple_ral_env_r_WC_register


class ral_reg_simple_ral_env_r_WS_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WS_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WS_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WS_register extends uvm_reg;
	rand uvm_reg_field r_WS_field;

	function new(string name = "simple_ral_env_r_WS_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WS_field = uvm_reg_field::type_id::create("r_WS_field",,get_full_name());
      this.r_WS_field.configure(this, 15, 0, "WS", 0, 15'h28, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WS_register)

endclass : ral_reg_simple_ral_env_r_WS_register


class ral_reg_simple_ral_env_r_WSRC_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WSRC_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WSRC_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WSRC_register extends uvm_reg;
	rand uvm_reg_field r_WSRC_field;

	function new(string name = "simple_ral_env_r_WSRC_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WSRC_field = uvm_reg_field::type_id::create("r_WSRC_field",,get_full_name());
      this.r_WSRC_field.configure(this, 15, 0, "WSRC", 0, 15'h2c, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WSRC_register)

endclass : ral_reg_simple_ral_env_r_WSRC_register


class ral_reg_simple_ral_env_r_WCRS_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WCRS_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WCRS_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WCRS_register extends uvm_reg;
	rand uvm_reg_field r_WCRS_field;

	function new(string name = "simple_ral_env_r_WCRS_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WCRS_field = uvm_reg_field::type_id::create("r_WCRS_field",,get_full_name());
      this.r_WCRS_field.configure(this, 15, 0, "WCRS", 0, 15'h30, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WCRS_register)

endclass : ral_reg_simple_ral_env_r_WCRS_register


class ral_reg_simple_ral_env_r_W1C_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W1C_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W1C_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W1C_register extends uvm_reg;
	rand uvm_reg_field r_W1C_field;

	function new(string name = "simple_ral_env_r_W1C_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W1C_field = uvm_reg_field::type_id::create("r_W1C_field",,get_full_name());
      this.r_W1C_field.configure(this, 15, 0, "W1C", 0, 15'h34, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W1C_register)

endclass : ral_reg_simple_ral_env_r_W1C_register


class ral_reg_simple_ral_env_r_W1S_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W1S_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W1S_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W1S_register extends uvm_reg;
	rand uvm_reg_field r_W1S_field;

	function new(string name = "simple_ral_env_r_W1S_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W1S_field = uvm_reg_field::type_id::create("r_W1S_field",,get_full_name());
      this.r_W1S_field.configure(this, 15, 0, "W1S", 0, 15'h38, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W1S_register)

endclass : ral_reg_simple_ral_env_r_W1S_register


class ral_reg_simple_ral_env_r_W1T_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W1T_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W1T_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W1T_register extends uvm_reg;
	rand uvm_reg_field r_W1T_field;

	function new(string name = "simple_ral_env_r_W1T_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W1T_field = uvm_reg_field::type_id::create("r_W1T_field",,get_full_name());
      this.r_W1T_field.configure(this, 15, 0, "W1T", 0, 15'h3c, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W1T_register)

endclass : ral_reg_simple_ral_env_r_W1T_register


class ral_reg_simple_ral_env_r_W0C_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W0C_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W0C_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W0C_register extends uvm_reg;
	rand uvm_reg_field r_W0C_field;

	function new(string name = "simple_ral_env_r_W0C_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W0C_field = uvm_reg_field::type_id::create("r_W0C_field",,get_full_name());
      this.r_W0C_field.configure(this, 15, 0, "W0C", 0, 15'h40, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W0C_register)

endclass : ral_reg_simple_ral_env_r_W0C_register


class ral_reg_simple_ral_env_r_W0S_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W0S_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W0S_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W0S_register extends uvm_reg;
	rand uvm_reg_field r_W0S_field;

	function new(string name = "simple_ral_env_r_W0S_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W0S_field = uvm_reg_field::type_id::create("r_W0S_field",,get_full_name());
      this.r_W0S_field.configure(this, 15, 0, "W0S", 0, 15'h44, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W0S_register)

endclass : ral_reg_simple_ral_env_r_W0S_register


class ral_reg_simple_ral_env_r_W0T_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W0T_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W0T_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W0T_register extends uvm_reg;
	rand uvm_reg_field r_W0T_field;

	function new(string name = "simple_ral_env_r_W0T_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W0T_field = uvm_reg_field::type_id::create("r_W0T_field",,get_full_name());
      this.r_W0T_field.configure(this, 15, 0, "W0T", 0, 15'h48, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W0T_register)

endclass : ral_reg_simple_ral_env_r_W0T_register


class ral_reg_simple_ral_env_r_W1SRC_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W1SRC_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W1SRC_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W1SRC_register extends uvm_reg;
	rand uvm_reg_field r_W1SRC_field;

	function new(string name = "simple_ral_env_r_W1SRC_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W1SRC_field = uvm_reg_field::type_id::create("r_W1SRC_field",,get_full_name());
      this.r_W1SRC_field.configure(this, 15, 0, "W1SRC", 0, 15'h4c, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W1SRC_register)

endclass : ral_reg_simple_ral_env_r_W1SRC_register


class ral_reg_simple_ral_env_r_W1CRS_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W1CRS_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W1CRS_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W1CRS_register extends uvm_reg;
	rand uvm_reg_field r_W1CRS_field;

	function new(string name = "simple_ral_env_r_W1CRS_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W1CRS_field = uvm_reg_field::type_id::create("r_W1CRS_field",,get_full_name());
      this.r_W1CRS_field.configure(this, 15, 0, "W1CRS", 0, 15'h50, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W1CRS_register)

endclass : ral_reg_simple_ral_env_r_W1CRS_register


class ral_reg_simple_ral_env_r_W0SRC_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W0SRC_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W0SRC_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W0SRC_register extends uvm_reg;
	rand uvm_reg_field r_W0SRC_field;

	function new(string name = "simple_ral_env_r_W0SRC_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W0SRC_field = uvm_reg_field::type_id::create("r_W0SRC_field",,get_full_name());
      this.r_W0SRC_field.configure(this, 15, 0, "W0SRC", 0, 15'h54, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W0SRC_register)

endclass : ral_reg_simple_ral_env_r_W0SRC_register


class ral_reg_simple_ral_env_r_W0CRS_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W0CRS_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W0CRS_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W0CRS_register extends uvm_reg;
	rand uvm_reg_field r_W0CRS_field;

	function new(string name = "simple_ral_env_r_W0CRS_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W0CRS_field = uvm_reg_field::type_id::create("r_W0CRS_field",,get_full_name());
      this.r_W0CRS_field.configure(this, 15, 0, "W0CRS", 0, 15'h58, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W0CRS_register)

endclass : ral_reg_simple_ral_env_r_W0CRS_register


class ral_reg_simple_ral_env_r_WO_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WO_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WO_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WO_register extends uvm_reg;
	rand uvm_reg_field r_WO_field;

	function new(string name = "simple_ral_env_r_WO_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WO_field = uvm_reg_field::type_id::create("r_WO_field",,get_full_name());
      this.r_WO_field.configure(this, 15, 0, "WO", 0, 15'h5c, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WO_register)

endclass : ral_reg_simple_ral_env_r_WO_register


class ral_reg_simple_ral_env_r_WOC_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WOC_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WOC_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WOC_register extends uvm_reg;
	rand uvm_reg_field r_WOC_field;

	function new(string name = "simple_ral_env_r_WOC_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WOC_field = uvm_reg_field::type_id::create("r_WOC_field",,get_full_name());
      this.r_WOC_field.configure(this, 15, 0, "W0C", 0, 15'h60, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WOC_register)

endclass : ral_reg_simple_ral_env_r_WOC_register


class ral_reg_simple_ral_env_r_WOS_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WOS_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WOS_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WOS_register extends uvm_reg;
	rand uvm_reg_field r_WOS_field;

	function new(string name = "simple_ral_env_r_WOS_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WOS_field = uvm_reg_field::type_id::create("r_WOS_field",,get_full_name());
      this.r_WOS_field.configure(this, 15, 0, "W0S", 0, 15'h64, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WOS_register)

endclass : ral_reg_simple_ral_env_r_WOS_register


class ral_reg_simple_ral_env_r_W1_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_W1_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_W1_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_W1_register extends uvm_reg;
	rand uvm_reg_field r_W1_field;

	function new(string name = "simple_ral_env_r_W1_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_W1_field = uvm_reg_field::type_id::create("r_W1_field",,get_full_name());
      this.r_W1_field.configure(this, 15, 0, "W1", 0, 15'h68, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_W1_register)

endclass : ral_reg_simple_ral_env_r_W1_register


class ral_reg_simple_ral_env_r_WO1_register_bkdr extends uvm_reg_backdoor;

	function new(string name);
		super.new(name);
	endfunction

	virtual task read(uvm_reg_item rw);
		do_pre_read(rw);
		rw.value[0] = `SIMPLE_RAL_ENV_TOP_PATH.r_WO1_register;
		rw.status = UVM_IS_OK;
		do_post_read(rw);
	endtask

	virtual task write(uvm_reg_item rw);
		do_pre_write(rw);
		`SIMPLE_RAL_ENV_TOP_PATH.r_WO1_register = rw.value[0];
		rw.status = UVM_IS_OK;
		do_post_write(rw);
	endtask
endclass


class ral_reg_simple_ral_env_r_WO1_register extends uvm_reg;
	rand uvm_reg_field r_WO1_field;

	function new(string name = "simple_ral_env_r_WO1_register");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_WO1_field = uvm_reg_field::type_id::create("r_WO1_field",,get_full_name());
      this.r_WO1_field.configure(this, 15, 0, "WO1", 0, 15'h6c, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_WO1_register)

endclass : ral_reg_simple_ral_env_r_WO1_register


class ral_reg_simple_ral_env_r_aliased_1 extends uvm_reg;
	rand uvm_reg_field r_aliased_1;

	function new(string name = "simple_ral_env_r_aliased_1");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_aliased_1 = uvm_reg_field::type_id::create("r_aliased_1",,get_full_name());
      this.r_aliased_1.configure(this, 15, 0, "RW", 0, 15'h70, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_aliased_1)

endclass : ral_reg_simple_ral_env_r_aliased_1


class ral_reg_simple_ral_env_r_aliased_2 extends uvm_reg;
	uvm_reg_field r_aliased_2;

	function new(string name = "simple_ral_env_r_aliased_2");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.r_aliased_2 = uvm_reg_field::type_id::create("r_aliased_2",,get_full_name());
      this.r_aliased_2.configure(this, 15, 0, "RO", 0, 15'h74, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_r_aliased_2)

endclass : ral_reg_simple_ral_env_r_aliased_2


class ral_reg_simple_ral_env_master_index extends uvm_reg;
	rand uvm_reg_field master_index;

	function new(string name = "simple_ral_env_master_index");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.master_index = uvm_reg_field::type_id::create("master_index",,get_full_name());
      this.master_index.configure(this, 15, 0, "RW", 0, 15'h78, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_master_index)

endclass : ral_reg_simple_ral_env_master_index


class ral_reg_simple_ral_env_master_data extends uvm_reg;
	rand uvm_reg_field field_data;

	function new(string name = "simple_ral_env_master_data");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.field_data = uvm_reg_field::type_id::create("field_data",,get_full_name());
      this.field_data.configure(this, 32, 0, "RW", 0, 32'h00, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_simple_ral_env_master_data)

endclass : ral_reg_simple_ral_env_master_data


class ral_block_simple_ral_env extends uvm_reg_block;
	rand ral_reg_simple_ral_env_CHIP_ID CHIP_ID;
	rand ral_reg_simple_ral_env_r_RO_register r_RO_register;
	rand ral_reg_simple_ral_env_r_RW_register r_RW_register;
	rand ral_reg_simple_ral_env_r_RC_register r_RC_register;
	rand ral_reg_simple_ral_env_r_RS_register r_RS_register;
	rand ral_reg_simple_ral_env_r_WRC_register r_WRC_register;
	rand ral_reg_simple_ral_env_r_WRS_register r_WRS_register;
	rand ral_reg_simple_ral_env_r_WC_register r_WC_register;
	rand ral_reg_simple_ral_env_r_WS_register r_WS_register;
	rand ral_reg_simple_ral_env_r_WSRC_register r_WSRC_register;
	rand ral_reg_simple_ral_env_r_WCRS_register r_WCRS_register;
	rand ral_reg_simple_ral_env_r_W1C_register r_W1C_register;
	rand ral_reg_simple_ral_env_r_W1S_register r_W1S_register;
	rand ral_reg_simple_ral_env_r_W1T_register r_W1T_register;
	rand ral_reg_simple_ral_env_r_W0C_register r_W0C_register;
	rand ral_reg_simple_ral_env_r_W0S_register r_W0S_register;
	rand ral_reg_simple_ral_env_r_W0T_register r_W0T_register;
	rand ral_reg_simple_ral_env_r_W1SRC_register r_W1SRC_register;
	rand ral_reg_simple_ral_env_r_W1CRS_register r_W1CRS_register;
	rand ral_reg_simple_ral_env_r_W0SRC_register r_W0SRC_register;
	rand ral_reg_simple_ral_env_r_W0CRS_register r_W0CRS_register;
	rand ral_reg_simple_ral_env_r_WO_register r_WO_register;
	rand ral_reg_simple_ral_env_r_WOC_register r_WOC_register;
	rand ral_reg_simple_ral_env_r_WOS_register r_WOS_register;
	rand ral_reg_simple_ral_env_r_W1_register r_W1_register;
	rand ral_reg_simple_ral_env_r_WO1_register r_WO1_register;
	rand ral_reg_simple_ral_env_r_aliased_1 r_aliased_1;
	rand ral_reg_simple_ral_env_r_aliased_2 r_aliased_2;
	rand ral_reg_simple_ral_env_master_index master_index;
	rand ral_reg_simple_ral_env_master_data master_data;
	uvm_reg_field CHIP_ID_REVISION_ID;
	uvm_reg_field REVISION_ID;
	uvm_reg_field CHIP_ID_CHIP_ID;
	uvm_reg_field CHIP_ID_PRODUCT_ID;
	uvm_reg_field PRODUCT_ID;
	uvm_reg_field r_RO_register_r_RO_field;
	uvm_reg_field r_RO_field;
	rand uvm_reg_field r_RW_register_r_RW_field;
	rand uvm_reg_field r_RW_field;
	rand uvm_reg_field r_RC_register_r_RC_field;
	rand uvm_reg_field r_RC_field;
	rand uvm_reg_field r_RS_register_r_RS_field;
	rand uvm_reg_field r_RS_field;
	rand uvm_reg_field r_WRC_register_r_WRC_field;
	rand uvm_reg_field r_WRC_field;
	rand uvm_reg_field r_WRS_register_r_WRS_field;
	rand uvm_reg_field r_WRS_field;
	rand uvm_reg_field r_WC_register_r_WC_field;
	rand uvm_reg_field r_WC_field;
	rand uvm_reg_field r_WS_register_r_WS_field;
	rand uvm_reg_field r_WS_field;
	rand uvm_reg_field r_WSRC_register_r_WSRC_field;
	rand uvm_reg_field r_WSRC_field;
	rand uvm_reg_field r_WCRS_register_r_WCRS_field;
	rand uvm_reg_field r_WCRS_field;
	rand uvm_reg_field r_W1C_register_r_W1C_field;
	rand uvm_reg_field r_W1C_field;
	rand uvm_reg_field r_W1S_register_r_W1S_field;
	rand uvm_reg_field r_W1S_field;
	rand uvm_reg_field r_W1T_register_r_W1T_field;
	rand uvm_reg_field r_W1T_field;
	rand uvm_reg_field r_W0C_register_r_W0C_field;
	rand uvm_reg_field r_W0C_field;
	rand uvm_reg_field r_W0S_register_r_W0S_field;
	rand uvm_reg_field r_W0S_field;
	rand uvm_reg_field r_W0T_register_r_W0T_field;
	rand uvm_reg_field r_W0T_field;
	rand uvm_reg_field r_W1SRC_register_r_W1SRC_field;
	rand uvm_reg_field r_W1SRC_field;
	rand uvm_reg_field r_W1CRS_register_r_W1CRS_field;
	rand uvm_reg_field r_W1CRS_field;
	rand uvm_reg_field r_W0SRC_register_r_W0SRC_field;
	rand uvm_reg_field r_W0SRC_field;
	rand uvm_reg_field r_W0CRS_register_r_W0CRS_field;
	rand uvm_reg_field r_W0CRS_field;
	rand uvm_reg_field r_WO_register_r_WO_field;
	rand uvm_reg_field r_WO_field;
	rand uvm_reg_field r_WOC_register_r_WOC_field;
	rand uvm_reg_field r_WOC_field;
	rand uvm_reg_field r_WOS_register_r_WOS_field;
	rand uvm_reg_field r_WOS_field;
	rand uvm_reg_field r_W1_register_r_W1_field;
	rand uvm_reg_field r_W1_field;
	rand uvm_reg_field r_WO1_register_r_WO1_field;
	rand uvm_reg_field r_WO1_field;
	rand uvm_reg_field r_aliased_1_r_aliased_1;
	uvm_reg_field r_aliased_2_r_aliased_2;
	rand uvm_reg_field master_index_master_index;
	rand uvm_reg_field master_data_field_data;
	rand uvm_reg_field field_data;

	function new(string name = "simple_ral_env");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.CHIP_ID = ral_reg_simple_ral_env_CHIP_ID::type_id::create("CHIP_ID",,get_full_name());
      this.CHIP_ID.configure(this, null, "");
      this.CHIP_ID.build();
         this.CHIP_ID.add_hdl_path('{

            '{"CHIP_ID", -1, -1}
         });
      this.default_map.add_reg(this.CHIP_ID, `UVM_REG_ADDR_WIDTH'h0, "RO", 0);
		this.CHIP_ID_REVISION_ID = this.CHIP_ID.REVISION_ID;
		this.REVISION_ID = this.CHIP_ID.REVISION_ID;
		this.CHIP_ID_CHIP_ID = this.CHIP_ID.CHIP_ID;
		this.CHIP_ID_PRODUCT_ID = this.CHIP_ID.PRODUCT_ID;
		this.PRODUCT_ID = this.CHIP_ID.PRODUCT_ID;
      this.r_RO_register = ral_reg_simple_ral_env_r_RO_register::type_id::create("r_RO_register",,get_full_name());
      this.r_RO_register.configure(this, null, "");
      this.r_RO_register.build();
         this.r_RO_register.add_hdl_path('{

            '{"r_RO_register", -1, -1}
         });
      this.default_map.add_reg(this.r_RO_register, `UVM_REG_ADDR_WIDTH'hC, "RO", 0);
		this.r_RO_register_r_RO_field = this.r_RO_register.r_RO_field;
		this.r_RO_field = this.r_RO_register.r_RO_field;
      this.r_RW_register = ral_reg_simple_ral_env_r_RW_register::type_id::create("r_RW_register",,get_full_name());
      this.r_RW_register.configure(this, null, "");
      this.r_RW_register.build();
         this.r_RW_register.add_hdl_path('{

            '{"r_RW_register", -1, -1}
         });
      this.default_map.add_reg(this.r_RW_register, `UVM_REG_ADDR_WIDTH'h10, "RW", 0);
		this.r_RW_register_r_RW_field = this.r_RW_register.r_RW_field;
		this.r_RW_field = this.r_RW_register.r_RW_field;
      this.r_RC_register = ral_reg_simple_ral_env_r_RC_register::type_id::create("r_RC_register",,get_full_name());
      this.r_RC_register.configure(this, null, "");
      this.r_RC_register.build();
         this.r_RC_register.add_hdl_path('{

            '{"r_RC_register", -1, -1}
         });
      this.default_map.add_reg(this.r_RC_register, `UVM_REG_ADDR_WIDTH'h14, "RW", 0);
		this.r_RC_register_r_RC_field = this.r_RC_register.r_RC_field;
		this.r_RC_field = this.r_RC_register.r_RC_field;
      this.r_RS_register = ral_reg_simple_ral_env_r_RS_register::type_id::create("r_RS_register",,get_full_name());
      this.r_RS_register.configure(this, null, "");
      this.r_RS_register.build();
         this.r_RS_register.add_hdl_path('{

            '{"r_RS_register", -1, -1}
         });
      this.default_map.add_reg(this.r_RS_register, `UVM_REG_ADDR_WIDTH'h18, "RW", 0);
		this.r_RS_register_r_RS_field = this.r_RS_register.r_RS_field;
		this.r_RS_field = this.r_RS_register.r_RS_field;
      this.r_WRC_register = ral_reg_simple_ral_env_r_WRC_register::type_id::create("r_WRC_register",,get_full_name());
      this.r_WRC_register.configure(this, null, "");
      this.r_WRC_register.build();
         this.r_WRC_register.add_hdl_path('{

            '{"r_WRC_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WRC_register, `UVM_REG_ADDR_WIDTH'h1C, "RW", 0);
		this.r_WRC_register_r_WRC_field = this.r_WRC_register.r_WRC_field;
		this.r_WRC_field = this.r_WRC_register.r_WRC_field;
      this.r_WRS_register = ral_reg_simple_ral_env_r_WRS_register::type_id::create("r_WRS_register",,get_full_name());
      this.r_WRS_register.configure(this, null, "");
      this.r_WRS_register.build();
         this.r_WRS_register.add_hdl_path('{

            '{"r_WRS_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WRS_register, `UVM_REG_ADDR_WIDTH'h20, "RW", 0);
		this.r_WRS_register_r_WRS_field = this.r_WRS_register.r_WRS_field;
		this.r_WRS_field = this.r_WRS_register.r_WRS_field;
      this.r_WC_register = ral_reg_simple_ral_env_r_WC_register::type_id::create("r_WC_register",,get_full_name());
      this.r_WC_register.configure(this, null, "");
      this.r_WC_register.build();
         this.r_WC_register.add_hdl_path('{

            '{"r_WC_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WC_register, `UVM_REG_ADDR_WIDTH'h24, "RW", 0);
		this.r_WC_register_r_WC_field = this.r_WC_register.r_WC_field;
		this.r_WC_field = this.r_WC_register.r_WC_field;
      this.r_WS_register = ral_reg_simple_ral_env_r_WS_register::type_id::create("r_WS_register",,get_full_name());
      this.r_WS_register.configure(this, null, "");
      this.r_WS_register.build();
         this.r_WS_register.add_hdl_path('{

            '{"r_WS_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WS_register, `UVM_REG_ADDR_WIDTH'h28, "RW", 0);
		this.r_WS_register_r_WS_field = this.r_WS_register.r_WS_field;
		this.r_WS_field = this.r_WS_register.r_WS_field;
      this.r_WSRC_register = ral_reg_simple_ral_env_r_WSRC_register::type_id::create("r_WSRC_register",,get_full_name());
      this.r_WSRC_register.configure(this, null, "");
      this.r_WSRC_register.build();
         this.r_WSRC_register.add_hdl_path('{

            '{"r_WSRC_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WSRC_register, `UVM_REG_ADDR_WIDTH'h2C, "RW", 0);
		this.r_WSRC_register_r_WSRC_field = this.r_WSRC_register.r_WSRC_field;
		this.r_WSRC_field = this.r_WSRC_register.r_WSRC_field;
      this.r_WCRS_register = ral_reg_simple_ral_env_r_WCRS_register::type_id::create("r_WCRS_register",,get_full_name());
      this.r_WCRS_register.configure(this, null, "");
      this.r_WCRS_register.build();
         this.r_WCRS_register.add_hdl_path('{

            '{"r_WCRS_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WCRS_register, `UVM_REG_ADDR_WIDTH'h30, "RW", 0);
		this.r_WCRS_register_r_WCRS_field = this.r_WCRS_register.r_WCRS_field;
		this.r_WCRS_field = this.r_WCRS_register.r_WCRS_field;
      this.r_W1C_register = ral_reg_simple_ral_env_r_W1C_register::type_id::create("r_W1C_register",,get_full_name());
      this.r_W1C_register.configure(this, null, "");
      this.r_W1C_register.build();
         this.r_W1C_register.add_hdl_path('{

            '{"r_W1C_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W1C_register, `UVM_REG_ADDR_WIDTH'h34, "RW", 0);
		this.r_W1C_register_r_W1C_field = this.r_W1C_register.r_W1C_field;
		this.r_W1C_field = this.r_W1C_register.r_W1C_field;
      this.r_W1S_register = ral_reg_simple_ral_env_r_W1S_register::type_id::create("r_W1S_register",,get_full_name());
      this.r_W1S_register.configure(this, null, "");
      this.r_W1S_register.build();
         this.r_W1S_register.add_hdl_path('{

            '{"r_W1S_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W1S_register, `UVM_REG_ADDR_WIDTH'h38, "RW", 0);
		this.r_W1S_register_r_W1S_field = this.r_W1S_register.r_W1S_field;
		this.r_W1S_field = this.r_W1S_register.r_W1S_field;
      this.r_W1T_register = ral_reg_simple_ral_env_r_W1T_register::type_id::create("r_W1T_register",,get_full_name());
      this.r_W1T_register.configure(this, null, "");
      this.r_W1T_register.build();
         this.r_W1T_register.add_hdl_path('{

            '{"r_W1T_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W1T_register, `UVM_REG_ADDR_WIDTH'h3C, "RW", 0);
		this.r_W1T_register_r_W1T_field = this.r_W1T_register.r_W1T_field;
		this.r_W1T_field = this.r_W1T_register.r_W1T_field;
      this.r_W0C_register = ral_reg_simple_ral_env_r_W0C_register::type_id::create("r_W0C_register",,get_full_name());
      this.r_W0C_register.configure(this, null, "");
      this.r_W0C_register.build();
         this.r_W0C_register.add_hdl_path('{

            '{"r_W0C_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W0C_register, `UVM_REG_ADDR_WIDTH'h40, "RW", 0);
		this.r_W0C_register_r_W0C_field = this.r_W0C_register.r_W0C_field;
		this.r_W0C_field = this.r_W0C_register.r_W0C_field;
      this.r_W0S_register = ral_reg_simple_ral_env_r_W0S_register::type_id::create("r_W0S_register",,get_full_name());
      this.r_W0S_register.configure(this, null, "");
      this.r_W0S_register.build();
         this.r_W0S_register.add_hdl_path('{

            '{"r_W0S_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W0S_register, `UVM_REG_ADDR_WIDTH'h44, "RW", 0);
		this.r_W0S_register_r_W0S_field = this.r_W0S_register.r_W0S_field;
		this.r_W0S_field = this.r_W0S_register.r_W0S_field;
      this.r_W0T_register = ral_reg_simple_ral_env_r_W0T_register::type_id::create("r_W0T_register",,get_full_name());
      this.r_W0T_register.configure(this, null, "");
      this.r_W0T_register.build();
         this.r_W0T_register.add_hdl_path('{

            '{"r_W0T_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W0T_register, `UVM_REG_ADDR_WIDTH'h48, "RW", 0);
		this.r_W0T_register_r_W0T_field = this.r_W0T_register.r_W0T_field;
		this.r_W0T_field = this.r_W0T_register.r_W0T_field;
      this.r_W1SRC_register = ral_reg_simple_ral_env_r_W1SRC_register::type_id::create("r_W1SRC_register",,get_full_name());
      this.r_W1SRC_register.configure(this, null, "");
      this.r_W1SRC_register.build();
         this.r_W1SRC_register.add_hdl_path('{

            '{"r_W1SRC_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W1SRC_register, `UVM_REG_ADDR_WIDTH'h4C, "RW", 0);
		this.r_W1SRC_register_r_W1SRC_field = this.r_W1SRC_register.r_W1SRC_field;
		this.r_W1SRC_field = this.r_W1SRC_register.r_W1SRC_field;
      this.r_W1CRS_register = ral_reg_simple_ral_env_r_W1CRS_register::type_id::create("r_W1CRS_register",,get_full_name());
      this.r_W1CRS_register.configure(this, null, "");
      this.r_W1CRS_register.build();
         this.r_W1CRS_register.add_hdl_path('{

            '{"r_W1CRS_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W1CRS_register, `UVM_REG_ADDR_WIDTH'h50, "RW", 0);
		this.r_W1CRS_register_r_W1CRS_field = this.r_W1CRS_register.r_W1CRS_field;
		this.r_W1CRS_field = this.r_W1CRS_register.r_W1CRS_field;
      this.r_W0SRC_register = ral_reg_simple_ral_env_r_W0SRC_register::type_id::create("r_W0SRC_register",,get_full_name());
      this.r_W0SRC_register.configure(this, null, "");
      this.r_W0SRC_register.build();
         this.r_W0SRC_register.add_hdl_path('{

            '{"r_W0SRC_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W0SRC_register, `UVM_REG_ADDR_WIDTH'h54, "RW", 0);
		this.r_W0SRC_register_r_W0SRC_field = this.r_W0SRC_register.r_W0SRC_field;
		this.r_W0SRC_field = this.r_W0SRC_register.r_W0SRC_field;
      this.r_W0CRS_register = ral_reg_simple_ral_env_r_W0CRS_register::type_id::create("r_W0CRS_register",,get_full_name());
      this.r_W0CRS_register.configure(this, null, "");
      this.r_W0CRS_register.build();
         this.r_W0CRS_register.add_hdl_path('{

            '{"r_W0CRS_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W0CRS_register, `UVM_REG_ADDR_WIDTH'h58, "RW", 0);
		this.r_W0CRS_register_r_W0CRS_field = this.r_W0CRS_register.r_W0CRS_field;
		this.r_W0CRS_field = this.r_W0CRS_register.r_W0CRS_field;
      this.r_WO_register = ral_reg_simple_ral_env_r_WO_register::type_id::create("r_WO_register",,get_full_name());
      this.r_WO_register.configure(this, null, "");
      this.r_WO_register.build();
         this.r_WO_register.add_hdl_path('{

            '{"r_WO_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WO_register, `UVM_REG_ADDR_WIDTH'h5C, "RW", 0);
		this.r_WO_register_r_WO_field = this.r_WO_register.r_WO_field;
		this.r_WO_field = this.r_WO_register.r_WO_field;
      this.r_WOC_register = ral_reg_simple_ral_env_r_WOC_register::type_id::create("r_WOC_register",,get_full_name());
      this.r_WOC_register.configure(this, null, "");
      this.r_WOC_register.build();
         this.r_WOC_register.add_hdl_path('{

            '{"r_WOC_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WOC_register, `UVM_REG_ADDR_WIDTH'h60, "RW", 0);
		this.r_WOC_register_r_WOC_field = this.r_WOC_register.r_WOC_field;
		this.r_WOC_field = this.r_WOC_register.r_WOC_field;
      this.r_WOS_register = ral_reg_simple_ral_env_r_WOS_register::type_id::create("r_WOS_register",,get_full_name());
      this.r_WOS_register.configure(this, null, "");
      this.r_WOS_register.build();
         this.r_WOS_register.add_hdl_path('{

            '{"r_WOS_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WOS_register, `UVM_REG_ADDR_WIDTH'h64, "RW", 0);
		this.r_WOS_register_r_WOS_field = this.r_WOS_register.r_WOS_field;
		this.r_WOS_field = this.r_WOS_register.r_WOS_field;
      this.r_W1_register = ral_reg_simple_ral_env_r_W1_register::type_id::create("r_W1_register",,get_full_name());
      this.r_W1_register.configure(this, null, "");
      this.r_W1_register.build();
         this.r_W1_register.add_hdl_path('{

            '{"r_W1_register", -1, -1}
         });
      this.default_map.add_reg(this.r_W1_register, `UVM_REG_ADDR_WIDTH'h68, "RW", 0);
		this.r_W1_register_r_W1_field = this.r_W1_register.r_W1_field;
		this.r_W1_field = this.r_W1_register.r_W1_field;
      this.r_WO1_register = ral_reg_simple_ral_env_r_WO1_register::type_id::create("r_WO1_register",,get_full_name());
      this.r_WO1_register.configure(this, null, "");
      this.r_WO1_register.build();
         this.r_WO1_register.add_hdl_path('{

            '{"r_WO1_register", -1, -1}
         });
      this.default_map.add_reg(this.r_WO1_register, `UVM_REG_ADDR_WIDTH'h6C, "RW", 0);
		this.r_WO1_register_r_WO1_field = this.r_WO1_register.r_WO1_field;
		this.r_WO1_field = this.r_WO1_register.r_WO1_field;
      this.r_aliased_1 = ral_reg_simple_ral_env_r_aliased_1::type_id::create("r_aliased_1",,get_full_name());
      this.r_aliased_1.configure(this, null, "");
      this.r_aliased_1.build();
      this.default_map.add_reg(this.r_aliased_1, `UVM_REG_ADDR_WIDTH'h70, "RW", 0);
		this.r_aliased_1_r_aliased_1 = this.r_aliased_1.r_aliased_1;
      this.r_aliased_2 = ral_reg_simple_ral_env_r_aliased_2::type_id::create("r_aliased_2",,get_full_name());
      this.r_aliased_2.configure(this, null, "");
      this.r_aliased_2.build();
      this.default_map.add_reg(this.r_aliased_2, `UVM_REG_ADDR_WIDTH'h74, "RO", 0);
		this.r_aliased_2_r_aliased_2 = this.r_aliased_2.r_aliased_2;
      this.master_index = ral_reg_simple_ral_env_master_index::type_id::create("master_index",,get_full_name());
      this.master_index.configure(this, null, "");
      this.master_index.build();
      this.default_map.add_reg(this.master_index, `UVM_REG_ADDR_WIDTH'h78, "RW", 0);
		this.master_index_master_index = this.master_index.master_index;
      this.master_data = ral_reg_simple_ral_env_master_data::type_id::create("master_data",,get_full_name());
      this.master_data.configure(this, null, "");
      this.master_data.build();
      this.default_map.add_reg(this.master_data, `UVM_REG_ADDR_WIDTH'h7C, "RW", 0);
		this.master_data_field_data = this.master_data.field_data;
		this.field_data = this.master_data.field_data;

		//
		// Setting up backdoor access...
		//
		begin
			ral_reg_simple_ral_env_CHIP_ID_bkdr bkdr = new(this.CHIP_ID.get_full_name());
			this.CHIP_ID.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_RO_register_bkdr bkdr = new(this.r_RO_register.get_full_name());
			this.r_RO_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_RW_register_bkdr bkdr = new(this.r_RW_register.get_full_name());
			this.r_RW_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_RC_register_bkdr bkdr = new(this.r_RC_register.get_full_name());
			this.r_RC_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_RS_register_bkdr bkdr = new(this.r_RS_register.get_full_name());
			this.r_RS_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WRC_register_bkdr bkdr = new(this.r_WRC_register.get_full_name());
			this.r_WRC_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WRS_register_bkdr bkdr = new(this.r_WRS_register.get_full_name());
			this.r_WRS_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WC_register_bkdr bkdr = new(this.r_WC_register.get_full_name());
			this.r_WC_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WS_register_bkdr bkdr = new(this.r_WS_register.get_full_name());
			this.r_WS_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WSRC_register_bkdr bkdr = new(this.r_WSRC_register.get_full_name());
			this.r_WSRC_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WCRS_register_bkdr bkdr = new(this.r_WCRS_register.get_full_name());
			this.r_WCRS_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W1C_register_bkdr bkdr = new(this.r_W1C_register.get_full_name());
			this.r_W1C_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W1S_register_bkdr bkdr = new(this.r_W1S_register.get_full_name());
			this.r_W1S_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W1T_register_bkdr bkdr = new(this.r_W1T_register.get_full_name());
			this.r_W1T_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W0C_register_bkdr bkdr = new(this.r_W0C_register.get_full_name());
			this.r_W0C_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W0S_register_bkdr bkdr = new(this.r_W0S_register.get_full_name());
			this.r_W0S_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W0T_register_bkdr bkdr = new(this.r_W0T_register.get_full_name());
			this.r_W0T_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W1SRC_register_bkdr bkdr = new(this.r_W1SRC_register.get_full_name());
			this.r_W1SRC_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W1CRS_register_bkdr bkdr = new(this.r_W1CRS_register.get_full_name());
			this.r_W1CRS_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W0SRC_register_bkdr bkdr = new(this.r_W0SRC_register.get_full_name());
			this.r_W0SRC_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W0CRS_register_bkdr bkdr = new(this.r_W0CRS_register.get_full_name());
			this.r_W0CRS_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WO_register_bkdr bkdr = new(this.r_WO_register.get_full_name());
			this.r_WO_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WOC_register_bkdr bkdr = new(this.r_WOC_register.get_full_name());
			this.r_WOC_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WOS_register_bkdr bkdr = new(this.r_WOS_register.get_full_name());
			this.r_WOS_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_W1_register_bkdr bkdr = new(this.r_W1_register.get_full_name());
			this.r_W1_register.set_backdoor(bkdr);
		end
		begin
			ral_reg_simple_ral_env_r_WO1_register_bkdr bkdr = new(this.r_WO1_register.get_full_name());
			this.r_WO1_register.set_backdoor(bkdr);
		end
   endfunction : build

	`uvm_object_utils(ral_block_simple_ral_env)

endclass : ral_block_simple_ral_env



`endif
