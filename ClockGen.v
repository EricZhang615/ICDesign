module ClockGen (
  input clk,
  output wire clk_m,
  output wire clk_level,
  output wire clk_CarryWave

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

  reg [4:0] count1=0;
  reg [4:0] count2=0;
  reg clk1=0;
  reg clk2=0;

  reg clk_CW_tmp=0;

  assign clk_CarryWave = (clk_CW_tmp);

  always @ ( posedge clk ) begin
    if (count1 == 24) begin
      count1 = 0;
    end else begin
      if ((count1 == 0) || (count1 == 11)) begin
        clk1 =~ clk1;
        count1 = count1 + 1;
      end else begin
        count1 = count1 + 1;
      end
    end
  end

  always @ ( negedge clk ) begin
    if (count2 == 24) begin
      count2 = 0;
    end else begin
      if ((count2 == 0) || (count2 == 11)) begin
        clk2 =~ clk2;
        count2 = count2 + 1;
      end else begin
        count2 = count2 + 1;
      end
    end
  end

  assign clk_CW_tmp = ( clk1 | clk2 );


endmodule // ClockGen
