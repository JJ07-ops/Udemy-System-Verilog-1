/*Assignment agenda:

Create a function that generate and return 32 values of multiple of 8 (0, 8, 16, 24, 32, 40 .... 248). Store this value in the local array of the testbench top and also print the value of each element of this array on the console.

*/

`timescale 1ns/1ps

module tb(); 
  
  //Create function
  function automatic init_arr(ref int array[32]);
    
    for(int i = 0; i < 32; i ++) begin
      array[i] = (i * 8);
    end
    
  endfunction
  
  //Declare an array
  int array[32];
    
  initial begin
  
  	//Call the function on the array and print the array
    init_arr(array);
  	$display("Values of array are : %0p",array);
    
  end
  
  
endmodule
