module counter_days_tb;
    
    reg clk;
    reg rst_n;
    reg mode_day;
    reg up;
    reg down;
    reg tick_day;
    reg [4:0] max_days;
    wire [3:0] day_unit;
    wire [3:0] day_ten;
    wire tick_month;

    counter_days cnt_day (
        .clk(clk),
        .rst_n(rst_n),
        .mode_day(mode_day),
        .up(up),
        .down(down),
        .tick_day(tick_day),
        .max_days(max_days),
        .day_unit(day_unit),
        .day_ten(day_ten),
        .tick_month(tick_month)
    );

    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end

    initial begin 
    rst_n = 0;
    mode_day = 1;
    tick_day = 0;
    up = 0;
    down = 0;
    max_days = 5'd29;

    #25 rst_n = 1;

    mode_day = 1;
    tick_day = 1;
    repeat(36) @(posedge clk);

    tick_day = 0;
    repeat(36) @(posedge clk);

    mode_day = 0;

    up = 1; down = 1;
    repeat(36) @(posedge clk);  

    up = 1; down = 0;
    repeat(36) @(posedge clk);  
   
    up = 0; down = 0;
    repeat(36) @(posedge clk);

    up = 0; down = 1;
    repeat(36) @(posedge clk);

    #1000 $stop;

    end

endmodule