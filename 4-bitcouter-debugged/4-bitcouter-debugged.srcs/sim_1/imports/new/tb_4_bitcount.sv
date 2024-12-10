`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:21:55 AM
// Design Name: 
// Module Name: tb_4_bitcount
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_4_bitcount;

logic clk=0;
logic reset_n,load;
logic [3:0] load_data, count;
 
counter_4bit#(
)counter(
 .clk(clk),
 .reset_n(reset_n),
 .load(load),
 .load_data(load_data),
 .count(count)
);

initial begin 

forever #5 clk =~clk;
end 
initial begin 
 reset_n=0; load=0; load_data=0;

#10 reset_n=1; #50 
#10 reset_n=1;load=1; load_data=0; #10 
#10 reset_n=1;load=1; load_data=4'b0010; #20 
#10 reset_n=0; 
$finish;
end

endmodule