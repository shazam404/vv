module comparator (
    input [3:0]data1, 
    input [3:0]data2,
    output g,e,l
    );
    assign e=(~(data1[3]^data2[3]))&(~(data1[2]^data2[2]))&(~(data1[1]^data2[1]))&(~(data1[0]^data2[0]));
    wire x3,x2,x1,x0;
    assign x3=~(data1[3]^data2[3]);
    assign x2=(~(data1[2]^data2[2]));
    assign x1=(~(data1[1]^data2[1]));
    assign x0=(~(data1[0]^data2[0]));
    assign g=(data1[3]&(~data2[3]))| (x3&data1[2]&(~data2[2]))|(x3&x2&data1[1]&(~data2[1]))|(x3&x2&x1&data1[0]&(~data2[0]));
    assign l=(data2[3]&(~data1[3]))| (x3&data2[2]&(~data1[2]))|(x3&x2&data2[1]&(~data1[1]))|(x3&x2&x1&data2[0]&(~data1[0]));

endmodule