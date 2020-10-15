module DigitalQAMModulation(
  input wire clk,
  input wire rst,

  output wire clk_m,

  output wire m_align,
  output wire [2:0] A_reg,

  output wire [1:0] SigI,
  output wire [1:0] SigQ

  );




ClockGen ClockGen(
  .clk(clk),
  .clk_m(clk_m)
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

endmodule // DigitalQAMModulation
