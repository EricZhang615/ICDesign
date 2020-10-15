`timescale 1us / 1us


module DigitalQAMModulation;
reg clk;
wire m_align;

m_alignment m_gen(
  .clk(clk),
  .m_align(m_align)
  );

parameter timer = 1000;

initial begin
  clk = 1'b0;
end

always
begin
  #(timer / 2) clk =~ clk;
end

endmodule // DigitalQAMModulation
