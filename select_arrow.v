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
						up, 
						down, 
						left, 
						direction_out
						);
	// clock to continuously update 
	input up, right, down, left, clock;
	output direction_out; 
	
	localparam direction = {up, right, down, left};
	always @(posedge clock) 
		case (direction): 
			4'b1000: direction_out <= 3'b000; // If up is pressed, arrow is up
			4'b0100: direction_out <= 3'b001; // If right is pressed, arrow is right
			4'b0010: direction_out <= 3'b010; // If down is pressed, arrow is down
			4'b0001: direction_out <= 3'b011; // If left is pressed, arrow is left
			default: direction_out <= 3'b111; // else, we do nothing 
		endcase 
endmodule 