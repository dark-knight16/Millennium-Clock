`timescale 1ns/1ps

module day_of_month_tb;

    reg [3:0] month_unit;
    reg [3:0] month_ten;
    reg [3:0] year_unit;
    reg [3:0] year_ten;
    reg [3:0] year_hundered;
    reg [3:0] year_thousand;
    wire [4:0] max_days;

    day_of_month DoM (
        .month_unit(month_unit),
        .month_ten(month_ten),
        .year_unit(year_unit),
        .year_ten(year_ten),
        .year_hundered(year_hundered),
        .year_thousand(year_thousand),
        .max_days(max_days)
    );

    initial begin
        month_unit = 4'd2;
        month_ten = 4'd0;
        year_unit = 4'd5;
        year_ten = 4'd0;
        year_hundered = 4'd0;
        year_thousand = 4'd2;

        #10;
        month_unit = 4'd2;
        month_ten = 4'd0;
        year_unit = 4'd0;
        year_ten = 4'd0;
        year_hundered = 4'd8;
        year_thousand = 4'd2;

        #10;
        month_unit = 4'd2;
        month_ten = 4'd0;
        year_unit = 4'd4;
        year_ten = 4'd0;
        year_hundered = 4'd1;
        year_thousand = 4'd2;

        #10;
        month_unit = 4'd2;
        month_ten = 4'd0;
        year_unit = 4'd0;
        year_ten = 4'd0;
        year_hundered = 4'd1;
        year_thousand = 4'd2;

        #10;
        month_unit = 4'd1;
        month_ten = 4'd0;
        year_unit = 4'd6;
        year_ten = 4'd3;
        year_hundered = 4'd7;
        year_thousand = 4'd2;

        #10;
        month_unit = 4'd2;
        month_ten = 4'd1;
        year_unit = 4'd1;
        year_ten = 4'd0;
        year_hundered = 4'd4;
        year_thousand = 4'd3;

        #10;
        month_unit = 4'd1;
        month_ten = 4'd1;
        year_unit = 4'd5;
        year_ten = 4'd2;
        year_hundered = 4'd2;
        year_thousand = 4'd5;

        #10;
        month_unit = 4'd7;
        month_ten = 4'd0;
        year_unit = 4'd0;
        year_ten = 4'd0;
        year_hundered = 4'd0;
        year_thousand = 4'd2;

        #10 $stop;
    end

endmodule