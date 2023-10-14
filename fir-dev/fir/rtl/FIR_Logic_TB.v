`include "FIR_Logic.v"
`timescale 1ps/1ps

module FIR_Logic_TB (
);
reg [31:0] X;
reg [31:0] tap;
reg CLK ;
reg Resetn ;
wire Done ;
wire [67:0] Y; 

FIR_Logic DUT1( .X(X) ,
                .tap(tap) ,
                .CLK(CLK),
                .Resetn(Resetn),
                .Y(Y) ,
                .Done(Done) );

    initial begin
        $dumpfile("fir_TB.vcd");
        $dumpvars();
    end


    initial begin
        CLK = 0;
        forever begin
            #5 CLK = (~CLK);
        end
    end

    initial begin
        Resetn = 1 ;
        #10;
        Resetn = 0;

        #10;
        Resetn = 1;
        X = 32'd1;
        tap = 32'd1;
        $display("Y = %d.",Y);
        $monitor("Y = %d.",Y);
        #100;
        #110;
        #10;
        $finish;
    end
    
endmodule