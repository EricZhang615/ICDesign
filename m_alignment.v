module m_alignment (
  input clk,
  input rst,
  output wire m_align,
  output wire [2:0] A_reg

  );

  reg [2:0] tmp = 3'b101;
  reg add;

  assign m_align = (tmp[2]);
  assign A_reg = (tmp);


  always @ ( posedge clk or posedge rst ) begin
    if (rst) begin
      tmp[2] = 1;
    end else begin
      add = tmp[2] ^ tmp[0];
      tmp = tmp << 1;
      tmp = tmp + add;
    end
  end


endmodule // m_alignment
