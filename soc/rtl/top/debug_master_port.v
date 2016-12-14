module debug_master_port (/*AUTOARG*/
   // Outputs
   m_data_o, m_ack_o, m_err_o, m_rty_o,
   // Inputs
   clk_i, rst_i, m_data_i, m_addr_i, m_sel_i, m_we_i, m_cyc_i,
   m_stb_i
   );
parameter dw=32;
   
parameter aw=16;
parameter sw=4;

input           clk_i, rst_i;

// Master 0 Interface
input   [dw-1:0]        m_data_i;
output  [dw-1:0]        m_data_o;
input   [aw-1:0]        m_addr_i;
input   [sw-1:0]        m_sel_i;
input                   m_we_i;
input                   m_cyc_i;
input                   m_stb_i;
output                  m_ack_o;
output                  m_err_o;
output                  m_rty_o;

endmodule
