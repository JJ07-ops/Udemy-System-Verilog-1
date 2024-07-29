`timescale 1ns/1ps

module tb(); //period: 40 nsec and duty cycle: 0.4
  
  //let clk move
  reg clk = 0;
  
  //declare variables for square waveform (input values here)
  reg clk40;
  real period = 40; //in nsec
  real duty_cycle = 0.4; //0 to 1
  real phase = 0;
  
  real t_on;
  real t_off;
  
  //function to generate clk
  task clkgen(input real period, input real duty_cycle, input real phase);
    #phase;
    
    t_on = period * duty_cycle;
  	t_off = period - t_on;
    
    while(1) begin
      clk = 1;
      #t_on;
      clk = 0;
      #t_off;
    end
  endtask
  
  //main part of code
  initial begin
    clkgen(period, duty_cycle, phase);
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
