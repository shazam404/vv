//S1 - 3
//Akshat Bharara
//231CS110
//6311 to 6421 converter

module converter(
    input a,b,c,d,
    output wG, xG, yG,zG,
    output wD, xD, yD, zD
);

//gate level modelling
wire temp1, temp2, temp3, temp4, temp5,temp6,comp_a, comp_b, comp_c, comp_d;

not(comp_a,a); //a'
not(comp_b,b); //b'
not(comp_c,c); //c'
not(comp_d,d); //d'


buf(wG, a); //w = a
and(xG, b,d); //x = bd

and(temp1,a,b); //ab
and(temp2,comp_b,c); //b'c
and(temp3,b,comp_c,comp_d); //b'c'd
or(yG,temp1,temp2,temp3); //y = ab + b'c + b'c'd

and(temp4,b,comp_d); //bd'
and(temp5,b,c); //bc
and(temp6,comp_b,comp_c,d); //b'c'd
or(zG,temp1,temp4,temp5,temp6);// z= ab + bd' + bc + b'c'd


//dataflow level modelling
assign wD = a; //msb
assign xD = ( b & d);
assign yD = (a & b) | (~b & c) | (b & ~c & ~d);
assign zD = (a & b) | (b & ~d) | (b & c) | (~b & ~c & d); //lsb

endmodule