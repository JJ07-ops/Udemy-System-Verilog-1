/*Assignment agenda:

Assume generator class consists of three 8-bit data members (x,y, and z). Write a code to generate 20 random values for all the data members at an interval of 20 ns.

*/

`timescale 1ns/1ps

//create generator class

class generator;  
  
  rand bit [7:0] x, y, z;
  
endclass
 

//main part of the code
module tb;
  
  generator g;
  
  initial begin
  
  	//for loop to generate 20 random values
  	for(int i = 0; i < 20; i++) begin
    
    	g = new();
    	g.randomize();
      $display("x: %0d, y: %0d, z: %0d",g.x,g.y,g.z);
      #20;
    
  	end
    
  end

  //force finish
  initial begin
    #500
    $finish();
  end
  
endmodule
