//
// Template for UVM-compliant verification environment
//

`ifndef WB_ENV__SV
`define WB_ENV__SV




`include "mstr_slv_src.incl"

`include "wb_env_cfg.sv"



`include "wb_env_cov.sv"

`include "mon_2cov.sv"


// ToDo: Add additional required `include directives

`endif // WB_ENV__SV
