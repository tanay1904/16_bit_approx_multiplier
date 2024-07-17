module FS_adder #(parameter N = 4) (
    input rst,
    input integer k,
    input [1:0][31:0] S,
    input clk,
    output reg [2*N:0] Z
);
    wire [32:0] tZ;
  assign tZ = S[1][31:0] + S[0][31:0]; 
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Z <= 0;
        end else if (k > 2 * N - 2) begin
            // Perform addition when not in reset
          Z <= tZ[16 + N : 16 - N];  // Assign the result to Z, ensuring it matches the required width
        end
    end
endmodule