`timescale 1ns / 1ps

module ShiftRegister_TB;

    logic clk, reset, sin;
    logic [4:0] q, qEx;
    logic [5:0] testvectors[1000:0];
    logic [31:0] vectornum, errors;

    ShiftRegister #(5) dut(
         .clk(clk),
         .reset(reset),
         .sin(sin),
         .q(q)
    );
    
    initial begin
        $readmemb("ShiftRegister.tv", testvectors);
        vectornum = 0; errors = 0;
        reset <= 0; sin <= 0; #2;
    end

    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end

    always @(posedge clk) begin
        #1; {sin, qEx} = testvectors[vectornum];
    end

    always @(negedge clk)
        begin
            if (q !== qEx) begin
                $display("Error: output = %b (%b expected)", q, qEx);
                $display("vectornum %b", vectornum);
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 'x) begin 
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
endmodule
