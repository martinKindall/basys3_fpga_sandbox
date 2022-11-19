`timescale 1ns / 1ps

module andGate(
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [3:0] out);

    assign out = a & b; 

endmodule
