module SimonSays(
		CLOCK_50,						//	On Board 50 MHz
		// Your inputs and outputs here
      KEY,
      SW,
		// The ports below are for the VGA output
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,					//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B   							//	VGA Blue[9:0]
	);

	input			CLOCK_50;				//	50 MHz
	input   [9:0]   SW;
	input   [3:0]   KEY;

	// Declare your inputs and outputs here
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
	wire resetn;
	assign resetn = SW[0];
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(1),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "black.mif";
			
	// Put your code here. Your code should produce signals x,y,colour and writeEn/plot
	// for the VGA controller, in addition to any other functionality your design may require.
    
	wire [1:0] selected_arrow;
	wire clicked;
	
	wire [3:0] counter_save;
	assign counter_save = 4'b0000;
	
	reg [3:0]counter;
	reg [2:0] colour_choose;
	reg [7:0] x_choose;
	reg [6:0] y_choose;
	
		// Arrow Selection
	select_arrow sa(
		.clock(CLOCK_50),
		.up(~KEY[0]),
		.right(~KEY[1]),
		.down(~KEY[2]),
		.left(~KEY[3]),
		.direction_out(selected_arrow),
		.clicked(clicked)
	);
	
	//counter
	always @(posedge CLOCK_50) begin
//		counter <= counter_save;
		if (!clicked) begin
			counter <= 4'b0000;
		// Up
			if (counter == 4'b0001) begin
				x_choose <= 8'b01001110;
				y_choose <= 7'b0110110;
				colour_choose <= 3'b111;
			end
			// Right
			else if (counter == 4'b0010) begin
				x_choose <= 8'b01010010;
				y_choose <= 7'b0111010;
				colour_choose <= 3'b111;
			end
			// Down
			else if (counter == 4'b0011) begin
				x_choose <= 8'b01001110;
				y_choose <= 7'b0111110;
				colour_choose <= 3'b111;
			end
			// Left
			else if (counter == 4'b0100) begin
				x_choose <= 8'b01001010;
				y_choose <= 7'b0111010;
				colour_choose <= 3'b111;
			end
			else if (counter == 4'b1111) begin
				counter <= 4'b0000;
			end
			counter <= counter + 1'b1;
		end
		else begin
		// Up
				if (selected_arrow == 2'b00) begin
					x_choose <= 8'b01001110;
					y_choose <= 7'b0110110;
					colour_choose <= 3'b010;
					end
				// Right
				else if (selected_arrow == 2'b01) begin
					x_choose <= 8'b01010010;
					y_choose <= 7'b0111010;
					colour_choose <= 3'b010;
					end
				// Down
				else if (selected_arrow == 2'b10) begin
					x_choose <= 8'b01001110;
					y_choose <= 7'b0111110;
					colour_choose <= 3'b010;
					end
				// Left
				else if (selected_arrow == 2'b11) begin
					x_choose <= 8'b01001010;
					y_choose <= 7'b0111010;
					colour_choose <= 3'b010;
					end
				end
		
	end
	
//	assign counter_save = counter;
	
	// Instansiate datapath
	datapath d0(
		.clk(CLOCK_50), 
		.resetn(resetn), 
		.x_in(x_choose),
		.y_in(y_choose),
		.colour_in(colour_choose),  
		.x_out(x), 
		.y_out(y), 
		.colour_out(colour)
	);
	
//	fsmachine fsm(
//		.reset_n(resetn),
//		.clock(CLOCK_50),
//		.direction(selected_arrow),
//		.clicked(clicked),
//		.out_x(x_choose),
//		.out_y(y_choose),
//		.out_color(colour_choose),
//		);

//    // Instansiate FSM control
//	 controller c0(
//		.go(!KEY[3]), 
//		.reset_n(resetn), 
//		.clock(CLOCK_50), 
//		.draw(!KEY[1]), 
//		.controlA(ld_x), 
//		.controlB(ld_y), 
//		.controlC(ld_c), 
	
endmodule

//// Up
//x_choose <= 8'b01001110
//y_choose <= 7'b0110110
//
//// Right
//x_choose <= 8'b01010010
//y_choose <= 7'b0111010
//
//// Down
//x_choose <= 8'b01001110
//y_choose <= 7'b0111110
//
//// Left
//x_choose <= 8'b01001010
//y_choose <= 7'b0111010
