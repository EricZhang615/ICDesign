module ClockGen (
  input clk,
  output wire clk_m,
  output wire clk_level

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

  reg [14:0] count_l=0;
  reg clk_l_tmp=0;

  assign clk_level = (clk_l_tmp);

  always @ ( posedge clk ) begin
    if (count_l == 24999 ) begin
      clk_l_tmp =~ clk_l_tmp;
      count_l = 0;
    end else begin
      count_l = count_l + 1;
    end
  end

endmodule // ClockGen
