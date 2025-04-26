module tb;
  reg clk,rst,coin,second_wash,lid_open;
  wire Time;
  
  washingmachine KABALI (clk,rst,coin,Time,second_wash,lid_open);
  
  always #5 clk =! clk;
  
  initial
    begin
      clk=0;
      rst=0;
      coin=0;
      second_wash=0;
      lid_open=0;
      #2;
      rst=1;
      #2;
      rst=0;
      @(posedge clk);
      //test
      coin=1;
      @(posedge clk);
      coin=0;
      repeat(10) @(posedge clk);
      lid_open=1;
      repeat(2) @(posedge clk);    
      lid_open=0;
      repeat(2) @(posedge clk);
      second_wash=1;
      //repeat (2) @(posedge clk);
      //second_wash=0;
      repeat(10) @(posedge clk);
      second_wash=0;

      #20;
      $finish;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
endmodule
      
  
