module automated_sequence(sequence, begin_signal, clock, direction_arrow, stop);
    input [7:0]sequence;
    input clock;
	input begin_signal;
    output [1:0]direction_arrow;
    output stop;

    reg out_signal;
    reg [4:0]count = 5'b00000;
	//reg [19:0] count = 20'b0;
    always @(posedge clock) begin
    
        if (begin_signal) begin
            //if(count == 20'd60)//833_333)
            if(count == 5'b00111)
                begin
                out_signal <= 1;
                count <= 0;
                end
            else
                begin
                count <= count+1;
                out_signal <= 0;
                end
        end
        
    end 

    reg [2:0]remaining = 3'b100;
    reg [1:0]direction;
    reg stop_signal;
    always @ (posedge out_signal) begin
        if (remaining == 3'b100) 
            direction <= sequence[7:6];
        else if (remaining == 3'b011)
            direction <= sequence[5:4];
        else if (remaining == 3'b010)
            direction <= sequence[3:2];
        else if (remaining == 3'b001)
            direction <= sequence[1:0];
        else
            stop_signal <= 1;
        remaining <= remaining - 1'b1;
    end 

    assign direction_arrow = direction;
    assign stop = stop_signal; 
endmodule
/**
module automated_sequence(
                        clock, 
                        reset_n, 
                        begin_signal, 
                        sequence, 
                        arrow_direction, 
                        stop, 
                        sequence_out
                        );
    input clock, begin_signal, reset_n;
    input [7:0]sequence;
    output [1:0]arrow_direction; 
    output stop;
    output [7:0] sequence_out;

    reg out_signal;
    reg [4:0]count = 5'b00000;
	//reg [19:0] count = 20'b0;
    always @(posedge clock) begin

	
	//if(count == 20'd60)//833_333)
	if(count == 5'b00111)
		begin
		out_signal <= 1;
		count <= 0;
		end
	else
		begin
		count <= count+1;
		out_signal <= 0;
		end
end
	reg [7:0]sequence_shifted;
	always @(posedge out_signal)begin
		sequence_shifted <= sequence <<2;
	end
	assign sequence_out = sequence_shifted;
	assign arrow_direction = sequence_out[9:8];
endmodule
        
    /**
    reg [2:0]shifts_left; 
    reg stop_sequence;

    reg [9:0]sequence_shifted;
    always @(posedge out_signal) begin 
        if (!reset_n) begin
            shifts_left <= 3'b100; 
        end 
        if (shifts_left == 0) begin 
            stop_sequence <= 1; 
        end 
            sequence_shifted <= sequence << 2;
            shifts_left <= shifts_left - 1'b1;
    end 

    assign arrow_direction = sequence_shifted[9:8];
    assign sequence_out = sequence_shifted[7:0];
    assign stop = stop_sequence;
endmodule
*/

