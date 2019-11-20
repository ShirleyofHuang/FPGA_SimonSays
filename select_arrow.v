// 000: UP
// 001: RIGHT
// 010: DOWN
// 011: LEFT
// 111: NOTHING

// Selects appropriate arrow based on key inputs 
module select_arrow(
						clock, 
						up, 
						right, 
						down, 
						left, 
						direction_out,
						clicked
						);
	// clock to continuously update 
	input up;
	input right;
	input down;
	input left;
	input clock;
	output reg [1:0]direction_out; 
	output reg clicked;
	
	wire [3:0] direction;
	assign direction = {up, right, down, left};
	
	always @(posedge clock) 
		case (direction)
			4'b1000: begin
				direction_out <= 2'b00; // If up is pressed, arrow is up
				clicked <= 1;
			end
			4'b0100: begin
				direction_out <= 2'b01; // If right is pressed, arrow is right
				clicked <= 1;
			end
			4'b0010: begin
				direction_out <= 2'b10; // If down is pressed, arrow is down
				clicked <= 1;
			end
			4'b0001: begin
				direction_out <= 2'b11; // If left is pressed, arrow is left
				clicked <= 1;
			end
			default: begin
				direction_out <= 2'b00;
				clicked <= 0;
			end
		endcase 
endmodule 
