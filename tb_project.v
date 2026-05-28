`timescale 1ns / 1ps

module tb_project();
    // Inputs to Design
    reg clk;
    reg rst;
    reg reg_write;
    reg [1:0] read_reg1;
    reg [1:0] read_reg2;
    reg [1:0] write_reg;
    reg [7:0] write_data;
    reg [1:0] opcode;

    // Outputs from Design
    wire [7:0] read_data1;
    wire [7:0] read_data2;
    wire [7:0] alu_result;
    wire zero_flag;

    // 1. Instantiate Register File
    reg_file UUT_reg (
        .clk(clk),
        .rst(rst),
        .reg_write(reg_write),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // 2. Instantiate ALU (Wiring Reg File outputs directly to ALU inputs)
    alu UUT_alu (
        .A(read_data1),
        .B(read_data2),
        .opcode(opcode),
        .result(alu_result),
        .zero(zero_flag)
    );

    // Clock Generation (20ns period -> 50MHz)
    always #10 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        reg_write = 0;
        read_reg1 = 0;
        read_reg2 = 0;
        write_reg = 0;
        write_data = 0;
        opcode = 0;

        #20;
        rst = 0; // Release Reset

        // STEP 1: Write 10 into Register 1 (R1)
        @(posedge clk);
        reg_write = 1;
        write_reg = 2'b01; // Target R1
        write_data = 8'd10; // Data = 10

        // STEP 2: Write 5 into Register 2 (R2)
        @(posedge clk);
        write_reg = 2'b10; // Target R2
        write_data = 8'd5;  // Data = 5

        // STEP 3: Stop Writing & Read both R1 and R2 to feed ALU
        @(posedge clk);
        reg_write = 0;     // Disable writing
        read_reg1 = 2'b01; // Read R1 (Outputs 10)
        read_reg2 = 2'b10; // Read R2 (Outputs 5)
        
        // Test ADD Operation (Expected alu_result = 15)
        opcode = 2'b00; 
        
        // Test SUB Operation (Expected alu_result = 5)
        #20;
        opcode = 2'b01; 

        // Test AND Operation (Expected alu_result = 0)
        #20;
        opcode = 2'b10; 

        #40;
        $stop; // Simulation pause karega waveform dekhne ke liye
    end
endmodule
