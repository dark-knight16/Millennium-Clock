module counter_days (
    input clk,
    input rst_n,
    input mode_day,
    input up,
    input down,
    input tick_day,
    input [4:0] max_days,
	 output reg [3:0] day_unit,
    output reg [3:0] day_ten,
    output reg tick_month
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            day_unit <= 4'b0001;
            day_ten <= 4'b0000;
            tick_month <= 0;
        end
        else begin
            if (mode_day) begin
                if (!tick_day) begin
                    day_unit <= day_unit;
                    day_ten <= day_ten;
                    tick_month <= 1'b0;
                end
                else begin
                    if ((day_unit + day_ten * 10) == max_days) begin
                        day_unit <= 4'b0001;
                        day_ten <= 4'b0000;
                        tick_month <= 1'b1;
                    end
                    else begin
                        if (day_unit == 4'b1001) begin
                            day_unit <= 4'b0000;
                            day_ten <= day_ten + 1'b1;
                        end
                        else day_unit <= day_unit + 1'b1;
                        tick_month <= 1'b0;
                    end
                end
            end
            else begin
                case ({up, down})
                2'b10: begin
                    if ((day_unit + day_ten * 10) == max_days) begin
                        day_unit <= 4'b0001;
                        day_ten <= 4'b0000;
                    end
                    else begin
                        if (day_unit == 4'b1001) begin
                            day_unit <= 4'b0000;
                            day_ten <= day_ten + 1'b1;
                        end
                        else day_unit <= day_unit + 1'b1;
                    end
                end
                2'b01: begin
                    if (day_unit == 4'b0000) begin
                        day_unit <= 4'b1001;
                        day_ten <= day_ten - 1'b1;
                    end 
                    else begin
                        if (day_unit == 4'b0001) begin
                            if (day_ten == 4'b0000) begin
                                if (max_days == 5'd31) begin
                                    day_unit <= 4'd1;
                                    day_ten <= 4'd3;
                                end
                                else if (max_days == 5'd30) begin
                                    day_unit <= 4'd0;
                                    day_ten <= 4'd3;
                                end
                                else if (max_days == 5'd29) begin
                                    day_unit <= 4'd9;
                                    day_ten <= 4'd2;
                                end
                                else if (max_days == 5'd28) begin
                                    day_unit <= 4'd8;
                                    day_ten <= 4'd2;
                                end
                            end 
                            else begin
                                day_unit <= 4'b0000;
                                day_ten <= day_ten;
                            end
                        end
                        else begin
                            day_unit <= day_unit - 1'b1;
                            day_ten <= day_ten;
                        end
                    end
                end
                default: begin
                    day_unit <= day_unit;
                    day_ten <= day_ten;
                end
                endcase
            end
        end
    end

endmodule 