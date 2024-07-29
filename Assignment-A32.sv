/*Assignment agenda:

Create an array capable of storing 10 elements of an unsigned integer. Initialize all the 10 elements to a value equal to the square of the index of that element. for e.g. first element has index no. 0 so initialize it to 0, the second element has index no. 1 so initialize it to 1, the third element has index no. 2 so initialize it to 4, and so on. Verify the code by sending values of all the elements on Console.



*/

`timescale 1ns/1ps

module tb(); 
  
  //initialize array
  int unsigned array[10] = {0,1,4,9,16,25,36,49,64,81};
  
  //main part of code
  initial begin;
    
    //print array
    $display("The elements inside the array are : %0p", array);
  
  end

  //dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  //force finish
  initial begin
    #200
    $finish();
  end
  
endmodule
