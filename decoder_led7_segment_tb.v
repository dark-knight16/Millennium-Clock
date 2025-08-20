`timescale 1ns/1ps

module decoder_led7_segment_tb;

    reg  [3:0] BCD;       
    wire [6:0] segment;    

    decoder_led7_segment dls0 (
        .BCD(BCD),
        .segment(segment)
    );

    initial begin
        BCD = 4'd0;
        repeat (16) begin
            #20;          
            BCD = BCD + 1;
        end

        #20;
        $finish;
    end

endmodule
