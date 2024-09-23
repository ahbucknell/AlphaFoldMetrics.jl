# AlphaFoldMetrics

[![Build Status](https://github.com/ahbucknell/AlphaFoldMetrics.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ahbucknell/AlphaFoldMetrics.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Description
A simple package to generate AlphaFold3 metadata plots quickly, focusing on Predicted Aligned Error (PAE) plots.

## Getting started
### Installation
Currently this package is not listed within the Julia package registry and, as such, cannot be installed via `Pkg.jl`. For now, please use the following command within the Julia REPL to install:
```jl
using Pkg; Pkg.add(url="https://github.com/ahbucknell/AlphaFoldMetrics.jl")
```
## Roadmap
- [x] Plot single chain PAE plots
- [x] Plot multichain PAE plots
- [ ] Add formatting customisations
