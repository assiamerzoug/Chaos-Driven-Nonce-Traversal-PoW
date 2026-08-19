# Chaos-Driven-Nonce-Traversal-PoW

MATLAB implementation and experimental scripts associated with the study **“A Chaos-Driven Nonce Search Mechanism Based on a Modified Tent Map for Proof-of-Work Blockchain Mining.”**

The repository contains the source code and scripts used to conduct the experiments and generate the figures reported in the study.

## Repository Structure

```text
Chaos-Driven-Nonce-Traversal-PoW/
│
├── experiments/
│   ├── ComparativeEvaluation.m
│   ├── ProofOfWorkSimulation.m
│   └── SensitivityComparison.m
│
├── figures/
│   ├── BifurcationDiagramClassicalTentMap.m
│   ├── BifurcationDiagramModifiedTentMap.m
│   ├── HistogramComparative.m
│   └── LargestLyapunovExponentComparison.m
│
├── src/
│   ├── analysis/
│   │   ├── CycleAnalysis.m
│   │   └── TentModified.m
│   │
│   ├── generators/
│   │   ├── ClassicalTentNonce.m
│   │   ├── MTNonce.m
│   │   ├── ModifiedTentNonce.m
│   │   ├── SequentialNonce.m
│   │   └── XorshiftNonce.m
│   │
│   └── mining/
│       ├── CheckDifficulty.m
│       ├── CreateBlockHeader.m
│       ├── DoubleSHA256.m
│       ├── MinePoW.m
│       └── SHA256Hash.m
│
└── README.md
```

## Requirements

* MATLAB R2009a or later
* Java support for SHA-256 computation

## Usage

Run the scripts in the `experiments/` and `figures/` directories to reproduce the corresponding experimental analyses and figures.

For the experiments, the required source directories are added automatically using `addpath`.

## Reproducibility

The repository is provided to support the reproducibility and verification of the experimental results presented in the associated study.

## License

This repository is provided for academic and research purposes.

