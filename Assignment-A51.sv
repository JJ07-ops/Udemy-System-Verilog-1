/*Assignment agenda:

Create a Class consisting of 3 data members each of unsigned integer type. 
Initialize them to 45,78, and 90. Use the display function to print the values on the console.

*/
`timescale 1ns/1ps

//Design the class
class example;
  
  //create 3 data members for the class
  int unsigned data1;
  int unsigned data2;
  int unsigned data3;
  
endclass

module tb(); 
  
  //Declare a class
  example f;
  
  
  //main part of code
  initial begin;
    //allocate memory for the class
    f = new();
    
    //initialize data values
    f.data1 = 45;
    f.data2 = 78;
    f.data3 = 90;
    
    
    //print the array
    #1;
    $display("The value of data1 is : %0d", f.data1);
    $display("The value of data2 is : %0d", f.data2);
    $display("The value of data3 is : %0d", f.data3);
    
    
    //deallocate the memory for the class
    f = null;
  
  end

  
endmodule
