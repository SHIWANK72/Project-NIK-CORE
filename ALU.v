module alu(
    input [7:0] A,        // 8-bit Operand 1 (Reg File se aayega)
    input [7:0] B,        // 8-bit Operand 2 (Reg File ya Immediate value)
    input [1:0] opcode,   // 2-bit Control Signal (Decoder se aayega)
    output reg [7:0] result, // 8-bit Final Calculation Output
    output zero           // 1-bit Flag (High agar result 0 hai)
);

    // Continuous assignment: Zero flag hamesha result par nazar rakhega
    assign zero = (result == 8'b0) ? 1'b1 : 1'b0;

    // Combinational Block: Jab bhi A, B ya opcode badlega, yeh execute hoga
    always @(*) begin
        case(opcode)
            2'b00: result = A + B;       // ADD operation
            2'b01: result = A - B;       // SUB operation
            2'b10: result = A & B;       // Bitwise AND operation
            2'b11: result = A;           // LOAD Instruction ke liye pass-through
            default: result = 8'b0;      // Safety net for latch prevention
        endcase
    end
endmodule
