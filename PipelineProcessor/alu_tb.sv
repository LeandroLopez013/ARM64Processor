module alu_tb();
	logic [63:0] a,b,result;
	logic [3:0] ALUControl;
	integer error_count = 0;
	logic zero;
	
	alu dut(a,b,ALUControl,result,zero);
	
	initial begin
		a = 64'b10; b = 64'b10; ALUControl = 4'b0;#10ns;
		if(result !== (64'b10 & 64'b10) | zero !== 'b0) begin
			$display("linea 1");
			error_count += 1;
		end
		a = -64'b10; b = -64'b10; ALUControl = 4'b0;#10ns;
		if(result !== (-64'b10 & -64'b10) | zero !== 'b0) begin
			$display("linea 2");
			error_count += 1;
		end
		a = 64'b10; b = -64'b10 ; ALUControl = 4'b0;#10ns;
		if(result !== (64'b10 & -64'b10) | zero !== 'b0) begin
			$display("linea 3");
			error_count += 1;
		end

		a = 64'b10; b = 64'b10; ALUControl = 4'b1;#10ns;
		if(result !== (64'b10 | 64'b10) | zero !== 'b0) begin
			$display("linea 4");
			error_count += 1;
		end
		a = -64'b10; b = -64'b10; ALUControl = 4'b1;#10ns;
		if(result !== (-64'b10 | -64'b10) | zero !== 'b0) begin
			$display("linea 5");
			error_count += 1;
		end
		a = 64'b10; b = -64'b10; ALUControl = 4'b1;#10ns;
		if(result !== (64'b10 | -64'b10) | zero !== 'b0) begin
			$display("linea 6");
			error_count += 1;
		end

		a = 64'b10; b = 64'b10; ALUControl = 4'b10;#10ns;
		if(result !== (64'b10+64'b10) | zero !== 'b0) begin
			$display("linea 7");
			error_count += 1;
		end
		a = -64'b10; b = -64'b10; ALUControl = 4'b10;#10ns;
		if(result !== (-64'b10 - 64'b10) | zero !== 'b0) begin
			$display("linea 8");
			error_count += 1;
		end
		a = 64'b10; b = -64'b10; ALUControl = 4'b10;#10ns;
		if(result !== (64'b10+(-64'b10)) | zero !== 'b1) begin
			$display("linea 9");
			error_count += 1;
		end

		a = 64'b10; b = 64'b10; ALUControl = 4'b110;#10ns;
		if(result !== (64'b10-64'b10) | zero !== 'b1) begin
			$display("linea 10");
			error_count += 1;
		end
		a = -64'b10; b = -64'b10; ALUControl = 4'b110;#10ns;
		if(result !== (-64'b10 + 64'b10) | zero !== 'b1) begin
			$display("linea 11");
			error_count += 1;
		end
		a = 64'b10; b = -64'b10; ALUControl = 4'b110;#10ns;
		if(result !== (64'b10+64'b10) | zero !== 'b0) begin
			$display("linea 12");
			error_count += 1;
		end

		a = 64'b10; b = 64'b10; ALUControl = 4'b111;#10ns;
		if(result !== b | zero !== 'b0) begin
			$display("linea 13");
			error_count += 1;
		end
		a = -64'b10; b = -64'b10; ALUControl = 4'b111;#10ns;
		if(result !== b | zero !== 'b0) begin
			$display("linea 14");
			error_count += 1;
		end
		a = 64'b10; b = -64'b10; ALUControl = 4'b111;#10ns;
		if(result !== b | zero !== 'b0) begin
			$display("linea 15");
			error_count += 1;
		end
		
		a = 64'h7FFFFFFFFFFFFFFF; b = 64'h7FFFFFFFFFFFFFFF; ALUControl = 4'b10;#10ns;
		if(result !== 64'hFFFFFFFFFFFFFFFE | zero !== 'b0) begin
			$display("linea 16");
			error_count += 1;
		end		
	
		$display("simulacion finalizada, %d errores encontrados", error_count);
	end
endmodule