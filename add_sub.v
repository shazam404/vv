// Full Adder Module
module fulladder(sum, carry, a, b, cin);
    input a, b, cin;
    output sum, carry;
    wire w1, w2, w3;

    xor x1(w1, a, b);
    and x2(w2, a, b);
    xor x3(sum, w1, cin);
    and x4(w3, w1, cin);
    or x5(carry, w2, w3);
endmodule

// Binary Adder-Subtractor Module
module binary_adder_subtractor(sum, cout, a, b, cin);
    output [3:0] sum;
    output cout;
    input [3:0] a, b;
    input cin;
    wire c0, c1, c2;
    wire [3:0] b_xor_cin;

    // XOR each bit of B with cin to handle addition/subtraction
    xor x1(b_xor_cin[0], b[0], cin);
    xor x2(b_xor_cin[1], b[1], cin);
    xor x3(b_xor_cin[2], b[2], cin);
    xor x4(b_xor_cin[3], b[3], cin);

    // Full adder instances for 4-bit addition/subtraction
    fulladder f1(sum[0], c0, a[0], b_xor_cin[0], cin);
    fulladder f2(sum[1], c1, a[1], b_xor_cin[1], c0);
    fulladder f3(sum[2], c2, a[2], b_xor_cin[2], c1);
    fulladder f4(sum[3], cout, a[3], b_xor_cin[3], c2);
endmodule