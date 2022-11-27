`timescale 1ns / 1ps

module Comparator_TB;

    logic clk, lt, ltExp;
    logic [2:0] a, b;
    logic [6:0] testvectors[1000:0];
    logic [31:0] vectornum, errors;

    Comparator #(3) dut(
         .a(a),
         .b(b),
         .lt(lt)
    );
    
    initial begin
        $readmemb("Comparator.tv", testvectors);
        vectornum = 0; errors = 0;
        a <= 0; b <= 0; #15;
    end

    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end

    always @(posedge clk) begin
        #1; {a, b, ltExp} = testvectors[vectornum];
    end

    always @(negedge clk)
        begin
            if (lt !== ltExp) begin
                $display("Error: output = %b (%b expected)", lt, ltExp);
                $display("vectornum %b", vectornum);
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 'x) begin 
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
endmodule
