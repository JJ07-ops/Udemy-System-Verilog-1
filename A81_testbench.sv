/*Assignment agenda:

Create Transaction, Generator and Driver code for Synchronus 4-bit Multiplier.

Student's note: $display shows that mul is always 0 because there is no randomization for it but the EPWave generated shows the correct multiplication values for mul

*/

`timescale 1ns/1ns
//Create the transaction class
class transaction;
  
  //declare the variables
  randc bit [3:0] a,b;
  bit [7:0] mul;
  
  //add display function
  function void display();
    $display("a : %0d  b : %0d  mul : %0d",a,b,mul);
  endfunction
  
  //add custom copy method for deep copy purposes
  function transaction copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
    copy.mul = this.mul;
  endfunction
  
endclass

//Create the generator class
class generator;
  
  //call variables
  transaction trans;
  mailbox #(transaction) mbx;
  event done;
  
  //custom constructor for generator
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
    trans = new();
  endfunction;
  
  //randomize data and send to driver
  task run();
    
    for(int i = 0; i < 10; i++) begin
      assert(trans.randomize) else $display("Randomization failed");
      mbx.put(trans.copy);
      $display("[GEN] : SENT DATA:");
      trans.display();
      #10;
    end 
    -> done;
  endtask
  
endclass

//Create the interface
interface top_if;
  logic clk;
  logic [3:0] a,b;
  logic [7:0] mul;
endinterface

//Create the driver class
class driver;
  
  //call variables
  virtual top_if tif;
  mailbox #(transaction) mbx;
  transaction trans;
  
  //custom constructor
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction;
  
  //receive data from generator
  task run();
    forever begin
      
      mbx.get(trans);
      @(posedge tif.clk)
      tif.a <= trans.a;
      tif.b <= trans.b;
      $display("[DRV] : RCVD DATA:");
      trans.display;
      
    end
  endtask
  
endclass


//Create the testbench module
module tb;
  
  //call the variables
  event done;
  top_if tif();
  generator gen;
  driver drv;
  mailbox #(transaction) mbx;
  
  //construct the variables
  initial begin
    mbx = new();
    gen = new(mbx);
    drv = new(mbx);
    done = gen.done;
    drv.tif = tif;
    
  end
  
  //set clock
  initial begin
    tif.clk = 0;
  end
  
  always #5 tif.clk = ~tif.clk;
  
  //Call DUT
  top DUT(.a(tif.a), .b(tif.b), .mul(tif.mul), .clk(tif.clk));
  
  //Run the code
  initial begin
    fork
      gen.run();
      drv.run();
    join
  end
  
  
  //wait for event to be done and finish
  initial begin
    wait(done.triggered)
    #20;
    $finish();
  end
  
  //dumpfile
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
