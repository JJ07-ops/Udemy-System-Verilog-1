/*Assignment agenda:

Create a task that will generate stimulus for addr , wr, and en signal as mentioned in a waveform of the Instruction tab. 
Assume address is 6-bit wide while en and wr both are 1-bit wide. The stimulus should be sent on a positive edge of 25 MHz clock signal.

Student's note: not 100% clear what the question wants but the results
generated is the same as the figure given in the question when
stimulated in EDA playground.

*/

`timescale 1ns/1ps

module tb(); 
  
  //Initialize the variables
  bit clk = 0;
  bit wr = 0;
  bit en = 0;
  bit[5:0] addr;
  
  
  //Oscillate the clock on 25MHz
  always #20 clk = ~clk;
  
  //Create the task
  task stimulus();
    
    //set the conditions for wr
    @(posedge clk)
    if((addr > 6'd11) & (addr < 6'd15)) begin
      wr = 1;
    end
    else begin
      wr = 0;
    end
    
    //set the conditions for en
    if((addr > 6'd11) & (addr < 6'd49)) begin
      en = 1;
    end
    else begin
      en = 0;
    end 
  
  endtask
    
    
  //set different values of addr before task is called each time
  initial begin;
    
    @(posedge clk);
    addr = 12;
    @(posedge clk);
    addr = 14;
    @(posedge clk);
    addr = 23;
    @(posedge clk);
    addr = 48;
    @(posedge clk);
    addr = 56;
    
  end
  
  //run stimulus task 
  always begin
    stimulus();
  end
    
    
    //dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  //force finish
  initial begin
    #220
    $finish();
  end

endmodule
