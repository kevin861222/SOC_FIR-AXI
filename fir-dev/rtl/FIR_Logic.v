// 11 cycle to calculate
module FIR_Logic(   input [31:0] X ,
                    input [31:0] tap ,
                    input CLK,
                    input Resetn,
                    output reg [67:0] Y ,
                    output Done 
                    );
reg [3:0] Done_count ;
always @(posedge CLK or negedge Resetn) begin
    if (~Resetn) begin
        Done_count <= 4'd0;
        Y <= 68'd0 ;
    end else begin
        if (Done) begin
            Y <= (X * tap) ;
            Done_count <= 4'd1;
        end else begin
            Y <= Y + (X * tap) ;
            Done_count <= Done_count+1;
        end
    end
end

assign Done = (Done_count == 4'b1011)? (1):(0) ;

endmodule