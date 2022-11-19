`timescale 1ns / 1ps

module Register(
    input logic clk,
    input logic enable,
    input logic [3:0] d,
    output logic [3:0] q);

    always_ff @(posedge clk)
        begin
            if (enable)
                q <= d;
        end 

endmodule
