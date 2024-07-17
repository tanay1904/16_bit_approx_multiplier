`timescale 1ns / 1ps

/* module comp_tb;
  reg [14:0] IN;
  wire S;
  wire [6:0] C_O;

  // Instantiate the Device Under Test (DUT)
  comp15_2 dut (
    .IN(IN),
    .S(S),
    .C_O(C_O)
  );

  // Test sequence
  initial begin
    IN = 'b0;
    #5 IN = 'b11111;
    #5 IN = 'b0;
    #5 IN = 'b1111;
    #5 IN = 'b0;
    #5 IN = 'b10101001110101;
    #5 IN = 'b10101001110100;
  end

  // Dump waveforms
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end*/
  
module tb_multiplier_WT_finial;
  parameter N = 4;
  reg load;
  reg clk;
  reg rst;

  // Input signals
  reg [N-1:0] A;
  reg [N-1:0] B;

  // Output signal
  wire [2*N:0] Z;

 approx_multiplier_WT_finial #(.N(N)) dut(.*);

 initial begin
  clk = 'b0;
  rst = 'b0;
 end

 always #5clk = !clk;

 task reset;
  rst = 'b0; load = 0;
  @(negedge clk);
  rst = 'b1;
  repeat(5)@(negedge clk);
  rst = 'b0;
 endtask
  

    

/*
  // Instantiate the design under test (DUT)
  multiplier_WT_finial dut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .Z(Z)
  );.*/



 // Clock generation
  //always #5 clk = ~clk;


  // Stimulus
  initial begin
   	reset;
    @(negedge clk);
    load = 'b1;
    A = 'b1111;
    B = 'b1111;
    @(negedge clk);
    load = 'b0;
    #500 $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time: %0t, A: %h, B: %h, Z: %h", $time, A, B, Z);
  end

 initial begin
  $dumpfile("dump.vcd"); $dumpvars;
 end
endmodule
