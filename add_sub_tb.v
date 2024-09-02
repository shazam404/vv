// Binary Adder-Subtractor

module add_sub_tb;
    reg [3:0] a, b;
    reg cin;

    wire [3:0] sum;
    wire cout;

    // Instantiate the binary_adder_subtractor module
    binary_adder_subtractor uut(
        .sum(sum),
        .cout(cout),
        .a(a),
        .b(b),
        .cin(cin)
    );

    initial begin
        // Generate waveforms for GTKWave
        $dumpfile("add_sub.vcd");
        $dumpvars(0, add_sub_tb);

        // Display headers
        $display(" ");
        $display("Binary Adder-Subtractor Verification:");
        $display("   a    |    b    |  cin  |   sum   |  cout  |");
        $display("-------------------------------------------------------");

        // Monitor signal values
        $monitor("%4b  |  %4b  |   %b   |  %4b  |   %b    |", a, b, cin, sum, cout);

        // Test cases
        a = 4'b1010; b = 4'b1010; cin = 0; #10;  // Addition: 10 + 10 = 20 (sum=0100, cout=1)
        a = 4'b1010; b = 4'b1010; cin = 1; #10;  // Subtraction: 10 - 10 = 0 (sum=0000, cout=1)
        a = 4'b0110; b = 4'b0011; cin = 0; #10;  // Addition: 6 + 3 = 9 (sum=1001, cout=0)
        a = 4'b0110; b = 4'b0011; cin = 1; #10;  // Subtraction: 6 - 3 = 3 (sum=0011, cout=1)

        $display("-------------------------------------------------------");

        // End the simulation
        $finish;
    end
endmodule
