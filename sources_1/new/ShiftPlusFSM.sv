
module ShiftPlusFSM(
    input logic clk,
    input logic btn,
    output logic ledFSM,
    output logic led0,
    output logic led1,
    output logic led2,
    output logic led3,
    output logic led4
);
    logic slowClock;
    logic reset = 0;
    logic logicLedFsm;

    Clock1Hz Clock1Hz_a(
        .clk_in(clk),
        .clk_out(slowClock)
    );

    DivideBy4FSM DivideBy4FSM_a(
        .clk(slowClock),
        .reset(btn),
        .y(logicLedFsm)
    );

    ShiftRegister #(5) ShiftRegister_a(
        .clk(slowClock),
        .reset(reset),
        .sin(logicLedFsm),
        .q({led4, led3, led2, led1, led0})
    );

    assign ledFSM = logicLedFsm;

endmodule
