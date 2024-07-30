/*Assignment agenda:

Create a dynamic array capable of storing 7 elements. add a value of multiple of 7 starting from 7 in the array (7, 14, 21 ....49). 
After 20 nsec Update the size of the dynamic array to 20. Keep existing values of the array as it is and update the rest 13 elements to a multiple of 5 starting from 5. 
Print Value of the dynamic array after updating all the elements.

Expected result : 7, 14, 21, 28 ..... 49, 5, 10, 15 ..... 65 .


*/

`timescale 1ns/1ps

module tb(); 
  
  //create dynamic array and call variable i
  int array[];
  int i = 0;
  
  //main part of code
  initial begin;
    
    //set size of dynamic array to 7
    array = new[7];
    
    //add multiples of 7 until 49
    foreach(array[j]) begin
      array[j] = (j + 1) * 7;
    end
    
    //20 nsec delay
    #20
    
    //Update size of dynamic array to 20
    array = new[20](array);
    
    //add multiples of 5 for new elements
    for(i = 7; i < 20; i++) begin
      array[i] = (i - 6) * 5;
    end
    
    
    //print the array
    $display("The elements inside array are : %0p", array);
  
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
