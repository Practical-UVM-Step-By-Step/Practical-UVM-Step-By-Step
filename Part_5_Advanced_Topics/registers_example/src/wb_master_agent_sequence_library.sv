typedef class wb_transaction;

class wb_master_seqr_sequence_library extends uvm_sequence_library # (wb_transaction);
  `uvm_sequence_library_utils(wb_master_seqr_sequence_library)

  function new(string name = "simple_seq_lib");
    super.new(name);
    init_sequence_library();
  endfunction

endclass  

class base_sequence extends uvm_sequence #(wb_transaction);
  `uvm_object_utils(base_sequence)

  `uvm_declare_p_sequencer(wb_master_seqr)
  function new(string name = "base_seq");
    super.new(name);

  endfunction:new
  virtual task pre_body(); uvm_phase phase_=get_starting_phase();

    if (phase_ != null)
      phase_.raise_objection(this);
  endtask:pre_body
  virtual task post_body(); 


	uvm_phase phase_=get_starting_phase();

    if (phase_!= null)
      phase_.drop_objection(this);
  endtask:post_body
endclass


class sequence_reg_basic extends base_sequence;
  `uvm_object_utils(sequence_reg_basic)
  `uvm_add_to_seq_lib(sequence_reg_basic,wb_master_seqr_sequence_library)
  function new(string name = "seq_0");
    super.new(name);
  endfunction:new
  virtual task body();
uvm_reg_data_t reg_data;
uvm_status_e reg_status;

//         p_sequencer.regmodel.MODER.write(.status(reg_status),.path(UVM_FRONTDOOR), .parent(this),.value(32'h00002403));

$display("hello there");	
    repeat(2) begin
     `uvm_do(req);
    end
   start_item(req);
   finish_item(req);
  endtask

endclass
/*
class uvm_reg_single_all_access_seq extends uvm_reg_sequence #(uvm_sequence #(uvm_reg_item));

   // Variable: rg
   // The register to be tested
   uvm_reg rg;
   ral_block_simple_ral_env regmodel;
	string regname_string;


   uvm_status_e status;
   uvm_reg_data_t  read_val, write_val, set_val, mirror_val, get_val, peek_val, poke_val;
   uvm_reg_data_t  peek_bkup_1, read_bkup1;

   `uvm_object_utils(uvm_reg_single_all_access_seq)

   function new(string name="uvm_reg_single_access_seq");
     super.new(name);
   endfunction

	task body() ;
	 uvm_resource_db#(string)::read_by_name("reg_seq","regname_string",regname_string,this);

	if(rg == null) `uvm_fatal(get_full_name(),{regname_string ," register not found"})
	rg = regmodel.get_reg_by_name(regname_string);

	  rg.read(.status(status), .value(read_val), .path(UVM_FRONTDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),"  When performing FrontDoor Read() from ",rg.get_full_name()}, UVM_LOW)

	`uvm_info(get_full_name(),$psprintf("BEFORE Read Value : %08h\nWrite Value %08h \nSet Value: %08h\n MirrorValue:%08h\n GetValue : %08h", read_val, write_val, set_val, mirror_val, get_val, peek_val, poke_val),UVM_LOW);

	  rg.peek(.status(status), .value(peek_val), .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),"  When performing peek() from ",rg.get_full_name()}, UVM_LOW)
       
	  rg.poke(.status(status), .value(poke_val), .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),  "  When performing poke() from ",rg.get_full_name()}, UVM_LOW)


	  rg.peek(.status(status), .value(peek_val),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was ", status.name(),"  When performing peek() from ",rg.get_full_name()}, UVM_LOW)


	  rg.peek(.status(status), .value(peek_val),   .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),"  When performing peek() from ",rg.get_full_name()}, UVM_LOW)

	  rg.read(.status(status), .value(read_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),"  When performing Backdoor read () from ",rg.get_full_name()}, UVM_LOW)

	  rg.write(.status(status), .value(write_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),"  When performing backdoor write() from ",rg.get_full_name()}, UVM_LOW)

	  rg.read(.status(status), .value(read_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),"  When performing Backdoor read () from ",rg.get_full_name()}, UVM_LOW)

	  rg.write(.status(status), .value(write_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),"  When performing Backdoor write () from ",rg.get_full_name()}, UVM_LOW)

	  rg.read(.status(status), .value(read_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , {"Status was  ", status.name(),"  When performing Backdoor read () from ",rg.get_full_name()}, UVM_LOW)

	`uvm_info(get_full_name(),$psprintf("AFTER Read Value : %08h\nWrite Value %08h \nSet Value: %08h\n MirrorValue:%08h\n GetValue : %08h", read_val, write_val, set_val, mirror_val, get_val, peek_val, poke_val),UVM_LOW);

	endtask



endclass
*/
class uvm_reg_single_all_access_seq_resdb extends uvm_reg_sequence #(uvm_sequence #(uvm_reg_item));

   // Variable: rg
   // The register to be tested
   uvm_reg rg;
   ral_block_simple_ral_env regmodel;
