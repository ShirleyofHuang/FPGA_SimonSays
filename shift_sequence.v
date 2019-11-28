module shift_sequence(
                    clock, 
                    enable, 
                    sequence, 
                    new_sequence, 
                    correct_direction
                    );
    input [5:0]sequence;
    input clock, enable; 
    output [1:0]correct_direction;
	output[5:0]new_sequence;

    reg [5:0]s;
    always @(posedge clock) begin 
        if (enable)
            s <= sequence << 2'b11;
       end 
	
	assign new_sequence = s;
	assign correct_direction = s[5:4];
  //  assign correct_direction = [1:0]sequence;
endmodule 


