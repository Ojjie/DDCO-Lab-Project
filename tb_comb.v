`timescale 1 ns / 100 ps
`define TESTVECS 17

module tb;
  reg clk, reset;
  reg [15:0] i;
  wire [4:0] op;
  reg [15:0] test_vecs [0:(`TESTVECS-1)];
  integer c;
  initial begin $dumpfile("tb_comb.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
  	test_vecs[0][15:0]=16'b0000000000000000;
  	test_vecs[1][15:0]=16'b0000000000010000;
  	test_vecs[2][15:0]=16'b0000000011000000;
  	test_vecs[3][15:0]=16'b0000111000000000;
  	test_vecs[4][15:0]=16'b1010101011111111;
  	test_vecs[5][15:0]=16'b1000000001110100;
  	test_vecs[6][15:0]=16'b1100011000110000;
  	test_vecs[7][15:0]=16'b0011001100110010;
  	test_vecs[8][15:0]=16'b1010101010101010;
  	test_vecs[9][15:0]=16'b0111000111000111;
  	test_vecs[10][15:0]=16'b1111000111000111;
  	test_vecs[11][15:0]=16'b1111000111010111;
  	test_vecs[12][15:0]=16'b1111110001111110;  	
  	test_vecs[13][15:0]=16'b1111101111100111;  	
  	test_vecs[14][15:0]=16'b1111111111110011;
  	test_vecs[15][15:0]=16'b1111111011111111;
  	test_vecs[16][15:0]=16'b1111111111111111;
  end
  initial {i} = 0;
  unit u0(i,op);
  initial begin
  	#6 for(c=0;c<`TESTVECS;c=c+1)
  		begin #10 {i}=test_vecs[c]; end
  	#100 $finish;
  end
endmodule
