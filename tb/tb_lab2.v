
module tb_lab2();
  
  reg [1:0] OP;
  reg [3:0] A, B;
  wire [9:0] out;
  
  calculator u1(.OP(OP), .A(A), .B(B), .out(out));
  
  initial begin
    OP = 2'b00;
    A = 4'b0101; //   5
    B = 4'b0010; // + 2
    #10 $display("%b",out);  // should output 00000111 = +7
    OP = 2'b10;
    A = 4'b0110; //   6
    B = 4'b1001; // * 9 
    #10 $display("%b",out);  // should output 00110110 = 54
    OP = 2'b01;
    A = 4'b0110; //   6
    B = 4'b0111; // - 7 
    #10 $display("%b",out);  // should output 00001111 = -1

// add at least 4 more tests to check your implementation	  
	  
    // Signed overflow: 7 + 1 = 8
    OP = 2'b00;
    A = 4'b0111;
    B = 4'b0001;
    #10 $display("%b", out);  // should output 0100001000 = +8

    // Carry-out: 15 + 1 = 0
    OP = 2'b00;
    A = 4'b1111;
    B = 4'b0001;
    #10 $display("%b", out);  // should output 1000000000 = 0

    // Subtraction: 2 - 5 = -3
    OP = 2'b01;
    A = 4'b0010;
    B = 4'b0101;
    #10 $display("%b", out);  // should output 0000001101 = -3

    // Multiplication: 15 * 15 = 225
    OP = 2'b10;
    A = 4'b1111;
    B = 4'b1111;
    #10 $display("%b", out);  // should output 0011100001 = 225

    // Signed overflow: -8 - 1 = 7
    OP = 2'b01;
    A = 4'b1000;
    B = 4'b0001;
    #10 $display("%b", out);  // should output 1100000111 = +7
    
    $finish;
  end
  
endmodule
		   
		   
