`timescale 1ns/1ps

module alu_register_tb;
    parameter WIDTH = 8;

    reg              clk = 1'b0;
    reg              arstn;
    reg              valid_i;
    reg [WIDTH-1:0]  first;
    reg [WIDTH-1:0]  second;
    reg [1:0]        opcode;
    wire             valid_o;
    wire [WIDTH-1:0] result;

    alu_register #(.WIDTH(WIDTH)) dut (
        .clk_i(clk),
        .arstn_i(arstn),
        .valid_i(valid_i),
        .first_i(first),
        .second_i(second),
        .opcode_i(opcode),
        .valid_o(valid_o),
        .result_o(result)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("alu_reg.vcd");
        $dumpvars(0, alu_register_tb);
    end

    initial begin
        clk     = 1'b0;
        arstn   = 1'b0;
        valid_i = 1'b0;
        first   = 0;
        second  = 0;
        opcode  = 0;

        #20;
        arstn = 1'b1;
        #10;

        opcode  = 2'b00;
        first   = 8'h12;
        second  = 8'h34;
        valid_i = 1'b1;

        #20;
        valid_i = 1'b0;
        #10;

        opcode  = 2'b01;
        first   = 8'b11001100;
        second  = 8'b10101010;
        valid_i = 1'b1;

        #20;
        valid_i = 1'b0;
        #10;

        opcode  = 2'b10;
        first   = 8'd2;
        second  = 8'b10110010;
        valid_i = 1'b1;

        #20;
        valid_i = 1'b0;
        #10;

        opcode  = 2'b11;
        first   = 8'hAA;
        second  = 8'h55;
        valid_i = 1'b1;

        #20;
        valid_i = 1'b0;
        #10;

        first   = 8'hAA;
        second  = 8'hAA;
        valid_i = 1'b1;

        #20;
        valid_i = 1'b0;
        #10;

        opcode  = 2'b00;
        first   = 8'h01;
        second  = 8'h02;
        valid_i = 1'b1;

        #20;
        valid_i = 1'b0;
        #10;

        first  = 8'hFF;
        second = 8'hFF;

        #20;
        #10;

        arstn = 1'b0;
        #20;
        arstn = 1'b1;
        #20;

        $finish;
    end

endmodule