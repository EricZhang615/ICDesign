module Serial2Parallel (
  input clk,
  input rst,
  input srl,
  output wire [1:0] ParaSig1,
  output wire [1:0] ParaSig2

  );

  reg [1:0] tmp1;
  reg [1:0] tmp2;
  reg [1:0] count=0;

  always @ ( posedge clk or posedge rst ) begin
    if (rst) begin
      tmp1 = 2'b00;
      tmp2 = 2'b00;
      count = 0;
    end else begin
      if (count == 0) begin
        tmp1[1] = srl;
        count = count + 1;
      end else if (count == 1) begin
        tmp2[1] = srl;
        count = count + 1;
      end else if (count == 2) begin
        tmp1[0] = srl;
        count = count + 1;
      end else begin
        tmp2[0] = srl;
        count = count + 1;
      end
    end
  end

  assign ParaSig1 = (tmp1);
  assign ParaSig2 = (tmp2);


endmodule // Serial2Parallel
