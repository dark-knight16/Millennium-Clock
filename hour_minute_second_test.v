module hour_minute_second_test (
    input clk,
    input rst_n,
    input mode_day,
    input mode_minute,
    input mode_second,
    input up,
    input down,
    output [3:0] hour_unit,
    output [3:0] hour_ten,
    output [3:0] minute_unit,
    output [3:0] minute_ten,
    output [3:0] second_unit,
    output [3:0] second_ten
);

    wire tick_minute;
    wire tick_hour;
    wire tick_day;

    counter_seconds cnt_sec0 (
        .clk(clk),
        .rst_n(rst_n),
        .mode_second(mode_second),
        .up(up),
        .down(down),
        .second_unit(second_unit),
        .second_ten(second_ten),
        .tick_minute(tick_minute) 
    );

    counter_minutes cnt_min0 (
        .clk(clk),
        .rst_n(rst_n),
        .mode_minute(mode_minute),
        .tick_minute(tick_minute),
        .up(up),
        .down(down),
        .minute_unit(minute_unit),
        .minute_ten(minute_ten),
        .tick_hour(tick_hour) 
    );

    counter_hours cnt_hour0 (
        .clk(clk),
        .rst_n(rst_n),
        .mode_hour(mode_hour),
        .tick_hour(tick_hour),
        .up(up),
        .down(down),
        .hour_unit(hour_unit),
        .hour_ten(hour_ten),
        .tick_day(tick_day)
    );

endmodule