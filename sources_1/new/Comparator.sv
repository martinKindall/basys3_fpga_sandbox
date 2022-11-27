
module Comparator #(parameter N = 8)
    (input logic [N-1:0] a, b,
    output logic lt);

    assign lt = a < b;

endmodule
