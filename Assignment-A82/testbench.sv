/*Assignment agenda:

Create Monitor and Scoreboard Code for Synchronous 4-bit Multiplier. 
Stimulus is generated in Testbench top so do not add Transaction, Generator, or Driver Code. 
Also, add the Scoreboard model to compare the response with an expected result.

*/

`timescale 1ns/1ns

//Create interface
interface top_if;
  logic clk;
  logic [3:0] a, b;
  logic [7:0] mul;
  
endinterface

//Create monitor
class monitor;
  
  //call variables for data members
  bit [3:0] a,b;
  bit [7:0] mul;
  
  //all variables for classes
  mailbox #(bit [3:0]) mbxA;
  mailbox #(bit [3:0]) mbxB;
  mailbox #(bit [7:0])mbxMul;
  virtual top_if tif;
  
  //custom constructor
  function new(mailbox #(bit [3:0]) mbxA, mbxB, mailbox #(bit [7:0]) mbxMul);
    this.mbxA = mbxA;
    this.mbxB = mbxB;
    this.mbxMul = mbxMul;
  endfunction
  
  //send data to scoreboard
  task run();
    forever begin
      repeat(2) @(posedge tif.clk);
      a = tif.a;
      b = tif.b;
      mul = tif.mul;
      mbxA.put(a);
      mbxB.put(b);
      mbxMul.put(mul);
      $display("-------------------------------------");
      $display("[MON] : DATA SENT : ");
      $display("a : %0d  b : %0d  mul : %0d",a,b,mul);
      
    end
  endtask
  
  
  
endclass

//Create scoreboard
class scoreboard;
  
  //call variables for data members
  bit [3:0] a,b;
  bit [7:0] mul;
  
  //call variables for classes
  mailbox #(bit [3:0]) mbxA;
  mailbox #(bit [3:0]) mbxB;
  mailbox #(bit [7:0])mbxMul;
  virtual top_if tif;
  
  //custom constructor
  function new(mailbox #(bit [3:0]) mbxA, mbxB, mailbox #(bit [7:0]) mbxMul);
    this.mbxA = mbxA;
    this.mbxB = mbxB;
    this.mbxMul = mbxMul;
  endfunction
  
  //receive data from monitor
  task run();
    forever begin
      mbxA.get(a);
      mbxB.get(b);
      mbxMul.get(mul);
      $display("[SCO] : DATA RCVD : ");
      $display("a : %0d  b : %0d  mul : %0d",a,b,mul);  
      compare(a,b,mul);
      $display("-------------------------------------");
      #20;
    end
  endtask
  
  
  //create scoreboard model
  task compare(input a,b,mul);
    if(mul == (a * b))
      $display("[SCO] : RESULTS MATCHED");
    else
      $error("[SCO] : RESULTS MISMATCHED");
  endtask
  
endclass

//Create testbench top
module tb;
  
  //call the variables
  mailbox #(bit [3:0]) mbxA;
  mailbox #(bit [3:0]) mbxB;
  mailbox #(bit [7:0])mbxMul;
  top_if vif();
  monitor mon;
  scoreboard sco;
  
  //drive the duty
  top dut (vif.clk, vif.a, vif.b, vif.mul);
  
  //set up the clock
  initial begin
    vif.clk <= 0;
  end
  always #5 vif.clk <= ~vif.clk;
  
  //construct the classes and connect the interface
  initial begin
    mbxA = new();
    mbxB = new();
    mbxMul = new();
    mon = new(mbxA,mbxB,mbxMul);
    sco = new(mbxA,mbxB,mbxMul);
    mon.tif = vif;
  end
  
  //randomization for interface values
  initial begin
    for(int i = 0; i<20; i++) begin
      repeat(2) @(posedge vif.clk);
      vif.a <= $urandom_range(1,15);
      vif.b <= $urandom_range(1,15);
    end
  end
    
  //run the code
  initial begin
    fork
      mon.run();
      sco.run();
    join
  end   

  
  //dump and forced finish
  initial begin
    $dumpfile("dump.vcd");
     $dumpvars;    
    #420;
    $finish();
  end
  
endmodule
