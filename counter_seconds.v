module counter_seconds (
  input clk,
  input rst_n,
  input mode_second,
  input up, 
  input down, 
  output reg [3:0] second_unit,
  output reg [3:0] second_ten,
  output reg tick_minute 
);

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      second_unit <= 4'd0;
      second_ten <= 4'd0;
      tick_minute <= 0;
    end  
    else begin
      if (mode_second) begin
        if (second_unit == 4'd9) begin
          second_unit <= 4'b0000;
          if (second_ten == 4'd5) begin
            second_ten <= 4'd0;
            tick_minute <= 1'b1;
          end
          else begin
            second_ten <= second_ten + 1'b1;
            tick_minute <= 0;
          end
        end
        else begin
          second_unit <= second_unit + 1'b1;
          tick_minute <= 1'b0;
        end
      end
      else begin
        case ({up, down})
        2'b10: begin
          if (second_unit == 4'd9) begin
            second_unit <= 4'b0000;
            if (second_ten == 4'd5) second_ten <= 4'd0;
            else second_ten <= second_ten + 1'd1;
          end
          else second_unit <= second_unit + 1'd1;
        end
        2'b01: begin
          if (second_unit == 4'd0) begin
            second_unit <= 4'd9;
            if (second_ten == 4'd0) second_ten <= 4'd5;
            else second_ten <= second_ten - 1'd1;
          end
          else second_unit <= second_unit - 1'd1;
        end
        default: begin
          second_unit <= second_unit;
          second_ten <= second_ten;
        end
      endcase
      end
    end
  end

endmodule