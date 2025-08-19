module counter_months (
    input clk, 
    input rst_n,
    input mode_month,
    input up, 
    input down,
    input tick_month,
    output reg [3:0] month_unit,
    output reg [3:0] month_ten,
    output reg tick_year
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            month_unit <= 4'd1;
            month_ten <= 4'd0;
            tick_year <= 1'b0;
        end     
        else begin
            if (mode_month) begin
                if (!tick_month) begin
                    month_unit <= month_unit;
                    month_ten <= month_ten;
                    tick_year <= 1'b0;
                end 
                else begin
                    if ((month_unit == 4'd2) && (month_ten == 4'd1)) begin
                        month_unit <= 4'd1;
                        month_ten <= 4'd0;
                        tick_year <= 1;
                    end
                    else begin
                        if (month_unit == 4'd9) begin
                            month_unit <= 4'd0;
                            month_ten <= 4'd1;
                            tick_year <= 1'b0;
                        end
                        else begin
                            month_unit <= month_unit + 1'b1;
                            month_ten <= month_ten;
                            tick_year <= 1'b0;
                        end
                    end
                end
            end
            else begin
                case ({up, down})
                2'b10: begin
                    if ((month_unit == 4'd2) && (month_ten == 4'd1)) begin
                        month_unit <= 4'd1;
                        month_ten <= 4'd0;
                        // tick_day <= 1'b1;
                    end
                    else begin
                        if (month_unit == 4'd9) begin
                            month_unit <= 4'd0;
                            month_ten <= 4'd1;
                            // tick_day <= 1'b0;
                        end
                        else begin
                            month_unit <= month_unit + 1'b1;
                            month_ten <= month_ten;
                            // tick_day <= 1'b0;
                        end
                    end
                end
                2'b01: begin
                    if (month_unit == 4'd1) begin
                        if (month_ten == 4'd0) begin
                            month_unit <= 4'd2;
                            month_ten <= 4'd1;
                        end
                        else begin
                            month_unit <= 4'd9;
                            month_ten <= month_ten - 1'b1;
                        end
                    end
                    else begin
                        month_unit <= month_unit - 1'b1;
                        month_ten <= month_ten;
                    end
                end
                endcase
            end
        end
    end

endmodule