`include "FIFO.sv"
`timescale 1ns / 1ps

module FIFO_2_tb;

  // ----- Thông số Testbench -----
  parameter DEPTH = 16;
  parameter ADDR_WIDTH = 4;
  parameter DATA_WIDTH = 8;
  parameter CLK_PERIOD = 10; // 10ns = 100MHz
  integer i;
  // ----- Tín hiệu kết nối đến DUT (Device Under Test) -----
  // Inputs (dùng reg)
  reg clk;
  reg n_rst; // Lưu ý: Module của bạn dùng active-low reset
  reg wr_en;
  reg rd_en;
  reg [DATA_WIDTH-1:0] din;

  // Outputs (dùng wire)
  wire [DATA_WIDTH-1:0] dout;
  wire f_full;
  wire f_empty;

  // ----- Khởi tạo DUT -----
  FIFO #(
         .DEPTH(DEPTH),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DATA_WIDTH(DATA_WIDTH)
       ) uut (
         .clk(clk),
         .n_rst(n_rst),
         .wr_en(wr_en),
         .rd_en(rd_en),
         .din(din),
         .dout(dout),
         .f_full(f_full),
         .f_empty(f_empty)
       );

  // ----- Tạo Clock -----
  initial
  begin
    clk = 0;
    // Lặp vô hạn để tạo clock
    forever
      #(CLK_PERIOD / 2) clk = ~clk;
  end

  // ----- Tác vụ (Tasks) tiện ích -----

  // Tác vụ Reset (Active-low)
  task reset_fifo;
    begin
      $display("T=%0t [RESET] Bat dau Reset (active-low)...", $time);
      n_rst = 0; // Kích hoạt reset
      wr_en = 0;
      rd_en = 0;
      din = 8'h00;
      repeat(3) @(posedge clk); // Giữ reset 3 chu kỳ
      n_rst = 1; // Nhả reset
      @(posedge clk);
      $display("T=%0t [RESET] Hoan thanh Reset. FIFO nen o trang thai Empty.", $time);
    end
  endtask

  // Tác vụ Ghi (Write)
  task write_fifo;
    input [DATA_WIDTH-1:0] data_in;
    begin
      @(posedge clk);
      wr_en = 1;
      rd_en = 0;
      din = data_in;
      $display("T=%0t [WRITE] Ghi du lieu: 0x%h (Full=%b)", $time, data_in, f_full);
      @(posedge clk);
      wr_en = 0;
      din = 8'hzz; // Thả nổi bus data_in
    end
  endtask

  // Tác vụ Đọc (Read)
  task read_fifo;
    begin
      @(posedge clk);
      wr_en = 0;
      rd_en = 1;
      $display("T=%0t [READ]  Yeu cau doc... (Empty=%b)", $time, f_empty);
      @(posedge clk); // Đợi 1 chu kỳ cho dữ liệu ra
      rd_en = 0;
      $display("T=%0t [READ]  Du lieu doc ra: 0x%h", $time, dout);
    end
  endtask

  // ----- Kịch bản Test chính -----
  initial
  begin
    // ** SỬA LỖI: Khai báo 'integer i' ở đầu khối initial **


    // 1. Khởi tạo và Reset
    reset_fifo;

    // Kiểm tra ban đầu: FIFO phải rỗng
    @(posedge clk); // Đợi 1 chu kỳ để tín hiệu ổn định sau reset
    if (f_empty !== 1)
    begin
      $display("T=%0t [=============ERROR] FIFO khong rong sau reset! (f_empty = %b)", $time, f_empty);
    end

    // --------------------------------------------------
    // Trường hợp 1 & 2: Ghi và Đọc cơ bản
    // --------------------------------------------------
    $display("\n--- Kiem tra 1: GHI va DOC co ban ---");
    write_fifo(8'hAA); // Ghi
    write_fifo(8'hBB); // Ghi
    write_fifo(8'hCC); // Ghi

    @(posedge clk);
    if (f_empty)
      $display("T=%0t [=============ERROR] FIFO van rong sau khi ghi!", $time);

    read_fifo; // Đọc (mong đợi AA)
    read_fifo; // Đọc (mong đợi BB)
    read_fifo; // Đọc (mong đợi CC)

    @(posedge clk);
    if (f_empty !== 1)
      $display("T=%0t [=============ERROR] FIFO khong rong sau khi doc het!", $time);
    else
      $display("T=%0t [INFO] FIFO da bao rong sau khi doc het.", $time);


    // --------------------------------------------------
    // Trường hợp 3: Đọc khi FIFO đang Rỗng (Read when Empty)
    // --------------------------------------------------
    $display("\n--- Kiem tra 2: DOC khi RONG ---");
    $display("T=%0t [INFO] FIFO dang rong. Thu doc...", $time);

    read_fifo; // Cố gắng đọc

    @(posedge clk);
    if (f_empty !== 1)
      $display("T=%0t [=============ERROR] Co 'empty' bi xoa khi doc luc rong!", $time);
    $display("T=%0t [INFO] Kiem tra doc khi rong: OK (empty flag van = 1)", $time);

    // --------------------------------------------------
    // Trường hợp 4: Ghi khi FIFO đang Đầy (Write when Full)
    // --------------------------------------------------
    $display("\n--- Kiem tra 3: GHI khi DAY ---");
    $display("T=%0t [INFO] Bat dau lap day FIFO (Depth=16)...", $time);

    // Lấp đầy FIFO
    // ** SỬA LỖI: Xóa 'integer' khỏi khai báo vòng lặp 'for' **
    for (i = 0; i < DEPTH; i = i + 1)
    begin
      write_fifo(i[DATA_WIDTH-1:0]);
    end

    // Kiểm tra xem FIFO đã báo đầy chưa
    @(posedge clk);
    if (f_full !== 1)
      $display("T=%0t [=============ERROR] FIFO khong bao day sau %0d lan ghi!", $time, DEPTH);
    else
      $display("T=%0t [INFO] FIFO da bao day (full flag = 1).", $time);

    // Cố gắng ghi thêm 1 giá trị (8'hFF) khi đã đầy
    $display("T=%0t [INFO] FIFO da day. Thu ghi tran...", $time);
    write_fifo(8'hFF); // Lệnh ghi này phải bị FIFO bỏ qua

    @(posedge clk);
    if (f_full !== 1)
      $display("T=%0t [=============ERROR] Co 'full' bi xoa khi ghi luc day!", $time);

    // Đọc phần tử đầu tiên ra để kiểm tra
    $display("T=%0t [INFO] Doc phan tu dau tien de kiem tra ghi tran...", $time);
    read_fifo; // Mong đợi đọc ra 0x00

    $display("\n--- Tat ca kiem tra hoan tat ---");
    repeat(10) @(posedge clk);
    $finish; // Kết thúc mô phỏng
  end

  // (Tùy chọn) Monitor để theo dõi tín hiệu
  // initial begin
  //     $monitor("T=%0t [MONITOR] clk=%b, n_rst=%b, wr=%b, rd=%b, din=0x%h, dout=0x%h, full=%b, empty=%b",
  //              $time, clk, n_rst, wr_en, rd_en, din, dout, f_full, f_empty);
  // end

endmodule
