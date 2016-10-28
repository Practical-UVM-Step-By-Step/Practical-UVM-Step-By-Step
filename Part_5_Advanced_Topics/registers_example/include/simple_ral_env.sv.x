//
// Template for UVM-compliant verification environment
//

`ifndef SIMPLE_RAL_ENV__SV
`define SIMPLE_RAL_ENV__SV




`include "mstr_slv_src.incl"

`include "simple_ral_env_cfg.sv"

`include "simple_ral_env_cov.sv"
`include "mon_2cov.sv"

`include "ral_simple_ral_env.sv"
// ToDo: Add additional required `include directives

`endif // SIMPLE_RAL_ENV__SV
