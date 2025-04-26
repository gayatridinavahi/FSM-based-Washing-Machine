module washingmachine (clk,rst,coin,Time,second_wash,lid_open);
  input clk,rst,coin,second_wash,lid_open;
  output Time;
  
  reg [2:0] T_cnt;
  
  enum {NONE,SOAK,WASH,RINSE,SPIN,WASH2,RINSE2} state;
  
  always @(posedge clk or posedge rst)
    begin
      if (rst) state <= NONE;
      else begin
        case (state)
          NONE: state <= (coin) ? SOAK : NONE;
          SOAK: state <= (Time) ? WASH : SOAK;
          WASH: state <= (Time) ? RINSE : WASH;
          RINSE: state <= (Time) ? SPIN : RINSE;
          SPIN: begin
                  if (second_wash) 
                    begin
                      if (Time) state <= WASH2;
                      else state <= SPIN;
                    end 
                  else state <= (Time) ? NONE : SPIN;
                end
          WASH2: state <= (Time) ? RINSE2 : WASH2;
          RINSE2: state <= (Time) ? NONE : RINSE2;
          default: state <= state;
        endcase
      end
    end
  
  always @(posedge clk or posedge rst)
    begin
      if (rst) T_cnt <= 0;
      else if (coin) T_cnt <= (T_cnt==3) ? 0 : (T_cnt + 1);
      else if (state==SPIN && lid_open) T_cnt <= T_cnt;
      else T_cnt <= (T_cnt==3) ? 0 : (T_cnt + 1);
        
    end
  
  assign Time = (T_cnt==3 || coin) ? 1 : 0;
  
endmodule
            
