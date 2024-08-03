/*Assignment agenda:

Code for transaction class is mentioned in the Instruction tab. Write a code to send transaction data between generator and driver. Also, verify the data by printing the value of data members of Generator and Driver in each transaction. Execute the code for 10 random transactions.

*/

`timescale 1ns/1ns

//transaction class given in the question
class transaction;
 
rand bit [7:0] a;
rand bit [7:0] b;
rand bit wr;
 
endclass

//generator class
class generator;
  
  transaction data;
  mailbox #(transaction) mbx;
  
  //custom constructor
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  
  //main task
  task main();
    
    //send transaction data through mailbox
    for(int i = 0; i<10; i++) begin
      data = new();
      assert(data.randomize) else $display("Randomization failed");
      mbx.put(data);
      $display("[GEN] : DATA SENT : a: %0d, b: %0d, wr: %0d", data.a, data.b, data.wr);
    #10;
    end
  endtask
  
endclass



//driver class
class driver;
  
  transaction data;
  mailbox #(transaction) mbx;
  
  //custom constructor
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  //receive transaction data through mailbox
  task main();
    forever begin
    data = new();
      mbx.get(data);
      $display("[DRV] : DATA RCVD : a: %0d, b: %0d, wr: %0d", data.a, data.b, data.wr);
      #10;
    end
  endtask
  
endclass

//testbench code
module tb;
  
  //declare classes
  generator g;
  driver d;
  mailbox #(transaction) mbx;
  
  initial begin
    //construct the classes
    mbx = new();
    g = new(mbx);
    d = new(mbx);
  
    //send data from gen to driver
    fork
      g.main();
      d.main();
    join
  end
  
endmodule
