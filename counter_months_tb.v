module counter_months_tb;
    
    reg clk;
    reg rst_n;
    reg mode_month;
    reg up;
    reg down;
    reg tick_month;
    wire [3:0] month_unit;
    wire [3:0] month_ten;
    wire tick_year;

    counter_months cnt_months (
        .clk(clk),
        .rst_n(rst_n),
        .mode_month(mode_month),
        .up(up),
        .down(down),
        .tick_month(tick_month),
        .month_unit(month_unit),
        .month_ten(month_ten),
        .tick_year(tick_year)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin 
        rst_n = 0;
        mode_month = 1;
        tick_month = 0;
        up = 0;
        down = 0;

        #25 rst_n = 1;

        mode_month = 1;
        tick_month = 1;
        repeat(20) @(posedge clk);

        tick_month = 0;
        repeat(20) @(posedge clk);

        mode_month = 0;

        up = 1; down = 1;
        repeat(20) @(posedge clk);  

        up = 1; down = 0;
        repeat(20) @(posedge clk);  
   
        up = 0; down = 0;
        repeat(20) @(posedge clk);

        up = 0; down = 1;
        repeat(20) @(posedge clk);

      #300 $stop;

  end

endmodule