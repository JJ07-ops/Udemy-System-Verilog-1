/*Assignment agenda:

Take the help of pseudo-random number generator to generate values for wr and rst signal. rst should be low for apprx. 30% of time whie wr should be high for apprx. 50% of time. Verify your code for 20 iterations by sending values of both wr and rst on a console. Generator code is mentioned in the Instruction tab.

*/

`timescale 1ns/1ps

class generator;
  
  rand bit rst;
  rand bit wr;
  
  /////////////////add constraint
  constraint control {
    rst dist{0 := 30, 1 := 70};
    wr dist{[0:1] :/ 100};
    
  }
  
  
  
  
  
endclass
 

//main part of the code
module tb;
  
  generator g;
  
  initial begin
  
  	//for loop to generate 20 random values
  	for(int i = 0; i < 20; i++) begin
    
      g = new();
      g.randomize;

      $display("wr : %0d, rst : %0d",g.wr,g.rst);
    
  	end
    
  end
  
endmodule
