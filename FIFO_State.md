# Entity: FIFO_State 
- **File**: rtl/FIFO_State.sv

## Diagram
![Diagram](public/FIFO_State.svg "Diagram")
## Generics

| Generic name | Type | Value | Description |
| ------------ | ---- | ----- | ----------- |
| ADDR_WIDTH   | Parameter     | 4     | Address width            |

## Ports

| Port name | Direction | Type                  | Description |
| --------- | --------- | --------------------- | ----------- |
| clk       | input     | wire                  | Clock            |
| n_rst     | input     | wire                  | Negative reset            |
| can_write | input     | wire                  | Verify writing operation.            |
| can_read  | input     | wire                  | Verify reading operation.            |
| wr_ptr    | input     | wire [ADDR_WIDTH-1:0] | Write pointer            |
| rd_ptr    | input     | wire [ADDR_WIDTH-1:0] | Read pointer            |
| f_full    | output    |                       | Full Flag Status            |
| f_empty   | output    |                       | Empty Flag Status            |