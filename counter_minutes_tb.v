`timescale 1ns/1ps

module counter_minutes_tb;

  reg clk;
  reg rst_n;
  reg mode_minute;
  reg tick_minute;
  reg up;
  reg down;
  wire [3:0] minute_unit;
  wire [3:0] minute_ten;
  wire tick_hour;

  counter_minutes cnt_min (
    .clk(clk),
    .rst_n(rst_n),
    .mode_minute(mode_minute),
    .up(up),
    .down(down),
    .tick_minute(tick_minute),
    .minute_unit(minute_unit),
    .minute_ten(minute_ten),
    .tick_hour(tick_hour)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin 
    rst_n = 0;
    mode_minute = 1;
    tick_minute = 0;
    up = 0;
    down = 0;

    #25 rst_n = 1;

    mode_minute = 1;
    tick_minute = 1;
    repeat(36) @(posedge clk);

    tick_minute = 0;
    repeat(25) @(posedge clk);

    mode_minute = 0;

    up = 1; down = 1;
    repeat(65) @(posedge clk);  

    up = 1; down = 0;
    repeat(65) @(posedge clk);  
   
    up = 0; down = 0;
    repeat(65) @(posedge clk);

    up = 0; down = 1;
    repeat(65) @(posedge clk);

    #2000 $stop;

  end

endmodule