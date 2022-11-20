`timescale 1ns / 1ps

module DivideBy4FSM(
    input logic clk,
    input logic reset,
    output logic y);

    typedef enum logic [1:0] { S0, S1, S2, S3 } statetype;  // 00, 01, 10, 11
    statetype [1:0] state, nextstate;  // state is a register (memory)

    always_ff @(posedge clk, posedge reset)
        if (reset) state <= S0;
        else state <= nextstate;

    always_comb 
        case (state)
            S0: nextstate <= S1;
            S1: nextstate <= S2;
            S2: nextstate <= S3;
            S3: nextstate <= S0;
            default: nextstate <= S0;
        endcase

    assign y = (state == S0);

endmodule