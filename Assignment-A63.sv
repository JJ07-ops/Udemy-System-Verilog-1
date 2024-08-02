/*Assignment agenda:

For the Generator code mentioned in the Instruction tab, expected values for variable a ranges from 0 to 8, variable b ranges from 0 to 5. Also, add logic to store the number of times randomization failed. Print values of variables during each iteration and error count after generating 20 random values for a and b. Add Constraint Code and Testbench top code to  the Design.

Student's note: error count will always remain at 0 unless the code is modified to have the ifelse condition to check for the range and the constraint is removed

*/

`timescale 1ns/1ps

//generator class given in the question

class generator;
  
  rand bit [4:0] a;
  rand bit [5:0] b;
  
  //added part:
  constraint data {a inside {[0:8]}; b inside {[0:5]};}
  
endclass
 

//main part of the code
module tb;
  
  generator g;
  int error = 0;
  
  initial begin
  
  	//for loop to generate 20 random values
  	for(int i = 0; i < 20; i++) begin
    
      g = new();
      if(!(g.randomize()))begin
        error++;
      end

      $display("a: %0d, b: %0d", g.a, g.b);
    
  	end
    
    $display("Error count: %0d", error);
    
  end
  
endmodule
