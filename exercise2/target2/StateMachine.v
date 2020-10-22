module StateMachine (
  input rst,
  input clk,
  input clk_4,
  input flag_cs,
  input we_en,
  input [1:0] sync,

  output wire [2:0] state_o,
  output reg rst_cs,
  output wire clk_cs,
  output reg cs_o=1,
  output reg da_cs=0

  );

  reg [2:0] CurrentState=3'b000;
  reg [2:0] NextState=3'b000;
  assign state_o = (CurrentState);


  //reg TransmitSig1=0;
  reg [2:0] clkCount1=3'b000;

  reg clk_4_switch=0;
  assign clk_cs = (clk_4_switch & clk_4);

  //reg TransmitSig2=0;
  reg [1:0] clkCount2=2'b00;

  reg [4:0] clkCount3=5'b00000;
  reg [15:0] DataAddr=16'b1010110011110000;

  reg [2:0] clkCount4=3'b000;


  always @ ( CurrentState or posedge clk or rst) begin
    case (CurrentState)
      3'b000:begin
              if (rst == 1) begin
                rst_cs = 1;
                clkCount1 = 3'b000;
                NextState = 3'b000;
              end else begin
                if (clkCount1 == 3'b100) begin
                  clkCount1 = 3'b000;
                  NextState = 3'b001;
                end else begin
                  rst_cs = 1;
                  clkCount1 = clkCount1 + 1;
                  NextState = 3'b000;
                end
              end
             end
      3'b001: begin
                if (rst == 1) begin
                  rst_cs = 1;
                  clk_4_switch = 0;
                  NextState = 3'b000;
                end else begin
                  rst_cs = 0;
                  clk_4_switch = 1;
                  NextState = 3'b010;
                end
              end
      3'b010: begin
                if (rst == 1) begin
                  rst_cs = 1;
                  clk_4_switch = 0;
                  clkCount2 = 2'b00;
                  NextState = 3'b000;
                end else begin
                  if (clkCount2 == 2'b10) begin
                    if (we_en == 1) begin
                      clkCount2 = 2'b00;
                      NextState = 3'b011;
                    end else begin
                      NextState = 3'b010;
                    end
                  end else begin
                    clkCount2 = clkCount2 + 1;
                    NextState = 3'b010;
                  end
                end
              end
      3'b011: begin
                if (rst == 1) begin
                  rst_cs = 1;
                  clk_4_switch = 0;
                  clkCount3 = 5'b00000;
                  NextState = 3'b000;
                end else begin
                  if (flag_cs == 0) begin
                    NextState = 3'b010;
                  end else begin
                    if (sync == 2'b11) begin
                      if (clkCount3 == 5'b00000) begin
                        cs_o = 0;
                        clkCount3 = clkCount3 + 1;
                        NextState = 3'b011;
                      end else if (clkCount3 == 5'b10000) begin
                        cs_o = 1;
                        clkCount3 = 5'b00000;
                        NextState = 3'b100;
                      end else begin
                        clkCount3 = clkCount3 + 1;
                        NextState = 3'b011;
                      end
                    end else begin
                      NextState = 3'b011;
                    end
                    if (clkCount3 == 5'b00000) begin
                      da_cs = 0;
                    end else begin
                      da_cs = DataAddr[16 - clkCount3];
                    end
                  end
                end
              end
      3'b100: begin
                if (rst == 1) begin
                  rst_cs = 1;
                  clk_4_switch = 0;
                  clkCount4 = 3'b000;
                  NextState = 3'b000;
                end else begin
                  if (clkCount4 == 3'b100) begin
                    clkCount4 = 3'b000;
                    if (flag_cs == 1) begin
                      NextState = 3'b010;
                    end else begin
                      NextState = 3'b011;
                    end
                  end else begin
                    clkCount4 = clkCount4 + 1;
                    NextState = 3'b100;
                  end
                end
              end
      default: NextState = 3'b000;
    endcase
  end

  always @ ( posedge clk ) begin
    CurrentState = NextState;
  end

  /*
  always @ ( TransmitSig1 or posedge clk ) begin
    if (TransmitSig1 == 1) begin
      clkCount1 = clkCount1 + 1;
    end else begin
      clkCount1 = 3'b000;
    end
  end

  always @ ( TransmitSig2 or posedge clk ) begin
    if (TransmitSig2 == 1) begin
      clkCount2 = clkCount2 + 1;
    end else begin
      clkCount2 = 2'b00;
    end
  end
  */

endmodule // StateMachine
