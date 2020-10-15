`timescale 10ns / 10ns


module Testbench;
reg clk;
reg rst;
wire clk_m;
wire m_align;
wire [2:0] A_reg;

DigitalQAMModulation MainComp(
  .clk(clk),
  .rst(rst),
  .clk_m(clk_m),
  .m_align(m_align),
  .A_reg(A_reg)
  );


parameter timer = 2;

initial begin
  clk = 0;
  rst = 0;
  // #850000
  // rst = 1;
  // #1000
  // rst = 0;

end

always
begin
  #(timer / 2) clk =~ clk;
end

endmodule // DigitalQAMModulation
