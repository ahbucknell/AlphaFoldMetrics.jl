# Contains functions relating to data processing
function validateJSON(path::String)
    jsonData = JSON.parsefile(path)
    if !(haskey(jsonData, "pae"))
        throw("Key 'pae' cannot be found within $path")
    end
end