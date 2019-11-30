module or2 (input wire i0, i1, output wire o);
  assign o = i0 | i1;
endmodule
module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module xor2 (input wire i0, i1, output wire o);
  assign o = i0 ^ i1;
endmodule

module or3 (input wire i0, i1, i2, output wire o);
   wire t;
   or2 or2_0 (i0, i1, t);
   or2 or2_1 (i2, t, o);
endmodule

module xor3 (input wire i0, i1, i2, output wire o);
   wire t;
   xor2 xor2_0 (i0, i1, t);
   xor2 xor2_1 (i2, t, o);
endmodule

module ha(input wire a,b,output wire sum,c);
	xor2 x0(a,b,sum);
	and2 a0(a,b,c);
endmodule

module fa(input wire a,b,c, output wire[1:0]sum);
	wire t0,t1,t2;
	xor3 x0(a,b,c,sum[0]);
	and2 a0(a,b,t0);
	and2 a1(b,c,t1);
	and2 a2(a,c,t2);
	or3 o0(t0,t1,t2,sum[1]);
endmodule
