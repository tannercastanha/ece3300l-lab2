
module mult4 (
	     input [3:0] A, B,
	     output [7:0] X
	     );

//
// fill in the verilog code here to implement a 4-bit multiplier, 
// using multiple instances of the add4 module.
//   

// m = A
// q = B

wire [3:0] mq0 = A & {4{B[0]}};
wire [3:0] mq1 = A & {4{B[1]}}; 
wire [3:0] mq2 = A & {4{B[2]}}; 
wire [3:0] mq3 = A & {4{B[3]}}; 

wire [3:0] result_1, result_2, result_3;
wire carry_1, carry_2, carry_3;

add4 madd1 (
.carryin(1'b0),
.X(mq1[3:0]),
.Y({1'b0, mq0[3:1]}),
.S(result_1),
.ovf(),
.carryout(carry_1)
);

add4 madd2 (
.carryin(1'b0),
.X(mq2[3:0]),
.Y({carry_1, result_1[3:1]}),
.S(result_2),
.ovf(),
.carryout(carry_2)
);
 
add4 madd3 (
.carryin(1'b0),
.X(mq3[3:0]),
.Y({carry_2, result_2[3:1]}),
.S(result_3),
.ovf(),
.carryout(carry_3)
);


assign X = {carry_3, result_3, result_2[0], result_1[0], mq0[0]};

endmodule // mult4

