module comparator(
                clock, 
                enable, 
                sequence, 
                direction, 
                done, 
                correctness
                );
    input enable;
	input clock;
    input [7:0]sequence;
    input [1:0]direction;
    output correctness;
    output reg done;
    
    reg [2:0]count = 3'b000;
    always @(posedge enable) begin
        count <= count + 1'b1; 
    end 


    reg correct;
    always@(posedge clock) begin
        if (count == 3'b001) begin 
            correct <= (sequence[7:6] == direction);
            end
        else if (count == 3'b010) begin 
            correct <= (sequence[5:4] == direction);
            end 
        else if (count == 3'b011) begin 
            correct <= (sequence[3:2] == direction);
            end
        else if (count == 3'b100) begin 
            correct <= (sequence[1:0] == direction);
            end
        else if (count > 3'b100)begin 
            done <= 1;
            end 
        end 
	assign correctness = correct;
endmodule 

