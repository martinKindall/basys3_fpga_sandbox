`timescale 1ns / 1ps

module Adder_TB;

    logic cin, cout, clk;
    logic [1:0] a, b, s;
    logic [6:0] testvectors[1000:0];
    logic [31:0] vectornum, errors;

    logic [6:0] expected;

    Adder dut(
         .a(a),
         .b(b),
         .cin(cin),
         .s(s),
         .cout(cout)
    );
    
    initial begin
        $readmemb("Adder.tv", testvectors);
        vectornum = 0; errors = 0;
        cin <= 0; a <= 0; b <= 0; #5;
    end

    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end

    always @(posedge clk) begin
        #1;
        expected = testvectors[vectornum];
        a <= expected[6:5];
        b <= expected[4:3];
    end

    always @(negedge clk)
        begin
            if ({cout, s} !== expected[2:0]) begin
                $display("Error: output = %b (%b expected)", {cout, s}, expected[2:0]);
                $display("vectornum %b", vectornum);
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 'x) begin 
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
endmodule
