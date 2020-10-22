module ClockGen4 (
  input clk,
  output wire clk_4
  );

  reg count=0;
  reg clk_4_tmp=0;

  assign clk_4 = (clk_4_tmp);

  always @ ( posedge clk ) begin
    if (count == 1) begin
      clk_4_tmp =~ clk_4_tmp;
      count = 0;
    end else begin
      count = count + 1;
    end
  end



endmodule // ClockGen4
