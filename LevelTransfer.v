module LevelTransfer (
  input clk,
  input rst,
  input [1:0] InputSig,
  output reg [2:0] LevelSig
  );

  always @ ( posedge clk or posedge rst ) begin
    if (rst) begin
      LevelSig = 3'b000;
    end else begin
      case (InputSig)
        2'b00: LevelSig = 3'b011;
        2'b01: LevelSig = 3'b001;
        2'b11: LevelSig = 3'b111;
        2'b10: LevelSig = 3'b101;
        default: LevelSig = 3'b000;
      endcase
    end
  end

endmodule // LevelTransfer
