/*Assignment agenda:

Assume the class consists of three 8-bit data members a, b, and c. Create a Custom Constructor that allows the user to update the value of these data members while adding a constructor to the class. 
Test your code by adding the value of 2, 4, and 56 to a, b and c respectively.

*/

`timescale 1ns/1ps

//Create the class
class container;
  
  //Declare the 3 data members
  bit[7:0] a, b, c;
  
  //Create the custom constructor
  function new(bit[7:0] a = 0, b = 0, c = 0);
    
    this.a = a;
    this.b = b;
    this.c = c;
    
  endfunction
  
  
endclass


module tb(); 
  
  container f;
  
  //main part of the code
  initial begin
    
    f = new(2, 4 ,56);
    $display("Value of a is : %0d", f.a);
    $display("Value of b is : %0d", f.b);
    $display("Value of c is : %0d", f.c);
    
  end
  
  
endmodule
