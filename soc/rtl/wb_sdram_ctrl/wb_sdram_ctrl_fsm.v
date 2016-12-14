`include "wb_sdram_ctrl_defines.v"
module wb_sdram_ctrl_fsm (
  output reg [14:0] a,
  output reg accept_cmd,
  output reg [2:0] cmd,
  output reg cs_n,
  output reg rd_ack,
  output reg ref_ack,
  output reg wr_ack,
  input clear,
  input dly_100us,
  input end_of_burst,
  input ref_req,
  input sdram_clk,
  input wb_ack,
  input [`WB_ADR_HI:`WB_ADR_LO] wb_adr_i,
  input wb_cyc,
  input wb_rst,
  input wb_stb,
  input wb_we 
);
  
  
  

  // state bits
  parameter 
  IDLE           = 18, 
  ACT_ROW        = 13, 
  AREF           = 11, 
  ARF1           = 17, 
  ARF2           = 19, 
  AWAIT_CMD      = 10, 
  LMR            = 3, 
  NOP1           = 0, 
  NOP2           = 14, 
  NOP3           = 15, 
  NOP4           = 9, 
  NOP5           = 8, 
  NOP6           = 7, 
  PRE            = 5, 
  PRECHARGECLEAR = 16, 
  PRECHARGERD    = 6, 
  PRECHARGETERM  = 4, 
  PRECHARGEWR    = 12, 
  READ           = 2, 
  WRITE          = 1; 
  
  reg [19:0] state;
  reg [19:0] nextstate;
  
  // comb always block
  always @* begin
    nextstate = 20'b00000000000000000000;
    a[14:0] = `A_DEFAULT; // default
    accept_cmd = 1'b0; // default
    cmd[2:0] = `CMD_NOP; // default
    cs_n = 1'b0; // default
    rd_ack = 1'b0; // default
    ref_ack = 1'b0; // default
    wr_ack = 1'b0; // default
    case (1'b1) // synopsys parallel_case full_case
      state[IDLE]          : begin
                                                cs_n = 1'b1;
        if (dly_100us)                          nextstate[PRE] = 1'b1;
        else                                    nextstate[IDLE] = 1'b1; // Added because implied_loopback is true
      end
      state[ACT_ROW]       : begin
                                                a[14:0] = `A_ACT;
                                                cmd[2:0] = `CMD_ACT;
                                                nextstate[NOP4] = 1'b1;
      end
      state[AREF]          : begin
                                                cmd[2:0] = `CMD_AREF;
                                                ref_ack = 1'b1;
                                                nextstate[AWAIT_CMD] = 1'b1;
      end
      state[ARF1]          : begin
                                                cmd[2:0] = `CMD_AREF;
                                                nextstate[NOP2] = 1'b1;
      end
      state[ARF2]          : begin
                                                cmd[2:0] = `CMD_AREF;
                                                nextstate[NOP3] = 1'b1;
      end
      state[AWAIT_CMD]     : begin
                                                accept_cmd = 1'b1;
                                                cs_n = 1'b1;
        if (ref_req)                            nextstate[AREF] = 1'b1;
        else if (wb_stb & wb_cyc)               nextstate[ACT_ROW] = 1'b1;
        else                                    nextstate[AWAIT_CMD] = 1'b1; // Added because implied_loopback is true
      end
      state[LMR]           : begin
                                                a[14:0] = `A_LMR;
                                                cmd[2:0] = `CMD_LMR;
                                                nextstate[AWAIT_CMD] = 1'b1;
      end
      state[NOP1]          :                    nextstate[ARF1] = 1'b1;
      state[NOP2]          :                    nextstate[ARF2] = 1'b1;
      state[NOP3]          :                    nextstate[LMR] = 1'b1;
      state[NOP4]          : if (wb_we)         nextstate[WRITE] = 1'b1;
                             else               nextstate[READ] = 1'b1;
      state[NOP5]          : begin
        if (clear)                              nextstate[ACT_ROW] = 1'b1;
        else if (wb_ack | (!wb_cyc & !wb_stb))  nextstate[AWAIT_CMD] = 1'b1;
        else                                    nextstate[NOP5] = 1'b1; // Added because implied_loopback is true
      end
      state[NOP6]          : begin
                                                accept_cmd = 1'b1;
                                                nextstate[ACT_ROW] = 1'b1;
      end
      state[PRE]           : begin
                                                a[14:0] = `A_PRE;
                                                cmd[2:0] = `CMD_PRE;
                                                nextstate[NOP1] = 1'b1;
      end
      state[PRECHARGECLEAR]: begin
                                                a[14:0] = `A_PRE;
                                                accept_cmd = 1'b1;
                                                cmd[2:0] = `CMD_PRE;
                                                nextstate[ACT_ROW] = 1'b1;
      end
      state[PRECHARGERD]   : begin
                                                a[14:0] = `A_PRE;
                                                cmd[2:0] = `CMD_PRE;
        if (clear)                              nextstate[NOP6] = 1'b1;
        else                                    nextstate[NOP5] = 1'b1;
      end
      state[PRECHARGETERM] : begin
                                                a[14:0] = `A_PRE;
                                                cmd[2:0] = `CMD_PRE;
                                                nextstate[AWAIT_CMD] = 1'b1;
      end
      state[PRECHARGEWR]   : begin
                                                a[14:0] = `A_PRE;
                                                cmd[2:0] = `CMD_PRE;
                                                nextstate[AWAIT_CMD] = 1'b1;
      end
      state[READ]          : begin
                                                a[14:0] = `A_READ;
                                                cmd[2:0] = `CMD_READ;
                                                rd_ack = 1'b1;
        if (!wb_cyc & !wb_stb)                  nextstate[PRECHARGETERM] = 1'b1;
        else if (clear)                         nextstate[PRECHARGECLEAR] = 1'b1;
        else if (end_of_burst)                  nextstate[PRECHARGERD] = 1'b1;
        else                                    nextstate[READ] = 1'b1; // Added because implied_loopback is true
      end
      state[WRITE]         : begin
                                                a[14:0] = `A_WRITE;
                                                cmd[2:0] = `CMD_WRITE;
                                                wr_ack = 1'b1;
        if (end_of_burst)                       nextstate[PRECHARGEWR] = 1'b1;
        else                                    nextstate[WRITE] = 1'b1; // Added because implied_loopback is true
      end
    endcase
  end
  
  // sequential always block
  always @(posedge sdram_clk or posedge wb_rst) begin
    if (wb_rst)
      state <= 20'b00000000000000000001 << IDLE;
    else
      state <= nextstate;
  end
  
  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [111:0] statename;
  always @* begin
    case (1)
      state[IDLE]          : statename = "IDLE";
      state[ACT_ROW]       : statename = "ACT_ROW";
      state[AREF]          : statename = "AREF";
      state[ARF1]          : statename = "ARF1";
      state[ARF2]          : statename = "ARF2";
      state[AWAIT_CMD]     : statename = "AWAIT_CMD";
      state[LMR]           : statename = "LMR";
      state[NOP1]          : statename = "NOP1";
      state[NOP2]          : statename = "NOP2";
      state[NOP3]          : statename = "NOP3";
      state[NOP4]          : statename = "NOP4";
      state[NOP5]          : statename = "NOP5";
      state[NOP6]          : statename = "NOP6";
      state[PRE]           : statename = "PRE";
      state[PRECHARGECLEAR]: statename = "PRECHARGECLEAR";
      state[PRECHARGERD]   : statename = "PRECHARGERD";
      state[PRECHARGETERM] : statename = "PRECHARGETERM";
      state[PRECHARGEWR]   : statename = "PRECHARGEWR";
      state[READ]          : statename = "READ";
      state[WRITE]         : statename = "WRITE";
      default       :        statename = "XXXXXXXXXXXXXX";
    endcase
  end
  `endif

  
endmodule

