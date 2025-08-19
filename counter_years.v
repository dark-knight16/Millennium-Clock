module counter_years (
    input clk,
    input rst_n,
    input mode_year,
    input up,
    input down,
    input tick_year,
    output reg [3:0] year_unit,
    output reg [3:0] year_ten,
    output reg [3:0] year_hundered,
    output reg [3:0] year_thousand
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            year_unit <= 4'b0101;
            year_ten <= 4'b0000;
            year_hundered <= 4'b0000;
            year_thousand <= 4'b0010;
        end
        else begin
            if (mode_year) begin
                if (!tick_year) begin 
                    year_unit <= year_unit;
                    year_ten <= year_ten;
                    year_hundered <= year_hundered;
                    year_thousand <= year_thousand;
                end
                else begin
                    if ((year_thousand == 4'd3) && (year_hundered == 4'd0) && (year_ten == 4'd0) && (year_unit == 4'd0)) begin
                        year_unit <= 4'd5;
                        year_ten <= 4'd0;
                        year_hundered <= 4'd0;
                        year_thousand <= 4'd2;                        
                    end
                    else begin
                        if (year_unit == 4'd9) begin
                            year_unit <= 4'd0;
                            if (year_ten == 4'd9) begin
                                year_ten <= 4'd0;
                                if (year_hundered == 4'd9) begin
                                    year_hundered <= 4'd0;
                                    year_thousand <= year_thousand + 1'b1;
                                end
                                else begin
                                    year_hundered <= year_hundered + 1'b1;
                                    year_thousand <= year_thousand;
                                end
                            end
                            else begin
                                year_ten <= year_ten + 1'b1;
                                year_hundered <= year_hundered;
                                year_thousand <= year_thousand;
                            end
                        end 
                        else begin
                            year_unit <= year_unit + 1'b1;
                            year_ten <= year_ten;
                            year_hundered <= year_hundered;
                            year_thousand <= year_thousand;
                        end
                    end
                end
            end
            else begin
                case ({up, down}) 
                2'b10: begin
                    if ((year_thousand == 4'd3) && (year_hundered == 4'd0) && (year_ten == 4'd0) && (year_unit == 4'd0)) begin
                        year_unit <= 4'd5;
                        year_ten <= 4'd0;
                        year_hundered <= 4'd0;
                        year_thousand <= 4'd2;                        
                    end
                    else begin
                        if (year_unit == 4'd9) begin
                            year_unit <= 4'd0;
                            if (year_ten == 4'd9) begin
                                year_ten <= 4'd0;
                                if (year_hundered == 4'd9) begin
                                    year_hundered <= 4'd0;
                                    year_thousand <= year_thousand + 1'b1;
                                end
                                else begin
                                    year_hundered <= year_hundered + 1'b1;
                                    year_thousand <= year_thousand;
                                end
                            end
                            else begin
                                year_ten <= year_ten + 1'b1;
                                year_hundered <= year_hundered;
                                year_thousand <= year_thousand;
                            end
                        end 
                        else begin
                            year_unit <= year_unit + 1'b1;
                            year_ten <= year_ten;
                            year_hundered <= year_hundered;
                            year_thousand <= year_thousand;
                        end
                    end
                end
                2'b01: begin
                    if ((year_thousand == 4'd2) && (year_hundered == 4'd0) && (year_ten == 4'd0) && (year_unit == 4'd5)) begin
                        year_unit <= 4'd0;
                        year_ten <= 4'd0;
                        year_hundered <= 4'd0;
                        year_thousand <= 4'd3;
                    end
                    else begin
                        if (year_unit == 4'd0) begin
                            year_unit <= 4'd9;
                            if (year_ten == 4'd0) begin
                                year_ten <= 4'd0;
                                if (year_hundered == 4'd0) begin
                                    year_hundered <= 4'd9;
                                    year_thousand <= year_thousand - 1'b1;
                                end
                                else begin
                                    year_hundered <= year_hundered - 1'b1;
                                    year_thousand <= year_thousand;
                                end
                            end
                            else begin
                                year_ten <= year_ten - 1'b1;
                                year_hundered <= year_hundered;
                                year_thousand <= year_thousand;
                            end
                        end
                        else begin
                            year_unit <= year_unit - 1'b1;
                            year_ten <= year_ten;
                            year_hundered <= year_hundered;
                            year_thousand <= year_thousand;
                        end
                    end
                end
                default: begin
                    year_thousand <= year_thousand;
                    year_hundered <= year_hundered;
                    year_ten <= year_ten;
                    year_unit <= year_unit;
                end
                endcase
            end
        end
    end

endmodule