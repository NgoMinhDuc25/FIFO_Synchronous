
## FIFO Ring 

![FIFO Ring ](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/wavedrom/FIFO%20Operation.png)

## Block Diagram

![Block Diagram](public/block_diagram.jpg)

- [FIFO Document](https://github.com/NgoMinhDuc25/FIFO_Synchronous/blob/main/FIFO.md)
- [FIFO_State Document](https://github.com/NgoMinhDuc25/FIFO_Synchronous/blob/main/FIFO_State.md)
- [FIFO_Memory Document](https://github.com/NgoMinhDuc25/FIFO_Synchronous/blob/main/FIFO_Memory.md)
- [FIFO_Write_Pointer Document](https://github.com/NgoMinhDuc25/FIFO_Synchronous/blob/main/FIFO_Write_Pointer.md)
- [FIFO_Read_Pointer Document](https://github.com/NgoMinhDuc25/FIFO_Synchronous/blob/main/FIFO_Read_Pointer.md)

## Waveform

![Waveform 1](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/wavedrom/w1.png)
- FIFO Operation: Reset -> Write 3 datapacks -> Read 3 datapacks

![Waveform 2](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/wavedrom/w2.png)
- FIFO Operation: Burst write from 00 to 0F and check the full flag (for inserting data FF).

![Waveform 3](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/wavedrom/w3.png)
- FIFO Operation: Read when empty

## Simulation with ModelSim

![Simulation_MS](simulation/ModelSim_simulation.png)
- ModelSim simulation

![Simulation](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/simulation/simulation.png)
- [Full simulation result](https://github.com/NgoMinhDuc25/FIFO_Synchronous/blob/main/simulation/wf.pdf)

## Authors

- [@NgoDuc2505](https://github.com/NgoDuc2505)