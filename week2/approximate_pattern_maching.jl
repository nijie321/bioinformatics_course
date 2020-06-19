include("./hamming_distance_iterative.jl")
using .hammingDistIterative


# find the starting location of the pattern within text
# with at most d hamming distance
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

# pattern = "ATTCTGGA"
# text = "CGCCCGAATCCAGAACGCATTCCCATATTTCGGGACCACTGGCCTCCACGGTACGGACGTCAATCAAAT"
# d = 3
# result = find_approximate_loc(pattern, text, d)
# println(result)


fname = "dataset_9_4.txt"

file = open(fname,"r")

data = split(read(file, String))
close(file)
pattern, text, d = data

result = find_approximate_loc(pattern, text, parse(Int64, d))

open("approximate_pattern_matching.txt", "w") do io
    write(io, join(result, " "))
end
