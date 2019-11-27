module comparator(clock, sequence);
    wire first_to_second, second_to_third, third_to_fourth;
    arrow_block first(
        .clock(clock),
        .pass_signal(),
        .next_direction(sequence[1:0]),
        .pass_direction(first_to_second)
    );

    arrow_block first(
        .clock(clock),
        .pass_signal(),
        .next_direction(sequence[1:0]),
        .pass_direction(first_to_second)
    );


endmodule 

module arrow_block(clock, pass_signal, next_direction, pass_direction);
    input [1:0]next_direction;
    output [1:0]pass_direction;

    reg [1:0]passing; 
    always @(posedge clock) begin
        if (pass_signal)
            passing <= next_direction;
        

    end

    assign pass_direction = passing;
endmodule
