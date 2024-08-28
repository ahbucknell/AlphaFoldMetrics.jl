# Contains all functions relating to Predicted Aligned Error (PAE) plots 
function makeSingleChainPAE(paeMx::Matrix{Float64}, figure, ticks)
    arrlen = sqrt(length(paeMx))
    ax1 = CairoMakie.Axis(figure[1,1], yreversed = true, aspect = 1, xticks = [1,arrlen], yticks = [1,arrlen])
    if !(ticks)
        CairoMakie.hidedecorations!(ax1)
    end
    CairoMakie.heatmap!(ax1, paeMx, colorrange = (0,30), colormap = CairoMakie.Reverse(:Greens))
    return figure
end

function makeMultiChainPAE(paeMx::Matrix{Float64}, json::Dict{String, Any}, figure, ticks)
    startpoints = Dict{String,Int64}()
    for chain in json["atom_chain_ids"]
        startpoints[chain] = findfirst(x -> x == chain, json["token_chain_ids"])
    end
    div = collect(values(startpoints))
    push!(div, length(json["token_chain_ids"]))
    ax1 = CairoMakie.Axis(figure[1,1], xticks = div, yticks = div, aspect = 1)
    if !(ticks)
        CairoMakie.hidedecorations!(ax1)
    end
    CairoMakie.heatmap!(ax1, paeMx, colorrange = (0,30), colormap = CairoMakie.Reverse(:Greens))
    return figure
end

function plotPAE(path::String, figure; ticks::Bool=true)
    validateJSON(path)
    jsonData = JSON.parsefile(path)
    # Below flattens vector of vectors into 2D Matrix{Any}, then converted to Matrix{Float64}
    mx = convert(Matrix{Float64}, Base.stack(jsonData["pae"]))
    numChains = length(unique(jsonData["token_chain_ids"]))
    if numChains > 1
        makeMultiChainPAE(mx, jsonData, figure, ticks)
    else
        makeSingleChainPAE(mx, figure, ticks)
    end
end