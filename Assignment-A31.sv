/*Assignment agenda:

Assume you have four variables ( a, b,c, and d )  in your testbench top. 
a and b are of the 8-bit reg type, while c and d are of the integer type. 
initialize a,b,c, and d to values of 12, 34, 67, and 255 respectively. 
Add a code to print the values of all the variables after 12 nSec.

*/

`timescale 1ns/1ps

module tb(); 
  
  //declare variables
  reg [7:0] a = 8'd12;
  reg [7:0] b = 8'd34;
  int c = 67;
  int d = 255;
  time real_time = 0;
  
  //main part of code
  initial begin;
    
    //12 nanosecond delay
    #12
    real_time = $realtime();
    $display("Current simulation time : %0d nanoseconds", real_time);
    
    //print all the values of a,b,c,d
    $display("The value of a is %0d", a);
    $display("The value of b is %0d", b);
    $display("The value of c is %0d", c);
    $display("The value of d is %0d", d);
  
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
