`timescale 1ps/1ps
module testcircuit (
);
reg A ;
wire s ;
    initial begin
        A=0;
        #1 ;
        A = 1 ;
        #1 ;
        A= 0;
        #1;
        A = 1 ;
        $finish;
    end

    subcircuit DUT(.A(A),.signal(s));
endmodule

module subcircuit (
    input A ,
    output reg signal 
);
    always @(*) begin
        signal = A ;
        $display("%b.",A);
        $monitor("%b.",A);
    end
endmodule