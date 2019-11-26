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
    output [7:0] sequence_out

    reg out_signal;
    reg [27:0]count;

    always @(posedge clock) begin
        if (!reset_n) begin
            count <= 28'b0;
        end 
        if (begin_signal) begin
            if (count == 28'b1)   //not sure if correct time
                out_signal <= 1;
                count <= 28'b0;
            else begin
                out_signal <= 0;
                count <= count + 1'b1; 
            end 
        end 
    end 
    
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

    assign arrow_direction = [9:8]sequence_shifted;
    assign sequence_output = [7:0]sequence_shifted;
    assign stop = stop_sequence;
endmodule
