module add2(input wire[1:0]i0,i1,output wire[2:0]sum);
	wire c;
	ha h0(i0[0],i1[0],sum[0],c);
	fa f0(i0[1],i1[1],c,{sum[2],sum[1]});
endmodule

module add3(input wire[2:0]i0,i1,output wire[3:0]sum);
	wire c0,c1;
	ha h0(i0[0],i1[0],sum[0],c0);
	fa f0(i0[1],i1[1],c0,{c1,sum[1]});
	fa f1(i0[2],i1[2],c1,{sum[3],sum[2]});
endmodule

module add4(input wire[3:0]i0,i1,output wire[4:0]sum);
	wire c0,c1,c2,c3;
	ha h0(i0[0],i1[0],sum[0],c0);
	fa f0(i0[1],i1[1],c0,{c1,sum[1]});
	fa f1(i0[2],i1[2],c1,{c2,sum[2]});
	fa f2(i0[3],i1[3],c2,{sum[4],sum[3]});
endmodule

module unit(input wire[15:0]i,output wire[4:0]o);
	wire[1:0] s0,s1,s2,s3,s4;
	wire[2:0] s5,s6;
	wire[3:0] s7;
	wire[4:0] s8;
	fa f0(i[0],i[1],i[2],s0);
	fa f1(i[3],i[4],i[5],s1);
	fa f2(i[6],i[7],i[8],s2);
	fa f3(i[9],i[10],i[11],s3);
	fa f4(i[12],i[13],i[14],s4);

	add2 a0(s0,s1,s5);
	add2 a1(s2,s3,s6);

	add3 a2(s5,s6,s7);

	add4 a3(s7,{1'b0,1'b0,s4[1],s4[0]},s8);
	add4 a4({s8[3],s8[2],s8[1],s8[0]},{1'b0,1'b0,1'b0,i[15]},o);
endmodule
