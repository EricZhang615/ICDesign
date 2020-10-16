module AddModule (
  input [12:0] posInput,
  input [12:0] negInput,
  input rst,
  output wire [13:0] result

  );

  assign result = (rst) ? 14'b00000000000000 : (posInput + negInput);



endmodule // AddModule
