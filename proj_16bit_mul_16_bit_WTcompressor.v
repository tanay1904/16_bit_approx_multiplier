`include "proj_16bit_mul_compressors.v"
`include "proj_16bit_mul_approx_compressors.v"
module sixteen_bit_mul(rst, WT, k, clk, S);
parameter M = 16;
input rst;
  input reg [ M - 1 : 0 ][ 2 * M - 2 : 0 ] WT;
input integer k;
input clk;
output wire [1:0] [2 * M - 1 : 0] S;


//wire declarations
wire comp2_2_2, comp2_2_3; // 1-bit wires
wire comp3_2_3, comp3_2_4; // 1-bit wires
wire comp2_2_29, comp2_2_30; // 1-bit wires
wire sum2_2_2, sum2_2_3, sum3_2_3, sum3_2_4, sum2_2_29, sum2_2_30; // 1-bit wires

wire [1:0] comp4_2_4, comp4_2_5, comp5_2_5, comp5_2_6, comp5_2_26, comp5_2_27, comp4_2_27, comp4_2_28; // 2-bit wires
wire [1:0] sum4_2_4, sum4_2_5, sum5_2_5, sum5_2_6, sum5_2_26, sum5_2_27, sum4_2_27, sum4_2_28; // 2-bit wires

wire [2:0] comp6_2_6, comp6_2_7, comp7_2_7, comp7_2_8, comp7_2_24, comp7_2_25, comp6_2_25, comp6_2_26; // 3-bit wires
wire [2:0] sum6_2_6, sum6_2_7, sum7_2_7, sum7_2_8, sum7_2_24, sum7_2_25, sum6_2_25, sum6_2_26; // 3-bit wires

wire [3:0] comp8_2_8, comp8_2_9, comp9_2_9, comp9_2_10, comp9_2_22, comp9_2_23, comp8_2_23, comp8_2_24; // 4-bit wires
wire [3:0] sum8_2_8, sum8_2_9, sum9_2_9, sum9_2_10, sum9_2_22, sum9_2_23, sum8_2_23, sum8_2_24; // 4-bit wires

wire [4:0] comp10_2_10, comp10_2_11, comp11_2_11, comp11_2_12, comp11_2_20, comp11_2_21, comp10_2_22, comp10_2_21; // 5-bit wires
wire [4:0] sum10_2_10, sum10_2_11, sum11_2_11, sum11_2_12, sum11_2_20, sum11_2_21, sum10_2_22, sum10_2_21; // 5-bit wires

wire [5:0] comp12_2_12, comp12_2_13, comp13_2_13, comp13_2_14, comp13_2_18, comp13_2_19, comp12_2_19, comp12_2_20; // 6-bit wires
wire [5:0] sum12_2_12, sum12_2_13, sum13_2_13, sum13_2_14, sum13_2_15, sum13_2_18, sum12_2_19, sum12_2_18; // 6-bit wires

wire [6:0] comp14_2_14, comp14_2_15, comp14_2_16, comp14_2_17, comp14_2_18, comp15_2_15, comp15_2_16, comp14_3_17; // 7-bit wire
wire [6:0] sum14_2_14, sum14_2_15, sum14_2_16, sum14_2_17, sum14_2_18, sum15_2_15, sum15_2_16, sum14_3_17; // 7-bit wires




