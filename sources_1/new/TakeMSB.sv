`timescale 1ns / 1ps

module TakeMSB(
    input logic [7:0] in,
    output logic out);

    assign out = in[7]; 

endmodule
