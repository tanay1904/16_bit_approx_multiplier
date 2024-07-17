`include "sample.v"
`include "proj_16bit_mul_16_bit_WTcompressor.v"
`include "proj_16bit_mul_FS_addder.v"

module approx_multiplier_WT_finial #(parameter N = 16)(
    input logic clk,
    input logic rst,
    input logic load,
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    output logic [2 * N : 0] Z
);
  reg [16-1:0][2 * 16 - 2:0] WT;
    integer k;
  wire [1:0][2 * 16 - 1:0] S;
    par_mul # (.N(N)) ser_mul_1 (
        .clk(clk),
        .rst(rst),
        .load(load),
        .A(A),
        .B(B),
        .WT(WT),
        .k(k)
    );
    sixteen_bit_mul sixteen_bit_mul_1 (
        .rst(rst),
        .WT(WT),
        .clk(clk),
        .S(S)
    );
    FS_adder #(.N(N)) FS_adder_1 (
        .rst(rst),
        .k(k),
        .S(S),
        .clk(clk),
        .Z(Z)
    );

endmodule

