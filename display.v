module display (
    input clk,
    input rst_n,
    input mode_display,
    input blink_second_year,
    input blink_minute_month,
    input blink_hour_day,
    input [3:0] second_unit,
    input [3:0] second_ten,
    input [3:0] minute_unit,
    input [3:0] minute_ten,
    input [3:0] hour_unit,
    input [3:0] hour_ten,
    input [3:0] day_unit,
    input [3:0] day_ten,
    input [3:0] month_unit,
    input [3:0] month_ten,
    input [3:0] year_unit,
    input [3:0] year_ten,
    input [3:0] year_hundered,
    input [3:0] year_thousand,
    output reg [6:0] HEX0,
    output reg [6:0] HEX1,
    output reg [6:0] HEX2,
    output reg [6:0] HEX3,
    output reg [6:0] HEX4,
    output reg [6:0] HEX5,
    output reg [6:0] HEX6,
    output reg [6:0] HEX7
);

    reg blink_enable;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) blink_enable <= 0;
        else blink_enable <= ~blink_enable;
    end

    wire [6:0] second_unit_segment;
    wire [6:0] second_ten_segment;
    wire [6:0] minute_unit_segment;
    wire [6:0] minute_ten_segment;
    wire [6:0] hour_unit_segment;
    wire [6:0] hour_ten_segment;
    wire [6:0] day_unit_segment;
    wire [6:0] day_ten_segment;
    wire [6:0] month_unit_segment;
    wire [6:0] month_ten_segment;
    wire [6:0] year_unit_segment;
    wire [6:0] year_ten_segment;
    wire [6:0] year_hundered_segment;
    wire [6:0] year_thousand_segment;

    decoder_led7_segment sec_unit (.BCD(second_unit), .segment(second_unit_segment));
    decoder_led7_segment sec_ten (.BCD(second_ten), .segment(second_ten_segment));
    decoder_led7_segment min_unit (.BCD(minute_unit), .segment(minute_unit_segment));
    decoder_led7_segment min_ten (.BCD(minute_ten), .segment(minute_ten_segment));
    decoder_led7_segment hr_unit (.BCD(hour_unit), .segment(hour_unit_segment));
    decoder_led7_segment hr_ten (.BCD(hour_ten), .segment(hour_ten_segment));
    decoder_led7_segment da_unit (.BCD(day_unit), .segment(day_unit_segment));
    decoder_led7_segment da_ten (.BCD(day_ten), .segment(day_ten_segment));
    decoder_led7_segment mon_unit (.BCD(month_unit), .segment(month_unit_segment));
    decoder_led7_segment mon_ten (.BCD(month_ten), .segment(month_ten_segment));
    decoder_led7_segment yr_unit (.BCD(year_unit), .segment(year_unit_segment));
    decoder_led7_segment yr_ten (.BCD(year_ten), .segment(year_ten_segment));
    decoder_led7_segment yr_hundered (.BCD(year_hundered), .segment(year_hundered_segment));
    decoder_led7_segment yr_thousand (.BCD(year_thousand), .segment(year_thousand_segment));
    
    always @(*) begin
        if (mode_display) begin
            HEX0 = 7'b1111111;
            HEX1 = 7'b1111111;
            HEX2 = (blink_second_year && !blink_enable) ? 7'b11111111 : second_unit_segment;
            HEX3 = (blink_second_year && !blink_enable) ? 7'b11111111 : second_ten_segment;
            HEX4 = (blink_minute_month && !blink_enable) ? 7'b11111111 : month_unit_segment;
            HEX5 = (blink_minute_month && !blink_enable) ? 7'b11111111 : month_ten_segment;
            HEX6 = (blink_hour_day && !blink_enable) ? 7'b11111111 : hour_unit_segment;
            HEX7 = (blink_hour_day && !blink_enable) ? 7'b11111111 : hour_ten_segment;        
        end
        else begin
            HEX0 = (blink_second_year && !blink_enable) ? 7'b11111111 : year_unit_segment;
            HEX1 = (blink_second_year && !blink_enable) ? 7'b11111111 : year_ten_segment;
            HEX2 = (blink_second_year && !blink_enable) ? 7'b11111111 : year_hundered_segment;
            HEX3 = (blink_second_year && !blink_enable) ? 7'b11111111 : year_thousand_segment;
            HEX4 = (blink_minute_month && !blink_enable) ? 7'b11111111 : month_unit_segment;
            HEX5 = (blink_minute_month && !blink_enable) ? 7'b11111111 : month_ten_segment;
            HEX6 = (blink_hour_day && !blink_enable) ? 7'b11111111 : day_unit_segment;
            HEX7 = (blink_hour_day && !blink_enable) ? 7'b11111111 : day_ten_segment;       
        end
    end

endmodule