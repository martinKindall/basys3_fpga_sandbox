`timescale 1ns / 1ps

module AdderBtn(
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

    logic ground = 0;
    logic cout;
    logic [1:0] s;
    logic [6:0] segments;

    Adder adder(
        .a({btn1, btn0}),
        .b({btn3, btn2}),
        .cin(ground),
        .s(s),
        .cout(cout)
    );

    SevenSeg1Dig display(
    .binary({ground, cout, s}),
    .segments(segments));

    assign {a, b, c, d, e, f, g} = ~segments;

    assign dp = 1;

    assign enable0 = 0;
    assign enable1 = 1;
    assign enable2 = 1;
    assign enable3 = 1;

endmodule
