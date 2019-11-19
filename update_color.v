module update_color(clock, direction, box_right, box_left, box_up, box_down);
	input [2:0]direction;
	input [15:0]box_right;
	input [15:0]box_left;
	input [15:0]box_up;
	input [15:0]box_down;
	input clock;
	
	// use fsm and other thing to decide where to draw and update color every once and awhile 
	
	always @ (posedge clock) begin
		// Left
		if (direction == 3'b000) begin
			datapath left(
				.coordinate_input(box_left),
				.color_input(3'b010),
				.clock(clock),
				.out_x(out_x),
				.out_y(out_y),
				.out_color(out_color)
				);
			end 
		// Down
		else if (direction == 3'b001) begin
			datapath down(
				.coordinate_input(box_down),
				.color_input(3'b010),
				.clock(clock),
				.out_x(out_x),
				.out_y(out_y),
				.out_color(out_color)
				);
			end 
		// Right
		else if (direction == 3'b011) begin 
			datapath right(
				.coordinate_input(box_right),
				.color_input(3'b111),
				.clock(clock),
				.out_x(out_x),
				.out_y(out_y),
				.out_color(out_color)
				);
			end
		// Up
		else if (direction == 3'b010) begin
			datapath up(
				.coordinate_input(box_up),
				.color_input(3'b010),
				.clock(clock),
				.out_x(out_x),
				.out_y(out_y),
				.out_color(out_color)
				);
			end 
		// Display all white
		else begin
			datapath right(
				.coordinate_input(box_right),
				.color_input(3'b111),
				.clock(clock),
				.out_x(out_x),
				.out_y(out_y),
				.out_color(out_color)
				);
				
			datapath left(
				.coordinate_input(box_left),
				.color_input(3'b111),
				.clock(clock),
				.out_x(out_x),
				.out_y(out_y),
				.out_color(out_color)
				);
				
			datapath up(
				.coordinate_input(box_up),
				.color_input(3'b111),
				.clock(clock),
				.out_x(out_x),
				.out_y(out_y),
				.out_color(out_color)
				);
				
			datapath down(
				.coordinate_input(box_down),
				.color_input(3'b111),
				.clock(clock),
				.out_x(out_x),
				.out_y(out_y),
				.out_color(out_color)
				);
			end 
		end 
endmodule 		
	
//module lab2(clock,coordinate_input, color_input, out_x, out_y, out_color);
//	input clock;
//	input [6:0]coordinate_input;
//	input [2:0]color_input;
//	output [7:0]out_x;
//	output [6:0]out_y;
//	output [2:0]out_color;
//	
//	datapath data_one(
//		.coordinate_input(coordinate_input[6:0]),
//		.color_input(color_input[2:0]),
//		.clock(clock),
//		.out_x(out_x),
//		.out_y(out_y),
//		.out_color(out_color)
//		);
//
//endmodule

module datapath(coordinate_input, color_input, clock, out_x, out_y, out_color);
	input [6:0]coordinate_input;
	input [2:0]color_input;
	input clock;
	output [7:0]out_x;
	output [6:0]out_y;
	output [2:0]out_color;
	
	reg [7:0]x;
	reg [6:0]y;
	reg [2:0]color;
	reg [0:3]counter;
	
	always @(posedge clock)
		begin // else we load x iff loadx is on, if not we load y instead, we load color if loadcolor is on
				color <= color_input;
				y<=coordinate_input[6:0];
				x<={coordinate_input[7:14];
				
			end 
	
	always @(posedge clock) begin
			if counter == 4'b1111
				counter <= 4'b0000;
			else
				counter = counter + 1b'0;
			end 
		
	// assign them appropriately
	assign out_x = x + counter[1:0];
	assign out_y = y + counter[2:3];
	assign out_color = color;
	
	endmodule 	