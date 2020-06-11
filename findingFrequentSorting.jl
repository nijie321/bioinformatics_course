include("./exercise_1_4.jl")
using .freqWordFinder

include("numberToPattern.jl")
using .numToPat


function findFreqWordsSorting(text, k)
    freqPatterns = Set()
    size = length(text) - k
    index = Array{Int64}(undef, size+1)
    count = Array{Int64}(undef, size+1)
    for i in 0:size
        pattern = text[i+1:i+k]
        index[i+1] = patternToNumber(pattern)
        count[i+1] = 1
    end

    sort!(index)
    
    for i in 2:size
        if index[i] == index[i-1]
            count[i] = count[i-1] + 1
        end
    end

    # println(count)
    maxCount = max(count...)
    
    for i in 1:size
        if count[i] == maxCount
            pattern = numberToPattern(index[i],k)
            push!(freqPatterns,pattern)
        end
    end
    return freqPatterns
end

text = "AAGCAAAGGTGGG"
k = 2
result = findFreqWordsSorting(text,k)
println(result)
