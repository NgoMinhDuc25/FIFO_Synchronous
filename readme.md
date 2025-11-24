
# FIFO Synchronous

The simple project about FIFO, this repo shows how to organize project folder, design waveform, create block diagram and simulate.

## FIFO Ring 

![FIFO Ring ](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/wavedrom/FIFO%20Operation.png)

## Block Diagram

![Block Diagram](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/block_diagram.jpg)

## Waveform

![Waveform 1](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/wavedrom/w1.png)
- FIFO Operation: Reset -> Write 3 datapacks -> Read 3 datapacks

![Waveform 2](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/wavedrom/w2.png)
- FIFO Operation: Burst write from 00 to 0F and check the full flag (for inserting data FF).

![Waveform 3](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/wavedrom/w3.png)
- FIFO Operation: Read when empty

## Simulation with ModelSim

![Simulation](https://raw.githubusercontent.com/NgoMinhDuc25/FIFO_Synchronous/refs/heads/main/simulation/simulation.png)
- [Full simulation result](https://github.com/NgoMinhDuc25/FIFO_Synchronous/blob/main/simulation/wf.pdf)

## Authors

- [@NgoDuc2505](https://github.com/NgoDuc2505)