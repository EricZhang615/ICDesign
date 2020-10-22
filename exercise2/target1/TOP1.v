module TOP1 (
  input rst,
  input clk,
  input flag_cs,
  input we_en,

  output wire [2:0] state_o,
  output wire rst_cs,
  output wire clk_cs

  );

  wire clk_4;


ClockGen4 ClockGen4(
  .clk(clk),
  .clk_4(clk_4)
  );

StateMachine StateMachine(
  .clk(clk),
  .rst(rst),
  .clk_4(clk_4),
  .flag_cs(flag_cs),
  .we_en(we_en),
  .state_o(state_o),
  .rst_cs(rst_cs),
  .clk_cs(clk_cs)
  );

endmodule // TOP1
