
module Adder(
    input logic [1:0] a, b,
    input logic cin,
    output logic [1:0] s,
    output logic cout
);

    assign {cout, s} = a + b + cin;

endmodule
