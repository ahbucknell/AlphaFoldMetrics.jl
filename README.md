# AlphaFoldMetrics

[![Build Status](https://github.com/ahbucknell/AlphaFoldMetrics.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ahbucknell/AlphaFoldMetrics.jl/actions/workflows/CI.yml?query=branch%3Amain)

A WIP package for Julia focusing on exporting data from AlphaFold predictions and quickly making confidence plots.

## Dependencies
- [CairoMakie](https://github.com/MakieOrg/Makie.jl) - generating PAE heatmaps and other plots.
- [JSON](https://github.com/JuliaIO/JSON.jl) - parsing AlphaFold3 and some AlphaFold2 metadata from `.json` files

## Usage

`plotPAE(path)` - plot a single chain or multi-chain PAE plot. Requires JSON file path from AlphaFold prediction.
