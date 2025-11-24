library verilog;
use verilog.vl_types.all;
entity FIFO_Read_Pointer is
    generic(
        ADDR_WIDTH      : integer := 4
    );
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        rd_en           : in     vl_logic;
        f_empty         : in     vl_logic;
        rd_ptr          : out    vl_logic_vector;
        can_read        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end FIFO_Read_Pointer;
