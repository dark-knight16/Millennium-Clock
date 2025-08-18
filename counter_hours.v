module counter_hours (
    input clk,
    input rst_n,
    input up, 
    input down,
    input mode_hour,
    input tick_hour,
    output reg [3:0] hour_unit,
    output reg [3:0] hour_ten,
    output reg tick_day    
);
 
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hour_unit <= 4'd0;
            hour_ten <= 4'd0;
            tick_day <= 1'b0;
        end     
        else begin
            if (mode_hour) begin
                if (!tick_hour) begin
                    hour_unit <= hour_unit;
                    hour_ten <= hour_ten;
                    tick_day <= 1'b0;
                end 
                else begin
                    if ((hour_unit == 4'd3) && (hour_ten == 4'd2)) begin
                        hour_unit <= 4'd0;
                        hour_ten <= 4'd0;
                        tick_day <= 1;
                    end
                    else begin
                        if (hour_unit == 4'd9) begin
                            hour_unit <= 4'd0;
                            hour_ten <= hour_ten + 1'b1;
                            tick_day <= 1'b0;
                        end
                        else begin
                            hour_unit <= hour_unit + 1'b1;
                            hour_ten <= hour_ten;
                            tick_day <= 1'b0;
                        end
                    end
                end
            end
            else begin
                case ({up, down})
                2'b10: begin
                    if ((hour_unit == 4'd3) && (hour_ten == 4'd2)) begin
                        hour_unit <= 4'd0;
                        hour_ten <= 4'd0;
                        // tick_day <= 1'b1;
                    end
                    else begin
                        if (hour_unit == 4'd9) begin
                            hour_unit <= 4'd0;
                            hour_ten <= hour_ten + 1'b1;
                            // tick_day <= 1'b0;
                        end
                        else begin
                            hour_unit <= hour_unit + 1'b1;
                            hour_ten <= hour_ten;
                            // tick_day <= 1'b0;
                        end
                    end
                end
                2'b01: begin
                    if (hour_unit == 4'd0) begin
                        if (hour_ten == 4'd0) begin
                            hour_unit <= 4'd3;
                            hour_ten <= 4'd2;
                        end
                        else begin
                            hour_unit <= 4'd9;
                            hour_ten <= hour_ten - 1'b1;
                        end
                    end
                    else begin
                        hour_unit <= hour_unit - 1'b1;
                        hour_ten <= hour_ten;
                    end
                end
                endcase
            end
        end
    end

endmodule