app_comp2_2 comp2_22({WT[M-2][2], WT[M-3][2]}, sum2_2_2, comp_2_2_2);
app_comp2_2 comp2_23({WT[M-1][3], comp_2_2_2}, sum2_2_3, comp2_2_3);
app_comp3_2 comp3_23({WT[M-2][3], WT[M-3][3],WT[M-4][3]}, sum3_2_3, comp3_2_3);
app_comp3_2 comp3_24({WT[M-1][4], comp2_2_3, comp3_2_3}, sum3_2_4, comp3_2_4);
app_comp4_2 comp4_24({WT[M-2][4], WT[M-3][4], WT[M-4][4], WT[M-5][4]}, sum4_2_4, comp4_2_4);
app_comp4_2 comp4_25({WT[M-1][5], {comp3_2_4} , {comp4_2_4}}, sum4_2_5, comp4_2_5);
app_comp5_2 comp5_25({WT[M-2][5], WT[M-3][5], WT[M-4][5], WT[M-5][5], WT[M-6][5]}, sum5_2_5, comp5_2_5);
app_comp5_2 comp5_26({WT[M-1][6], comp4_2_5, comp5_2_5}, sum5_2_6, comp5_2_6);
app_comp6_2 comp6_26({WT[M-2][6], WT[M-3][6], WT[M-4][6], WT[M-5][6], WT[M-6][6], WT[M-7][6]}, sum6_2_6, comp6_2_6);
app_comp6_2 comp6_27({WT[M-1][7],comp5_2_6,comp6_2_6}, sum6_2_7, comp6_2_7);
app_comp7_2 comp7_27({WT[M-2][7], WT[M-3][7], WT[M-4][7], WT[M-5][7], WT[M-6][7], WT[M-7][7], WT[M-8][7]}, sum7_2_7,comp7_2_7);
app_comp7_2 comp7_28({WT[M-1][8], comp6_2_7, comp7_2_7}, sum7_2_8, comp7_2_8);
app_comp8_2 comp8_28({WT[M-2][8], WT[M-3][8], WT[M-4][8], WT[M-5][8], WT[M-6][8], WT[M-7][8], WT[M-8][8], WT[M-9][8]}, sum8_2_8, comp8_2_8);
app_comp8_2 comp8_29({WT[M-1][9], comp7_2_8, comp8_2_8}, sum8_2_9, comp8_2_9);
app_comp9_2 comp9_29({WT[M-2][9], WT[M-3][9], WT[M-4][9], WT[M-5][9], WT[M-6][9], WT[M-7][9], WT[M-8][9], WT[M-9][9], WT[M-10][9]}, sum9_2_9, comp9_2_9);
app_comp9_2 comp9_210({WT[M-1][10], comp8_2_9, comp9_2_9}, sum9_2_10, comp9_2_10);
app_comp10_2 comp10_210({WT[M-2][10], WT[M-3][10], WT[M-4][10], WT[M-5][10], WT[M-6][10], WT[M-7][10], WT[M-8][10], WT[M-9][10], WT[M-10][10],WT [M-11][10]}, sum10_2_10, comp10_2_10);
app_comp10_2 comp10_211({WT[M-1][11], comp9_2_10, comp10_2_10}, sum10_2_11, comp10_2_11);
app_comp11_2 comp11_211({WT[M-2][11], WT[M-3][11], WT[M-4][11], WT[M-5][11], WT[M-6][11], WT[M-7][11], WT[M-8][11], WT[M-9][11], WT[M-10][11],WT [M-11][11],WT[M-12][11]}, sum11_2_11, comp11_2_11);
app_comp11_2 comp11_212({WT[M-1][12], comp10_2_11, comp11_2_11}, sum11_2_12, comp11_2_12);
app_comp12_2 comp12_212({WT[M-2][12], WT[M-3][12], WT[M-4][12], WT[M-5][12], WT[M-6][12], WT[M-7][12], WT[M-8][12], WT[M-9][12], WT[M-10][12],WT [M-11][12],WT[M-12][12], WT[M-13][12]}, sum12_2_12, comp12_2_12);
app_comp12_2 comp12_213({WT[M-1][13], comp11_2_12, comp12_2_12}, sum12_2_13, comp12_2_13);
app_comp13_2 comp13_213({WT[M-2][13], WT[M-3][13], WT[M-4][13], WT[M-5][13], WT[M-6][13], WT[M-7][13], WT[M-8][13], WT[M-9][13], WT[M-10][13],WT [M-11][13],WT[M-12][13], WT[M-13][13], WT[M-14][13]}, sum13_2_13, comp13_2_13);
comp13_2 comp13_214({WT[M-1][14], comp12_2_13, comp13_2_13}, sum13_2_14, comp13_2_14);
comp14_2 comp14_214({WT[M-2][14], WT[M-3][14], WT[M-4][14], WT[M-5][14], WT[M-6][14], WT[M-7][14], WT[M-8][14], WT[M-9][14], WT[M-10][14],WT [M-11][14],WT[M-12][14], WT[M-13][14], WT[M-14][14],WT[M-15][14]}, sum14_2_14, comp14_2_14);
comp14_2 comp14_215({WT[M-1][15], comp14_2_14, comp13_2_14}, sum14_2_15, comp14_2_15);
comp15_2 comp15_215({WT[M-2][15], WT[M-3][15], WT[M-4][15], WT[M-5][15], WT[M-6][15], WT[M-7][15], WT[M-8][15], WT[M-9][15], WT[M-10][15],WT [M-11][15],WT[M-12][15], WT[M-13][15], WT[M-14][15],WT[M-15][15],WT[M-16][15]}, sum15_2_15, comp15_2_15);
comp14_2 comp14_216({comp14_2_15, comp15_2_15}, sum14_2_16, comp14_2_16);
comp15_2 comp15_216({WT[M-1][16], WT[M-2][16], WT[M-3][16], WT[M-4][16], WT[M-5][16], WT[M-6][16], WT[M-7][16], WT[M-8][16], WT[M-9][16], WT[M-10][16],WT [M-11][16],WT[M-12][16], WT[M-13][16], WT[M-14][16],WT[M-15][16]}, sum15_2_16, comp15_2_16);
comp14_2 comp14_217({comp14_2_16, comp15_2_16}, sum14_2_17, comp14_2_17);
comp14_2 comp14_317({WT[M-1][17], WT[M-2][17], WT[M-3][17], WT[M-4][17], WT[M-5][17], WT[M-6][17], WT[M-7][17], WT[M-8][17], WT[M-9][17], WT[M-10][17],WT [M-11][17],WT[M-12][17], WT[M-13][17], WT[M-14][17]}, sum14_3_17, comp14_3_17);
comp14_2 comp14_218({comp14_2_17, comp14_3_17}, sum14_2_18, comp14_2_18);
comp13_2 comp13_218({WT[M-1][18],WT[M-2][18], WT[M-3][18], WT[M-4][18], WT[M-5][18], WT[M-6][18], WT[M-7][18], WT[M-8][18], WT[M-9][18], WT[M-10][18],WT [M-11][18],WT[M-12][18], WT[M-13][18]}, sum13_2_18, comp13_2_18);
comp13_2 comp13_219({comp14_2_18, comp13_2_18}, sum13_2_19, comp13_2_19);
comp12_2 comp12_219({WT[M-1][19],WT[M-2][19], WT[M-3][19], WT[M-4][19], WT[M-5][19], WT[M-6][19], WT[M-7][19], WT[M-8][19], WT[M-9][19], WT[M-10][19],WT [M-11][19],WT[M-12][19]}, sum12_2_19, comp12_2_19);
comp12_2 comp12_220({comp13_2_19, comp12_2_19}, sum12_2_20, comp12_2_20);
comp11_2 comp11_220({WT[M-1][20],WT[M-2][20], WT[M-3][20], WT[M-4][20], WT[M-5][20], WT[M-6][20], WT[M-7][20], WT[M-8][20], WT[M-9][20], WT[M-10][20],WT [M-11][20]}, sum11_2_20, comp11_2_20);
comp11_2 comp11_221({comp12_2_20, comp11_2_20}, sum11_2_21, comp11_2_21);
comp10_2 comp10_221({WT[M-1][21], WT[M-2][21], WT[M-3][21], WT[M-4][21], WT[M-5][21], WT[M-6][21], WT[M-7][21], WT[M-8][21], WT[M-9][21], WT[M-10][21]}, sum10_2_21, comp10_2_21);
comp10_2 comp10_222({comp11_2_21, comp10_2_21}, sum10_2_22, comp10_2_22);
comp9_2 comp9_222({WT[M-1][22], WT[M-2][22], WT[M-3][22], WT[M-4][22], WT[M-5][22], WT[M-6][22], WT[M-7][22], WT[M-8][22], WT[M-9][22]}, sum9_2_22, comp9_2_22);
comp9_2 comp9_223({comp10_2_22, comp9_2_22}, sum9_2_23, comp9_2_23);
comp8_2 comp8_223({WT[M-1][23], WT[M-2][23], WT[M-3][23], WT[M-4][23], WT[M-5][23], WT[M-6][23], WT[M-7][23], WT[M-8][23]}, sum8_2_23, comp8_2_23);
comp8_2 comp8_224({comp9_2_23, comp8_2_23}, sum8_2_24, comp8_2_24);
comp7_2 comp7_224({WT[M-1][24], WT[M-2][24], WT[M-3][24], WT[M-4][24], WT[M-5][24], WT[M-6][24], WT[M-7][24]}, sum7_2_24, comp7_2_24);
comp7_2 comp7_225({comp8_2_24, comp7_2_24}, sum7_2_25, comp7_2_25);
comp6_2 comp6_225({WT[M-1][25], WT[M-2][25], WT[M-3][25], WT[M-4][25], WT[M-5][25], WT[M-6][25]}, sum6_2_25, comp6_2_25);
comp6_2 comp6_226({comp7_2_25, comp6_2_25}, sum6_2_26, comp6_2_26);
comp5_2 comp5_226({WT[M-1][26], WT[M-2][26], WT[M-3][26], WT[M-4][26], WT[M-5][26]}, sum5_2_26, comp5_2_26);
comp5_2 comp5_227({comp6_2_26, comp5_2_26}, sum5_2_27, comp5_2_27);
comp4_2 comp4_227({WT[M-1][27], WT[M-2][27], WT[M-3][27], WT[M-4][27]}, sum4_2_27, comp4_2_27);
comp4_2 comp4_228({comp5_2_27, comp4_2_27}, sum4_2_28, comp4_2_28);
comp3_2 comp3_228({WT[M-1][28], WT[M-2][28], WT[M-3][28]}, sum3_2_28, comp3_2_28);
comp3_2 comp3_229({comp4_2_28, comp3_2_28}, sum3_2_29, comp3_2_29);
comp2_2 comp2_229({WT[M-1][29], WT[M-2][29]}, sum2_2_29, comp2_2_29);
comp2_2 comp2_230({comp3_2_29, comp2_2_29}, sum2_2_30, comp2_2_30);

