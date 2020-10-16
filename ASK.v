module ASK (
  input rst,
  input CarryWave,
  input BaseSig,
  output wire Modulated
  );

  reg en=0;

  always @ ( posedge rst ) begin
    if (rst) begin
      en = 1;
    end else begin
      en = 0;
    end
  end

  assign Modulated = (CarryWave && BaseSig) & en;


endmodule // ASK
