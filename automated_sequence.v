module automated_sequence(clock, reset_n, begin_signal, sequence, arrow_direction, stop);
    input clock, begin_signal, reset_n;
    input [8:0]sequence;
    output [1:0]arrow_direction; 
    output stop;

    reg out_signal, [27:0]count;
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
    reg index;
    reg [1:0]sequence_output;
    reg stop_sequence;
    always @(posedge clock) begin 
        if (!reset_n) begin
            shifts_left <= 3'b100; 
        end 
        if (shifts_left == 0) begin 
            stop_sequence <= 1; 
        end 
        if (out_signal == 1) begin
            shifts_left <= shifts_left - 1'b1;
            sequence_output <= sequence[index+1:index];
            index <= index + 2; 
        end 
    end 

    assign arrow_direction = sequence_output;
    assign stop = stop_sequence;



            