//assignstatemeMts
  assign S[0][0] = 0;
assign S[1][0] = (!rst) ? WT[M-1][0] : 0;
assign S[1][1] = (!rst) ? WT[M-1][1] : 0;
assign S[0][1] = (!rst) ? WT[M-2][1] : 0;
assign S[0][2] = (!rst) ? sum2_2_2 : 0;
assign S[1][2] = (!rst) ? WT[M-1][2] : 0;
assign S[0][3] = (!rst) ? sum2_2_3 : 0;
assign S[1][3] = (!rst) ? sum3_2_3 : 0;
assign S[0][4] = (!rst) ? sum3_2_4 : 0;
assign S[1][4] = (!rst) ? sum4_2_4 : 0;
assign S[0][5] = (!rst) ? sum4_2_5 : 0;
assign S[1][5] = (!rst) ? sum5_2_5 : 0;
assign S[0][6] = (!rst) ? sum5_2_6 : 0;
assign S[1][6] = (!rst) ? sum6_2_6 : 0;
assign S[0][7] = (!rst) ? sum6_2_7 : 0;
assign S[1][7] = (!rst) ? sum7_2_7 : 0;
assign S[0][8] = (!rst) ? sum7_2_8 : 0;
assign S[1][8] = (!rst) ? sum8_2_8 : 0;
assign S[0][9] = (!rst) ? sum8_2_9 : 0;
assign S[1][9] = (!rst) ? sum9_2_9 : 0;
assign S[0][10] =(!rst) ?  sum9_2_10 : 0;
assign S[1][10] =(!rst) ?  sum10_2_10 : 0;
assign S[0][11] =(!rst) ?  sum10_2_11 : 0;
assign S[1][11] =(!rst) ?  sum11_2_11 : 0;
assign S[0][12] =(!rst) ?  sum11_2_12 : 0;
assign S[1][12] =(!rst) ?  sum12_2_12 : 0;
assign S[0][13] =(!rst) ?  sum12_2_13 : 0;
assign S[1][13] =(!rst) ?  sum13_2_13 : 0;
assign S[0][14] =(!rst) ?  sum13_2_14 : 0;
assign S[1][14] =(!rst) ?  sum14_2_14 : 0;
assign S[0][15] =(!rst) ?  sum15_2_15 : 0;
assign S[1][15] =(!rst) ?  sum14_2_15 : 0;
assign S[0][16] =(!rst) ?  sum14_2_16 : 0;
  assign S[1][16] =(!rst) ?  sum15_2_16 : 0;
