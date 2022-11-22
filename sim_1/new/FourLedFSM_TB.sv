`timescale 1ns / 1ps

module FourLedFSM_TB;

    logic clk, reset, y0, y1, y2, y3;
    logic [3:0] yTest;
    logic [3:0] testvectors[1000:0];
    logic [31:0] vectornum, errors;

    FourLedFSM dut(
         .clk(clk),
         .resetBtn(reset),
         .led0(y0),
         .led1(y1),
         .led2(y2),
         .led3(y3)
    );
    
    initial begin
        $readmemb("FourLedFSM.tv", testvectors);
        vectornum = 0; errors = 0;
        reset <= 1; #15; reset <= 0;
    end

    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end

    always @(posedge clk) begin
        #1; yTest = testvectors[vectornum];
    end

    always @(negedge clk)
        if (~reset) begin
            if (yTest != {y0, y1, y2, y3}) begin
                $display("Error: output = %b (%b expected)", {y0, y1, y2, y3}, yTest);
                $display("vectornum %b", vectornum);
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 'x) begin 
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
endmodule
