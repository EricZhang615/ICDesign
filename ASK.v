module ASK (
  input rst,
  input [9:0] CarryWave,
  input [2:0] BaseSig,
  output wire [12:0] Modulated
  );

  reg en=0;

  always @ ( posedge rst ) begin
    if (rst) begin
      en = 0;
    end else begin
      en = 1;
    end
  end

  wire CW_sign;
  wire BS_sign;
  wire [9:0] CW_abs;
  wire [2:0] BS_abs;
  wire [12:0] product_abs_tmp1;
  wire [12:0] product_abs_tmp2;
  wire [12:0] product_abs_tmp3;
  wire [12:0] product_abs;



  assign CW_sign = (CarryWave[9]);
  assign BS_sign = (BaseSig[2]);

  assign product_sign = (CW_sign ^ BS_sign);

  assign CW_abs = (CW_sign) ? (~CarryWave + 1) : CarryWave;
  assign BS_abs = (BS_sign) ? (~BaseSig + 1) : BaseSig;

  assign product_abs_tmp1[9:0] = (BS_abs[0]) ? CW_abs : 10'b0000000000;
  assign product_abs_tmp2[10:1] = (BS_abs[1]) ? CW_abs : 10'b0000000000;
  assign product_abs_tmp3[11:2] = (BS_abs[2]) ? CW_abs : 10'b0000000000;

  assign product_abs = (product_abs_tmp1 + product_abs_tmp2 + product_abs_tmp3);

  assign Modulated = (rst) ? 13'b0000000000000 : ((product_sign) ? (~product_abs + 1) : product_abs);



endmodule // ASK
