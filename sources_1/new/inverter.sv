`timescale 1ns / 1ps

module inverter(
    input logic switch1,
    output logic y);

    assign y = ~switch1; 

endmodule
