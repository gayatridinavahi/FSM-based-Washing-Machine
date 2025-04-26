# FSM-based-Washing-Machine
An FSM based washing machine is designed according to the specifications provided.

## Working
Developing a Verilog code for a washing machine controller. 
The machine starts when a coin is deposited. It then sequences through the following steps: soak, wash, rinse, and spin. There is a switch called double_wash, which if turned ON, causes a second wash and second rinse to occur. There is one timer -  assume that each stage takes the same amount of time. The timer begins ticking (counting) as soon as the coin is deposited, generates a signal at the end of the time period, and then resets itself and starts again. If the lid is raised during the spin cycle, then the timer stops ticking and the machine stops spinning. At the end of the wash cycle, the machine goes back to its initial state.

## Results
![image](https://github.com/user-attachments/assets/ec285b82-10b2-4a2b-8c33-fc453274d613)


