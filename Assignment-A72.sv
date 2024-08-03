/*Assignment agenda:

Code for transaction class is mentioned in the Instruction tab. Write a code to send transaction data between generator and driver. 
Also, verify the data by printing the value of data members of Generator and Driver.

*/

`timescale 1ns/1ns

//transaction class given in the question
class transaction;
 
bit [7:0] addr = 7'h12;
bit [3:0] data = 4'h4;
bit we = 1'b1;
bit rst = 1'b0;
 
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
    
    //edit the transaction data
    data = new();
    data.addr = 7'h13;
    data.data = 4'h5;
    data.we = 1'b0;
    data.rst = 1'b1;
    
    //send transaction data through mailbox
    mbx.put(data);
    $display("[GEN] : DATA SENT : addr: %0d, data: %0d, we: %0d, rst: %0d", data.addr, data.data, data.we, data.rst);
    #10;
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
    data = new();
    mbx.get(data);
    $display("[DRV] : DATA RCVD : addr: %0d, data: %0d, we: %0d, rst: %0d", data.addr, data.data, data.we, data.rst);
    #10;
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
