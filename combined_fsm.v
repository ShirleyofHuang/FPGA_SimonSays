module combined_fsm(
										clock, 
										x_auto, 
										y_auto,
										color_auto,
										x_manual,
										y_manual,
										color_manual, 
										stop, 
										x_final, 
										y_final, 
										color_final
										);

	input clock;
	input [7:0] x_auto;
	input [6:0] y_auto;
	input [2:0] color_auto;
	input [7:0] x_manual;
	input [6:0] y_manual;
	input [2:0] color_manual;
	input stop;

	output reg [7:0] x_final;
	output reg [6:0] y_final;
	output reg [2:0] color_final;

	always @(posedge clock) begin
		if (stop == 0) begin 
			x_final <= x_auto;
			y_final <= y_auto;
			color_final <= color_auto;
			end
		else begin
			x_final <= x_manual;
			y_final <= y_manual;
			color_final <= color_manual;
			end
		end

endmodule

