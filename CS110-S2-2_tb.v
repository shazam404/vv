// S2 - 2
// Vatsal Jay Gandhi
// 231CS164
// Safe unlocks

module safe_tb;
    reg a, b, c, d, e;
    wire open_gate, open_dataflow;

    // Instantiate the safe module
    safe uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .open_gate(open_gate),
        .open_dataflow(open_dataflow)
    );

    initial begin
        // Generate waveforms for GTKWave
        $dumpfile("CS110-S2-2.vcd");
        $dumpvars(0, safe_tb);
        
        // Display header
        $display(" ");
        $display("The outputs open_gate and open_dataflow are 1 whenever the safe can be unlocked");
        $display("         Time           |      a  b  c  d  e     |  open_gate  | open_dataflow |");
        $display(" ");
        $monitor("%t \t|     %2b %2b %2b %2b %2b     |     %2b     |     %2b     |", $time, a, b, c, d, e, open_gate, open_dataflow);

        // Test cases
        a = 0; b = 0; c = 0; d = 0; e = 0; #10; // 0
        a = 0; b = 0; c = 0; d = 0; e = 1; #10; // 1
        a = 0; b = 0; c = 0; d = 1; e = 0; #10; // 2
        a = 0; b = 0; c = 0; d = 1; e = 1; #10; // 3
        a = 0; b = 0; c = 1; d = 0; e = 0; #10; // 4
        a = 0; b = 0; c = 1; d = 0; e = 1; #10; // 5
        a = 0; b = 0; c = 1; d = 1; e = 0; #10; // 6
        a = 0; b = 0; c = 1; d = 1; e = 1; #10; // 7
        a = 0; b = 1; c = 0; d = 0; e = 0; #10; // 8
        a = 0; b = 1; c = 0; d = 0; e = 1; #10; // 9
        a = 0; b = 1; c = 0; d = 1; e = 0; #10; // 10
        a = 0; b = 1; c = 0; d = 1; e = 1; #10; // 11
        a = 0; b = 1; c = 1; d = 0; e = 0; #10; // 12
        a = 0; b = 1; c = 1; d = 0; e = 1; #10; // 13
        a = 0; b = 1; c = 1; d = 1; e = 0; #10; // 14
        a = 0; b = 1; c = 1; d = 1; e = 1; #10; // 15
        a = 1; b = 0; c = 0; d = 0; e = 0; #10; // 16
        a = 1; b = 0; c = 0; d = 0; e = 1; #10; // 17
        a = 1; b = 0; c = 0; d = 1; e = 0; #10; // 18
        a = 1; b = 0; c = 0; d = 1; e = 1; #10; // 19
        a = 1; b = 0; c = 1; d = 0; e = 0; #10; // 20
        a = 1; b = 0; c = 1; d = 0; e = 1; #10; // 21
        a = 1; b = 0; c = 1; d = 1; e = 0; #10; // 22
        a = 1; b = 0; c = 1; d = 1; e = 1; #10; // 23
        a = 1; b = 1; c = 0; d = 0; e = 0; #10; // 24
        a = 1; b = 1; c = 0; d = 0; e = 1; #10; // 25
        a = 1; b = 1; c = 0; d = 1; e = 0; #10; // 26
        a = 1; b = 1; c = 0; d = 1; e = 1; #10; // 27
        a = 1; b = 1; c = 1; d = 0; e = 0; #10; // 28
        a = 1; b = 1; c = 1; d = 0; e = 1; #10; // 29
        a = 1; b = 1; c = 1; d = 1; e = 0; #10; // 30
        a = 1; b = 1; c = 1; d = 1; e = 1; #10; // 31

        $display("______________________________________________________________________________________________ ");
        
        $finish;
    end
endmodule
