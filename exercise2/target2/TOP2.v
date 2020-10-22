module TOP2 (
  input rst,
  input clk,
  input flag_cs,
  input we_en,

  output wire [2:0] state_o,
  output wire rst_cs,
  output wire clk_cs,
  output wire cs_o,
  output wire da_cs

  );

  wire clk_4;
  wire [1:0] sync;


ClockGen4 ClockGen4(
  .clk(clk),
  .clk_4(clk_4),
  .sync(sync)
  );

StateMachine StateMachine(
  .clk(clk),
  .rst(rst),
  .clk_4(clk_4),
  .flag_cs(flag_cs),
  .we_en(we_en),
  .sync(sync),

  .state_o(state_o),
  .rst_cs(rst_cs),
  .clk_cs(clk_cs),
  .cs_o(cs_o),
  .da_cs(da_cs)
  
  );

endmodule // TOP2
