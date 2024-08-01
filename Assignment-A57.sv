/*Assignment agenda:

Create a deep copy of the Generator class. To verify the deep copy code assign value of the copy method to another instance of the generator class in TB top. 
Print the value of data members in the generator class as well as copied class. Refer Instruction tab for Generator class code.

*/

`timescale 1ns/1ps

//Generator class given in the question (modified by the student)
class generator;
  
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction
  
  //custom copy function (added by the student)
  function generator copy();
    copy = new();
    copy.a = a;
    copy.wr = wr;
    copy.en = en;
    copy.s = s;
  endfunction
 
endclass

//another random class
class random;
  
  //call generator class inside random generator
  generator g;
  
  //custom constructor function
  function new();
    g = new();
  endfunction
  
  //custom copy function 
  function random copy();
    copy = new();
    copy.g = g.copy;
  endfunction
  
endclass


//main part of the code
module tb(); 
  
  //call two random classes
  random ex1, ex2;
  
  initial begin
    //construct both classes
    ex1 = new();
    ex2 = new();
    
    //change value of data member a of generator class in random class ex1
    ex1.g.a = 3;
    
    //copy ex1 into ex2 through deep copy
    ex2 = ex1.copy;
    
    //change value of data member a of generator class in random class ex2
    ex2.g.a = 6;
    
    //print value of data members a of generator class in random class ex1 and ex2 to show that value of a in both classes are different
    ex1.g.display();
    ex2.g.display(); 
    
  end
  
endmodule
