library verilog;
use verilog.vl_types.all;
entity FIFO_Memory is
    generic(
        DEPTH           : integer := 16;
        DATA_WIDTH      : integer := 8
    );
    port(
        clk             : in     vl_logic;
        can_write       : in     vl_logic;
        can_read        : in     vl_logic;
        din             : in     vl_logic_vector;
        wr_ptr          : in     vl_logic_vector(3 downto 0);
        rd_ptr          : in     vl_logic_vector(3 downto 0);
        dout            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end FIFO_Memory;
