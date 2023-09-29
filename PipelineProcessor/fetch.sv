module fetch(input logic PCSrc_F, clk, reset,
             input logic [63:0] PCBranch_F,
				 output logic [63:0] imem_addr_F);
	logic [63:0] adder_result, mux_result;
	mux2 #(64) mux(adder_result, PCBranch_F, PCSrc_F, mux_result);
	flopr #(64) PC(clk, reset, mux_result, imem_addr_F);
	adder #(64) add(imem_addr_F, 64'd4, adder_result);
	
endmodule