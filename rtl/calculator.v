
module calculator (
		   input [1:0]	OP,
		   input [3:0]	A, B,
		   output [9:0]	out
		   );

   wire				cout, ovf;  // carry_out and overflow
   wire [3:0]			outa;  // adder output
   wire [7:0]			outm;  // multiplier output

//
// make instances of the three modules addsub4, mult4, and mux10
// and wire them up to create the functionality required.
//
	
    addsub4 addsub (
    .subsel(OP[0]),
    .A(A),
    .B(B),
    .X(outa),
    .cout(cout),
    .ovf(ovf)
    );
	
	mult4 mult (
	.A(A),
	.B(B),
	.X(outm)
	);
	
	mux10 mux ( 
	.in0({cout, ovf, 4'b0000, outa[3:0]}),
	.in1({2'b00, outm[7:0]}),
	.sel(OP[1]),
	.out(out)
	);
endmodule // calculator

