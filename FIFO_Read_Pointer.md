
# Entity: FIFO_Read_Pointer 
- **File**: rtl/FIFO_Read_Pointer.sv

## Diagram
![Diagram](public/FIFO_Read_Pointer.svg "Diagram")
## Generics

| Generic name | Type | Value | Description |
| ------------ | ---- | ----- | ----------- |
| ADDR_WIDTH   | Parameter     | 4     | Address width            |

## Ports

| Port name | Direction | Type             | Description |
| --------- | --------- | ---------------- | ----------- |
| clk       | input     | wire             | Clock            |
| n_rst     | input     | wire             | Negative reset            |
| rd_en     | input     | wire             | Enable read            |
| f_empty   | input     | wire             | Empty Flag Status            |
| rd_ptr    | output    | [ADDR_WIDTH-1:0] | Read pointer            |
| can_read  | output    | wire             | Verify reading operation            |


