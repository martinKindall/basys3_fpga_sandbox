`timescale 1ns / 1ps

module DivideBy4FSM_TB;

    logic clk, reset, y;
     
    DivideBy4FSM dut(
         .clk(clk),
         .reset(reset),
         .y(y)
    );
    
    initial begin
        reset <= 1; #15;
        assert(y === 1) else $error("Big problem");

        reset <= 0; #10;
        assert(y === 0) else $error("Big problem");

        #10;
        assert(y === 0) else $error("Big problem");

        #10;
        assert(y === 0) else $error("Big problem");

        #10;
        assert(y === 1) else $error("Big problem");

        #10;
        assert(y === 0) else $error("Big problem");

        #10;
        assert(y === 0) else $error("Big problem");

        #10;
        assert(y === 0) else $error("Big problem");

        #10;
        assert(y === 1) else $error("Big problem");

        reset <= 1; #10;
        assert(y === 1) else $error("Big problem");
    end

    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end
    
endmodule
