module counter_4bit#(
)(
    input logic clk,
    input logic reset_n,
    input logic load,
    input logic [3:0] load_data,
    output logic [3:0] count
);

        logic dff0_data_i;
        logic dff1_data_i;
        logic dff2_data_i;
        logic dff3_data_i;


        // Next count logic 
        logic [3:0] next_count;
        assign next_count[0] = ~count[0];
        assign next_count[1] = count[0] ^ count[1];
        assign next_count[2] = (count[0] & count[1]) ^ count[2];//debugged : count[0] was ~
        assign next_count[3] = (count[0] & count[1] & count[2])  ^ count[3];//debugged : count[2] was ~

        // do count plus one or load a value to counter
        mux2x1 mux_inst0(load, next_count[0], load_data[0], dff0_data_i);// debug changing Sel
        mux2x1 mux_inst1(load, next_count[1], load_data[1], dff1_data_i);
        mux2x1 mux_inst2(load, next_count[2], load_data[2], dff2_data_i);
        mux2x1 mux_inst3(load, next_count[3], load_data[3], dff3_data_i);
//mux2x1 mux_inst0(load,load_data[0] , next_count[0], dff0_data_i);// debug changing 
//        mux2x1 mux_inst1(load,load_data[1], next_count[1],  dff1_data_i);
//        mux2x1 mux_inst2(load, load_data[2],next_count[2],  dff2_data_i);
//        mux2x1 mux_inst3(load, load_data[3],next_count[3],  dff3_data_i);

        // D flip flops
        d_flipflop dff0(
            .clk(clk),
            .D(dff0_data_i),
            .reset_n(reset_n),
            .Q(count[0])
            );

        d_flipflop dff1(
            .clk(clk),
            .D(dff1_data_i),
            .reset_n(reset_n),
            .Q(count[1])
            );

        d_flipflop dff2(
            .clk(clk),
            .D(dff2_data_i),// debugged was not used
            .reset_n(reset_n),
            .Q(count[2])
            );

        d_flipflop dff3(
            .clk(clk),
            .D(dff3_data_i),
            .reset_n(reset_n),
            .Q(count[3])// debugged (Qn)
            );

endmodule