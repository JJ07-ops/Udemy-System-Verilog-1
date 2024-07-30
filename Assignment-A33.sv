/*Assignment agenda:

Create two arrays of reg type capable of storing 15 elements. Use $urandom function to add 15 values to the array. Print the value of all the elements of the array on a single line.

*/

`timescale 1ns/1ps

module tb(); 
  
  //create 2 arrays
  reg array1[15];
  reg array2[15];
  
  //main part of code
  initial begin;
    
    //add 15 random values to the arrays
    foreach(array1[j]) begin
      array1[j] = $urandom();
    end
    
    foreach(array2[j]) begin
      array2[j] = $urandom();
    end
    
    //print the array
    $display("The elements inside array1 are : %0p", array1);
    $display("The elements inside array2 are : %0p", array2);
  
  end

  
endmodule
