# NIK-CORE — 8-Bit RISC Processor | RTL to GDS

**Nik-Coronics | Independent R&D Initiative**
**Engineer:** Shiwank Gupta
**GitHub:** github.com/SHIWANK72

---

## 🎯 Project Overview

A fully functional custom **8-bit RISC Processor** designed from scratch in Verilog HDL — taken through the **complete ASIC implementation flow** from RTL to GDS using open-source tools.

```
RTL Design → Simulation → Synthesis → 
Floorplan → Placement → CTS → Routing → GDS ✅
```

This is an end-to-end open-source ASIC flow — targeting **Efabless OpenMPW** for free physical fabrication on Sky130A 130nm process.

---

## ⚙️ Architecture

```
┌─────────────────────────────────────────┐
│           NIK-CORE Processor            │
│                                         │
│  ┌──────┐    ┌──────────┐    ┌───────┐  │
│  │  PC  │───▶│ INST ROM │───▶│  CU   │  │
│  └──────┘    └──────────┘    └───┬───┘  │
│                                  │      │
│  ┌──────────┐              ┌─────▼────┐ │
│  │ REG FILE │◀────────────▶│   ALU    │ │
│  └──────────┘              └──────────┘ │
└─────────────────────────────────────────┘
```

**4-Stage Dataflow:**
```
Fetch → Decode → Execute → Writeback
```

---

## 🔑 Key Features

```
Custom ISA        — Designed for 8-bit instruction processing
Program Counter   — Sequential + branch-capable
Instruction ROM   — Hardcoded instruction memory
Control Unit      — FSM-based decode + control signal generation
Register File     — Multi-register read/write
ALU               — Arithmetic + logical operations
Modular RTL       — Each component independently verifiable
```

---

## 📐 Complete Design Flow

```
1. ARCHITECTURAL SPEC
   ├── Custom ISA definition
   ├── Datapath + control path planning
   └── Blueprint documentation

2. RTL DESIGN (Verilog)
   ├── ALU.v
   ├── control_unit.v
   ├── instruction_mem.v
   ├── pc.v
   ├── reg_file.v
   └── processor_top.v  ← top-level

3. FUNCTIONAL SIMULATION
   ├── Tool: Questa/ModelSim
   ├── Testbench: tb_project.v
   └── Result: All instructions PASS ✅

4. SYNTHESIS + TIMING (FPGA reference)
   ├── Tool: Intel Quartus Prime Lite
   ├── Target: Cyclone V — synthesis reference
   └── Result: Timing closure, positive slack ✅

5. RTL TO GDS — COMPLETE ✅
   ├── Tool: OpenLane 2023.11.03
   ├── PDK: Sky130A (Google/SkyWater 130nm)
   ├── Platform: Google Colab
   ├── Synthesis    → Yosys       ✅
   ├── Floorplan    → OpenROAD    ✅
   ├── Placement    → OpenROAD    ✅
   ├── CTS          → OpenROAD    ✅
   ├── Routing      → TritonRoute ✅ (DRC clean)
   └── GDS          → Magic VLSI  ✅
```

---

## 📊 Physical Design Metrics

```
Technology        : Sky130A — 130nm open-source PDK
Die Area          : 0.00435 mm²
Core Utilization  : 54.87%
Total Cells       : 362
D Flip-Flops      : 8
Wire Length       : 931,138 units
Vias              : 822
Max Frequency     : ~91 MHz
DRC Violations    : 0 (post-routing) ✅
```

---

## 🛠️ Tools Used

| Tool | Purpose | Status |
|------|---------|--------|
| Verilog HDL | RTL Design | ✅ |
| Questa/ModelSim | Functional Simulation | ✅ |
| Intel Quartus Prime | Synthesis reference | ✅ |
| OpenLane 2023.11.03 | RTL to GDS flow | ✅ |
| Sky130A PDK | 130nm process library | ✅ |
| Yosys | Logic Synthesis | ✅ |
| OpenROAD | PnR + CTS | ✅ |
| TritonRoute | Detailed Routing | ✅ |
| Magic VLSI | GDS Generation | ✅ |
| KLayout | GDS Visualization | ✅ |

---

## 📁 Repository Structure

```
Project-NIK-CORE/
├── RTL Sources
│   ├── processor_top.v     ← Top-level integration
│   ├── ALU.v               ← Arithmetic Logic Unit
│   ├── control_unit.v      ← FSM Control Unit
│   ├── instruction_mem.v   ← Instruction ROM
│   ├── pc.v                ← Program Counter
│   └── reg_file.v          ← Register File
│
├── Verification
│   ├── tb_project.v        ← Simulation testbench
│   ├── transcript          ← ModelSim log
│   └── vsim.wlf            ← Waveform file
│
├── Physical Design
│   ├── processor_top.gds   ← Final GDS ✅
│   ├── floorplan.gds       ← Stage 1
│   ├── placement.gds       ← Stage 2
│   ├── cts.gds             ← Stage 3
│   └── metrics.csv         ← Flow metrics
│
├── Documentation
│   ├── BLUEPRINT.png       ← Architecture diagram
│   ├── notes.md            ← RTL to GDS flow notes
│   └── README.md           ← This file
```

---

## 📊 Results Summary

```
Functional Simulation  : All instructions PASS  ✅
Synthesis              : Timing closure achieved ✅
Routing                : 0 DRC violations        ✅
GDS Generation         : Complete                ✅
Die Area               : 0.00435 mm²             ✅
Core Utilization       : 54.87%                  ✅
Max Frequency          : ~91 MHz                 ✅
LVS Signoff            : Pending                 ⬜
Full DRC Signoff       : Pending                 ⬜
Efabless Submission    : Targeting OpenMPW       ⬜
```

---

## 🔭 Next Steps

```
1. Custom SDC — improve timing to 100 MHz
2. Full Magic DRC signoff
3. LVS — netgen verification
4. Efabless OpenMPW submission
   → Free physical fabrication on Sky130A
```

---

## 📬 Connect

Open to RTL/DV/FPGA opportunities, research collaborations,
and mentoring students breaking into chip design.

**Email:** NIKORONICS@proton.me
**GitHub:** github.com/SHIWANK72
**LinkedIn:** linkedin.com/in/guptashiwank

---

*Shiwank Gupta | Independent VLSI Researcher | Nik-Coronics*
