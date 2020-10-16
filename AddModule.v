module AddModule (
  input [12:0] posInput,
  input [12:0] negInput,
  input rst,
  output wire [12:0] result

  );

  assign result = (rst) ? 13'b0000000000000 : (posInput + negInput);
  


endmodule // AddModule
