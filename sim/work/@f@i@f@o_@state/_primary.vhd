library verilog;
use verilog.vl_types.all;
entity FIFO_State is
    generic(
        ADDR_WIDTH      : integer := 4
    );
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        can_write       : in     vl_logic;
        can_read        : in     vl_logic;
        wr_ptr          : in     vl_logic_vector;
        rd_ptr          : in     vl_logic_vector;
        f_full          : out    vl_logic;
        f_empty         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end FIFO_State;
