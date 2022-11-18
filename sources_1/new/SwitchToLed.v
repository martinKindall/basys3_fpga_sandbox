`timescale 1ns / 1ps

module SwitchToLed(
    input slideSwitch,
    output led
    );

    assign led = slideSwitch;

endmodule
