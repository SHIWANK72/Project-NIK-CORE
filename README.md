# 8-Bit RISC Processor - FPGA Implementation

A fully functional 8-bit RISC processor designed from scratch using **Verilog HDL**. This project follows the complete hardware design lifecycle, from architectural specification and RTL design to synthesis, timing analysis, and physical implementation on an **Intel Cyclone V FPGA (DE1-SoC)**.

## Project Overview
This processor features a custom 4-stage data flow architecture capable of executing a defined Instruction Set Architecture (ISA). It was designed to demonstrate high-level digital logic design and timing closure on FPGA hardware.

## Key Features
* **Custom ISA:** Designed for efficient 8-bit instruction processing.
* **Architecture:** Includes a Program Counter (PC), Instruction ROM, Control Unit, Register File, and ALU.
* **Verification:** Fully verified through functional simulation using Questa/ModelSim.
* **Implementation:** Synthesized and mapped to physical hardware pins on the Intel Cyclone V device.

## Design Flow
1. **RTL Design:** Developed modular Verilog code for all processor components.
2. **Functional Simulation:** Validated logic correctness using a custom testbench in Questa.
3. **Synthesis & Timing:** Performed logic synthesis in Intel Quartus Prime; achieved successful timing closure with positive setup/hold slack.
4. **FPGA Mapping:** Assigned physical pins (Clock, Reset, LEDs) and generated `.sof` bitstream for hardware deployment.

## Hardware Summary
* **Target Device:** Intel Cyclone V (5CSEMA5F31C6)
* **EDA Tools:** Intel Quartus Prime Lite Edition
* **Simulation:** Questa/ModelSim

## Repository Structure
* `/Phase_2_Full_ISA`: Contains Quartus project files, SDC constraints, and netlist reports.
* `/*.v`: Verilog source files for the processor modules.
* `/docs`: Contains architectural diagrams, waveform results, and pin planning documentation.

---
**Developed by:** Shiwank Gupta
*Electronics and Communication Engineer*
