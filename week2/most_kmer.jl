
include("./hamming_distance_iterative.jl")
using .hammingDistIterative

function find_approximate_loc(pattern::T, text::T, d::Int64) where {T <: AbstractString}
    patternLen = length(pattern)
    pos = Int64[]

    for i in 0:length(text) - patternLen
        seq2 = text[i+1:i+patternLen]
        try 
            distance = calc_hamming_dist(pattern, seq2)
            if distance <= d
                push!(pos, i)
            end
        catch e
            println(e)
        end

    end

    return pos
end



fname = "dataset_9_7.txt"
file = open(fname, "r")
data = split(read(file, String))
close(file)
seq = String(data[1])
k = parse(Int64, data[2])
d = parse(Int64, data[3])

patterns = Array{String, 1}(undef,length(seq) - k +1)
patterns = Dict{String, Integer}()

for i in 0:length(seq)-k
    pattern = seq[i+1:i+k]
    patterns[pattern] = 0
end

posDict = Dict(pos => 0 for pos in keys(patterns))

for pattern in keys(patterns)
   pos = find_approximate_loc(pattern,seq,d) 
   posDict[pattern] = length(pos)
end

println(findmax(posDict))

