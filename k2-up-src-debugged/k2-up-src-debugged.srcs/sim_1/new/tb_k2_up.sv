`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:28:13 AM
// Design Name: 
// Module Name: tb_k2_up
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


module tb_k2_up;
logic clk=0;
logic reset_n;
 
core core_dut(
   .clk(clk), 
   .resetn(reset_n)
);


initial begin 

forever #5 clk =~clk;
end 
initial begin 
 
#10 reset_n=0;
#10reset_n=1;#100 
$finish;
end

endmodule
