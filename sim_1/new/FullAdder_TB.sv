`timescale 1ns / 1ps

module FullAdder_TB;

    logic a, b, ci, s, co;
    
    FullAdder dut(
         .a(a),
         .b(b),
         .ci(ci),
         .s(s),
         .co(co)
    );
    
    initial begin
        a <= 0; b <= 0; ci <= 0; #5;
        assert(s === 0) else $error("Big problem 1");
        assert(co === 0) else $error("Big problem 2");

        a <= 0; b <= 1; ci <= 0; #5;
        assert(s === 1) else $error("Big problem 3");
        assert(co === 0) else $error("Big problem 4");

        a <= 1; #5;
        assert(s === 0) else $error("Big problem 5");
        assert(co === 1) else $error("Big problem 6");

        a <= 0; b <= 0; ci <= 1; #5;
        assert(s === 1) else $error("Big problem 7");
        assert(co === 0) else $error("Big problem 8");

        b <= 1; #5;
        assert(s === 0) else $error("Big problem 9");
        assert(co === 1) else $error("Big problem a");
        
        a <= 1; #5;
        assert(s === 1) else $error("Big problem b");
        assert(co === 1) else $error("Big problem c");

        ci <= 0; #5;
        assert(s === 0) else $error("Big problem d");
        assert(co === 1) else $error("Big problem e");
    end
    
endmodule
