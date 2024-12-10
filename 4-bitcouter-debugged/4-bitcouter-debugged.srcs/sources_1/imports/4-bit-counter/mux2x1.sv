module mux2x1(
    input logic S, 
    input logic in1, 
    input logic in2,
    output logic out
);
    assign out = !S ? (in1):(in2);//debug: rearranged  based on given values  
    
endmodule : mux2x1