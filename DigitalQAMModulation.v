module DigitalQAMModulation(
  input wire clk,
  input wire rst,

  output wire clk_m,
  output wire clk_level,
  output wire clk_CarryWave,

  output wire m_align,
  output wire [2:0] A_reg,

  output wire [1:0] SigI,
  output wire [1:0] SigQ,

  output wire [2:0] Siga,
  output wire [2:0] Sigb,

  output wire [9:0] SinWave,
  output wire [9:0] CosWave,

  output wire [12:0] I_mod,
  output wire [12:0] Q_mod,

  output wire [12:0] qam

  );

ClockGen ClockGen(
  .clk(clk),
  .clk_m(clk_m),
  .clk_level(clk_level),
  .clk_CarryWave(clk_CarryWave)
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

CarryWaveGen CarryWaveGen(
  .clk(clk_CarryWave),
  .rst(rst),
  .SinWave(SinWave),
  .CosWave(CosWave)
  );

ASK ASK_I(
  .rst(rst),
  .CarryWave(CosWave),
  .BaseSig(Siga),
  .Modulated(I_mod)
  );

ASK ASK_Q(
  .rst(rst),
  .CarryWave(SinWave),
  .BaseSig(Sigb),
  .Modulated(Q_mod)
  );

AddModule AddModule(
  .rst(rst),
  .posInput(I_mod),
  .negInput(Q_mod),
  .result(qam)
  );

endmodule // DigitalQAMModulation
