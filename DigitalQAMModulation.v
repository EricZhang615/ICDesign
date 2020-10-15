module DigitalQAMModulation(
  input wire clk,
  input wire rst,

  output wire clk_m,
  output wire clk_level,

  output wire m_align,
  output wire [2:0] A_reg,

  output wire [1:0] SigI,
  output wire [1:0] SigQ,

  output wire [2:0] Siga,
  output wire [2:0] Sigb

  );




ClockGen ClockGen(
  .clk(clk),
  .clk_m(clk_m),
  .clk_level(clk_level)
  );

m_alignment m_gen(
  .clk(clk_m),
  .rst(rst),
  .m_align(m_align),
  .A_reg(A_reg)
  );

Serial2Parallel Serial2Parallel(
  .clk(clk_m),
  .rst(rst),
  .srl(m_align),
  .ParaSig1(SigI),
  .ParaSig2(SigQ)
  );

LevelTransfer LevelTransferI(
  .clk(clk_level),
  .rst(rst),
  .InputSig(SigI),
  .LevelSig(Siga)
  );

LevelTransfer LevelTransferQ(
  .clk(clk_level),
  .rst(rst),
  .InputSig(SigQ),
  .LevelSig(Sigb)
  );

endmodule // DigitalQAMModulation
