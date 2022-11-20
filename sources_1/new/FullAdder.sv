`timescale 1ns / 1ps

module FullAdder(
    input logic a, b, ci,
    output logic s, co
);

    logic p, g;

    always_comb begin
        p = a ^ b;        
        g = a & b;

        s = p ^ ci;
        co = g | (p & ci);
    end

endmodule
