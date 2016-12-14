
/******************************************
 * WB Master Interface
 ******************************************/
interface wb_mstr_intf  (input bit clk, rst);
  logic   [31:0]  dat_i;   
  logic   [31:0]  dat_o;
  logic   [11:2]  adr_i;
  logic   	      we_i;
  logic   [3:0]   sel_i;
  logic   		  cyc_i;
  logic   		  stb_i;
  logic           ack_o;
  logic   [2:0]   cti_i;

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
       inout   dat_i;   
       inout   dat_o;
       inout   adr_i;
       inout   we_i;
       inout   sel_i;
       inout   cyc_i;
       inout   stb_i;
       inout   ack_o;
       inout   cti_i;
  endclocking

  modport MP (clocking cb);

endinterface: wb_mstr_intf


/******************************************
 * RAM Interface
 ******************************************/
interface ram_intf  (input bit clk, rst);

  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;
    
  endclocking

  modport MP (clocking cb);

endinterface: ram_intf

