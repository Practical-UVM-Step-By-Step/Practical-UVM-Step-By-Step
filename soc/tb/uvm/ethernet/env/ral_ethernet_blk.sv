`ifndef RAL_ETHERNET_BLK
`define RAL_ETHERNET_BLK

import uvm_pkg::*;

class ral_reg_MODER extends uvm_reg;
	rand uvm_reg_field RECSMALL;
	rand uvm_reg_field PAD;
	rand uvm_reg_field HUGEN;
	rand uvm_reg_field CRCEN;
	rand uvm_reg_field DLYCRCEN;
	rand uvm_reg_field FULLD;
	rand uvm_reg_field EXDFREN;
	rand uvm_reg_field NOBCKOF;
	rand uvm_reg_field LOOPBCK;
	rand uvm_reg_field IFG;
	rand uvm_reg_field PRO;
	rand uvm_reg_field IAM;
	rand uvm_reg_field BRO;
	rand uvm_reg_field NOPRE;
	rand uvm_reg_field TXEN;
	rand uvm_reg_field RXEN;

	function new(string name = "MODER");
		super.new(name, 24,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RECSMALL = uvm_reg_field::type_id::create("RECSMALL",,get_full_name());
      this.RECSMALL.configure(this, 1, 16, "RW", 0, 1'h0, 0, 0, 1);
      this.PAD = uvm_reg_field::type_id::create("PAD",,get_full_name());
      this.PAD.configure(this, 1, 15, "RW", 0, 1, 1, 0, 0);
      this.HUGEN = uvm_reg_field::type_id::create("HUGEN",,get_full_name());
      this.HUGEN.configure(this, 1, 14, "RW", 0, 1'h0, 0, 0, 0);
      this.CRCEN = uvm_reg_field::type_id::create("CRCEN",,get_full_name());
      this.CRCEN.configure(this, 1, 13, "RW", 0, 1, 1, 0, 0);
      this.DLYCRCEN = uvm_reg_field::type_id::create("DLYCRCEN",,get_full_name());
      this.DLYCRCEN.configure(this, 1, 12, "RW", 0, 1'h0, 0, 0, 0);
      this.FULLD = uvm_reg_field::type_id::create("FULLD",,get_full_name());
      this.FULLD.configure(this, 1, 10, "RW", 0, 1'h0, 0, 0, 0);
      this.EXDFREN = uvm_reg_field::type_id::create("EXDFREN",,get_full_name());
      this.EXDFREN.configure(this, 1, 9, "RW", 0, 1'h0, 0, 0, 0);
      this.NOBCKOF = uvm_reg_field::type_id::create("NOBCKOF",,get_full_name());
      this.NOBCKOF.configure(this, 1, 8, "RW", 0, 1'h0, 0, 0, 0);
      this.LOOPBCK = uvm_reg_field::type_id::create("LOOPBCK",,get_full_name());
      this.LOOPBCK.configure(this, 1, 7, "RW", 0, 1'h0, 0, 0, 0);
      this.IFG = uvm_reg_field::type_id::create("IFG",,get_full_name());
      this.IFG.configure(this, 1, 6, "RW", 0, 1'h0, 0, 0, 0);
      this.PRO = uvm_reg_field::type_id::create("PRO",,get_full_name());
      this.PRO.configure(this, 1, 5, "RW", 0, 1'h0, 0, 0, 0);
      this.IAM = uvm_reg_field::type_id::create("IAM",,get_full_name());
      this.IAM.configure(this, 1, 4, "RW", 0, 1'h0, 0, 0, 0);
      this.BRO = uvm_reg_field::type_id::create("BRO",,get_full_name());
      this.BRO.configure(this, 1, 3, "RW", 0, 1'h0, 0, 0, 0);
      this.NOPRE = uvm_reg_field::type_id::create("NOPRE",,get_full_name());
      this.NOPRE.configure(this, 1, 2, "RW", 0, 1'h0, 0, 0, 0);
      this.TXEN = uvm_reg_field::type_id::create("TXEN",,get_full_name());
      this.TXEN.configure(this, 1, 1, "RW", 0, 1'h0, 0, 0, 0);
      this.RXEN = uvm_reg_field::type_id::create("RXEN",,get_full_name());
      this.RXEN.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_MODER)

endclass : ral_reg_MODER


class ral_reg_ethernet_blk_INT_SOURCE extends uvm_reg;
	rand uvm_reg_field RXC;
	rand uvm_reg_field TXC;
	rand uvm_reg_field BUSY;
	rand uvm_reg_field RXE;
	rand uvm_reg_field RXB;
	rand uvm_reg_field TXE;
	rand uvm_reg_field TXB;

	function new(string name = "ethernet_blk_INT_SOURCE");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RXC = uvm_reg_field::type_id::create("RXC",,get_full_name());
      this.RXC.configure(this, 1, 6, "W1C", 0, 1'h0, 0, 0, 0);
      this.TXC = uvm_reg_field::type_id::create("TXC",,get_full_name());
      this.TXC.configure(this, 1, 5, "W1C", 0, 1'h0, 0, 0, 0);
      this.BUSY = uvm_reg_field::type_id::create("BUSY",,get_full_name());
      this.BUSY.configure(this, 1, 4, "W1C", 0, 1'h0, 0, 0, 0);
      this.RXE = uvm_reg_field::type_id::create("RXE",,get_full_name());
      this.RXE.configure(this, 1, 3, "W1C", 0, 1'h0, 0, 0, 0);
      this.RXB = uvm_reg_field::type_id::create("RXB",,get_full_name());
      this.RXB.configure(this, 1, 2, "W1C", 0, 1'h0, 0, 0, 0);
      this.TXE = uvm_reg_field::type_id::create("TXE",,get_full_name());
      this.TXE.configure(this, 1, 1, "W1C", 0, 1'h0, 0, 0, 0);
      this.TXB = uvm_reg_field::type_id::create("TXB",,get_full_name());
      this.TXB.configure(this, 1, 0, "W1C", 0, 1'h0, 0, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_ethernet_blk_INT_SOURCE)

endclass : ral_reg_ethernet_blk_INT_SOURCE


class ral_reg_ethernet_blk_INT_MASK extends uvm_reg;
	rand uvm_reg_field RXC_M;
	rand uvm_reg_field TXC_M;
	rand uvm_reg_field BUSY_M;
	rand uvm_reg_field RXE_M;
	rand uvm_reg_field RXB_M;
	rand uvm_reg_field TXE_M;
	rand uvm_reg_field TXB_M;

	function new(string name = "ethernet_blk_INT_MASK");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RXC_M = uvm_reg_field::type_id::create("RXC_M",,get_full_name());
      this.RXC_M.configure(this, 1, 6, "RW", 0, 1'h0, 0, 0, 0);
      this.TXC_M = uvm_reg_field::type_id::create("TXC_M",,get_full_name());
      this.TXC_M.configure(this, 1, 5, "RW", 0, 1'h0, 0, 0, 0);
      this.BUSY_M = uvm_reg_field::type_id::create("BUSY_M",,get_full_name());
      this.BUSY_M.configure(this, 1, 4, "RW", 0, 1'h0, 0, 0, 0);
      this.RXE_M = uvm_reg_field::type_id::create("RXE_M",,get_full_name());
      this.RXE_M.configure(this, 1, 3, "RW", 0, 1'h0, 0, 0, 0);
      this.RXB_M = uvm_reg_field::type_id::create("RXB_M",,get_full_name());
      this.RXB_M.configure(this, 1, 2, "RW", 0, 1'h0, 0, 0, 0);
      this.TXE_M = uvm_reg_field::type_id::create("TXE_M",,get_full_name());
      this.TXE_M.configure(this, 1, 1, "RW", 0, 1'h0, 0, 0, 0);
      this.TXB_M = uvm_reg_field::type_id::create("TXB_M",,get_full_name());
      this.TXB_M.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_ethernet_blk_INT_MASK)

endclass : ral_reg_ethernet_blk_INT_MASK


class ral_reg_IPGT extends uvm_reg;
	rand uvm_reg_field IPGT;

	function new(string name = "IPGT");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.IPGT = uvm_reg_field::type_id::create("IPGT",,get_full_name());
      this.IPGT.configure(this, 7, 0, "RW", 0, 7'h12, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_IPGT)

endclass : ral_reg_IPGT


class ral_reg_IPGR1 extends uvm_reg;
	rand uvm_reg_field IPGR1;

	function new(string name = "IPGR1");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.IPGR1 = uvm_reg_field::type_id::create("IPGR1",,get_full_name());
      this.IPGR1.configure(this, 7, 0, "RW", 0, 7'h0C, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_IPGR1)

endclass : ral_reg_IPGR1


class ral_reg_IPGR2 extends uvm_reg;
	rand uvm_reg_field IPGR2;

	function new(string name = "IPGR2");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.IPGR2 = uvm_reg_field::type_id::create("IPGR2",,get_full_name());
      this.IPGR2.configure(this, 7, 0, "RW", 0, 7'h12, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_IPGR2)

endclass : ral_reg_IPGR2


class ral_reg_PACKETLEN extends uvm_reg;
	rand uvm_reg_field MINFL;
	rand uvm_reg_field MAXFL;

	constraint MINFL_spec {
		MINFL.value == 'h40;
	}
	constraint MAXFL_spec {
		MAXFL.value == 'h600;
	}

	function new(string name = "PACKETLEN");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.MINFL = uvm_reg_field::type_id::create("MINFL",,get_full_name());
      this.MINFL.configure(this, 16, 16, "RW", 0, 16'h0040, 1, 1, 1);
      this.MAXFL = uvm_reg_field::type_id::create("MAXFL",,get_full_name());
      this.MAXFL.configure(this, 16, 0, "RW", 0, 16'h0600, 1, 1, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_PACKETLEN)

endclass : ral_reg_PACKETLEN


class ral_reg_COLLCONF extends uvm_reg;
	rand uvm_reg_field MAXRET;
	rand uvm_reg_field COLLVALID;

	function new(string name = "COLLCONF");
		super.new(name, 24,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.MAXRET = uvm_reg_field::type_id::create("MAXRET",,get_full_name());
      this.MAXRET.configure(this, 4, 16, "RW", 0, 4'hF, 1, 0, 1);
      this.COLLVALID = uvm_reg_field::type_id::create("COLLVALID",,get_full_name());
      this.COLLVALID.configure(this, 6, 0, "RW", 0, 6'h3F, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_COLLCONF)

endclass : ral_reg_COLLCONF


class ral_reg_TX_BD_NUM extends uvm_reg;
	rand uvm_reg_field TX_BD_NUM;

	constraint TX_BD_NUM_hardware {
		TX_BD_NUM.value <= 'h80;
	}

	function new(string name = "TX_BD_NUM");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.TX_BD_NUM = uvm_reg_field::type_id::create("TX_BD_NUM",,get_full_name());
      this.TX_BD_NUM.configure(this, 8, 0, "RW", 0, 8'h40, 1, 1, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_TX_BD_NUM)

endclass : ral_reg_TX_BD_NUM


class ral_reg_CTRLMODER extends uvm_reg;
	rand uvm_reg_field TXFLOW;
	rand uvm_reg_field RXFLOW;
	rand uvm_reg_field PASSALL;

	function new(string name = "CTRLMODER");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.TXFLOW = uvm_reg_field::type_id::create("TXFLOW",,get_full_name());
      this.TXFLOW.configure(this, 1, 2, "RW", 0, 1'h0, 0, 0, 0);
      this.RXFLOW = uvm_reg_field::type_id::create("RXFLOW",,get_full_name());
      this.RXFLOW.configure(this, 1, 1, "RW", 0, 1'h0, 0, 0, 0);
      this.PASSALL = uvm_reg_field::type_id::create("PASSALL",,get_full_name());
      this.PASSALL.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_CTRLMODER)

endclass : ral_reg_CTRLMODER


class ral_reg_MIIMODER extends uvm_reg;
	rand uvm_reg_field MIINOPRE;
	rand uvm_reg_field CLKDIV;

	function new(string name = "MIIMODER");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.MIINOPRE = uvm_reg_field::type_id::create("MIINOPRE",,get_full_name());
      this.MIINOPRE.configure(this, 1, 8, "RW", 0, 1'h0, 0, 0, 1);
      this.CLKDIV = uvm_reg_field::type_id::create("CLKDIV",,get_full_name());
      this.CLKDIV.configure(this, 8, 0, "RW", 0, 8'h64, 1, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_MIIMODER)

endclass : ral_reg_MIIMODER


class ral_reg_MIICOMMAND extends uvm_reg;
	rand uvm_reg_field WCTRLDATA;
	rand uvm_reg_field RSTAT;
	rand uvm_reg_field SCANSTAT;

	function new(string name = "MIICOMMAND");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.WCTRLDATA = uvm_reg_field::type_id::create("WCTRLDATA",,get_full_name());
      this.WCTRLDATA.configure(this, 1, 2, "RW", 0, 1'h0, 0, 0, 0);
      this.RSTAT = uvm_reg_field::type_id::create("RSTAT",,get_full_name());
      this.RSTAT.configure(this, 1, 1, "RW", 0, 1'h0, 0, 0, 0);
      this.SCANSTAT = uvm_reg_field::type_id::create("SCANSTAT",,get_full_name());
      this.SCANSTAT.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_MIICOMMAND)

endclass : ral_reg_MIICOMMAND


class ral_reg_MIIADDRESS extends uvm_reg;
	rand uvm_reg_field RGAD;
	rand uvm_reg_field FIAD;

	function new(string name = "MIIADDRESS");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.RGAD = uvm_reg_field::type_id::create("RGAD",,get_full_name());
      this.RGAD.configure(this, 5, 8, "RW", 0, 5'h0, 0, 0, 1);
      this.FIAD = uvm_reg_field::type_id::create("FIAD",,get_full_name());
      this.FIAD.configure(this, 5, 0, "RW", 0, 5'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_MIIADDRESS)

endclass : ral_reg_MIIADDRESS


class ral_reg_MIITX_DATA extends uvm_reg;
	rand uvm_reg_field CTRLDATA;

	function new(string name = "MIITX_DATA");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.CTRLDATA = uvm_reg_field::type_id::create("CTRLDATA",,get_full_name());
      this.CTRLDATA.configure(this, 16, 0, "RW", 0, 16'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_MIITX_DATA)

endclass : ral_reg_MIITX_DATA


class ral_reg_MIIRX_DATA extends uvm_reg;
	uvm_reg_field PRSD;

	function new(string name = "MIIRX_DATA");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PRSD = uvm_reg_field::type_id::create("PRSD",,get_full_name());
      this.PRSD.configure(this, 16, 0, "RO", 0, 16'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_MIIRX_DATA)

endclass : ral_reg_MIIRX_DATA


class ral_reg_MIISTATUS extends uvm_reg;
	uvm_reg_field NVALID;
	uvm_reg_field BUSY_N;
	uvm_reg_field LINKFAIL;

	function new(string name = "MIISTATUS");
		super.new(name, 8,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.NVALID = uvm_reg_field::type_id::create("NVALID",,get_full_name());
      this.NVALID.configure(this, 1, 2, "RO", 0, 1'h0, 0, 0, 0);
      this.BUSY_N = uvm_reg_field::type_id::create("BUSY_N",,get_full_name());
      this.BUSY_N.configure(this, 1, 1, "RO", 0, 1'h0, 0, 0, 0);
      this.LINKFAIL = uvm_reg_field::type_id::create("LINKFAIL",,get_full_name());
      this.LINKFAIL.configure(this, 1, 0, "RO", 0, 1'h0, 0, 0, 0);
   endfunction: build

	`uvm_object_utils(ral_reg_MIISTATUS)

endclass : ral_reg_MIISTATUS


class ral_reg_MAC_ADDR0 extends uvm_reg;
	rand uvm_reg_field MAC_ADDR;

	function new(string name = "MAC_ADDR0");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.MAC_ADDR = uvm_reg_field::type_id::create("MAC_ADDR",,get_full_name());
      this.MAC_ADDR.configure(this, 32, 0, "RW", 0, 32'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_MAC_ADDR0)

endclass : ral_reg_MAC_ADDR0


class ral_reg_MAC_ADDR1 extends uvm_reg;
	rand uvm_reg_field MAC_ADDR;

	function new(string name = "MAC_ADDR1");
		super.new(name, 16,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.MAC_ADDR = uvm_reg_field::type_id::create("MAC_ADDR",,get_full_name());
      this.MAC_ADDR.configure(this, 16, 0, "RW", 0, 16'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_MAC_ADDR1)

endclass : ral_reg_MAC_ADDR1


class ral_reg_HASH0 extends uvm_reg;
	rand uvm_reg_field HASH0;

	function new(string name = "HASH0");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.HASH0 = uvm_reg_field::type_id::create("HASH0",,get_full_name());
      this.HASH0.configure(this, 32, 0, "RW", 0, 32'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_HASH0)

endclass : ral_reg_HASH0


class ral_reg_HASH1 extends uvm_reg;
	rand uvm_reg_field HASH1;

	function new(string name = "HASH1");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.HASH1 = uvm_reg_field::type_id::create("HASH1",,get_full_name());
      this.HASH1.configure(this, 32, 0, "RW", 0, 32'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_HASH1)

endclass : ral_reg_HASH1


class ral_reg_TXCTRL extends uvm_reg;
	rand uvm_reg_field TXPAUSEREQ;
	rand uvm_reg_field TXPAUSETV;

	function new(string name = "TXCTRL");
		super.new(name, 24,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.TXPAUSEREQ = uvm_reg_field::type_id::create("TXPAUSEREQ",,get_full_name());
      this.TXPAUSEREQ.configure(this, 1, 16, "RW", 0, 1'h0, 0, 0, 1);
      this.TXPAUSETV = uvm_reg_field::type_id::create("TXPAUSETV",,get_full_name());
      this.TXPAUSETV.configure(this, 16, 0, "RW", 0, 16'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_TXCTRL)

endclass : ral_reg_TXCTRL


class ral_reg_ethernet_blk_TxBD_TxBD_CTRL extends uvm_reg;
	rand uvm_reg_field CS;
	rand uvm_reg_field DF;
	rand uvm_reg_field LC;
	rand uvm_reg_field RL;
	rand uvm_reg_field RTRY;
	rand uvm_reg_field UR;
	rand uvm_reg_field CRC;
	rand uvm_reg_field PAD;
	rand uvm_reg_field WR;
	rand uvm_reg_field IRQ;
	rand uvm_reg_field RD;
	rand uvm_reg_field LEN;

	function new(string name = "ethernet_blk_TxBD_TxBD_CTRL");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.CS = uvm_reg_field::type_id::create("CS",,get_full_name());
      this.CS.configure(this, 1, 0, "RW", 0, 1'h0, 0, 0, 0);
      this.DF = uvm_reg_field::type_id::create("DF",,get_full_name());
      this.DF.configure(this, 1, 1, "RW", 0, 1'h0, 0, 0, 0);
      this.LC = uvm_reg_field::type_id::create("LC",,get_full_name());
      this.LC.configure(this, 1, 2, "RW", 0, 1'h0, 0, 0, 0);
      this.RL = uvm_reg_field::type_id::create("RL",,get_full_name());
      this.RL.configure(this, 1, 3, "RW", 0, 1'h0, 0, 0, 0);
      this.RTRY = uvm_reg_field::type_id::create("RTRY",,get_full_name());
      this.RTRY.configure(this, 4, 4, "RW", 0, 4'h0, 0, 0, 0);
      this.UR = uvm_reg_field::type_id::create("UR",,get_full_name());
      this.UR.configure(this, 1, 8, "RW", 0, 1'h0, 0, 0, 0);
      this.CRC = uvm_reg_field::type_id::create("CRC",,get_full_name());
      this.CRC.configure(this, 1, 11, "RW", 0, 1'h0, 0, 0, 0);
      this.PAD = uvm_reg_field::type_id::create("PAD",,get_full_name());
      this.PAD.configure(this, 1, 12, "RW", 0, 1'h0, 0, 0, 0);
      this.WR = uvm_reg_field::type_id::create("WR",,get_full_name());
      this.WR.configure(this, 1, 13, "RW", 0, 1'h0, 0, 0, 0);
      this.IRQ = uvm_reg_field::type_id::create("IRQ",,get_full_name());
      this.IRQ.configure(this, 1, 14, "RW", 0, 1'h0, 0, 0, 0);
      this.RD = uvm_reg_field::type_id::create("RD",,get_full_name());
      this.RD.configure(this, 1, 15, "RW", 0, 1'h0, 0, 0, 0);
      this.LEN = uvm_reg_field::type_id::create("LEN",,get_full_name());
      this.LEN.configure(this, 16, 16, "RW", 0, 16'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_ethernet_blk_TxBD_TxBD_CTRL)

endclass : ral_reg_ethernet_blk_TxBD_TxBD_CTRL


class ral_reg_ethernet_blk_TxBD_TxPNT_val extends uvm_reg;
	rand uvm_reg_field PTR;

	function new(string name = "ethernet_blk_TxBD_TxPNT_val");
		super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
	endfunction: new
   virtual function void build();
      this.PTR = uvm_reg_field::type_id::create("PTR",,get_full_name());
      this.PTR.configure(this, 32, 0, "RW", 0, 32'h0, 0, 0, 1);
   endfunction: build

	`uvm_object_utils(ral_reg_ethernet_blk_TxBD_TxPNT_val)

endclass : ral_reg_ethernet_blk_TxBD_TxPNT_val


class ral_regfile_ethernet_blk_TxBD extends uvm_reg_file;
	uvm_reg regs[$];
	rand ral_reg_ethernet_blk_TxBD_TxBD_CTRL TxBD_CTRL;
	rand ral_reg_ethernet_blk_TxBD_TxPNT_val TxPNT_val;
	rand uvm_reg_field TxBD_CTRL_CS;
	rand uvm_reg_field CS;
	rand uvm_reg_field TxBD_CTRL_DF;
	rand uvm_reg_field DF;
	rand uvm_reg_field TxBD_CTRL_LC;
	rand uvm_reg_field LC;
	rand uvm_reg_field TxBD_CTRL_RL;
	rand uvm_reg_field RL;
	rand uvm_reg_field TxBD_CTRL_RTRY;
	rand uvm_reg_field RTRY;
	rand uvm_reg_field TxBD_CTRL_UR;
	rand uvm_reg_field UR;
	rand uvm_reg_field TxBD_CTRL_CRC;
	rand uvm_reg_field CRC;
	rand uvm_reg_field TxBD_CTRL_PAD;
	rand uvm_reg_field PAD;
	rand uvm_reg_field TxBD_CTRL_WR;
	rand uvm_reg_field WR;
	rand uvm_reg_field TxBD_CTRL_IRQ;
	rand uvm_reg_field IRQ;
	rand uvm_reg_field TxBD_CTRL_RD;
	rand uvm_reg_field RD;
	rand uvm_reg_field TxBD_CTRL_LEN;
	rand uvm_reg_field LEN;
	rand uvm_reg_field TxPNT_val_PTR;
	rand uvm_reg_field PTR;


	function new(string name = "ethernet_blk_TxBD");
		super.new(name);
	endfunction : new

	virtual function void build();
		this.TxBD_CTRL = ral_reg_ethernet_blk_TxBD_TxBD_CTRL::type_id::create("TxBD_CTRL",,get_full_name());
		this.TxBD_CTRL.configure(get_block(), this, "");
		this.TxBD_CTRL.build();
		this.TxBD_CTRL_CS = this.TxBD_CTRL.CS;
		this.CS = this.TxBD_CTRL.CS;
		this.TxBD_CTRL_DF = this.TxBD_CTRL.DF;
		this.DF = this.TxBD_CTRL.DF;
		this.TxBD_CTRL_LC = this.TxBD_CTRL.LC;
		this.LC = this.TxBD_CTRL.LC;
		this.TxBD_CTRL_RL = this.TxBD_CTRL.RL;
		this.RL = this.TxBD_CTRL.RL;
		this.TxBD_CTRL_RTRY = this.TxBD_CTRL.RTRY;
		this.RTRY = this.TxBD_CTRL.RTRY;
		this.TxBD_CTRL_UR = this.TxBD_CTRL.UR;
		this.UR = this.TxBD_CTRL.UR;
		this.TxBD_CTRL_CRC = this.TxBD_CTRL.CRC;
		this.CRC = this.TxBD_CTRL.CRC;
		this.TxBD_CTRL_PAD = this.TxBD_CTRL.PAD;
		this.PAD = this.TxBD_CTRL.PAD;
		this.TxBD_CTRL_WR = this.TxBD_CTRL.WR;
		this.WR = this.TxBD_CTRL.WR;
		this.TxBD_CTRL_IRQ = this.TxBD_CTRL.IRQ;
		this.IRQ = this.TxBD_CTRL.IRQ;
		this.TxBD_CTRL_RD = this.TxBD_CTRL.RD;
		this.RD = this.TxBD_CTRL.RD;
		this.TxBD_CTRL_LEN = this.TxBD_CTRL.LEN;
		this.LEN = this.TxBD_CTRL.LEN;
		this.regs.push_back(TxBD_CTRL);
		this.TxPNT_val = ral_reg_ethernet_blk_TxBD_TxPNT_val::type_id::create("TxPNT_val",,get_full_name());
		this.TxPNT_val.configure(get_block(), this, "");
		this.TxPNT_val.build();
		this.TxPNT_val_PTR = this.TxPNT_val.PTR;
		this.PTR = this.TxPNT_val.PTR;
		this.regs.push_back(TxPNT_val);
	endfunction : build

	virtual function void map(uvm_reg_map    mp,
	                          uvm_reg_addr_t offset);
	  mp.add_reg(TxBD_CTRL, offset+`UVM_REG_ADDR_WIDTH'h0);
	  mp.add_reg(TxPNT_val, offset+`UVM_REG_ADDR_WIDTH'h4);

	endfunction

	virtual function void set_offset(uvm_reg_map    mp,
	                                   uvm_reg_addr_t offset);
	  TxBD_CTRL.set_offset(mp, offset+`UVM_REG_ADDR_WIDTH'h0);
	  TxPNT_val.set_offset(mp, offset+`UVM_REG_ADDR_WIDTH'h4);

	endfunction

	`uvm_object_utils(ral_regfile_ethernet_blk_TxBD)
endclass : ral_regfile_ethernet_blk_TxBD




class ral_block_ethernet_blk extends uvm_reg_block;
	rand ral_reg_MODER MODER;
	rand ral_reg_ethernet_blk_INT_SOURCE INT_SOURCE;
	rand ral_reg_ethernet_blk_INT_MASK INT_MASK;
	rand ral_reg_IPGT IPGT;
	rand ral_reg_IPGR1 IPGR1;
	rand ral_reg_IPGR2 IPGR2;
	rand ral_reg_PACKETLEN PACKETLEN;
	rand ral_reg_COLLCONF COLLCONF;
	rand ral_reg_TX_BD_NUM TX_BD_NUM;
	rand ral_reg_CTRLMODER CTRLMODER;
	rand ral_reg_MIIMODER MIIMODER;
	rand ral_reg_MIICOMMAND MIICOMMAND;
	rand ral_reg_MIIADDRESS MIIADDRESS;
	rand ral_reg_MIITX_DATA MIITX_DATA;
	rand ral_reg_MIIRX_DATA MIIRX_DATA;
	rand ral_reg_MIISTATUS MIISTATUS;
	rand ral_reg_MAC_ADDR0 MAC_ADDR0;
	rand ral_reg_MAC_ADDR1 MAC_ADDR1;
	rand ral_reg_HASH0 HASH0;
	rand ral_reg_HASH1 HASH1;
	rand ral_reg_TXCTRL TXCTRL;
	rand ral_regfile_ethernet_blk_TxBD TxBD[128];
	rand uvm_reg_field MODER_RECSMALL;
	rand uvm_reg_field RECSMALL;
	rand uvm_reg_field MODER_PAD;
	rand uvm_reg_field PAD;
	rand uvm_reg_field MODER_HUGEN;
	rand uvm_reg_field HUGEN;
	rand uvm_reg_field MODER_CRCEN;
	rand uvm_reg_field CRCEN;
	rand uvm_reg_field MODER_DLYCRCEN;
	rand uvm_reg_field DLYCRCEN;
	rand uvm_reg_field MODER_FULLD;
	rand uvm_reg_field FULLD;
	rand uvm_reg_field MODER_EXDFREN;
	rand uvm_reg_field EXDFREN;
	rand uvm_reg_field MODER_NOBCKOF;
	rand uvm_reg_field NOBCKOF;
	rand uvm_reg_field MODER_LOOPBCK;
	rand uvm_reg_field LOOPBCK;
	rand uvm_reg_field MODER_IFG;
	rand uvm_reg_field IFG;
	rand uvm_reg_field MODER_PRO;
	rand uvm_reg_field PRO;
	rand uvm_reg_field MODER_IAM;
	rand uvm_reg_field IAM;
	rand uvm_reg_field MODER_BRO;
	rand uvm_reg_field BRO;
	rand uvm_reg_field MODER_NOPRE;
	rand uvm_reg_field NOPRE;
	rand uvm_reg_field MODER_TXEN;
	rand uvm_reg_field TXEN;
	rand uvm_reg_field MODER_RXEN;
	rand uvm_reg_field RXEN;
	rand uvm_reg_field INT_SOURCE_RXC;
	rand uvm_reg_field RXC;
	rand uvm_reg_field INT_SOURCE_TXC;
	rand uvm_reg_field TXC;
	rand uvm_reg_field INT_SOURCE_BUSY;
	rand uvm_reg_field BUSY;
	rand uvm_reg_field INT_SOURCE_RXE;
	rand uvm_reg_field RXE;
	rand uvm_reg_field INT_SOURCE_RXB;
	rand uvm_reg_field RXB;
	rand uvm_reg_field INT_SOURCE_TXE;
	rand uvm_reg_field TXE;
	rand uvm_reg_field INT_SOURCE_TXB;
	rand uvm_reg_field TXB;
	rand uvm_reg_field INT_MASK_RXC_M;
	rand uvm_reg_field RXC_M;
	rand uvm_reg_field INT_MASK_TXC_M;
	rand uvm_reg_field TXC_M;
	rand uvm_reg_field INT_MASK_BUSY_M;
	rand uvm_reg_field BUSY_M;
	rand uvm_reg_field INT_MASK_RXE_M;
	rand uvm_reg_field RXE_M;
	rand uvm_reg_field INT_MASK_RXB_M;
	rand uvm_reg_field RXB_M;
	rand uvm_reg_field INT_MASK_TXE_M;
	rand uvm_reg_field TXE_M;
	rand uvm_reg_field INT_MASK_TXB_M;
	rand uvm_reg_field TXB_M;
	rand uvm_reg_field IPGT_IPGT;
	rand uvm_reg_field IPGR1_IPGR1;
	rand uvm_reg_field IPGR2_IPGR2;
	rand uvm_reg_field PACKETLEN_MINFL;
	rand uvm_reg_field MINFL;
	rand uvm_reg_field PACKETLEN_MAXFL;
	rand uvm_reg_field MAXFL;
	rand uvm_reg_field COLLCONF_MAXRET;
	rand uvm_reg_field MAXRET;
	rand uvm_reg_field COLLCONF_COLLVALID;
	rand uvm_reg_field COLLVALID;
	rand uvm_reg_field TX_BD_NUM_TX_BD_NUM;
	rand uvm_reg_field CTRLMODER_TXFLOW;
	rand uvm_reg_field TXFLOW;
	rand uvm_reg_field CTRLMODER_RXFLOW;
	rand uvm_reg_field RXFLOW;
	rand uvm_reg_field CTRLMODER_PASSALL;
	rand uvm_reg_field PASSALL;
	rand uvm_reg_field MIIMODER_MIINOPRE;
	rand uvm_reg_field MIINOPRE;
	rand uvm_reg_field MIIMODER_CLKDIV;
	rand uvm_reg_field CLKDIV;
	rand uvm_reg_field MIICOMMAND_WCTRLDATA;
	rand uvm_reg_field WCTRLDATA;
	rand uvm_reg_field MIICOMMAND_RSTAT;
	rand uvm_reg_field RSTAT;
	rand uvm_reg_field MIICOMMAND_SCANSTAT;
	rand uvm_reg_field SCANSTAT;
	rand uvm_reg_field MIIADDRESS_RGAD;
	rand uvm_reg_field RGAD;
	rand uvm_reg_field MIIADDRESS_FIAD;
	rand uvm_reg_field FIAD;
	rand uvm_reg_field MIITX_DATA_CTRLDATA;
	rand uvm_reg_field CTRLDATA;
	uvm_reg_field MIIRX_DATA_PRSD;
	uvm_reg_field PRSD;
	uvm_reg_field MIISTATUS_NVALID;
	uvm_reg_field NVALID;
	uvm_reg_field MIISTATUS_BUSY_N;
	uvm_reg_field BUSY_N;
	uvm_reg_field MIISTATUS_LINKFAIL;
	uvm_reg_field LINKFAIL;
	rand uvm_reg_field MAC_ADDR0_MAC_ADDR;
	rand uvm_reg_field MAC_ADDR1_MAC_ADDR;
	rand uvm_reg_field HASH0_HASH0;
	rand uvm_reg_field HASH1_HASH1;
	rand uvm_reg_field TXCTRL_TXPAUSEREQ;
	rand uvm_reg_field TXPAUSEREQ;
	rand uvm_reg_field TXCTRL_TXPAUSETV;
	rand uvm_reg_field TXPAUSETV;

	function new(string name = "ethernet_blk");
		super.new(name, build_coverage(UVM_NO_COVERAGE));
	endfunction: new

   virtual function void build();
      this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.MODER = ral_reg_MODER::type_id::create("MODER",,get_full_name());
      this.MODER.configure(this, null, "");
      this.MODER.build();
      this.default_map.add_reg(this.MODER, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
		this.MODER_RECSMALL = this.MODER.RECSMALL;
		this.RECSMALL = this.MODER.RECSMALL;
		this.MODER_PAD = this.MODER.PAD;
		this.PAD = this.MODER.PAD;
		this.MODER_HUGEN = this.MODER.HUGEN;
		this.HUGEN = this.MODER.HUGEN;
		this.MODER_CRCEN = this.MODER.CRCEN;
		this.CRCEN = this.MODER.CRCEN;
		this.MODER_DLYCRCEN = this.MODER.DLYCRCEN;
		this.DLYCRCEN = this.MODER.DLYCRCEN;
		this.MODER_FULLD = this.MODER.FULLD;
		this.FULLD = this.MODER.FULLD;
		this.MODER_EXDFREN = this.MODER.EXDFREN;
		this.EXDFREN = this.MODER.EXDFREN;
		this.MODER_NOBCKOF = this.MODER.NOBCKOF;
		this.NOBCKOF = this.MODER.NOBCKOF;
		this.MODER_LOOPBCK = this.MODER.LOOPBCK;
		this.LOOPBCK = this.MODER.LOOPBCK;
		this.MODER_IFG = this.MODER.IFG;
		this.IFG = this.MODER.IFG;
		this.MODER_PRO = this.MODER.PRO;
		this.PRO = this.MODER.PRO;
		this.MODER_IAM = this.MODER.IAM;
		this.IAM = this.MODER.IAM;
		this.MODER_BRO = this.MODER.BRO;
		this.BRO = this.MODER.BRO;
		this.MODER_NOPRE = this.MODER.NOPRE;
		this.NOPRE = this.MODER.NOPRE;
		this.MODER_TXEN = this.MODER.TXEN;
		this.TXEN = this.MODER.TXEN;
		this.MODER_RXEN = this.MODER.RXEN;
		this.RXEN = this.MODER.RXEN;
      this.INT_SOURCE = ral_reg_ethernet_blk_INT_SOURCE::type_id::create("INT_SOURCE",,get_full_name());
      this.INT_SOURCE.configure(this, null, "");
      this.INT_SOURCE.build();
      this.default_map.add_reg(this.INT_SOURCE, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
		this.INT_SOURCE_RXC = this.INT_SOURCE.RXC;
		this.RXC = this.INT_SOURCE.RXC;
		this.INT_SOURCE_TXC = this.INT_SOURCE.TXC;
		this.TXC = this.INT_SOURCE.TXC;
		this.INT_SOURCE_BUSY = this.INT_SOURCE.BUSY;
		this.BUSY = this.INT_SOURCE.BUSY;
		this.INT_SOURCE_RXE = this.INT_SOURCE.RXE;
		this.RXE = this.INT_SOURCE.RXE;
		this.INT_SOURCE_RXB = this.INT_SOURCE.RXB;
		this.RXB = this.INT_SOURCE.RXB;
		this.INT_SOURCE_TXE = this.INT_SOURCE.TXE;
		this.TXE = this.INT_SOURCE.TXE;
		this.INT_SOURCE_TXB = this.INT_SOURCE.TXB;
		this.TXB = this.INT_SOURCE.TXB;
      this.INT_MASK = ral_reg_ethernet_blk_INT_MASK::type_id::create("INT_MASK",,get_full_name());
      this.INT_MASK.configure(this, null, "");
      this.INT_MASK.build();
      this.default_map.add_reg(this.INT_MASK, `UVM_REG_ADDR_WIDTH'h8, "RW", 0);
		this.INT_MASK_RXC_M = this.INT_MASK.RXC_M;
		this.RXC_M = this.INT_MASK.RXC_M;
		this.INT_MASK_TXC_M = this.INT_MASK.TXC_M;
		this.TXC_M = this.INT_MASK.TXC_M;
		this.INT_MASK_BUSY_M = this.INT_MASK.BUSY_M;
		this.BUSY_M = this.INT_MASK.BUSY_M;
		this.INT_MASK_RXE_M = this.INT_MASK.RXE_M;
		this.RXE_M = this.INT_MASK.RXE_M;
		this.INT_MASK_RXB_M = this.INT_MASK.RXB_M;
		this.RXB_M = this.INT_MASK.RXB_M;
		this.INT_MASK_TXE_M = this.INT_MASK.TXE_M;
		this.TXE_M = this.INT_MASK.TXE_M;
		this.INT_MASK_TXB_M = this.INT_MASK.TXB_M;
		this.TXB_M = this.INT_MASK.TXB_M;
      this.IPGT = ral_reg_IPGT::type_id::create("IPGT",,get_full_name());
      this.IPGT.configure(this, null, "");
      this.IPGT.build();
      this.default_map.add_reg(this.IPGT, `UVM_REG_ADDR_WIDTH'hC, "RW", 0);
		this.IPGT_IPGT = this.IPGT.IPGT;
      this.IPGR1 = ral_reg_IPGR1::type_id::create("IPGR1",,get_full_name());
      this.IPGR1.configure(this, null, "");
      this.IPGR1.build();
      this.default_map.add_reg(this.IPGR1, `UVM_REG_ADDR_WIDTH'h10, "RW", 0);
		this.IPGR1_IPGR1 = this.IPGR1.IPGR1;
      this.IPGR2 = ral_reg_IPGR2::type_id::create("IPGR2",,get_full_name());
      this.IPGR2.configure(this, null, "");
      this.IPGR2.build();
      this.default_map.add_reg(this.IPGR2, `UVM_REG_ADDR_WIDTH'h14, "RW", 0);
		this.IPGR2_IPGR2 = this.IPGR2.IPGR2;
      this.PACKETLEN = ral_reg_PACKETLEN::type_id::create("PACKETLEN",,get_full_name());
      this.PACKETLEN.configure(this, null, "");
      this.PACKETLEN.build();
      this.default_map.add_reg(this.PACKETLEN, `UVM_REG_ADDR_WIDTH'h18, "RW", 0);
		this.PACKETLEN_MINFL = this.PACKETLEN.MINFL;
		this.MINFL = this.PACKETLEN.MINFL;
		this.PACKETLEN_MAXFL = this.PACKETLEN.MAXFL;
		this.MAXFL = this.PACKETLEN.MAXFL;
      this.COLLCONF = ral_reg_COLLCONF::type_id::create("COLLCONF",,get_full_name());
      this.COLLCONF.configure(this, null, "");
      this.COLLCONF.build();
      this.default_map.add_reg(this.COLLCONF, `UVM_REG_ADDR_WIDTH'h1C, "RW", 0);
		this.COLLCONF_MAXRET = this.COLLCONF.MAXRET;
		this.MAXRET = this.COLLCONF.MAXRET;
		this.COLLCONF_COLLVALID = this.COLLCONF.COLLVALID;
		this.COLLVALID = this.COLLCONF.COLLVALID;
      this.TX_BD_NUM = ral_reg_TX_BD_NUM::type_id::create("TX_BD_NUM",,get_full_name());
      this.TX_BD_NUM.configure(this, null, "");
      this.TX_BD_NUM.build();
      this.default_map.add_reg(this.TX_BD_NUM, `UVM_REG_ADDR_WIDTH'h20, "RW", 0);
		this.TX_BD_NUM_TX_BD_NUM = this.TX_BD_NUM.TX_BD_NUM;
      this.CTRLMODER = ral_reg_CTRLMODER::type_id::create("CTRLMODER",,get_full_name());
      this.CTRLMODER.configure(this, null, "");
      this.CTRLMODER.build();
      this.default_map.add_reg(this.CTRLMODER, `UVM_REG_ADDR_WIDTH'h24, "RW", 0);
		this.CTRLMODER_TXFLOW = this.CTRLMODER.TXFLOW;
		this.TXFLOW = this.CTRLMODER.TXFLOW;
		this.CTRLMODER_RXFLOW = this.CTRLMODER.RXFLOW;
		this.RXFLOW = this.CTRLMODER.RXFLOW;
		this.CTRLMODER_PASSALL = this.CTRLMODER.PASSALL;
		this.PASSALL = this.CTRLMODER.PASSALL;
      this.MIIMODER = ral_reg_MIIMODER::type_id::create("MIIMODER",,get_full_name());
      this.MIIMODER.configure(this, null, "");
      this.MIIMODER.build();
      this.default_map.add_reg(this.MIIMODER, `UVM_REG_ADDR_WIDTH'h28, "RW", 0);
		this.MIIMODER_MIINOPRE = this.MIIMODER.MIINOPRE;
		this.MIINOPRE = this.MIIMODER.MIINOPRE;
		this.MIIMODER_CLKDIV = this.MIIMODER.CLKDIV;
		this.CLKDIV = this.MIIMODER.CLKDIV;
      this.MIICOMMAND = ral_reg_MIICOMMAND::type_id::create("MIICOMMAND",,get_full_name());
      this.MIICOMMAND.configure(this, null, "");
      this.MIICOMMAND.build();
      this.default_map.add_reg(this.MIICOMMAND, `UVM_REG_ADDR_WIDTH'h2C, "RW", 0);
		this.MIICOMMAND_WCTRLDATA = this.MIICOMMAND.WCTRLDATA;
		this.WCTRLDATA = this.MIICOMMAND.WCTRLDATA;
		this.MIICOMMAND_RSTAT = this.MIICOMMAND.RSTAT;
		this.RSTAT = this.MIICOMMAND.RSTAT;
		this.MIICOMMAND_SCANSTAT = this.MIICOMMAND.SCANSTAT;
		this.SCANSTAT = this.MIICOMMAND.SCANSTAT;
      this.MIIADDRESS = ral_reg_MIIADDRESS::type_id::create("MIIADDRESS",,get_full_name());
      this.MIIADDRESS.configure(this, null, "");
      this.MIIADDRESS.build();
      this.default_map.add_reg(this.MIIADDRESS, `UVM_REG_ADDR_WIDTH'h30, "RW", 0);
		this.MIIADDRESS_RGAD = this.MIIADDRESS.RGAD;
		this.RGAD = this.MIIADDRESS.RGAD;
		this.MIIADDRESS_FIAD = this.MIIADDRESS.FIAD;
		this.FIAD = this.MIIADDRESS.FIAD;
      this.MIITX_DATA = ral_reg_MIITX_DATA::type_id::create("MIITX_DATA",,get_full_name());
      this.MIITX_DATA.configure(this, null, "");
      this.MIITX_DATA.build();
      this.default_map.add_reg(this.MIITX_DATA, `UVM_REG_ADDR_WIDTH'h34, "RW", 0);
		this.MIITX_DATA_CTRLDATA = this.MIITX_DATA.CTRLDATA;
		this.CTRLDATA = this.MIITX_DATA.CTRLDATA;
      this.MIIRX_DATA = ral_reg_MIIRX_DATA::type_id::create("MIIRX_DATA",,get_full_name());
      this.MIIRX_DATA.configure(this, null, "");
      this.MIIRX_DATA.build();
      this.default_map.add_reg(this.MIIRX_DATA, `UVM_REG_ADDR_WIDTH'h38, "RO", 0);
		this.MIIRX_DATA_PRSD = this.MIIRX_DATA.PRSD;
		this.PRSD = this.MIIRX_DATA.PRSD;
      this.MIISTATUS = ral_reg_MIISTATUS::type_id::create("MIISTATUS",,get_full_name());
      this.MIISTATUS.configure(this, null, "");
      this.MIISTATUS.build();
      this.default_map.add_reg(this.MIISTATUS, `UVM_REG_ADDR_WIDTH'h3C, "RO", 0);
		this.MIISTATUS_NVALID = this.MIISTATUS.NVALID;
		this.NVALID = this.MIISTATUS.NVALID;
		this.MIISTATUS_BUSY_N = this.MIISTATUS.BUSY_N;
		this.BUSY_N = this.MIISTATUS.BUSY_N;
		this.MIISTATUS_LINKFAIL = this.MIISTATUS.LINKFAIL;
		this.LINKFAIL = this.MIISTATUS.LINKFAIL;
      this.MAC_ADDR0 = ral_reg_MAC_ADDR0::type_id::create("MAC_ADDR0",,get_full_name());
      this.MAC_ADDR0.configure(this, null, "");
      this.MAC_ADDR0.build();
      this.default_map.add_reg(this.MAC_ADDR0, `UVM_REG_ADDR_WIDTH'h40, "RW", 0);
		this.MAC_ADDR0_MAC_ADDR = this.MAC_ADDR0.MAC_ADDR;
      this.MAC_ADDR1 = ral_reg_MAC_ADDR1::type_id::create("MAC_ADDR1",,get_full_name());
      this.MAC_ADDR1.configure(this, null, "");
      this.MAC_ADDR1.build();
      this.default_map.add_reg(this.MAC_ADDR1, `UVM_REG_ADDR_WIDTH'h44, "RW", 0);
		this.MAC_ADDR1_MAC_ADDR = this.MAC_ADDR1.MAC_ADDR;
      this.HASH0 = ral_reg_HASH0::type_id::create("HASH0",,get_full_name());
      this.HASH0.configure(this, null, "");
      this.HASH0.build();
      this.default_map.add_reg(this.HASH0, `UVM_REG_ADDR_WIDTH'h48, "RW", 0);
		this.HASH0_HASH0 = this.HASH0.HASH0;
      this.HASH1 = ral_reg_HASH1::type_id::create("HASH1",,get_full_name());
      this.HASH1.configure(this, null, "");
      this.HASH1.build();
      this.default_map.add_reg(this.HASH1, `UVM_REG_ADDR_WIDTH'h4C, "RW", 0);
		this.HASH1_HASH1 = this.HASH1.HASH1;
      this.TXCTRL = ral_reg_TXCTRL::type_id::create("TXCTRL",,get_full_name());
      this.TXCTRL.configure(this, null, "");
      this.TXCTRL.build();
      this.default_map.add_reg(this.TXCTRL, `UVM_REG_ADDR_WIDTH'h50, "RW", 0);
		this.TXCTRL_TXPAUSEREQ = this.TXCTRL.TXPAUSEREQ;
		this.TXPAUSEREQ = this.TXCTRL.TXPAUSEREQ;
		this.TXCTRL_TXPAUSETV = this.TXCTRL.TXPAUSETV;
		this.TXPAUSETV = this.TXCTRL.TXPAUSETV;
      foreach (this.TxBD[i]) begin
         int J = i;
         this.TxBD[J] = ral_regfile_ethernet_blk_TxBD::type_id::create($psprintf("TxBD[%0d]",J),,get_full_name());
        this.TxBD[J].configure(this, null, "");
        this.TxBD[J].build();
      this.TxBD[J].map(default_map, `UVM_REG_ADDR_WIDTH'h400+`UVM_REG_ADDR_WIDTH'h8 * J);
      end
   endfunction : build

	`uvm_object_utils(ral_block_ethernet_blk)

endclass : ral_block_ethernet_blk



`endif
