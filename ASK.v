module ASK (
  input rst,
  input [9:0] CarryWave,
  input [2:0] BaseSig,
  output wire [10:0] Modulated
  );

  reg en=0;

  always @ ( posedge rst ) begin
    if (rst) begin
      en = 0;
    end else begin
      en = 1;
    end
  end

  assign Modulated = (CarryWave && BaseSig);


endmodule // ASK
