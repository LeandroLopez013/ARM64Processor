module regfile_tb();
	logic clk, we3;
	logic [4:0] ra1, ra2, wa3;
	logic [63:0] wd3, rd1, rd2, rd1expected, rd2expected;
	logic [4:0] vectornums, errors;
	
	logic [207:0] testvectors [0:17] = '{
		{1'd0, 5'd0, 5'd1, 5'd0, 64'd35, 64'd0, 64'd1},
		{1'd0, 5'd2, 5'd3, 5'd2, 64'd35, 64'd2, 64'd3},
		{1'd1, 5'd4, 5'd5, 5'd4, 64'd35, 64'd35, 64'd5},
		{1'd1, 5'd6, 5'd7, 5'd7, 64'd35, 64'd6, 64'd35},
		{1'd0, 5'd8, 5'd9, 5'd8, 64'd35, 64'd8, 64'd9},
		{1'd0, 5'd9, 5'd10, 5'd9, 64'd35, 64'd9, 64'd10},
		{1'd1, 5'd11, 5'd12, 5'd10, 64'd35, 64'd11, 64'd12},
		{1'd0, 5'd13, 5'd14, 5'd0, 64'd35, 64'd13, 64'd14},
		{1'd0, 5'd15, 5'd16, 5'd0, 64'd35, 64'd15, 64'd16},
		{1'd0, 5'd17, 5'd18, 5'd0, 64'd35, 64'd17, 64'd18},
		{1'd1, 5'd19, 5'd20, 5'd19, 64'd35, 64'd35, 64'd20},
		{1'd0, 5'd21, 5'd22, 5'd0, 64'd35, 64'd21, 64'd22},
		{1'd0, 5'd23, 5'd24, 5'd0, 64'd35, 64'd23, 64'd24},
		{1'd0, 5'd25, 5'd26, 5'd0, 64'd35, 64'd25, 64'd26},
		{1'd0, 5'd27, 5'd28, 5'd0, 64'd35, 64'd27, 64'd28},
		{1'd0, 5'd29, 5'd30, 5'd0, 64'd35, 64'd29, 64'd30},
		{1'd0, 5'd30, 5'd31, 5'd0, 64'd35, 64'd30, 64'd0},
		{1'd1, 5'd30, 5'd31, 5'd31, 64'd35, 64'd30, 64'd0}
	};
	
	regfile dut(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
	
	always
		begin
			clk=0;#5ns;clk=1;#5ns;
		end
	
	initial
		begin
			vectornums = 0; errors = 0;
		end
		
	always_ff @(negedge clk)
		begin
			{we3, ra1, ra2, wa3, wd3} = testvectors[vectornums][207:128];
			{rd1expected, rd2expected} = testvectors[vectornums][127:0];
		end

	always @(posedge clk)
		begin
			#1;if((rd1 !== rd1expected) | (rd2 !== rd2expected)) begin
				$display("Error found");
				errors = errors+1;
			end
			vectornums = vectornums +1;
			if (vectornums === 18) begin 
				$display("%d tests completed with %d errors", 
                vectornums, errors);
				$stop;
			end
		end

endmodule