/*Assignment agenda:

Create two tasks each capable of sending a message to Console at a fixed interval. 
Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns. 
Keep the count of the number of times Task 1 and Task 2 trigger by adding a variable for keeping the track of task execution and incrementing with each trigger. 
Execute both tasks in parallel till 200 nsec. Display the number of times Task 1 and Task 2 executed after 200 ns before calling $finish for stopping the simulation.

*/

`timescale 1ns/1ns

//testbench code
module tb;
  
  //create count variables
  int count1 = 0;
  int count2 = 0;
  
  //create task1
  task Task1();
    forever begin
      //$display("Run time: %0t", $time);
      $display("Task 1 Trigger");
      count1++;
      #20;
    end
  endtask
  
  //create task2
  task Task2();
    forever begin
      //$display("Run time: %0t", $time);
      $display("Task 2 Trigger");
      count2++;
      #40;
    end
  endtask
  
  //run both tasks making use of fork join to make them parallel
  initial begin
    fork
      Task1();
      Task2();
    join
  end
  
  
 //force finish
  initial begin
    #200
    $display("Task 1 executed %0d times",count1);
    $display("Task 2 executed %0d times",count2);
    $finish();
  end
  
endmodule
