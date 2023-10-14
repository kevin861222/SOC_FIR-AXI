`include "bram11_rn.v"
// bram behavior code (can't be synthesis)
// 11 words
module bram11TB 
();

   reg            CLK;
   reg    [3:0]   WE; // write enable 
   reg            EN; // read enable
   reg    [31:0]  Di;
  wire     [31:0]  Do;
   reg    [11:0]   A; 
   reg             Resetn;        

   bram11_rn DUT1( .CLK(CLK),
                .WE(WE),
                .EN(EN),
                .Di(Di),
                .Do(Do),
                .A(A),
                .Resetn(Resetn));


    initial begin
        $dumpfile("bramTB.vcd");
        $dumpvars();
    end 
    initial begin
        CLK = 0 ;
        forever begin
            #5 CLK = (~CLK);
        end
    end

    initial begin
        // initial
        Resetn = 0;
        Di = 32'd0;
        // RAM [0] = 32'b11111111_00000000_11111111_00000000;
        // RAM [1] = 32'b11111111_00000000_11111111_00000000;
        // RAM [2] = 32'b11111111_00000000_11111111_00000000;
        // RAM [3] = 32'b11111111_00000000_11111111_00000000;
        // RAM [4] = 32'b11111111_00000000_11111111_00000000;
        // RAM [5] = 32'b11111111_00000000_11111111_00000000;
        // RAM [6] = 32'b11111111_00000000_11111111_00000000;
        // RAM [7] = 32'b11111111_00000000_11111111_00000000;
        // RAM [8] = 32'b11111111_00000000_11111111_00000000;
        // RAM [9] = 32'b11111111_00000000_11111111_00000000;
        // RAM [10] = 32'b11111111_00000000_11111111_00000000;
        EN = 1'b0;
        WE = 4'd0 ;

        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        // read initial value
        $display("Read Test");
        #10 
        Resetn = 1;
        EN = 1'b1;
        WE =  4'd0 ;
        A = 12'b000000000000;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        #10 
        EN = 1'b1;
        WE =  4'd0 ;
        A = 12'b000000000100;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        #10 
        EN = 1'b1;
        WE =  4'd0 ;
        A = 12'b000000001000;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        #10 
        EN = 1'b1;
        WE =  4'd0 ;
        A = 12'b000000001100;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        #10 
        EN = 1'b1;
        WE =  4'd0 ;
        A = 12'b000000101100; //1011
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        #10 
        EN = 1'b1;
        WE =  4'd0 ;
        A = 12'b000000110100; //1011
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");
        /////////////////////////////////////////////////////////////////////////////////////
        $display("Write Test");
        // write some value
        #10
        WE=4'b1111;
        Di = 32'b00000000_00000000_00000000_11111111;
        A = 12'b000000000100;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");
        
        #10
        WE=4'b1111;
        Di = 32'b00000000_00000000_11111111_00000000;
        A = 12'b000000001000;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");
        

        #10
        WE=4'b1111;
        Di = 32'b00000000_00000000_00000000_11110000;
        A = 12'b000000000100;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        #10
        WE=4'b1111;
        Di = 32'b00000000_00000000_00000000_00001111;
        A = 12'b000000000100;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        #10
        WE=4'b1111;
        Di = 32'b00000000_00000000_00000000_00001101;
        A = 12'b000000110100;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        #10
        WE=4'b1111;
        Di = 32'b00000000_00000000_00000000_00001101;
        A = 12'b000000110100;
        $display("A = %d.",A);
        $display("A>>2 = %d.",A>>2);
        // $display("RAM[A>>2] = %b.",RAM[A>>2]);
        $display("{32{EN}} = %b.",{32{EN}});
        $display("Do = %b.",Do);
        $display("");

        $display("End");
        #10 $finish;
    end

endmodule
