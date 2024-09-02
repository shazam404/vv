//S2 - 2
//Akshat Bharara
//231CS110
//Safe unlocks

module safe(
    input a,b,c,d,e,
    output open_gate, open_dataflow
);

wire temp1, temp2, temp3, temp4;
and(temp1,c,d,e); //cde
and(temp2,b,c,d); //bcd
and(temp3,a,c,d); //acd
and(temp4,a,c,e); //ace
or(open_gate,temp1,temp2,temp3,temp4); //open_gate = cde + bcd + acd + ace

assign open_dataflow = (c & d & e) | (b & c & d) | (a & c & d) | (a & c & e); //cde + bcd + acd + ace


endmodule

