`timescale 1ns / 1ps

module SevenSeg1Dig_TB;

    logic [3:0] binary;
    logic [6:0] segments;
    logic clk;
    logic [6:0] testvectors[1000:0];
    logic [31:0] vectornum, errors;

    logic [6:0] expected;

    SevenSeg1Dig dut(
         .binary(binary),
         .segments(segments)
    );
    
    initial begin
        $readmemb("SevenSeg1Dig.tv", testvectors);
        vectornum = 0; errors = 0;
        binary <= 0; #5;
    end

    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end

    always @(posedge clk) begin
        #1;
        expected <= testvectors[vectornum];
    end

    always @(negedge clk)
        begin
            if (segments !== expected) begin
                $display("Error: output = %b (%b expected)", segments, expected);
                $display("vectornum %b", vectornum);
            end
            vectornum = vectornum + 1;
            binary = binary + 1;
            if (testvectors[vectornum] === 'x) begin 
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
endmodule
