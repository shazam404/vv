module comparator_tb;
    reg [3:0]data1,data2;
    wire g,e,l;
    comparator uut(data1,data2,g,e,l);
    initial begin
        data1=0;
        data2=0;

        for (integer i = 0; i < 16; i = i + 1) begin
            for (integer j = 0; j < 16; j = j + 1) begin
                #10 data1 = i;
                #10 data2 = j;
            end
        end

        $finish;

    end

    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0);
        $display("--------------------------------------------");
        $display("data1  | data2  | equal  | greater | lesser ");
        $display("--------------------------------------------");
        $monitor("  %d   |   %d   |    %b   |    %b    |   %b  ",data1,data2,e,g,l);
    end


endmodule