//Assignment agenda:
//Assume System Consist of two global signals resetn and clk. 
//Use an initial block to initialize clk to 1'b0 and resetn to 1'b0. 
//User must keep resetn in an active low state for 60 nSec at the start of the simulation and then make active high. 
//Assume `timescale 1ns/1ps


`timescale 1ns/1ps

module tb(); 
  
  //declare global variables
  reg resetn;
  reg clk;
  
  //initialize global variables
  initial begin
    resetn = 1'b0;
    clk = 1'b0;
    
    #60
    resetn = 1'b1;
  end
   
  
  //dump
  initial begin;
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  //force finish
  initial begin
    #200
    $finish();
  end
  
endmodule
