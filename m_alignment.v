module m_alignment (
  input clk,
  input rst,
  output wire m_align
  );

  reg [2:0] tmp = 3'b101;
  reg add;
  assign m_align = (tmp[2]);
  always @ ( posedge clk ) begin
    add = tmp[2] ^ tmp[0];
    tmp = tmp << 1;
    tmp = tmp + add;
  end


endmodule // m_alignment
