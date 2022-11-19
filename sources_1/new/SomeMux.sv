`timescale 1ns / 1ps

module SomeMux(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic s,
    output logic [3:0] out);

    assign out = s ? b : a; 

endmodule
