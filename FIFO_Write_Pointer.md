
# Entity: FIFO_Write_Pointer 
- **File**: rtl/FIFO_Write_Pointer.sv

## Diagram
![Diagram](public/FIFO_Write_Pointer.svg "Diagram")
## Generics

| Generic name | Type | Value | Description |
| ------------ | ---- | ----- | ----------- |
| ADDR_WIDTH   | Parameter     | 4     | Address width            |

## Ports

| Port name | Direction | Type             | Description |
| --------- | --------- | ---------------- | ----------- |
| clk       | input     | wire             | Clock            |
| n_rst     | input     | wire             | Negative reset            |
| wr_en     | input     | wire             | Enable write            |
| f_full    | input     | wire             | Full Flag Status            |
| wr_ptr    | output    | [ADDR_WIDTH-1:0] | Write pointer            |
| can_write | output    | wire             | Verify writing operation.            |


