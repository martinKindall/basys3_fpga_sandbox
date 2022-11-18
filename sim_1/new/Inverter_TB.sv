`timescale 1ns / 1ps


module Inverter_TB;

    logic in;
    
    logic out;
     
    inverter dut(
         .switch1(in),
         .y(out)
    );
    
    initial begin
        in <= 1; #10;
        assert(out === 0) else $error("Big problem at begin #1, 1 != 0");

        in <= 0; #10;
        assert(out === 1) else $error("Big problem at begin #2, 0 != 1");

        in <= 1; #10;
        assert(out === 0) else $error("Big problem at begin #3, 1 != 0");
        
        in <= 0; #10;
        assert(out === 1) else $error("Big problem at begin #4, 0 != 1");
    end
    
endmodule
