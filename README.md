# 🚢 Network Optimization — Liner Shipping Project

![Julia](https://img.shields.io/badge/Julia-9558B2?style=for-the-badge&logo=julia&logoColor=white)
![Optimization](https://img.shields.io/badge/Operations%20Research-Network%20Optimization-blue?style=for-the-badge)
![DTU](https://img.shields.io/badge/DTU-42115%20Network%20Optimization-red?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=for-the-badge)

> **Course project for 42115 Network Optimization at DTU (2022)**  
> Modelling and solving cargo flow problems in a Mediterranean liner shipping network using JuMP + GLPK in Julia.

---

## 📦 The Problem

Containerized shipping is one of the most important logistics innovations of the modern era. This project explores how **network optimization models** can be applied to real-world liner shipping scenarios using the **MEDITLINE** instance — a small Mediterranean shipping network connecting five ports:

| Code | Port |
|------|------|
| `A` | Alexandria |
| `B` | Barcelona |
| `C` | Casablanca |
| `D` | Dubrovnik |
| `E` | Ephesus |

The network is a weighted directed graph `G = (V, E, c, u)` where each edge has a **cost per TEU** and a **capacity in TEU**.

```
        8/14
    A ──────── B
    │  1/2  2/3│
7/16│           │7/13
    │  1/2  2/10│
    E ──────── D ──── C
         1/8       8/9
```
*(edge format: cost / capacity)*

---

## 🗂️ Repository Structure

```
📁 network-opt-repo/
├── 📄 README.md                    ← You are here
├── 📁 code/                        ← Julia source files (JuMP + GLPK)
│   ├── question_11_code.jl         ← Multi-commodity IP formulation
│   ├── question_12_code.jl         ← Multi-commodity LP relaxation
│   ├── question_16_code.jl         ← Integer programming (IP) model
│   ├── question_17_code.jl         ← Linear programming (LP) relaxation
│   └── question_16_scratch.jl      ← Min-cost flow scratch formulation
├── 📁 docs/                        ← Project PDFs & written solutions
│   ├── NetOpt-project22.pdf        ← Original project assignment (DTU)
│   ├── Network_Optimization_Project.pdf ← Full group solution report
│   ├── question_5.pdf              ← Max-flow writeup
│   ├── question_6_1.pdf            ← Ford-Fulkerson step 1
│   ├── question_6_2.pdf            ← Ford-Fulkerson step 2
│   ├── question_6_3.pdf            ← Ford-Fulkerson step 3
│   └── super_source_and_sink.pdf   ← Super source/sink construction
└── 📁 diagrams/
    └── MEDITLINE_network.drawio    ← Editable network diagram
```

---

## 🧩 Project Parts & Methods

### Part 1 — 🗺️ Cheapest Route (Questions 1–4)
Finding the cheapest path for a container of size `w` TEU from source `s` to destination `t`.

- **Method:** Modified Bellman-Ford algorithm (edges with capacity `< w` are removed; costs multiplied by `w`)
- **Result:** For a 40ft high-cube container (`w=4`) from E→D: **cost = 68**, path `E→A→B→D`
- **Extension:** Resource-constrained shortest path for max-hop constraints

### Part 2 — 🔍 Bottleneck Analysis (Questions 5–8)
Finding the maximum flow from a region S to a region T.

- **Method:** Ford-Fulkerson max-flow with super source/sink construction
- **Result:** Max flow from `{A,D}` → `{B,C,E}` = **40 TEU** (over 6 augmenting path steps)
- **Extension:** Edge-disjoint path counting for supply security analysis

### Part 3 — 📦 Empty Container Repositioning (Questions 9–10)
Repositioning surplus empty containers across ports to meet demand at minimum cost.

- **Modelled as:** Minimum cost flow problem
- **Surpluses:** A=+7, B=−6, C=−5, D=0, E=+4

### Part 4 — 🌐 Multi-Commodity Flow (Questions 11–17)
Routing multiple container types (1, 2, and 4 TEU) simultaneously with shared edge capacities.

- **IP formulation** (`question_11_code.jl`, `question_16_code.jl`): Integer variables, exact solution
- **LP relaxation** (`question_12_code.jl`, `question_17_code.jl`): Continuous variables, lower bound
- **Solver:** GLPK via JuMP

---

## 🚀 Running the Code

### Prerequisites
```julia
] add JuMP GLPK
```

### Run a model
```bash
julia code/question_16_code.jl
```

Each script outputs the **optimal objective value** and **decision variable values** directly to the terminal.

---

## 👥 Authors

| Name | Student ID |
|------|-----------|
| Teresa Christine Goldenits | s222604 |
| Ifigeneia Tziola | s222569 |
| Stefanie Patricia Freymann | s221641 |

*Submitted: 4 December 2022 — DTU Course 42115 Network Optimization*

---

## 📚 References

- D. Pisinger, *Project Assignment: Flowing containers in a liner shipping network*, DTU 2022
- Khan, *NP-hardness of weighted multicommodity flow*, 2000
- JuMP.jl documentation: https://jump.dev
