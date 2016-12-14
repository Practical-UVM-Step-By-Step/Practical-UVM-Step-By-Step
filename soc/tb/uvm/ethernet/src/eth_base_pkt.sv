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

`ifndef ETH_BASE_PKT__SV
 `define ETH_BASE_PKT__SV

 `define MCAST_ADD_VAL  48'h81_81_81_81_81_81
 `define MCAST_ADD_INV  48'h81_00_00_00_00_81
 `define UCAST_ADD_VAL  48'h00_ff_00_ff_00_ff
 `define UCAST_ADD_INV  48'h00_ff_ff_ff_ff_00
 `define MCAST_PAUSE_ADD 48'h01_80_c2_00_00_01
 `define MAX_NUM_OF_VLANS 4
 `define SA_ADD     48'h00_00_00_00_00_00
 `define SEED 0
 `ifndef PACK 
  `define SHOW 0
 `else   
  `define SHOW 1
 `endif

class eth_base_pkt extends uvm_sequence_item;

   typedef enum {MCAST_VALID,MCAST_INVALID,UCAST_VALID,UCAST_INVALID,BCAST}DA_e      ;
   typedef enum {LENGTH,JUMBO,PAUSE,CNTRL}                                 TYPE_e    ;
   typedef enum {SVLAN,VLAN,MVLAN,NOTAG}                                   TAG_e     ;
   typedef enum {LES_46,EQL_46,BW_47_TO_1500,GTR_1536,LEN_INVALID}         LENGTH_e  ;
   typedef enum {TIME_ZERO,TIME_FFFF,TIME_RAND}                            TIME_e    ;
   typedef enum {LEN_GOOD,LEN_BAD}                                         LENERR_e  ; 
   typedef enum {RANDTYPE,ZERO}                                            PAYLOAD_e ; 
   typedef enum {FCS_GOOD,FCS_BAD}                 FCS_e    ;

   rand DA_e       DA_t    ;
   rand FCS_e       FCS_t    ;
   rand TAG_e      TAG_t   ;
   rand TYPE_e     TYPE_t  ;
   rand LENGTH_e   LENGTH_t;
   rand TIME_e     TIME_t  ;
   rand LENERR_e   LENERR_t;
   
   rand integer Num_Of_Vlans;
   rand integer lenght;
   static integer No;
   integer 	  Pkt_No;
   bit [7:0] 	  Pkt_Packed [];
   bit [7:0] 	  data [$];
   bit [31 :0] 	  Crc;
   bit [31:0] 	  Table [256];
      PAYLOAD_e PAYLOAD_t; 
      
      constraint lenght_c {
	 if  ((TYPE_t == LENGTH )& LENGTH_t == LES_46)       {lenght  inside  { [1 :45]};     }      
	 else if  ((TYPE_t == LENGTH )& LENGTH_t == EQL_46)       {lenght == 46 ;           }       
	 else if  ((TYPE_t == LENGTH )& LENGTH_t == BW_47_TO_1500){lenght  inside { [47 :1500]};  } 
	 else if  ((TYPE_t == LENGTH )& LENGTH_t == GTR_1536)     {lenght  inside { [1536 :1636]};}       
	 else if  ((TYPE_t == LENGTH )& LENGTH_t == LEN_INVALID)  {lenght  inside { [1501:1535]}; } 
	 else if  (TYPE_t == JUMBO & LENERR_t == LEN_GOOD)        {lenght  inside { [47 :9000]};    } 
	 else if  (TYPE_t == JUMBO & LENERR_t == LEN_BAD)        {lenght  inside { [1:46],[9001 :9999]}; }
	 else if  (TYPE_t == PAUSE & LENERR_t == LEN_GOOD )       {lenght  == 42 ;           }    
	 else if  (TYPE_t == PAUSE & LENERR_t == LEN_BAD  )       {lenght  inside {[1:41],[43:9999]};}       
	 else if  (TYPE_t == CNTRL & LENERR_t == LEN_GOOD )       {lenght  == 46 ;           }
	 else if  (TYPE_t == CNTRL & LENERR_t == LEN_BAD  )       {lenght  inside {[1:45],[47:9999]};}  }
      
      
      constraint len_c  {LENGTH_t dist {LES_46 := 15,EQL_46 := 5,BW_47_TO_1500 := 45,GTR_1536 := 15,LEN_INVALID := 15}; }
      constraint tag_c  {TAG_t dist {SVLAN := 25 ,VLAN := 20,MVLAN := 30,NOTAG := 25}; }
      constraint lenerr_c { LENERR_t dist {LEN_GOOD:= 70,LEN_BAD :=30};}
      constraint type_c { TYPE_t dist {LENGTH := 82,JUMBO := 3,PAUSE := 12,CNTRL := 3}; }
      constraint pausetime_c { if(TYPE_t == PAUSE ) TIME_t dist { TIME_ZERO := 10,TIME_FFFF := 10,TIME_RAND := 80}; }
      constraint vlans { if (TAG_t == MVLAN) {Num_Of_Vlans inside {[2 : `MAX_NUM_OF_VLANS] };}}
      
      

      // The UVM Macros to do some of the heavy lifting 
      
      `uvm_object_utils_begin(eth_base_pkt) 
	 `uvm_field_enum(DA_e,DA_t,UVM_ALL_ON)    
	 `uvm_field_enum(FCS_e,FCS_t,UVM_ALL_ON)    
	 `uvm_field_enum(TAG_e     , TAG_t  , UVM_ALL_ON) 
	 `uvm_field_enum(TYPE_e    , TYPE_t , UVM_ALL_ON) 
	 `uvm_field_enum(LENGTH_e  , LENGTH_t, UVM_ALL_ON)
	 `uvm_field_enum(TIME_e    , TIME_t , UVM_ALL_ON) 
	 `uvm_field_enum(LENERR_e  , LENERR_t, UVM_ALL_ON)
	 `uvm_field_int(Num_Of_Vlans, UVM_ALL_ON)
	 `uvm_field_int(lenght, UVM_ALL_ON)
	 `uvm_field_int(No, UVM_ALL_ON)
	 `uvm_field_int(Pkt_No, UVM_ALL_ON)
	 `uvm_field_array_int(Pkt_Packed,UVM_ALL_ON)
	 `uvm_field_queue_int(data,UVM_ALL_ON)
	 `uvm_field_sarray_int(Table,UVM_ALL_ON )
	    `uvm_field_enum(PAYLOAD_e,PAYLOAD_t,UVM_ALL_ON);
	 `uvm_object_utils_end

      virtual function void do_pack(uvm_packer packer);

      endfunction
      virtual function void do_unpack(uvm_packer packer);

      endfunction

      
      virtual task CrcTable();
	 integer i,j;
	 bit [31:0] crc;
	 
	 for(i = 0; i < 256; i++) 
	   begin
	      crc = i;
	      for(j = 0; j < 8; j++) 
		begin
		   if(crc[0] == 1) 
		     begin
			crc                       = {1'b0,crc[31:1]};
			crc                       = crc ^ 32'hEDB8_8320;
		     end
		   else 
		     begin
			crc                       = {1'b0,crc[31:1]};
		     end
		end
	      Table[255 - i]                   = crc;
	      end
      endtask
      
      virtual task calcCrc(bit [7:0] pkt);
	 integer i;
	 i                               = Crc[7:0] ^ pkt;
	 Crc                             = {8'h0,Crc[31:8]};
	 Crc                             = Crc ^ Table[255 - i];
	 endtask
      

      function new(string name = "base_pkt");
	 super.new(name);
	 CrcTable();
	 Num_Of_Vlans = 0;
	 PAYLOAD_t = RANDTYPE;
	 if(No === 'bx)
	   No = 0;
      endfunction: new

   endclass: eth_base_pkt

typedef eth_base_pkt mac_transaction;

`endif // ETH_BASE_PKT__SV
