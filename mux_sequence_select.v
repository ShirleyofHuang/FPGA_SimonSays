module mux_sequence_select(
                        sequence, 
                        begin_signal, 
                        clock, 
                        direction_arrow, 
                        stop,
                        out_signal
                        );
    input [7:0]sequence;
    input begin_signal;
    input clock;
    output [1:0]direction_arrow;
    output stop;
    output reg count;

    output reg out_signal;
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
