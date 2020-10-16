`timescale 10ns / 10ns


module Testbench;
reg clk;
reg rst;

wire clk_m;
wire clk_level;
wire clk_CarryWave;

wire m_align;
wire [2:0] A_reg;

wire [1:0] SigI;
wire [1:0] SigQ;

wire [2:0] Siga;
wire [2:0] Sigb;

wire [9:0] SinWave;
wire [9:0] CosWave;

wire [12:0] I_mod;
wire [12:0] Q_mod;

wire [12:0] qam;



DigitalQAMModulation MainComp(
  .clk(clk),
  .rst(rst),
  .clk_m(clk_m),
  .clk_level(clk_level),
  .clk_CarryWave(clk_CarryWave),
  .m_align(m_align),
  .A_reg(A_reg),
  .SigI(SigI),
  .SigQ(SigQ),
  .Siga(Siga),
  .Sigb(Sigb),
  .SinWave(SinWave),
  .CosWave(CosWave),
  .I_mod(I_mod),
  .Q_mod(Q_mod),
  .qam(qam)

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
