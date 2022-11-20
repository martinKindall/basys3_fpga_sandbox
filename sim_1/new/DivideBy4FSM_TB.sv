`timescale 1ns / 1ps

module DivideBy4FSM_TB;

    logic clk, reset, y, yexpected;
    logic testvectors[1000:0];
    logic [31:0] vectornum, errors;

    DivideBy4FSM dut(
         .clk(clk),
         .reset(reset),
         .y(y)
    );
    
    initial begin
        $readmemb("DivideBy4FSM.tv", testvectors);
        vectornum = 0; errors = 0;
        reset <= 1; #15; reset <= 0;
    end

    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end

    always @(posedge clk) begin
        #1; yexpected = testvectors[vectornum];
    end

    always @(negedge clk)
        if (~reset) begin
            if (y !== yexpected) begin
                $display("Error: output = %b (%b expected)", y, yexpected);
                $display("vectornum %b", vectornum);
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 'x) begin 
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
endmodule
