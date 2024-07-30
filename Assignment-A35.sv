/*Assignment agenda:

Create a Fixed-size array capable of storing 20 elements. Add random values to all the 20 elements by using $urandom function. Now add all the elements of the fixed-size array to the Queue in such a way that the first element of the Fixed-size array should be the last element of the Queue. Print all the elements of both fixed-size array and Queue on Console.

Student note: the question is unclear, therefore it is assumed that the elements in the queue has a reversed order compared to the fixed array.

*/

`timescale 1ns/1ps

module tb(); 
  
  //Create fixed array and queue
  int array[20];
  int queue[$];
  int i = 0;
  
  //main part of code
  initial begin;
    
    //Add random values to fixed array
    foreach(array[j]) begin
      array[j] = $urandom_range(100); //assume max is 100
    end
    
    //Add values into queue
    repeat(20) begin
      queue.push_front(array[i]);
      i++;
    end
    
    
    //print the array
    $display("The elements inside array are : %0p", array);
    $display("The elements inside queue are : %0p", queue);
  
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
