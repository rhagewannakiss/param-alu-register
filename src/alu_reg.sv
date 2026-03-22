module alu_register #(
    parameter WIDTH = 8
) (
    input wire         clk_i,
    input wire         arstn_i,
    input wire         valid_i,
    input [WIDTH-1:0]  first_i,
    input [WIDTH-1:0]  second_i,
    input [1:0]        opcode_i,
    output reg         valid_o,
    output [WIDTH-1:0] result_o
);

    reg [WIDTH-1:0] alu_out;
    reg [WIDTH-1:0] result_reg;

    always @(*) begin
        case (opcode_i)
            2'b00: alu_out = first_i + second_i;
            2'b01: alu_out = ~(first_i & second_i);
            2'b10: alu_out = second_i <<< first_i;
            2'b11: alu_out = {{WIDTH-1{1'b0}}, (second_i != first_i)};
            default: alu_out = {WIDTH{1'b0}};
        endcase
    end

    always @(posedge clk_i)
    begin
        if (valid_i)
            result_reg <= alu_out;
    end

    always @(posedge clk_i or negedge arstn_i)
    begin
        if (!arstn_i)
            valid_o <= 1'b0;
        else
            valid_o <= valid_i;
    end

    assign result_o = result_reg;

endmodule