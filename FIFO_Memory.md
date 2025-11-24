# Entity: FIFO_Memory 
- **File**: rtl/FIFO_Memory.sv

## Diagram
![Diagram](public/FIFO_Memory.svg "Diagram")

## Generics

| Generic name | Type           | Value | Description |
| ------------ | ----           | ----- | ----------- |
| DEPTH        | Parameter      | 16    | The number of memory array size.            |
| DATA_WIDTH   | Parameter      | 8     | The size of each memory array.            |

## Ports

| Port name | Direction | Type                  | Description |
| --------- | --------- | --------------------- | ----------- |
| clk       | input     | wire                  | Clock signal            |
| can_write | input     | wire                  | Verify writing operation.            |
| can_read  | input     | wire                  | Verify reading operation.            |
| din       | input     | wire [DATA_WIDTH-1:0] | Data for storing            |
| wr_ptr    | input     | wire [3:0]            | Write pointer            |
| rd_ptr    | input     | wire [3:0]            | Read pointer            |
| dout      | output    | [DATA_WIDTH-1:0]      | Retrieve Data            |

## Memory array register

| Name            | Type                 | Description |
| --------------- | -------------------- | ----------- |
| mem [0:DEPTH-1] | reg [DATA_WIDTH-1:0] | [None]            |