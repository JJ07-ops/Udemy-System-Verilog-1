//Assignment agenda:
//Write a code to generate a 9MHz square waveform for the signal sclk. 
//Assume timescale with 1nsec time-unit and 3 digit precision.

`timescale 1ns/1ps

module tb(); //period: 40 nsec and duty cycle: 0.4
  
  //declare clock variable
  reg sclk = 0;
  real frequency = 9000000;
  real period = (1/frequency) * (1 * 1000000000);
  real delay = period/2;
  
  //main part of code
  always #delay sclk = ~sclk;
  
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
