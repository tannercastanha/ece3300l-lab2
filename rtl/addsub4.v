
module addsub4 (
	       input [3:0] A, B,
	       input subsel,
	       output [3:0] X,
	       output cout, ovf
	       );

//
// fill in the verilog code here, using the add4 module,
//   to implement both addition and subtraction.
//

wire [3:0] b_xor = B ^ {4{subsel}};

add4 add_subtract (
.carryin(subsel),
.X(A),
.Y(b_xor),
.S(X),
.ovf(ovf),
.carryout(cout)
);

endmodule

