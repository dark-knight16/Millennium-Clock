`timescale 1ps/1ps

module controller_tb;

    reg clk;
    reg rst_n;
    reg display; 
    reg mode;
    wire blink_second_year;
    wire blink_minute_month;
    wire blink_hour_day;
    wire mode_second;
    wire mode_minute;
    wire mode_hour;
    wire mode_day;
    wire mode_month;
    wire mode_year;

    controller ctr0 (
        .clk(clk),
        .rst_n(rst_n),
        .display(display),
        .mode(mode),
        .blink_second_year(blink_second_year),
        .blink_minute_month(blink_minute_month),
        .blink_hour_day(blink_hour_day),
        .mode_second(mode_second),
        .mode_minute(mode_minute),
        .mode_hour(mode_hour),
        .mode_day(mode_day),
        .mode_month(mode_month),
        .mode_year(mode_year)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        display = 0;
        mode = 0;

        #25 rst_n = 1;

        #10 mode = 0; 
        display = 1;
        #10 display = 0;

        #10 mode = 1; 
        display = 1;
        #10 display = 0;

        #10 mode = 0; 
        display = 1;
        #10 display = 0;

        #10 mode = 1; 
        display = 0;
        #10 display = 0;

        #10 mode = 0; 
        #10 display = 1;
        display = 0;

        mode = 1; 
        display = 1;
        #10 display = 0;

        #10 mode = 1; 
        #10 display = 0;
        #10 display = 1;
        #10 display = 0;

        #10 mode = 0; 
        display = 1;
        display = 0;

        #10 mode = 1; 
        display = 1;
        #10 display = 0;

        $finish;
    end

endmodule