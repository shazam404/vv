// S1 - 3
// AKshat Bharara
// 231CS110
// 6311 to 6421 converter

module converter_tb;
reg A,B,C,D;
wire wG, xG, yG,zG ,wD, xD, yD, zD;

converter uut(
    .a(A),
    .b(B),
    .c(C),
    .d(D),
    .wG(wG),
    .xG(xG),
    .yG(yG),
    .zG(zG),
    .wD(wD),
    .xD(xD),
    .yD(yD),
    .zD(zD)
);

initial
    begin
  //gtkwave generation
  $dumpfile("CS110-S1-3.vcd");
  $dumpvars(0,converter_tb);

  //printing the values of the given inputs and the output
  $display(" ");
  $display("The truth table verificaiton for the given from 6311 to 6421 is : ");
  $display("          Time        |     6 4 2 1      |      6 3 1 1      |       6 3 1 1    | ");
  $display(" ");
  $monitor("%t  |   %2b %2b %2b %2b    |    %2b %2b %2b %2b    |    %2b %2b %2b %2b   |",$time,A,B,C,D,wG, xG, yG,zG ,wD, xD, yD, zD);
    A = 0;B = 0;C = 0;D = 0;#10;
    A = 0;B = 0;C = 0;D = 1;#10;
    A = 0;B = 0;C = 1;D = 1;#10;
    A = 0;B = 1;C = 0;D = 0;#10;
    A = 0;B = 1;C = 0;D = 1;#10;
    A = 0;B = 1;C = 1;D = 1;#10;
    A = 1;B = 0;C = 0;D = 0;#10;
    A = 1;B = 0;C = 0;D = 1;#10;
    A = 1;B = 0;C = 1;D = 1;#10;
    A = 1;B = 1;C = 0;D = 0;#10;
  $display("______________________________________________________________________________________________ ");

  
    $finish;
    end

endmodule