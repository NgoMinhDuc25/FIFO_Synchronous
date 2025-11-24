library verilog;
use verilog.vl_types.all;
entity FIFO is
    generic(
        DEPTH           : integer := 16;
        ADDR_WIDTH      : integer := 4;
        DATA_WIDTH      : integer := 8
    );
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        wr_en           : in     vl_logic;
        rd_en           : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        dout            : out    vl_logic_vector(7 downto 0);
        f_full          : out    vl_logic;
        f_empty         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end FIFO;
