# 💻 Code — Julia Optimization Models

All models are implemented in **Julia** using the [JuMP](https://jump.dev) modelling language with the [GLPK](https://www.gnu.org/software/glpk/) solver.

## 📋 Files

### `question_11_code.jl` — Multi-Commodity Integer Program
**Part:** Multi-commodity flow (Part 4)  
**Type:** Integer Programming (IP)  
**Problem:** Routes 3 commodity types (1 TEU, 2 TEU, 4 TEU containers) across a 5-node network simultaneously, respecting shared edge capacities. Uses integer variables `xij_k` representing the number of containers of commodity `k` on edge `(i,j)`.

### `question_12_code.jl` — Multi-Commodity LP Relaxation
**Part:** Multi-commodity flow (Part 4)  
**Type:** Linear Programming (LP)  
**Problem:** Identical formulation to Q11 but with continuous variables — gives the LP lower bound and can be solved faster.

### `question_16_code.jl` — Integer Programming Model
**Part:** Multi-commodity flow, alternative formulation  
**Type:** Integer Programming (IP)  
**Problem:** Models 8 container types (`x1`–`x8`) with resource constraints across 3 capacity groups. Minimises total shipping cost subject to resource usage and coverage constraints.

### `question_17_code.jl` — LP Relaxation of Q16
**Part:** Multi-commodity flow, alternative formulation  
**Type:** Linear Programming (LP)  
**Problem:** Continuous relaxation of `question_16_code.jl`. Useful for comparing IP vs LP objective values (integrality gap analysis).

### `question_16_scratch.jl` — Min-Cost Flow Scratch
**Part:** Min-cost network flow (scratch/draft)  
**Type:** Min-cost flow  
**Problem:** Direct arc-flow formulation for the MEDITLINE network, minimising total cost subject to flow conservation at all nodes.

---

## ▶️ How to Run

```julia
# Install dependencies (only once)
using Pkg
Pkg.add(["JuMP", "GLPK"])

# Run any model
julia question_16_code.jl
```

## 🔧 Dependencies

| Package | Purpose |
|---------|---------|
| `JuMP` | Mathematical modelling interface |
| `GLPK` | Open-source LP/IP solver |
