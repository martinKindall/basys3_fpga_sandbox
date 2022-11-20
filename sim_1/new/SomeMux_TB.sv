`timescale 1ns / 1ps

module SomeMux_TB;

    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] out;
    
    logic s;
     
    SomeMux dut(
         .a(a),
         .b(b),
         .s(s),
         .out(out)
    );
    
    initial begin
        a <= 4'hf; b <= 4'h8; s <= 0; #10;
        assert(out === 4'hf) else $error("Big problem at #1");

        s <= 1; #10;
        assert(out === 4'h8) else $error("Big problem at #2");

        a <= 4'h7; b <= 4'hd; s <= 0; #10;
        assert(out === 4'h7) else $error("Big problem at #3");

        s <= 1; #10;
        assert(out === 4'hd) else $error("Big problem at #4");
    end
    
endmodule
