module maindec_tb();
	logic [10:0] Op;
	logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
	logic [1:0] ALUOp;
	logic [8:0] tests [0:6] = '{
		9'b011110000,
		9'b110001000,
		9'b100000101,
		9'b000100010,
		9'b000100010,
		9'b000100010,
		9'b000100010
	};
	integer error_count = 0;
	integer num = 0;
	
	maindec dut(Op, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
	
	initial begin
		Op = 11'b111_1100_0010; #10ns;
		if ({Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} !== tests[num]) begin
			$display("error $d", num); error_count += 1;
		end
		num += 1;
		Op = 11'b111_1100_0000; #10ns;
		if ({Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} !== tests[num]) begin
			$display("error $d", num); error_count += 1;
		end
		num += 1;
		Op = 11'b101_1010_0???; #10ns;
		if ({Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} !== tests[num]) begin
			$display("error $d", num); error_count += 1;
		end
		num += 1;
		Op = 11'b100_0101_1000; #10ns;
		if ({Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} !== tests[num]) begin
			$display("error $d", num); error_count += 1;
		end
		num += 1;
		Op = 11'b110_0101_1000; #10ns;
		if ({Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} !== tests[num]) begin
			$display("error $d", num); error_count += 1;
		end
		num += 1;
		Op = 11'b100_0101_0000; #10ns;
		if ({Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} !== tests[num]) begin
			$display("error $d", num); error_count += 1;
		end
		num += 1;
		Op = 11'b101_0101_0000; #10ns;
		if ({Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} !== tests[num]) begin
			$display("error $d", num); error_count += 1;
		end
		num += 1;
		$display("test finalizados, %d errores", error_count);
	end
	
endmodule