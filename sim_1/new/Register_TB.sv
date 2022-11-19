`timescale 1ns / 1ps

module Register_TB;

    logic [3:0] d;
    logic [3:0] q;

    logic clk;
    logic enable;
     
    Register dut(
         .clk(clk),
         .enable(enable),
         .d(d),
         .q(q)
    );

    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end
    
    initial begin
        enable <= 0; d <= 0; q <= 0; #15;
        assert(q === 0) else $error("Big problem at #1");

        d <= 4'hf; #10;
        assert(q === 0) else $error("Big problem at #2");

        enable <= 1; #10;
        assert(q === 4'hf) else $error("Big problem at #3");
        
        d <= 4'hc; #2;
        assert(q === 4'hf) else $error("Big problem at #4");

        #8;
        assert(q === 4'hc) else $error("Big problem at #5");

        d <= 4'h7; #10;
        assert(q === 4'h7) else $error("Big problem at #6");

        d <= 0; enable <= 0; #10;
        assert(q === 4'h7) else $error("Big problem at #7");

        #10;
        assert(d === 0) else $error("Big problem at #8");
        assert(q === 4'h7) else $error("Big problem at #9");
    end
    
endmodule
