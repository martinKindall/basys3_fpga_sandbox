`timescale 1ns / 1ps

module FourLedFSMSlow(
    input logic clk,
    input logic resetBtn,
    output logic led0,
    output logic led1,
    output logic led2,
    output logic led3
);
    logic slowClock;
    
    Clock1Hz Clock1Hz_a(
        .clk_in(clk),
        .clk_out(slowClock)
    ); 

    FourLedFSM fsm(
        .clk(slowClock),
        .resetBtn(resetBtn),
        .led0(led0),
        .led1(led1),
        .led2(led2),
        .led3(led3)
    );
    
endmodule
