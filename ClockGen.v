module ClockGen (
  input clk,
  output wire clk_m

  );

  reg [12:0] count_m=0;
  reg clk_m_tmp=0;

  assign clk_m = (clk_m_tmp);

  always @ ( posedge clk ) begin
    if (count_m == 6249 ) begin
      clk_m_tmp =~ clk_m_tmp;
      count_m = 0;
    end else begin
      count_m = count_m + 1;
    end
  end

endmodule // ClockGen
