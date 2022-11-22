`timescale 1ns / 1ps

module FourLedFSM(
    input logic clk,
    input logic resetBtn,
    output logic led0,
    output logic led1,
    output logic led2,
    output logic led3);

    typedef enum logic [1:0] { S0, S1, S2, S3 } statetype;  // 00, 01, 10, 11
    statetype [1:0] state, nextstate;  // state is a register (memory)

    always_ff @(posedge clk, posedge resetBtn)
        if (resetBtn) state <= S0;
        else state <= nextstate;

    always_comb 
        case (state)
            S0: nextstate <= S1;
            S1: nextstate <= S2;
            S2: nextstate <= S3;
            S3: nextstate <= S0;
            default: nextstate <= S0;
        endcase

    assign led0 = (state == S0);
    assign led1 = (state == S1);
    assign led2 = (state == S2);
    assign led3 = (state == S3);

endmodule
