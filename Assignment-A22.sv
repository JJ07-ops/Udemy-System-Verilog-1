//Assignment agenda:
//Assume `timescale 1ps/1ps. 
//Generate a 25 MHz square wave waveform for the Signal clk.


`timescale 1ps/1ps

module tb(); 
  
  //declare clock variable
  reg clk = 0;
  real delay = 20000;
  
  //main part of code
  always #delay clk = ~clk;
  
  //dump
  initial begin;
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  //force finish
  initial begin
    #100000
    $finish();
  end
  
endmodule
