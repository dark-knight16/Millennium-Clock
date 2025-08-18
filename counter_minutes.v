module counter_minutes (
  input clk, 
  input rst_n,
  input mode_minute,
  input up,
  input down,
  input tick_minute,
  output reg [3:0] minute_unit,
  output reg [3:0] minute_ten,
  output reg tick_hour
);

  always @(posedge clk or negedge rst_n) begin
    casex ({rst_n, mode_minute})
    2'b0x: begin
        minute_unit <= 4'b0000;
        minute_ten <= 4'b0000;
        tick_hour <= 1'b0;
    end
    2'b11: begin
        if (!tick_minute) begin
            minute_unit <= minute_unit;
            minute_ten <= minute_ten;
            tick_hour <= 1'b0;
        end
        else begin
            if (minute_unit == 4'd9) begin
                minute_unit <= 4'b0000;
                if (minute_ten == 4'd5) begin
                    minute_ten <= 4'b0000;
                    tick_hour <= 1'b1;
                end
                else begin
                    minute_ten <= minute_ten + 1'b1;
                    tick_hour <= 1'b0;
                end
            end
            else begin
                minute_unit <= minute_unit + 1'b1;
                minute_ten <= minute_ten;
                tick_hour <= 1'b0;
            end
        end
    end
    2'b10: begin
        case ({up, down})
        2'b10: begin
            if (minute_unit == 4'd9) begin
                minute_unit <= 4'b0000;
                if (minute_ten == 4'd5) minute_ten <= 4'b0000;
                else minute_ten <= minute_ten + 1'b1;
            end
            else begin
                minute_unit <= minute_unit + 1'b1;
                minute_ten <= minute_ten;
            end
        end
        2'b01: begin
            if (minute_unit == 4'd0) begin
                minute_unit <= 4'd9;
                if (minute_ten == 4'd0) minute_ten <= 4'b0101;
                else minute_ten <= minute_ten - 1'b1;
            end
            else begin
                minute_unit <= minute_unit - 1'b1;
                minute_ten <= minute_ten; 
            end
        end
        default: begin
            minute_unit <= minute_unit;
            minute_ten <= minute_ten;
        end
        endcase
        tick_hour <= 1'b0;
    end
    endcase     
  end

endmodule