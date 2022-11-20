`timescale 1ns / 1ps

module AndGate_TB;

    logic [3:0] a;
    logic [3:0] b;
    
    logic [3:0] out;
     
    andGate dut(
         .a(a),
         .b(b),
         .out(out)
    );
    
    initial begin
        a <= 4'hf; b <= 4'hf; #10;
        assert(out === 4'hf) else $error("Big problem at #1");

        a <= 0; b <= 4'hf; #10;
        assert(out === 0) else $error("Big problem at #2");

        a <= 4'hf; b <= 0; #10;
        assert(out === 0) else $error("Big problem at #3");
        
        a <= 0; b <= 0; #10;
        assert(out === 0) else $error("Big problem at #4");

        a <= 4'hf; b <= 4'h3; #10;
        assert(out === 4'h3) else $error("Big problem at #5");

        a <= 4'h7; b <= 4'h8; #10;
        assert(out === 0) else $error("Big problem at #6");

        a <= 4'h4; b <= 4'h7; #10;
        assert(out === 4'h4) else $error("Big problem at #7");

        a <= 4'ha; b <= 4'ha; #10;
        assert(out === 4'ha) else $error("Big problem at #8");

        a <= 4'ha; b <= 4'hb; #10;
        assert(out === 4'ha) else $error("Big problem at #9");

        a <= 4'hc; b <= 4'h9; #10;
        assert(out === 4'h8) else $error("Big problem at #10");
    end
    
endmodule
