`timescale 1ns/1ps

module gen_clk_1Hz_tb();

    reg clk_50MHz;
    reg rst_n;
    wire clk_1Hz;

    
    gen_clk_1Hz uut (
        .clk_50MHz(clk_50MHz),
        .rst_n(rst_n),
        .clk_1Hz(clk_1Hz)
    );

    initial begin
        clk_50MHz = 0;
        forever #10 clk_50MHz = ~clk_50MHz;  
    end

    initial begin

        rst_n = 0;
        #50;         
        rst_n = 1;

        #2000000000;
        $finish;
    end

endmodule