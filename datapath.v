module datapath(
					clk, 
					resetn, 
					x_in,
					y_in,
					clicked,
					colour_in,  
					x_out, 
					y_out, 
					colour_out
					);
	input clk, resetn, clicked;
	input [7:0] x_in;
	input [6:0] y_in;
	input [2:0] colour_in; 
	output [7:0] x_out;
	output [6:0] y_out;
	output [2:0] colour_out;

	reg [3:0] counter;
	reg [2:0]actual_color;

	//counter
	always @(posedge clk) begin
//		if (clicked) begin
			if (!resetn)
				counter <= 4'b0000;
			else
					if (counter == 1111)
						counter <= 4'b0000;
					else
				counter <= counter + 1'b1;
		end
//		else begin
//			counter <= 4'b0000;
//			actual_color <= 3'b111;
//			end

	assign x_out = x_in;
	assign y_out = y_in;
//	assign x_out = x_in + counter[1:0];
//	assign y_out = y_in + counter[3:2];
//	assign colour_out = actual_color;
	assign colour_out = colour_in;
	
endmodule
