module AlphaFoldMetrics

import JSON
import CairoMakie


function validateJSON(path::String)
    jsonData = JSON.parsefile(path)
    if !(haskey(jsonData, "pae"))
        throw("Key 'pae' cannot be found within $path")
    end
end

function paeFromJSON(path::String)::Matrix{Float64}
    jsonData = JSON.parsefile(path)
    jsonMx = Base.stack(jsonData["pae"])
    return jsonMx
end

function makeSingleChainPAE(path::String)
    validateJSON(path)
    mx = paeFromJSON(path)
    arrlen = sqrt(length(mx))
    fig = CairoMakie.Figure()
    ax1 = CairoMakie.Axis(fig[1,1], yreversed = true, aspect = 1, xticks = [1,arrlen], yticks = [1,arrlen])
    CairoMakie.heatmap!(ax1, mx, colorrange = (0,30), colormap = CairoMakie.Reverse(:Greens))
    return fig
end

function makeMultiChainPAE(path::String)
    validateJSON(path)
    jsonData = JSON.parsefile(path)
    mx = Base.stack(jsonData["pae"])
    startpoints = Dict{String,Int64}()
    for chain in jsonData["atom_chain_ids"]
        startpoints[chain] = findfirst(x -> x == chain, jsonData["token_chain_ids"])
    end
    div = collect(values(startpoints))
    push!(div, length(jsonData["token_chain_ids"]))
    f = CairoMakie.Figure()
    ax1 = CairoMakie.Axis(f[1,1], xticks = div, yticks = div, aspect = 1)
    CairoMakie.heatmap!(ax1, mx, colorrange = (0,30), colormap = CairoMakie.Reverse(:Greens))
    return f
end

end
