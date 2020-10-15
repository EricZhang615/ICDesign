module DigitalQAMModulation(
  input wire clk,
  input wire rst,

  output wire clk_m,

  output wire m_align,
  output wire [2:0] A_reg

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


endmodule // DigitalQAMModulation
