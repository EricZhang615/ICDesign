module Serial2Parallel (
  input clk,
  input rst,
  input srl,
  output wire [1:0] ParaSig1,
  output wire [1:0] ParaSig2

  );

  reg [3:0] tmp;
  reg [1:0] count=0;

  always @ ( posedge clk or posedge rst ) begin
    if (rst) begin
      tmp = 4'b0000;
      count = 0;
      ParaSig1 = 2'b00;
      ParaSig2 = 2'b00;
    end else begin
      if (count == 3) begin
        tmp[3] = srl;
        ParaSig1[1] = tmp[3];
        ParaSig1[0] = tmp[1];
        ParaSig2[1] = tmp[2];
        ParaSig2[0] = tmp[0];
        count = 0;
      end else begin
        tmp[count] = srl;
        count = count + 1;
      end
    end
  end

endmodule // Serial2Parallel
