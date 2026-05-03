# 📄 Docs — Project Reports & Working Papers

This folder contains all written materials for the project, including the original assignment and the group's full solution report.

## 📚 Documents

### `NetOpt-project22.pdf` — Original Assignment
The full project brief from DTU course 42115, authored by David Pisinger. Contains all 17 questions, the MEDITLINE network specification, mathematical formulations, and hints.

### `Network_Optimization_Project.pdf` — Group Solution Report
The complete submitted report covering all four project parts:
- Cheapest route (Questions 1–4): Bellman-Ford, resource-constrained shortest path
- Bottleneck analysis (Questions 5–8): Ford-Fulkerson max-flow, edge-disjoint paths
- Empty container repositioning (Questions 9–10): Min-cost flow
- Multi-commodity flow (Questions 11–17): IP/LP formulations, column generation, hub modelling

### `question_5.pdf` — Max-Flow Writeup
Hand-written solution for Question 5, describing the max-flow algorithm choice and super source/sink construction.

### `question_6_1.pdf`, `question_6_2.pdf`, `question_6_3.pdf` — Ford-Fulkerson Steps
Step-by-step hand-drawn augmenting path calculations for Question 6 (max-flow from `{A,D}` to `{B,C,E}`). Shows all 6 augmenting paths reaching a total flow of 40 TEU.

### `super_source_and_sink.pdf` — Super Source/Sink Construction
Diagram and explanation of the graph modification used to convert the multi-source, multi-sink max-flow problem into a standard single-source single-sink form.
