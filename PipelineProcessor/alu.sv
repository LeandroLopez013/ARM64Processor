module alu(input logic [63:0] a,b,
           input logic [3:0] ALUControl,
			  output logic [63:0] result,
			  output logic zero);
	always_comb
		casez(ALUControl)
			4'b0000: result = a & b;
			4'b0001: result = a | b;
			4'b0010: result = a + b;
			4'b0011: result = b[15:0]<<b[17:16]*16;
			4'b0110: result = a-b;
			4'b0111: result = b;
			default: result = 64'b1;
		endcase
	always_comb
		casez(result)
			64'b0: zero = 'b1;
			default: zero = 'b0;
		endcase
endmodule