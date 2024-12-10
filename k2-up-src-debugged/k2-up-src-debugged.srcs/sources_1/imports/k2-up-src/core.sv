module core(
    input logic clk, 
    input logic resetn
);

// Instruction Fetching
logic [2:0] imm;
logic [3:0] pc;
logic carry;
logic J;
logic C;
// jump logic 
logic pc_load = J | (C & carry); // change the location after the assigning

counter_n_bit pc_inst(
    .clk(clk),
    .resetn(resetn),
    .load_data(imm),
    .load(pc_load),
    .en(1'b1),   
    .count(pc)
);


// Instruction memory
logic [7:0] inst;
imem imem_inst(
    .addr(pc),
    .inst(inst)
);

// Decoding instruction 
//logic J;  declated up to be used 
//logic C;
logic [1:0] D;
logic Sreg;
logic S;

assign J = inst[7];
assign C = inst[6];
assign D = inst[5:4]; //debugged :  [5] wasn't assigned
assign Sreg = inst[3];
assign imm = inst[2:0];
assign S= imm[2];//debugged was not decleared 

// Generating enables for register O, A and B
logic enA, enB, enO;
decoder decoder_inst(
    .in(D),
    .out({enO,enB,enA}) // debugged rearreanging decoder
);

// registers 
logic [3:0] regIn;
logic [3:0] regA, regB, regO;

logic AluOut;

// Mux for selecting inputs for register (regIn)
mux2x1 mux1(
    .in1(AluOut),
    .in2({'b0,imm}),// badding with zero 
    .sel(!Sreg),//debugged if sreg 0 then alu out 
    .out(regIn)
);

// Register RA (regA)
register reg_A(
    .clk(clk),
    .resetn(resetn),
    .wen(enA),
    .D(regIn),
    .Q(regA)
);

// Register RB (regB)
register reg_B(
    .clk(clk),
    .resetn(resetn),
     .wen(enB), //wasn't decleared 
    .D(regIn),
    .Q(regB)
);

// Register RO (regO)
register reg_O(
    .clk(clk),// core clk is clk 
    .resetn(resetn),
    .wen(enO),
    .D(regA),
    .Q(regO)
);

// ALU
//logic carry;

alu alu_inst(
    .clk(clk),// core clk is clk 
    .opcode(S),
    .a(regA),
    .b(regB),
    .out(AluOut),
    .carry(carry)
);


endmodule : core