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

`ifndef MII_TRANSACTION__SV
 `define MII_TRANSACTION__SV

 `define MCAST_ADD_VAL  48'h81_81_81_81_81_81
 `define MCAST_ADD_INV  48'h81_00_00_00_00_81
 `define UCAST_ADD_VAL  48'h00_ff_00_ff_00_ff
 `define UCAST_ADD_INV  48'h00_ff_ff_ff_ff_00
 `define MCAST_PAUSE_ADD 48'h01_80_c2_00_00_01
 `define MAX_NUM_OF_VLANS 4
 `define SA_ADD     48'h00_00_00_00_00_00

class mii_transaction extends uvm_sequence_item;

   typedef enum {MCAST_VALID,MCAST_INVALID,UCAST_VALID,UCAST_INVALID,BCAST}DA_e      ;
   typedef enum {LENGTH,JUMBO,PAUSE,CNTRL}                                 TYPE_e    ;
   typedef enum {SVLAN,VLAN,MVLAN,NOTAG}                                   TAG_e     ;
   typedef enum {LES_46,EQL_46,BW_47_TO_1500,GTR_1536,LEN_INVALID}         LENGTH_e  ;
   typedef enum {TIME_ZERO,TIME_FFFF,TIME_RAND}                            TIME_e    ;
   typedef enum {LEN_GOOD,LEN_BAD}                                         LENERR_e  ; 
   typedef enum {RANDTYPE,ZERO}                                            PAYLOAD_e ; 

   typedef enum {FCS_GOOD,FCS_BAD}                 FCS_e    ;
   typedef enum {PREAM_EQL7,PREAM_LES7,PREAM_GTR7} PREAM_e  ;
   typedef enum {SFD_GOOD,SFD_BAD}                 SFD_e    ;
   typedef enum {COLLISION, NO_COLLISION  } COLL_e;

   string 	name = "rx_pkt";
   rand FCS_e      FCS_t;
   rand PREAM_e    PREAM_t ;
   rand SFD_e      SFD_t   ;
   rand COLL_e	  COLL_t;
   bit [3:0] 	preamlength;
   rand bit collision;
   

   // Internal values used to help the transaction driver.
   bit [7:0] 	pream_data[8];
   bit [47:0] 	dest_addr; 
   bit [47:0] 	src_addr; 

   rand DA_e       DA_t    ;
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
   bit [7:0] 	  data [];
   bit [31 :0] 	  Crc;
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
   
   
   constraint fcs_c {FCS_t dist {FCS_GOOD := 80,FCS_BAD := 20};}
   constraint sfd_c { SFD_t dist { SFD_GOOD := 95,SFD_BAD := 5 };}
   constraint pream_c { PREAM_t dist { PREAM_EQL7 := 50,PREAM_LES7 := 5,PREAM_GTR7 := 45 } ;}

   // The UVM Macros to do some of the heavy lifting 
   
   `uvm_object_utils_begin(mii_transaction) 
      `uvm_field_enum(DA_e,DA_t,UVM_ALL_ON)    
      `uvm_field_enum(TAG_e     , TAG_t  , UVM_ALL_ON) 
      `uvm_field_enum(TYPE_e    , TYPE_t , UVM_ALL_ON) 
      `uvm_field_enum(LENGTH_e  , LENGTH_t, UVM_ALL_ON)
      `uvm_field_enum(TIME_e    , TIME_t , UVM_ALL_ON) 
      `uvm_field_enum(FCS_e     ,FCS_t   ,UVM_ALL_ON)
      `uvm_field_enum(LENERR_e  , LENERR_t, UVM_ALL_ON)
      `uvm_field_int(Num_Of_Vlans, UVM_ALL_ON)
      `uvm_field_int(lenght, UVM_ALL_ON)
      `uvm_field_int(No, UVM_ALL_ON)
      `uvm_field_int(Pkt_No, UVM_ALL_ON)
      `uvm_field_array_int(Pkt_Packed,UVM_ALL_ON)
      `uvm_field_array_int(data,UVM_ALL_ON)
      `uvm_field_enum(PAYLOAD_e,PAYLOAD_t,UVM_ALL_ON);
      `uvm_field_enum(PREAM_e,PREAM_t,UVM_ALL_ON)
      `uvm_field_enum(SFD_e,SFD_t,UVM_ALL_ON)
      `uvm_field_enum(COLL_e,COLL_t,UVM_ALL_ON)
   `uvm_object_utils_end

   function new(string name = "MII Trans");
      super.new(name);
      Num_Of_Vlans = 0;
      PAYLOAD_t = RANDTYPE;
      if(No === 'bx)
	No = 0;
   endfunction: new

   
   function bit [31:0]  calcCRC(input [3:0] Data, crc);
      // polynomial: (0 1 2 4 5 7 8 10 11 12 16 22 23 26 32)
      // data width: 4
      // convention: the first serial bit is D[3]
      // Info : tools@easics.be
      //    http://www.easics.com

      reg [3:0]   d;
      reg [31:0]  c;
      reg [31:0]  newcrc;
      begin
	 d = Data;
	 c = crc;

	 newcrc[0] = d[0] ^ c[28];
	 newcrc[1] = d[1] ^ d[0] ^ c[28] ^ c[29];
	 newcrc[2] = d[2] ^ d[1] ^ d[0] ^ c[28] ^ c[29] ^ c[30];
	 newcrc[3] = d[3] ^ d[2] ^ d[1] ^ c[29] ^ c[30] ^ c[31];
	 newcrc[4] = d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[28] ^ c[30] ^ c[31];
	 newcrc[5] = d[3] ^ d[1] ^ d[0] ^ c[1] ^ c[28] ^ c[29] ^ c[31];
	 newcrc[6] = d[2] ^ d[1] ^ c[2] ^ c[29] ^ c[30];
	 newcrc[7] = d[3] ^ d[2] ^ d[0] ^ c[3] ^ c[28] ^ c[30] ^ c[31];
	 newcrc[8] = d[3] ^ d[1] ^ d[0] ^ c[4] ^ c[28] ^ c[29] ^ c[31];
	 newcrc[9] = d[2] ^ d[1] ^ c[5] ^ c[29] ^ c[30];
	 newcrc[10] = d[3] ^ d[2] ^ d[0] ^ c[6] ^ c[28] ^ c[30] ^ c[31];
	 newcrc[11] = d[3] ^ d[1] ^ d[0] ^ c[7] ^ c[28] ^ c[29] ^ c[31];
	 newcrc[12] = d[2] ^ d[1] ^ d[0] ^ c[8] ^ c[28] ^ c[29] ^ c[30];
	 newcrc[13] = d[3] ^ d[2] ^ d[1] ^ c[9] ^ c[29] ^ c[30] ^ c[31];
	 newcrc[14] = d[3] ^ d[2] ^ c[10] ^ c[30] ^ c[31];
	 newcrc[15] = d[3] ^ c[11] ^ c[31];
	 newcrc[16] = d[0] ^ c[12] ^ c[28];
	 newcrc[17] = d[1] ^ c[13] ^ c[29];
	 newcrc[18] = d[2] ^ c[14] ^ c[30];
	 newcrc[19] = d[3] ^ c[15] ^ c[31];
	 newcrc[20] = c[16];
	 newcrc[21] = c[17];
	 newcrc[22] = d[0] ^ c[18] ^ c[28];
	 newcrc[23] = d[1] ^ d[0] ^ c[19] ^ c[28] ^ c[29];
	 newcrc[24] = d[2] ^ d[1] ^ c[20] ^ c[29] ^ c[30];
	 newcrc[25] = d[3] ^ d[2] ^ c[21] ^ c[30] ^ c[31];
	 newcrc[26] = d[3] ^ d[0] ^ c[22] ^ c[28] ^ c[31];
	 newcrc[27] = d[1] ^ c[23] ^ c[29];
	 newcrc[28] = d[2] ^ c[24] ^ c[30];
	 newcrc[29] = d[3] ^ c[25] ^ c[31];
	 newcrc[30] = c[26];
	 newcrc[31] = c[27];
	 calcCRC = newcrc;
      end
   endfunction

   function void pre_randomize();

   endfunction

   function void post_randomize();

   endfunction

endclass: mii_transaction

`endif // MII_TRANSACTION__SV

