//
// Template for UVM-compliant verification environment
//

`ifndef WB_DMA_INC__SV
`define WB_DMA_INC__SV

`include "mstr_slv_src.incl"
`include "wb_dma_env_cfg.sv"
// `include "wb_dma_scoreboard.sv"
`include "wb_dma_env_cov.sv"
`include "mon_2cov.sv"
`include "ral_multiplexed.sv"
`include "ral_wb_dma.sv"

`endif // WB_DMA_INC__SV
