`timescale 1ns / 1ps


module TakeMSB_TB;

    logic [7:0] in;
    
    logic out;
     
    TakeMSB dut(
         .in(in),
         .out(out)
    );
    
    initial begin
        in <= 8'hff; #10;
        assert(out === 1) else $error("Big problem at #1");

        in <= 8'h0; #10;
        assert(out === 0) else $error("Big problem at #2");

        in <= 8'h1; #10;
        assert(out === 0) else $error("Big problem at #3");

        in <= 8'h2; #10;
        assert(out === 0) else $error("Big problem at #4");

        in <= 8'h3; #10;
        assert(out === 0) else $error("Big problem at #5");

        in <= 8'h3; #10;
        assert(out === 0) else $error("Big problem at #6");

        in <= 8'h4; #10;
        assert(out === 0) else $error("Big problem at #7");

        in <= 8'h5; #10;
        assert(out === 0) else $error("Big problem at #8");

        in <= 8'h6; #10;
        assert(out === 0) else $error("Big problem at #9");

        in <= 8'h7; #10;
        assert(out === 0) else $error("Big problem at #10");

        in <= 8'h8; #10;
        assert(out === 1) else $error("Big problem at #11");

        in <= 8'h9; #10;
        assert(out === 1) else $error("Big problem at #12");
    end
    
endmodule
