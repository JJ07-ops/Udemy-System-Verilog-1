/*Assignment agenda:

Assume class consists of three data members a, b, and c each of size 4-bit. Create a task inside the class that returns the result of the addition of data members. 
The task must also be capable of sending the value of a, b, c, and result to the console. Verify code for a = 1, b = 2, and c = 4.

*/

`timescale 1ns/1ps

//Create the class
class container;
  
  //Declare the 3 data members
  bit[3:0] a, b, c;
  
  //Create the custom constructor
  function new(bit[3:0] a = 0, b = 0, c = 0);
    
    this.a = a;
    this.b = b;
    this.c = c;
    
  endfunction
  
  //Create the task
  task add(output bit [5:0] results);
    
    //add the data members of the task
    bit [5:0] results = a + b + c;
    
    //print the results
    $display("Value of a + b + c is : %0d", results);
    
  endtask
  
  
endclass


module tb(); 
  
  container f;
  bit [5:0] results;
  
  //main part of the code
  initial begin
    
    f = new(1, 2 , 4);
    f.add(results);
    
    //check if the value is returned by the task to variable results
    $display("Value of a + b + c is : %0d", results);
    
  end
  
  
endmodule
