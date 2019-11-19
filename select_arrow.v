// 001: DOWN
// 010: UP
// 011: RIGHT
// 000: LEFT
// 111: NOTHING

// Selects appropriate arrow based on key inputs 
module select_arrow(left, right, up, down, direction_out);
	input left, right, up, down;
	ouput direction_out; 
	
	localparam direction = {left, right, up, down};
	always @(*) 
		case (direction): 
			4'b0001: direction_out <= 3'b001; //If down is pressed, arrow is down
			4'b0010: direction_out <= 3'b010; // If up is pressed, arrow is up
			4'b0100: direction_out <= 3'b011; // If right is pressed, arrow is right
			4'b1000: direction_out <= 3'b000; // If left is pressed, arrow is left
			default: direction_out <= 3'b111;  // else, we do nothing 
		
		endcase 
endmodule 