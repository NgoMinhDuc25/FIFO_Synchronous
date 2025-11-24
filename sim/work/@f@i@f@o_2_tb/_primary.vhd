library verilog;
use verilog.vl_types.all;
entity FIFO_2_tb is
    generic(
        DEPTH           : integer := 16;
        ADDR_WIDTH      : integer := 4;
        DATA_WIDTH      : integer := 8;
        CLK_PERIOD      : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
end FIFO_2_tb;
