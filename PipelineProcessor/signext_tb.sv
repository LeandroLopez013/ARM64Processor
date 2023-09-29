module signext_tb();
	logic [31:0] a;
	integer error_count=0;
	logic [63:0] y;
	
	signext dut(a, y);
	
	initial begin
		a = {11'b111_1100_0010, 9'b111111111, 12'b0};#10ns;
		if (y!==64'hFFFFFFFFFFFFFFFF) begin 
			error_count += 1; $display("linea 1");
		end
		a = {11'b111_1100_0010, 9'b011111111, 12'b0};#10ns;
		if (y!==64'hFF) begin 
			error_count += 1; $display("linea 2");
		end
		a = {11'b111_1100_0000, 9'b111111111, 12'b0};#10ns;
		if (y!==64'hFFFFFFFFFFFFFFFF) begin 
			error_count += 1; $display("linea 3");
		end
		a = {11'b111_1100_0000, 9'b011111111, 12'b0};#10ns;
		if (y!==64'hFF) begin 
			error_count += 1; $display("linea 4");
		end
		a = {8'b101_1010_0, 19'b1111111111111111111, 5'b0};#10ns;
		if (y!==64'hFFFFFFFFFFFFFFFF) begin 
			error_count += 1; $display("linea 5");
		end
		a = {8'b101_1010_0, 19'b0111111111111111111, 5'b0};#10ns;
		if (y!==64'h3FFFF) begin 
			error_count += 1; $display("linea 6");
		end
		a = 32'b1;#10;
		if (y!==64'b0) begin 
			error_count += 1; $display("linea 7");
		end
		$display("Simulation finished, %d errors occurred", error_count);
	end
	
endmodule