# NIK-CORE — RTL to GDS Flow Notes

> **Nik-Coronics | Independent R&D Initiative**
> **Engineer:** Shiwank Gupta
> **Date:** July 2026
> **Tool:** OpenLane 2023.11.03 + Sky130A PDK

---

## 🎯 Objective

Take the existing NIK-CORE 8-bit RISC Processor RTL through a complete open-source ASIC implementation flow — Synthesis → Floorplan → Placement → CTS → Routing → GDS — using OpenLane on Google Colab with Sky130A PDK.

---

## 🛠️ Environment Setup

```
Platform  : Google Colab (Linux x86_64)
Tool      : OpenLane 2023.11.03 (litex-hub conda channel)
PDK       : Sky130A (Google/SkyWater 130nm open-source)
Package   : micromamba + conda-based install
            (pip-based OpenLane 2 did not work — 
             binaries missing in Colab environment)

Setup Commands:
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | \
tar -xvj -C /content bin/micromamba

micromamba create -p /content/conda-env \
-c litex-hub -c conda-forge \
openlane=2023.11.03 sky130pdk -y
```

---

## 📐 Flow Summary — Step by Step

```
Step 1  — Synthesis      (Yosys)
          RTL Verilog → Gate-level netlist
          Standard cells mapped from sky130_fd_sc_hd

Step 2  — Floorplanning  (OpenROAD)
          Die area defined
          Power rings + straps placed
          IO pins placed

Step 3  — Placement      (OpenROAD)
          Standard cells placed inside core area
          Legalization done

Step 4  — CTS            (OpenROAD)
          Clock Tree Synthesis
          Clock buffers inserted
          Clock skew minimized

Step 5  — Routing        (OpenROAD + TritonRoute)
          Global routing → Detailed routing
          DRC-clean routing confirmed
          "No DRC violations after detailed routing" ✅

Step 6  — GDS Generation (Magic VLSI)
          Manual stream-out (important order):
          1. gds read sky130_fd_sc_hd.gds  ← standard cells FIRST
          2. lef read merged.lef
          3. def read routing.def
          4. gds write processor_top.gds   ← final output
```

---

## 📊 Design Metrics (from metrics.csv)

```
Die Area          : 0.00435 mm²
Core Utilization  : 54.87%
Total Cells       : 362
D Flip-Flops      : 8
Wire Length       : 931,138 units
Vias              : 822

Timing:
  Clock Period    : 10 ns (100 MHz target)
  Critical Path   : 11.0 ns
  Max Safe Freq   : ~91 MHz
  Slack           : Negative (timing violation)
  Note            : Design meets timing at 91 MHz
                    Custom SDC would improve this
```

---

## 📁 GDS Files Generated

```
4 Stage Progression GDS:
├── floorplan.gds      ← After floorplanning
├── placement.gds      ← After placement
├── cts.gds            ← After clock tree synthesis
└── processor_top.gds  ← Final routed GDS ✅

Visualization:
Tool: KLayout
Layer colors: sky130A.lyp from
github.com/klayoutmatthias/sky130A_el
```

---

## ⚠️ Known Issues + Workarounds

```
Issue 1: Step 27 wire-length QoR check fails
  Error: "No logger installed in odb"
  Cause: Known bug in conda OpenLane build
  Impact: Non-critical — GDS generation not affected
  Status: Ignored ✅

Issue 2: Negative timing slack
  Cause: Default SDC — no custom constraints
  Fix: Custom SDC file with proper clock definition
  Status: Documented — future improvement ⬜

Issue 3: Colab session ephemeral
  Cause: /content wipes on session restart
  Fix: Rerun setup (~15-20 min) on each session
  Workaround: Download GDS immediately after generation
  Status: GDS downloaded locally ✅

Issue 4: LVS not completed
  Cause: netgen .se setup file path not found in PDK
  Status: Pending ⬜

Issue 5: Antenna check
  Cause: Flow did not reach signoff stage
  Status: Pending ⬜
```

---

## 🔑 Key Learnings

```
1. OpenLane conda build (litex-hub) works on Colab
   pip-based OpenLane 2 does NOT work on Colab
   (missing EDA binaries)

2. Magic GDS stream-out order is critical:
   Standard cell GDS MUST be read before DEF
   Wrong order = empty/broken GDS

3. Sky130A = 130nm open-source PDK by Google/SkyWater
   Suitable for educational + research tapeout
   Efabless OpenMPW uses this exact PDK

4. Core utilization 54.87% = good
   (Industry standard: 40-70% is healthy)
   Too high = routing congestion
   Too low = wasted area

5. 8 DFFs = 8 flip-flops in design
   (Register file + PC + pipeline registers)

6. Negative slack = timing violation
   Fix: Either reduce clock frequency (91 MHz)
   Or optimize critical path RTL
   Or add custom SDC constraints
```

---

## 📅 Signoff Status

```
✅ Synthesis          — CLEAN
✅ Floorplan          — COMPLETE
✅ Placement          — COMPLETE
✅ CTS                — COMPLETE
✅ Routing            — DRC CLEAN (0 violations)
✅ GDS Generation     — COMPLETE
⬜ Full Magic DRC      — Pending
⬜ LVS                — Pending
⬜ Antenna Check      — Pending
⬜ Timing (Custom SDC)— Pending
```

---

## 🔭 Next Steps

```
1. Custom SDC file — proper clock constraints
   → Improve timing closure to 100 MHz

2. Full Magic DRC signoff
   → Confirm 0 DRC on final GDS

3. LVS — netgen setup
   → Layout vs Schematic verification

4. Efabless OpenMPW submission
   → Free physical fabrication
   → Real silicon chip

5. LinkedIn post — GDS progression screenshots
```

---

*Shiwank Gupta | Nik-Coronics | VLSI R&D*