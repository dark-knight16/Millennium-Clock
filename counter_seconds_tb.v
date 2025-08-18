`timescale 1ns/1ps

module counter_seconds_tb;

  reg clk;
  reg rst_n;
  reg mode_second;
  reg up;
  reg down;
  wire [3:0] second_unit;
  wire [3:0] second_ten;
  wire tick_minute;

  counter_seconds cnt_sec (
    .clk(clk),
    .rst_n(rst_n),
    .mode_second(mode_second),
    .up(up),
    .down(down),
    .second_unit(second_unit),
    .second_ten(second_ten),
    .tick_minute(tick_minute)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin 
    rst_n = 0;
    mode_second = 1;
    up = 0;
    down = 0;

    #20 rst_n = 1;

    mode_second = 1;
    repeat(65) @(posedge clk);

    mode_second = 0;

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