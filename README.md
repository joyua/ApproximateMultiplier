# Approximate Multiplier RTL Design and Evaluation Project

This repository contains RTL implementations, verification scripts, and evaluation results for **four approximate multipliers** — MGER, ATCM, CLAM, and AMER — based on our design and experimental study

---

## 🧠 Project Goals

- Implement four representative approximate multipliers in Verilog
- Analyze architecture-specific design choices (compressors, top-down stages, error recovery)
- Measure functional accuracy (NMED, MRED) using Python testbenches
- Evaluate PPA (Power, Performance, Area) using Vivado and Synopsys DC

---

## 🧩 Implemented Architectures

| Name   | Key Techniques |
|--------|----------------|
| **MGER**  | Top-down block partitioning (High/Mid/Low), 4:2/6:2/8:2 probabilistic compressors |
| **ATCM1** | iCAC + OR-based correction, stage-wise ATC logic |
| **CLAM2** | Significance-Driven Logic Compression (SDLC), XOR-free OR logic |
| **AMER_4b** | Explicit error generation, error vector accumulation + partial correction |

Each architecture is optimized for specific trade-offs between **area, delay, power, and accuracy**.

---

## 🔬 Accuracy Metrics

All 8×8 input combinations (2¹⁶) evaluated for:

- **ED**: Error Distance  
- **MED / NMED**: Mean Error Distance, Normalized  
- **MRED**: Mean Relative Error Distance  
- **PSNR**: Image-based quality (512×512 grayscale test image)

---

## ⚙️ PPA Evaluation Setup

- **Synthesis tools**: Vivado (FPGA), Synopsys Design Compiler (ASIC 40nm)
- **Metrics**:
  - Power (μW), Area (LUT or μm²), Delay (ns)
  - Comparison with Wallace Tree (exact) multiplier

---

## 📊 Key Results Summary

| Structure | MRED ↓ | Power ↓ | Area ↓ | Delay ↓ | PSNR (dB) ↑ |
|-----------|--------|---------|--------|---------|-------------|
| MGER      | ⭐ Best | Mid     | High    | Mid     | 44.19       |
| ATCM1     | Good   | High    | Mid   | Good  | 42.80       |
| CLAM2     | Good   | High    | Low   | Slow    | 42.55       |
| AMER_4b   | Mid    | ⭐ Best | Mid  | ⭐ Best  | 36.17       |

> ✅ Trade-offs observed between error tolerance and hardware efficiency

---

## 📚 Reference

---

## 📚 References

[1] Yi Guo, Heming Sun, Li Guo and Shinji Kimura,  
“Low-Cost Approximate Multiplier Design using Probability-Driven Inexact Compressors,”  
IEEE Asia Pacific Conference on Circuits and Systems (APCCAS), 2018.

[2] Tongxin Yang, Tomoaki Ukezono and Toshinori Sato,  
“Low-Power and High-Speed Approximate Multiplier Design with a Tree Compressor,”  
IEEE 35th International Conference on Computer Design (ICCD), 2017.

[3] Issa Qiqieh, Rishad Shafik, Ghaith Tarawneh, Danil Sokolov and Alex Yakovlev,  
“Energy-Efficient Approximate Multiplier Design using Bit Significance-Driven Logic Compression,”  
Design, Automation and Test in Europe (DATE), 2017.

[4] C. Liu, J. Han, and F. Lombardi,  
“A Low-Power, High-Performance Approximate Multiplier with Configurable Partial Error Recovery,”  
Design, Automation & Test in Europe (DATE), 2014.

[5] J. Liang, J. Han, and F. Lombardi,  
“New Metrics for the Reliability of Approximate and Probabilistic Adders,”  
IEEE Transactions on Computers, vol. 62, no. 9, pp. 1760–1771, 2013.

[6] Z. Yang, J. Han, and F. Lombardi,  
“Approximate Compressors for Error Resilient Multiplier Design,”  
IEEE International Symposium on Defect and Fault Tolerance in VLSI and Nanotechnology Systems (DFTS), pp. 183–186, 2015.


---

## 🧑‍💻 Author

Designed by **Changhyun Jo**, Inha University EE  
Contact: kil0886@naver.com
GitHub: [github.com/joyua](https://github.com/joyua)

> “Exploring architectural design for approximate computing — when efficiency matters more than perfection.”
