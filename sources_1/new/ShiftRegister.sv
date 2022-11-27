
module ShiftRegister #(parameter N=8)(
    input logic clk,
    input logic reset,
    input logic sin,
    output logic [N-1:0] q
);

    always_ff @( posedge clk )
        if (reset)
            q <= 0;
        else
            q <= {q[N-2:0], sin};

endmodule