assign S[0][17] =(!rst) ?  sum14_3_17 : 0;
assign S[1][17] =(!rst) ?  sum14_2_17 : 0;
assign S[0][18] =(!rst) ?  sum14_2_18 : 0;
assign S[1][18] =(!rst) ?  sum13_2_18 : 0;
assign S[0][19] =(!rst) ?  sum13_2_19 : 0;
assign S[1][19] =(!rst) ?  sum12_2_19 : 0;
assign S[0][20] =(!rst) ?  sum12_2_20 : 0;
assign S[1][20] =(!rst) ?  sum11_2_20 : 0;
assign S[0][21] =(!rst) ?  sum11_2_21 : 0;
assign S[1][21] =(!rst) ?  sum10_2_21 : 0;
assign S[0][22] =(!rst) ?  sum10_2_22 : 0;
assign S[1][22] =(!rst) ?  sum9_2_22 : 0;
assign S[0][23] =(!rst) ?  sum9_2_23 : 0;
assign S[1][23] =(!rst) ?  sum8_2_23 : 0;
assign S[0][24] =(!rst) ?  sum8_2_24 : 0;
assign S[1][24] =(!rst) ?  sum7_2_24 : 0;
assign S[0][25] =(!rst) ?  sum7_2_25 : 0;
assign S[1][25] =(!rst) ?  sum6_2_25 : 0;
assign S[0][26] =(!rst) ?  sum6_2_26 : 0;
assign S[1][26] =(!rst) ?  sum5_2_26 : 0;
assign S[0][27] =(!rst) ?  sum5_2_27 : 0;
assign S[1][27] =(!rst) ?  sum4_2_27 : 0;
assign S[0][28] =(!rst) ?  sum4_2_28 : 0;
assign S[1][28] =(!rst) ?  sum3_2_28 : 0;
assign S[0][29] =(!rst) ?  sum3_2_29 : 0;
assign S[1][29] =(!rst) ?  sum2_2_29 : 0;
assign S[0][30] =(!rst) ?  sum2_2_30 : 0;
assign S[1][30] =(!rst) ?  WT[M-1][30] : 0;
assign S[1][31] =(!rst) ?  comp2_2_30 : 0;
assign S[0][31] = 0;


endmodule