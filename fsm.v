module fsmachine(reset_n,clock, direction, clicked);
	input reset_n, clock, clicked;
	input [2:0]direction; 
	output reg out_direction, color;

	reg[2:0] current_state, next_state;
	
	localparam DRAW_UP = 3'b0000,
					DRAW_DOWN = 3'b0001,
					DRAW_RIGHT = 3'b0010,
					DRAW_LEFT = 3'b0011,
					CHANGE_UP = 3'b0100,
					CHANGE_DOWN = 3'b0101,
					CHANGE_RIGHT = 3'b0110,
					CHANGE_LEFT = 3'b0111;
					READY_CHANGE = 3'b1000;
					UPDATE_COLOR = 3'b1001;
//					PLOT = 3'b100;
	always @(posedge clock) 
	begin
		if (!reset_n) begin
			current_state <= DRAW_UP;
			end
		else begin
			current_state <= next_state;
		end 
	end
		
	always @(*)
		begin:state_table
		case(current_state)
			DRAW_UP: next_state = DRAW_DOWN;
			DRAW_DOWN: next_state = DRAW_LEFT;
			DRAW_LEFT: next_state = DRAW_RIGHT;
			DRAW_RIGHT: next_state = READY_CHANGE;
			READY_CHANGE: next_state = clicked? READY_CHANGE: UPDATE_COLOR;
			UPDATE_COLOR = next_state = direction? CHANGE_UP, CHANGE_DOWN, CHANGE_RIGHT, CHANGE_LEFT;
			CHANGE_UP = next_state = clicked? READY_CHANGE, CHANGE_UP;
			CHANGE_DOWN = next_state = clicked? READY_CHANGE, CHANGE_DOWN;
			CHANGE_RIGHT = next_state = clicked? READY_CHANGE, CHANGE_RIGHT;
			CHANGE_LEFT = next_state = clicked? READY_CHANGE, CHANGE_LEFT;
			
		endcase 
		end 
			
	always @(*)
		begin
		out_x = coordinate; 
		out_y = coordinate;
		out_color = 3'b111; 
		case(current_state)
			DRAW_UP: begin 
				out_x = coordinate_up;
				out_y = coordinate_up;
				end 
			DRAW_DOWN: begin
				out_x = coordinate_down;
				out_y = coordinate_down; 
				end
			DRAW_LEFT: begin
				out_x = coordinate_left;
				out_y = oordinate_left;
			DRAW_RIGHT: begin
				out_x = coordinate_right;
				out_y = coordinate_right;
				end
			READY_CHANGE : begin
				out_x = coordinate_ready;
				out_y = coordinate_ready;
			UPDATE_COLOR:begin
				end
			CHANGE_DOWN: begin
				out_x = 
				out_y = 
				out_color = 3'b010;
				end 
			CHANGE_UP: begin
				out_x = 
				out_y = 
				out_color = 3'b010;
				end 
			CHANGE_LEFT: begin
				out_x = 
				out_y = 
				out_color = 3'b010;
				end 
			CHANGE_RIGHT: begin
				out_x = 
				out_y = 
				out_color = 3'b010;
				end 
		endcase 
		end 
endmodule 