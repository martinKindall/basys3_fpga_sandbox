`timescale 1ns / 1ps

module LedBlink(
    input logic clk,
    output logic led);

    Clock1Hz Clock1Hz_a(
        .clk_in(clk),
        .clk_out(led)
    ); 

endmodule
