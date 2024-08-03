/*Assignment agenda:

Create Transaction, Generator and Driver code for Synchronus 4-bit Multiplier.

Student's note: $display shows that mul is always 0 because there is no randomization for it but the EPWave generated shows the correct multiplication values for mul

*/

//design code given in the question
module top
(
  input clk,
  input [3:0] a,b,
  output reg [7:0] mul
);
  
  always@(posedge clk)
    begin
     mul <= a * b;
    end
  
endmodule
