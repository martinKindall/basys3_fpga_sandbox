`timescale 1ns / 1ps

// for testing, use a clock faster than 1khz, 1hz is too slow to simulate.

module Clock1Hz_TB;

    logic clk_in;
    logic clk_out;
    
    Clock1Hz dut(
         .clk_in(clk_in),
         .clk_out(clk_out)
    );
    
    initial begin
//        #10;
//        assert(clk_out == 0) else $error("Big problem at #1");

//        #50000;
//        assert(clk_out == 1) else $error("Big problem at #2");

//        #50000;
//        assert(clk_out == 0) else $error("Big problem at #3");
        
//        #50000;
//        assert(clk_out == 1) else $error("Big problem at #4");
    end

    always begin
        clk_in <= 1; #5;     
        clk_in <= 0; #5;     
    end
    
endmodule
