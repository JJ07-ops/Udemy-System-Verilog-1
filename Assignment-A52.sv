/*Assignment agenda:

Create a function that will perform the multiplication of the two unsigned integer variables. Compare values return by function with the expected result and if both values match send "Test Passed" to Console else send "Test Failed".

*/

`timescale 1ns/1ps

module tb(); 
  
  
  //Design the function
  function int unsigned multiply(int unsigned x, y);
    return x * y;
  endfunction

  //Call 2 unsigned integer variables
  int unsigned a = 9;
  int unsigned b = 6;
  int unsigned result = 0;
  
  
  //main part of code
  initial begin;
    
    //call the function 
    result = multiply(a,b);
    
    //compare with the expected results (54)
    #1;
    if(result == 54) begin
      $display("Test Passed");
    end
    else begin
      $display("Test Failed");
    end
  
  end

  
endmodule
