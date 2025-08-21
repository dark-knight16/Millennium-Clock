module controller (
    input clk,
    input rst_n,
    input display,
    input mode,
    output reg blink_second_year,
    output reg blink_minute_month,
    output reg blink_hour_day,
    output reg mode_second,
    output reg mode_minute,
    output reg mode_hour,
    output reg mode_day,
    output reg mode_month,
    output reg mode_year
);

    localparam S0 = 2'b00, 
               S1 = 2'b01,
               S2 = 2'b10,
               S3 = 2'b11;
    
    reg [1:0] state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= S0;
        else state <= next_state;
    end

    always @(state, mode) begin
        case (state)
        S0: begin
            if (mode) next_state <= S1;
            else next_state <= S0;
        end 
        S1: begin
            if (mode) next_state <= S2;
            else next_state <= S1;
        end
        S2: begin
            if (mode) next_state <= S3;
            else next_state <= S2;
        end
        S3: begin
            if (mode) next_state <= S0;
            else next_state <= S3;
        end
        endcase
    end

    always @(state, display) begin
        case (state)
        S0: begin
            {blink_second_year, blink_minute_month, blink_hour_day} <= 3'b000;
            {mode_second, mode_minute, mode_hour, mode_day, mode_month, mode_year} <= 6'b111111;
        end
        S1: begin
            blink_second_year <= 1'b1;
            {blink_minute_month, blink_hour_day} <= 2'b00;
            {mode_minute, mode_hour, mode_day, mode_month} <= 4'b1111;
            if (display) begin
                mode_second <= 1'b0;
                mode_year <= 1'b1;
            end
            else begin
                mode_second <= 1'b1;
                mode_year <= 1'b0;
            end
        end
        S2: begin
            blink_minute_month <= 1'b1;
            {blink_second_year, blink_hour_day} <= 2'b00;
            {mode_second, mode_hour, mode_day, mode_year} <= 4'b1111;
            if (display) begin
                mode_minute <= 1'b0;
                mode_month <= 1'b1;
            end
            else begin
                mode_minute <= 1'b1;
                mode_month <= 1'b0;
            end
        end
        S3: begin
            blink_hour_day <= 1'b1;
            {blink_second_year, blink_minute_month} <= 2'b00;
            {mode_second, mode_minute, mode_month, mode_year} <= 4'b1111;
            if (display) begin
                mode_hour <= 1'b0;
                mode_day <= 1'b1;
            end
            else begin
                mode_hour <= 1'b1;
                mode_day <= 1'b0;
            end
        end
        endcase
    end

endmodule