string regname_string;


   uvm_status_e status;
   uvm_reg_data_t  read_val, write_val, set_val, mirror_val, get_val, peek_val, poke_val;
   uvm_reg_data_t  peek_bkup_1, read_bkup1;

   `uvm_object_utils(uvm_reg_single_all_access_seq_resdb)

   function new(string name="uvm_reg_single_access_seq");
     super.new(name);
   endfunction

	task body() ;
 	string s1;

	 uvm_resource_db#(string)::read_by_name("reg_seq","regname_string",regname_string,this);

	$display("name of path %s : %s",this.get_full_name(), regname_string);


	rg = regmodel.get_reg_by_name(regname_string);
       write_val = 32'hdeadbeef;
       set_val = 32'hbeefdead;
       poke_val = 32'haaaabbbb;
	

 	if(rg == null) `uvm_fatal(get_full_name(),{regname_string ," register not found"})


	`uvm_info(get_full_name(),$psprintf("BEFORE Read Value : %08h\nWrite Value %08h \nSet Value: %08h\n MirrorValue:%08h\n GetValue : %08h\n", read_val, write_val, set_val, mirror_val, get_val, peek_val, poke_val),UVM_LOW);

	  rg.peek(.status(status), .value(peek_val), .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing peek() from %s peek_value = %x",status.name(), rg.get_full_name(),peek_val),UVM_LOW)

	  rg.poke(.status(status), .value(poke_val), .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing poke() from %s poke_value = %x",status.name(), rg.get_full_name(),poke_val),UVM_LOW)


	  rg.peek(.status(status), .value(peek_val),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing peek() from %s peek_value = %x",status.name(), rg.get_full_name(),peek_val),UVM_LOW)

	  rg.read(.status(status), .value(read_val), .path(UVM_FRONTDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing read() from %s read_value = %x",status.name(), rg.get_full_name(),read_val),UVM_LOW)


	  rg.peek(.status(status), .value(peek_val),   .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing peek() from %s peek_value = %x",status.name(), rg.get_full_name(),peek_val),UVM_LOW)


	  rg.write(.status(status), .value(write_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing FRONTDOOR write() from %s write_value = %x",status.name(), rg.get_full_name(),write_val),UVM_LOW)


	  rg.peek(.status(status), .value(peek_val),   .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing peek() from %s peek_value = %x",status.name(), rg.get_full_name(),peek_val),UVM_LOW)

	  rg.poke(.status(status), .value(poke_val), .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing poke() from %s poke_value = %x",status.name(), rg.get_full_name(),poke_val),UVM_LOW)
 		mirror_val = rg.get_mirrored_value();
	`uvm_info(get_full_name(),$psprintf("BEFORE Read Value : %08h\nWrite Value %08h \nSet Value: %08h\n MirrorValue:%08h\n GetValue : %08h\n", read_val, write_val, set_val, mirror_val, get_val, peek_val, poke_val),UVM_LOW);

	  rg.read(.status(status), .value(read_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing BACKDOOR read() from %s read_value = %x",status.name(), rg.get_full_name(),read_val),UVM_LOW)

	  rg.write(.status(status), .value(write_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing BACKDOOR WRITE() from %s write_value = %x",status.name(), rg.get_full_name(),write_val),UVM_LOW)

	  rg.read(.status(status), .value(read_val), .path(UVM_BACKDOOR),  .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing BACKDOOR READ() from %s write_value = %x",status.name(), rg.get_full_name(),read_val),UVM_LOW)

	  rg.peek(.status(status), .value(peek_val),   .parent(this));
	`uvm_info("uvm_reg_single_all_access_seq" , $psprintf("Status was %s when performing peek() from %s peek_value = %x",status.name(), rg.get_full_name(),peek_val),UVM_LOW)
	 // mirror_val =   rg.get_mirrored_value("r_R_field");
	`uvm_info(get_full_name(),$psprintf("AFTER Read Value : %08h\nWrite Value %08h \nSet Value: %08h\n MirrorValue:%08h\n GetValue : %08h\n", read_val, write_val, set_val, mirror_val, get_val, peek_val, poke_val),UVM_LOW);

	
// 	`uvm_info("uvm_reg_single_all_access_seq_resdb" , {" Mirrored value was : ", $psprintf("%d",rg.get_mirrored_value())}, UVM_LOW)
	endtask



endclass
