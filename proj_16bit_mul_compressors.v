// Full adder
module Full_Adder(input A, input B, input C, output S, output CO);
  
assign {CO,S} = A + B + C;
  
endmodule

// Half Adder
module Half_Adder(
    input A,
    input B,
    output S,
    output C_O
);
assign {C_O,S} = A + B;
endmodule

//2 to 2 compressor
module comp2_2(
    input [1:0]IN,
    output S,
    output C_O
);
  Half_Adder HA1(IN[1], IN[0],S, C_O);
endmodule

// 3 to 2 compressor
module comp3_2(
    input [2:0] IN,
    output S,
    output C_O
);
  Full_Adder FA1(IN[2], IN[1], IN[0], S, C_O);
endmodule

// 4 to 3 compressor
module comp4_2(
    input [3:0] IN,
    output S,
    output [1:0] C_O
);
wire S1;
Full_Adder FA2(IN[2],IN[1],IN[0],S1,C_O[0]);
Half_Adder HA2(IN[3],S1,S,C_O[1]);
endmodule

// 5 to 3 compressor
module comp5_2(
    input [4:0] IN,
    output S,
    output [1:0] C_O
);
wire S1;
Full_Adder FA3(IN[2],IN[1],IN[0],S1,C_O[0]);
Full_Adder FA4(IN[3],S1,IN[4],S,C_O[1]);
endmodule

// 6 to 4 compressor
module comp6_2(
    input [5:0] IN,
    output S,
    output [2:0] C_O
);
wire S1,S2;
Full_Adder FA5(IN[2],IN[1],IN[0],S1,C_O[0]);
Full_Adder FA6(IN[3],S1,IN[4],S2,C_O[1]);
Half_Adder HA3(IN[5],S2,S,C_O[2]);
endmodule

//7 to 4 compressor
module comp7_2(
    input [6:0] IN,
    output S,
    output [2:0] C_O
);
wire S1,S2;
Full_Adder FA7(IN[2],IN[1],IN[0],S1,C_O[0]);
Full_Adder FA8(IN[3],S1,IN[4],S2,C_O[1]);
Full_Adder FA9(IN[5],S2,IN[6],S,C_O[2]);
endmodule

// 8 to 5 compressor
module comp8_2(
    input [7:0] IN,
    output S,
    output [3:0] C_O
);
wire S1,S2,S3;
Full_Adder FA10(IN[2],IN[1],IN[0],S1,C_O[0]);
Full_Adder FA11(IN[3],S1,IN[4],S2,C_O[1]);
Full_Adder FA12(IN[5],S2,IN[6],S3,C_O[2]);
Half_Adder HA4(IN[7],S3,S,C_O[3]);
endmodule

// 9 to 5 compressor
module comp9_2(
    input [8:0] IN,
    output S,
    output [3:0] C_O
);
wire S1,S2,S3;
Full_Adder FA13(IN[2],IN[1],IN[0],S1,C_O[0]);
Full_Adder FA14(IN[3],S1,IN[4],S2,C_O[1]);
Full_Adder FA15(IN[5],S2,IN[6],S3,C_O[2]);
Full_Adder FA16(IN[7],S3,IN[8],S,C_O[3]);
endmodule
// 10 to 6 compressor 
module comp10_2(
    input [9:0] IN,
    output S,
    output [4:0] C_O
);
wire S1,S2,S3,S4;
Full_Adder FA17(IN[2],IN[1],IN[0],S1,C_O[0]);
Full_Adder FA18(IN[3],S1,IN[4],S2,C_O[1]);
Full_Adder FA19(IN[5],S2,IN[6],S3,C_O[2]);
Full_Adder FA20(IN[7],S3,IN[8],S4,C_O[3]);
Half_Adder HA5(IN[9],S4,S,C_O[4]);
endmodule
//11 to 6 compressor
module comp11_2(
    input [10:0] IN,
    output S,
    output [4:0] C_O
);
wire S1,S2,S3,S4;
Full_Adder FA21(IN[2],IN[1],IN[0],S1,C_O[0]);
Full_Adder FA22(IN[3],S1,IN[4],S2,C_O[1]);
Full_Adder FA23(IN[5],S2,IN[6],S3,C_O[2]);
Full_Adder FA24(IN[7],S3,IN[8],S4,C_O[3]);
Full_Adder FA25(IN[9],S4,IN[10],S,C_O[4]);
endmodule

//12 to 7 compressor
module comp12_2(
    input [11:0] IN,
    output S,
    output [5:0] C_O
    );
    wire S1,S2,S3,S4,S5;
    Full_Adder FA26(IN[2],IN[1],IN[0],S1,C_O[0]);
    Full_Adder FA27(IN[3],S1,IN[4],S2,C_O[1]);
    Full_Adder FA28(IN[5],S2,IN[6],S3,C_O[2]);
    Full_Adder FA29(IN[7],S3,IN[8],S4,C_O[3]);
    Full_Adder FA30(IN[9],S4,IN[10],S5,C_O[4]);
    Half_Adder HA6(IN[11],S5,S,C_O[5]);
endmodule

//13 to 7 compressor
module comp13_2(
    input [12:0] IN,
    output S,
    output [5:0] C_O
    );
    wire S1,S2,S3,S4,S5,S6;
    Full_Adder FA31(IN[2],IN[1],IN[0],S1,C_O[0]);
    Full_Adder FA32(IN[3],S1,IN[4],S2,C_O[1]);
    Full_Adder FA33(IN[5],S2,IN[6],S3,C_O[2]);
    Full_Adder FA34(IN[7],S3,IN[8],S4,C_O[3]);
    Full_Adder FA35(IN[9],S4,IN[10],S5,C_O[4]);
  Full_Adder FA36(IN[11],S5,IN[12],S,C_O[5]);
endmodule

//14 to 8 compressor
module comp14_2(
    input [13:0] IN,
    output S,
    output [6:0] C_O
    );
    wire S1,S2,S3,S4,S5,S6;
    Full_Adder FA37(IN[2],IN[1],IN[0],S1,C_O[0]);
    Full_Adder FA38(IN[3],S1,IN[4],S2,C_O[1]);
    Full_Adder FA39(IN[5],S2,IN[6],S3,C_O[2]);
    Full_Adder FA40(IN[7],S3,IN[8],S4,C_O[3]);
    Full_Adder FA41(IN[9],S4,IN[10],S5,C_O[4]);
  Full_Adder FA42(IN[11],S5,IN[12],S6,C_O[5]);
    Half_Adder HA7(IN[13],S6,S,C_O[6]);
endmodule

//15 to 8 compressor
module comp15_2(
    input [14:0] IN,
    output S,
    output [6:0] C_O
    );
    wire S1,S2,S3,S4,S5,S6;
    Full_Adder FA43(IN[2],IN[1],IN[0],S1,C_O[0]);
    Full_Adder FA44(IN[3],S1,IN[4],S2,C_O[1]);
    Full_Adder FA45(IN[5],S2,IN[6],S3,C_O[2]);
    Full_Adder FA46(IN[7],S3,IN[8],S4,C_O[3]);
    Full_Adder FA47(IN[9],S4,IN[10],S5,C_O[4]);
  Full_Adder FA48(IN[11],S5,IN[12],S6,C_O[5]);
    Full_Adder FA49(IN[13],S6,IN[14],S,C_O[6]);
endmodule