module gen_clk_1Hz (
    input clk_50MHz,
    input rst_n,
    output reg clk_1Hz    
);

    reg [25:0] counter;
    always @(posedge clk_50MHz or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            clk_1Hz <= 0;
        end
        else begin
            if (counter == 25000000 - 1) begin
                counter <= 0;
                clk_1Hz = ~clk_1Hz;
            end
            else counter <= counter + 1;
        end
    end

endmodule