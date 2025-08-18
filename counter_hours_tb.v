module counter_hours_tb;
    
    reg clk;
    reg rst_n;
    reg mode_hour;
    reg up;
    reg down;
    reg tick_hour;
    wire [3:0] hour_unit;
    wire [3:0] hour_ten;
    wire tick_day;

    counter_hours cnt_hours (
        .clk(clk),
        .rst_n(rst_n),
        .mode_hour(mode_hour),
        .up(up),
        .down(down),
        .tick_hour(tick_hour),
        .hour_unit(hour_unit),
        .hour_ten(hour_ten),
        .tick_day(tick_day)
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