`include "my_env_pkg.sv"
module top;
   import uvm_pkg::*;
   import my_env_pkg::*;

   my_env topenv;


   logic unsigned [4095:0] my_int;
   string my_string;

   initial begin
      //set configuration prior to creating the environment
      uvm_config_db #(uvm_bitstream_t)::set(null,"topenv.inst1.u1", "v", 30);
      uvm_config_db #(uvm_bitstream_t)::set(null,"topenv.instB.u1", "v", 10);

      // These are here for YOU TO TRY OUT
      //   uvm_config_db #(uvm_bitstream_t)::set(null,"/a+b/", "s", 11); 
      //   uvm_config_db #(uvm_bitstream_t)::set(null,"/ab?d/", "s", 21); 
      // uvm_config_db #(uvm_bitstream_t)::set(null,"/abc|def/", "s", 41); 
      //  uvm_config_db #(uvm_bitstream_t)::set(null,"/^(a){2}/", "s", 11); 
      //   uvm_config_db #(uvm_bitstream_t)::set(null,"/ca?b/", "v", 22); 
      uvm_config_db #(uvm_bitstream_t)::set(null,"/a{2,3}b.u1/", "s", 11); 
      uvm_config_db #(uvm_bitstream_t)::set(null,"/a{2,}b.u1/", "v", 15); 


      // Set the value of V to 30 for tom05 to tom07
      // uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom0[5-7*]\.u1/", "v", 30);
      // uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.to(m){4}*\.u1/", "v", 22);

      // uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom0[^0-2.]\.u1/", "v", 8); 

      // This one should not match tommm10.u1
      // uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tommmm1[1-2*]\.u1/", "v", 11); 


      // This one should match all of the 4 tommmm values
      //      uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.to(m){4}*\.u1/", "v", 22); // Doesnt work.
      //    uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.TOMMmm[15-19]*\.u1/", "v", 30); 

      /* This line will set the value of V in all the instances named TOMMMM which is basically instances
       inst_arr[15] through inst_arr[19]. None of the others should be affected.
       //  uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.TOMMMM.*\.u1/", "v", 10); 

       uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.to(m){4}*\.u1/", "v", 22);
       uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom{4}*\.u1/", "v", 22);

       //   uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.TOM\{1,4\}.0[^0-2.]\.u1/", "v", 90); 
       //  uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom{4}*\.u1/", "v", 22);
       //     uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom0[^0-2.]\.u1/", "v", 8); 
       //  uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom{4}*\.u1/", "v", 22);
       // uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom+[0-1.][^0-2.]\.u1/", "v", 8); 
       //  uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom{4}*\.u1/", "v", 22);
       */
      // need to try alternation
      //uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom0[^0-2.]\.u1/", "v", 8); 
      // uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.t(omm){3}[1*].\.u1/", "s", 42);
      uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.t(omm){2,}[1*].\.u1/", "s", 62);
      uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.tom(m){2,}[1*].\.u1/", "v", 52);
      //uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.to(m){3,}\.u1/", "v", 22);
      //uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.to(m){2,}\.u1/", "v", 32);
      //uvm_config_db #(uvm_bitstream_t)::set(null,"/topenv\.TOMMmm.*\.u1/", "v", 80); 
      topenv = new("topenv", null);
      run_test();


   end

endmodule
