module top_module (
    input clk_50MHz,
    input rst_n,
    input mode_display,
    input mode,
    input up,
    input down,
    output reg [6:0] HEX0,
    output reg [6:0] HEX1,
    output reg [6:0] HEX2,
    output reg [6:0] HEX3,
    output reg [6:0] HEX4,
    output reg [6:0] HEX5,
    output reg [6:0] HEX6,
    output reg [6:0] HEX7
);

    wire clk_1Hz;
    wire blink_second_year_wire;
    wire blink_minute_month_wire;
    wire blink_hour_day_wire;
    wire mode_second_wire;
    wire mode_minute_wire;
    wire mode_hour_wire;
    wire mode_day_wire;
    wire mode_month_wire;
    wire mode_year_wire;
    wire second_unit_wire;
    wire second_ten_wire;
    wire minute_unit_wire;
    wire minute_ten_wire;
    wire hour_unit_wire;
    wire hour_ten_wire;
    wire day_unit_wire;
    wire day_ten_wire;
    wire month_unit_wire;
    wire month_ten_wire;
    wire year_unit_wire;
    wire year_ten_wire;
    wire year_hundered_wire;
    wire year_thousand_wire;
    wire HEX0_wire;
    wire HEX1_wire;
    wire HEX2_wire;
    wire HEX3_wire;
    wire HEX4_wire;
    wire HEX5_wire;
    wire HEX6_wire;
    wire HEX7_wire;

    gen_clk_1Hz genclk1Hz (
        .clk_50MHz(clk_50MHz),
        .rst_n(rst_n),
        .clk_1Hz(clk_1Hz)
    );

    controller ctr (
        .clk(clk_1Hz),
        .rst_n(rst_n),
        .display(mode_display),
        .mode(mode),
        .blink_second_year(blink_second_year_wire),
        .blink_minute_month(blink_minute_month_wire),
        .blink_hour_day(blink_hour_day_wire),
        .mode_second(mode_second_wire),
        .mode_minute(mode_minute_wire),
        .mode_hour(mode_hour_wire),
        .mode_day(mode_day_wire),
        .mode_month(mode_month_wire),
        .mode_year(mode_year_wire)
    );

    count cnt (
        .clk(clk_1Hz),
        .rst_n(rst_n),
        .mode_second(mode_second_wire),
        .mode_minute(mode_minute_wire),
        .mode_hour(mode_hour_wire),
        .mode_day(mode_day_wire),
        .mode_month(mode_month_wire),
        .mode_year(mode_year_wire),
        .up(up),
        .down(down),
        .second_unit(second_unit_wire),
        .second_ten(second_ten_wire),
        .minute_unit(minute_unit_wire),
        .minute_ten(minute_ten_wire),
        .hour_unit(hour_unit_wire),
        .hour_ten(hour_ten_wire),
        .day_unit(day_unit_wire),
        .day_ten(day_ten_wire),
        .month_unit(month_unit_wire),
        .month_ten(month_ten_wire),
        .year_unit(year_unit_wire),
        .year_ten(year_ten_wire),
        .year_hundered(year_hundered_wire),
        .year_thousand(year_thousand_wire)
    );

    display dis (
        .clk(clk_1Hz),
        .rst_n(rst_n),
        .mode_display(mode_display),
        .blink_second_year(blink_second_year_wire),
        .blink_minute_month(blink_minute_month_wire),
        .blink_hour_day(blink_hour_day_wire),
        .second_unit(second_unit_wire),
        .second_ten(second_ten_wire),
        .minute_unit(minute_unit_wire),
        .minute_ten(minute_ten_wire),
        .hour_unit(hour_unit_wire),
        .hour_ten(hour_ten_wire),
        .day_unit(day_unit_wire),
        .day_ten(day_ten_wire),
        .month_unit(month_unit_wire),
        .month_ten(month_ten_wire),
        .year_unit(year_unit_wire),
        .year_ten(year_ten_wire),
        .year_hundered(year_hundered_wire),
        .year_thousand(year_thousand_wire),
        .HEX0(HEX0_wire),
        .HEX1(HEX1_wire),
        .HEX2(HEX2_wire),
        .HEX3(HEX3_wire),
        .HEX4(HEX4_wire),
        .HEX5(HEX5_wire),
        .HEX6(HEX6_wire),
        .HEX7(HEX7_wire)
    );

    always @(*) begin
        HEX0 = HEX0_wire;
        HEX1 = HEX1_wire;
        HEX2 = HEX2_wire;
        HEX3 = HEX3_wire;
        HEX4 = HEX4_wire;
        HEX5 = HEX5_wire;
        HEX6 = HEX6_wire;
        HEX7 = HEX7_wire;
    end

endmodule