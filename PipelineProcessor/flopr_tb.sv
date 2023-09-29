module flopr_tb();
	parameter N=64;
	logic clk, reset;
	logic [N-1:0] d,q, qexpected;
	logic [9:0] vectornum, errors;
	logic [N-1:0] testvectors [0:9] = '{64'b1,
	                                    64'b10,
													64'b11,
													64'b100,
													64'b101,
													64'b110,
													64'b111,
													64'b1000,
													64'b1001,
													64'b1010
	                                    };
	logic [N-1:0] testvectorsout [0:9] = '{64'b0,
	                                    64'b0,
													64'b0,
													64'b0,
													64'b0,
													64'b110,
													64'b111,
													64'b1000,
													64'b1001,
													64'b1010
	                                    };

	flopr #(N) flop(clk, reset, d, q);
	
	always
		begin
			clk=1; #5ns; clk=0; #5ns;
		end
		
	initial 	
		begin     
			vectornum = 0; errors = 0;
			reset = 1; #50ns; reset = 0;		
		end
	
	always @(negedge clk)
		begin
			#1; d = testvectors[vectornum]; qexpected = testvectorsout[vectornum];	
		end
	
	always @(posedge clk)
		begin
			if (~reset) begin
				#1;if(q!==qexpected) begin
					$display("Error: inputs = %b", d);
					$display("  outputs = %b (%b expected)",q,qexpected);
					errors = errors+1;
				end
			end
			vectornum = vectornum +1;
			if (vectornum === 10) begin 
				$display("%d tests completed with %d errors", 
                vectornum, errors);
				$stop;
			end
		end
	
endmodule