module decoder#(
    parameter n = 2
)(
    input logic [n-1:0]in,
    output logic [(1 << n) - 1: 0]out
);

    always @(*)
    begin 
        case(in)
        0: out = 'b0001; // 'b is needed it was read as decimial 
        1: out = 'b0010;
        2: out = 'b0100;// it was 0110
        default: out = 'b0000; // adding default case 
        endcase
    end

endmodule : decoder