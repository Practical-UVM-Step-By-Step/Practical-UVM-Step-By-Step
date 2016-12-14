
/*****************************************
 * WB Slave Interface
 ******************************************/
interface wb_slv_intf  (input bit clk, rst);


   logic [`UART_ADDR_WIDTH-1:0]  wb_adr_i;
   logic [`UART_DATA_WIDTH-1:0]  wb_dat_i;
   logic [`UART_DATA_WIDTH-1:0]  wb_dat_o;
   logic                        wb_we_i;
   logic                        wb_stb_i;
   logic                        wb_cyc_i;
   logic     [3:0]              wb_sel_i;
   logic                        wb_ack_o;
   logic                        int_o;


  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;

     inout   wb_adr_i;
     inout   wb_dat_i;
     inout   wb_dat_o;
     inout   wb_we_i;
     inout   wb_stb_i;
     inout   wb_cyc_i;
     inout   wb_sel_i;
     inout   wb_ack_o;
     inout   int_o;

    
  endclocking

  modport MP (clocking cb);

endinterface: wb_slv_intf

/******************************************
 * UART Interface
 ******************************************/
interface uart_intf  (input bit clk, rst);
   logic                        srx_pad_i;
   logic                        stx_pad_o;
   logic                        rts_pad_o;
   logic                        cts_pad_i;
   logic                        dtr_pad_o;
   logic                        dsr_pad_i;
   logic                        ri_pad_i;
   logic                        dcd_pad_i;
   logic                        baud_o;
  
  clocking cb @(posedge clk);
    default input #0.5ns output #0.5ns;

     inout   srx_pad_i;
     inout   stx_pad_o;
     inout   rts_pad_o;
     inout   cts_pad_i;
     inout   dtr_pad_o;
     inout   dsr_pad_i;
     inout   ri_pad_i;
     inout   dcd_pad_i;
     inout   baud_o;

  endclocking

  modport MP (clocking cb);

endinterface: uart_intf

