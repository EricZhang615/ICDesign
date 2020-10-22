`timescale 100us / 100us

module Testbench;
reg clk;
reg rst;
reg flag_cs;
reg we_en;

wire [2:0] state_o;
wire rst_cs;
wire clk_cs;
wire cs_o;
wire da_cs;



TOP2 TOP(
  .clk(clk),
  .rst(rst),
  .flag_cs(flag_cs),
  .we_en(we_en),

  .state_o(state_o),
  .rst_cs(rst_cs),
  .clk_cs(clk_cs),
  .cs_o(cs_o),
  .da_cs(da_cs)

  );

  parameter timer = 10;

  initial begin
    clk = 1;
    rst = 0;
    we_en = 1;
    flag_cs = 1;
    // #850000
    // rst = 1;
    // #1000
    // rst = 0;

    #783
    we_en = 1;
    flag_cs = 0;




  end

  always
  begin
    #(timer / 2) clk =~ clk;
  end
endmodule
