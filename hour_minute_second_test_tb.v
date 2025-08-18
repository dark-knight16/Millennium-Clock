module hour_minute_second_test_tb;
    
    reg clk;
    reg rst_n;
    reg mode_second;
    reg mode_minute;
    reg mode_hour;
    reg up;
    reg down;
    wire [3:0] hour_unit;
    wire [3:0] hour_ten;
    wire [3:0] minute_unit;
    wire [3:0] minute_ten;
    wire [3:0] second_unit;
    wire [3:0] second_ten;

    hour_minute_second_test h_m_s (
        .clk(clk),
        .rst_n(rst_n),
        .mode_second(mode_second),
        .mode_minute(mode_minute),
        .mode_hour(mode_hour),
        .up(up),
        .down(down),
        .second_unit(second_unit),
        .second_ten(second_ten),
        .minute_unit(minute_unit),
        .minute_ten(minute_ten),
        .hour_unit(hour_unit),
        .hour_ten(hour_ten)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin 
        rst_n = 0;
        mode_hour = 1;
        tick_hour = 0;
        up = 0;
        down = 0;

        #25 rst_n = 1;

        mode_hour = 1;
        tick_hour = 1;
        repeat(36) @(posedge clk);

        tick_hour = 0;
        repeat(35) @(posedge clk);

        mode_hour = 0;

        up = 1; down = 1;
        repeat(35) @(posedge clk);  

        up = 1; down = 0;
        repeat(35) @(posedge clk);  
   
        up = 0; down = 0;
        repeat(35) @(posedge clk);

        up = 0; down = 1;
        repeat(35) @(posedge clk);

      #2000 $stop;

  end

endmodule