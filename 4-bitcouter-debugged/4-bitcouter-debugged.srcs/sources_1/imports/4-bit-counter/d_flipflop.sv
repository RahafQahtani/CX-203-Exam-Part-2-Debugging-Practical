module d_flipflop(
    input logic clk, 
    input logic D, 
    input logic reset_n,
    output logic Q,
    output logic Qn 
);

logic d_latch0_o;
logic d_latch0_clk;
logic d_latch1_clk;

assign d_latch0_clk = ~clk;
assign d_latch1_clk = clk;//debugged it was (=~clk) for both clocks 

d_latch_asyn_rstn d_latch0(
    .clk(d_latch0_clk),
    .D(D),
    .reset_n(reset_n),
    .Q(d_latch0_o),
    .Qn() // debugged Qn is taken from the master ff
);

d_latch_asyn_rstn d_latch1(
    .clk(d_latch1_clk),
    .D(d_latch0_o),
    .reset_n(reset_n),
    .Q(Q),
    .Qn(Qn) // correction 
);

endmodule : d_flipflop