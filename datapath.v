module datapath(
					clk, 
					resetn, 
					x_in,
					y_in
					colour_in,  
					x_out, 
					y_out, 
					colour_out
					)
	input clk, resetn;
	input [7:0] x_in;
	input [6:0] y_in;
	input [2:0] colour_in; 
	output [7:0] x_out;
	output [6:0] y_out;
	output [2:0] colour_out;

	reg [3:0] counter;

	//counter
	always @(posedge clk) begin
		if (!resetn)
			counter <= 4'b0000;
		else
			if (counter == 1111)
				counter <= 4'b0000;
			else
				counter <= counter + 1'b1;
	end

	assign x_out = x_in + counter[1:0];
	assign y_out = y_in + counter[3:2];
	assign colour_out = colour;
	
endmodule
