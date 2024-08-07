/*Assignment agenda:

Generate values between 0 to 7 for addr signal when wr is high and values between 8 to 15 when wr is low. 
Generator code is mentioned in the Instruction tab. Verify your code for 20 iterations by sending values of both wr and addr on a console.

*/

`timescale 1ns/1ps

class generator;
  
  rand bit [3:0] addr;
  rand bit wr;
  
  /////////////////add constraint 
  constraint wr_addr_c {
    
    if(wr == 1)
    {
      addr inside {[0:7]};
    }
      else if(wr == 0)
      {
        addr inside {[8:15]};
      }
  }
  
endclass
 

//testbench code
module tb;
  
  generator g;
  
  initial begin
    
    g = new();
  
  	//for loop to generate 20 random values
  	for(int i = 0; i < 20; i++) begin
    
      g.randomize;
      $display("wr : %0d, addr : %0d",g.wr,g.addr);
    
  	end
    
  end
  
endmodule
