library verilog;
use verilog.vl_types.all;
entity FIFO_Write_Pointer is
    generic(
        ADDR_WIDTH      : integer := 4
    );
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        wr_en           : in     vl_logic;
        f_full          : in     vl_logic;
        wr_ptr          : out    vl_logic_vector;
        can_write       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end FIFO_Write_Pointer;
