module counter_years_tb;
    
    reg clk;
    reg rst_n;
    reg mode_year;
    reg up;
    reg down;
    reg tick_year;
    wire [3:0] year_unit;
    wire [3:0] year_ten;
    wire [3:0] year_hundered;
    wire [3:0] year_thousand;

    counter_years cnt_year (
        .clk(clk),
        .rst_n(rst_n),
        .mode_year(mode_year),
        .up(up),
        .down(down),
        .tick_year(tick_year),
        .year_unit(year_unit),
        .year_ten(year_ten),
        .year_hundered(year_hundered),
        .year_thousand(year_thousand)
    );

    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end

    initial begin 
    rst_n = 0;
    mode_year = 1;
    tick_year = 0;
    up = 0;
    down = 0;

    #25 rst_n = 1;

    mode_year = 1;
    tick_year = 1;
    repeat(1000) @(posedge clk);

    tick_year = 0;
    repeat(1000) @(posedge clk);

    mode_year = 0;

    up = 1; down = 1;
    repeat(10) @(posedge clk);  

    up = 1; down = 0;
    repeat(1000) @(posedge clk);  
   
    up = 0; down = 0;
    repeat(10) @(posedge clk);

    up = 0; down = 1;
    repeat(1000) @(posedge clk);

    #4100 $stop;

    end

endmodule