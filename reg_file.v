module reg_file(
    input clk,                    // System Clock
    input rst,                    // Active-High Reset
    input reg_write,              // Write Enable Control Signal
    input [1:0] read_reg1,        // 2-bit Address for Register to read 1
    input [1:0] read_reg2,        // 2-bit Address for Register to read 2
    input [1:0] write_reg,       // 2-bit Address for Register to write into
    input [7:0] write_data,       // 8-bit Data to be written
    output [7:0] read_data1,      // 8-bit Output Data 1
    output [7:0] read_data2       // 8-bit Output Data 2
);

    // Array definition: 4 Registers, each of 8-bit width
    reg [7:0] memory_array [3:0]; 

    // Asynchronous Read Logic (Instant output using continuous assignment)
    assign read_data1 = memory_array[read_reg1];
    assign read_data2 = memory_array[read_reg2];

    // Synchronous Write Logic (Clock dependent)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset state: Clear all registers to zero
            memory_array[0] <= 8'b0;
            memory_array[1] <= 8'b0;
            memory_array[2] <= 8'b0;
            memory_array[3] <= 8'b0;
        end 
        else if (reg_write) begin
            // Write only if write enable signal is active
            memory_array[write_reg] <= write_data;
        end
    end
endmodule
