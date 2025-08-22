module count (
    input clk,
    input rst_n,
    input mode_second,
    input mode_minute,
    input mode_hour,
    input mode_day,
    input mode_month,
    input mode_year,
    input up,
    input down,
    output reg [3:0] second_unit,
    output reg [3:0] second_ten,
    output reg [3:0] minute_unit,
    output reg [3:0] minute_ten,
    output reg [3:0] hour_unit,
    output reg [3:0] hour_ten,
    output reg [3:0] day_unit,
    output reg [3:0] day_ten,
    output reg [3:0] month_unit,
    output reg [3:0] month_ten,
    output reg [3:0] year_unit,
    output reg [3:0] year_ten,
    output reg [3:0] year_hundered,
    output reg [3:0] year_thousand
);

    wire [3:0] second_unit_wire;
    wire [3:0] second_ten_wire;
    wire [3:0] minute_unit_wire;
    wire [3:0] minute_ten_wire;
    wire [3:0] hour_unit_wire;
    wire [3:0] hour_ten_wire;
    wire [3:0] day_unit_wire;
    wire [3:0] day_ten_wire;
    wire [3:0] month_unit_wire;
    wire [3:0] month_ten_wire;
    wire [3:0] year_unit_wire;
    wire [3:0] year_ten_wire;
    wire [3:0] year_hundered_wire;
    wire [3:0] year_thousand_wire;
    wire tick_minute;
    wire tick_hour;
    wire tick_day;
    wire tick_month;
    wire tick_year;
    wire [4:0] max_days;

    counter_seconds cnt_sec (
        .clk(clk),
        .rst_n(rst_n),
        .mode_second(mode_second),
        .up(up),
        .down(down),
        .second_unit(second_unit_wire),
        .second_ten(second_ten_wire),
        .tick_minute(tick_minute)
    );

    counter_minutes cnt_min (
        .clk(clk),
        .rst_n(rst_n),
        .mode_minute(mode_minute),
        .up(up),
        .down(down),
        .tick_minute(tick_minute),
        .minute_unit(minute_unit_wire),
        .minute_ten(minute_ten_wire),
        .tick_hour(tick_hour)
    );

    counter_hours cnt_hour (
        .clk(clk),
        .rst_n(rst_n),
        .mode_hour(mode_hour),
        .up(up),
        .down(down),
        .tick_hour(tick_hour),
        .hour_unit(hour_unit_wire),
        .hour_ten(hour_ten_wire),
        .tick_day(tick_day)
    );

    counter_days cnt_day (
        .clk(clk),
        .rst_n(rst_n),
        .mode_day(mode_day),
        .up(up),
        .down(down),
        .tick_day(tick_day),
        .max_days(max_days),
        .day_unit(day_unit_wire),
        .day_ten(day_ten_wire),
        .tick_month(tick_month)
    );

    counter_months cnt_month (
        .clk(clk),
        .rst_n(rst_n),
        .mode_month(mode_month),
        .up(up),
        .down(down),
        .tick_month(tick_month),
        .month_unit(month_unit_wire),
        .month_ten(month_ten_wire),
        .tick_year(tick_year)
    );

    counter_years cnt_year (
        .clk(clk),
        .rst_n(rst_n),
        .mode_year(mode_year),
        .up(up),
        .down(down),
        .tick_year(tick_year),
        .year_unit(year_unit_wire),
        .year_ten(year_ten_wire),
        .year_hundered(year_hundered_wire),
        .year_thousand(year_thousand_wire)
    );

    day_of_month DoM (
        .month_unit(month_unit_wire),
        .month_ten(month_ten_wire),
        .year_unit(year_unit_wire),
        .year_ten(year_ten_wire),
        .year_hundered(year_hundered_wire),
        .year_thousand(year_thousand_wire),
        .max_days(max_days)
    );

    always @(*) begin
        second_unit = second_unit_wire;
        second_ten = second_ten_wire;
        minute_unit = minute_unit_wire;
        minute_ten = minute_ten_wire;
        hour_unit = hour_unit_wire;
        hour_ten = hour_ten_wire;
        day_unit = day_unit_wire;
        day_ten = day_ten_wire;
        month_unit = month_unit_wire;
        month_ten = month_ten_wire;
        year_unit = year_unit_wire;
        year_ten = year_ten_wire;
        year_hundered = year_hundered_wire;
        year_thousand = year_thousand_wire;
    end

endmodule