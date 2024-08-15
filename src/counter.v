module counter(
  input clk,
  input rst,
  input enable,
  output reg [7:0] bits
);

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      bits <= 0;
    end else if(enable) begin
      bits <= bits + 1;
    end
  end

endmodule


