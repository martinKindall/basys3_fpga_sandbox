`timescale 1ns / 1ps

module SevenSeg1DigBtn(
    input logic btn0,
    input logic btn1,
    input logic btn2,
    input logic btn3,
    output logic a,
    output logic b,
    output logic c,
    output logic d,
    output logic e,
    output logic f,
    output logic g,
    output logic dp,
    output logic enable0,
    output logic enable1,
    output logic enable2,
    output logic enable3);

    logic [6:0] segments;

    SevenSeg1Dig display(
    .binary({btn3, btn2, btn1, btn0}),
    .segments(segments));

    assign {a, b, c, d, e, f, g} = ~segments;

    assign dp = 1;

    assign enable0 = 0;
    assign enable1 = 1;
    assign enable2 = 1;
    assign enable3 = 1;

endmodule
