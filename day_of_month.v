module day_of_month (
    input [3:0] month_unit,
    input [3:0] month_ten,
    input [3:0] year_unit,
    input [3:0] year_ten,
    input [3:0] year_hundered,
    input [3:0] year_thousand,
    output reg [4:0] max_days
);

    reg leap_year;
    reg [6:0] temp_year0, temp_year1;
    reg [3:0] temp_month;
    always @(month_unit, month_ten, year_unit, year_ten, year_hundered, year_thousand) begin
        if ({year_ten, year_unit} == 8'd0) begin
            temp_year0 = (year_thousand << 3) + (year_thousand << 1) + year_hundered;
            if (temp_year0[1:0] == 2'b0) leap_year = 1'b1;
            else leap_year = 1'b0; 
        end
        else begin
            temp_year1 = (year_ten << 3) + (year_ten << 1) + year_unit;
            if (temp_year1[1:0] == 2'b0) leap_year = 1'b1;
            else leap_year = 1'b0;
        end
        temp_month = (month_ten << 3) + (month_ten << 1) + month_unit;
        case (temp_month)
        4'd4,
        4'd6,
        4'd9,
        4'd11: max_days = 5'd30;
        4'd2: begin
            if (leap_year) max_days = 5'd29;
            else max_days = 5'd28;
        end
        default: max_days = 5'd31;
        endcase
    end

endmodule