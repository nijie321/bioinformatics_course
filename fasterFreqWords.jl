
include("./exercise_1_4.jl")
using .freqWordFinder

# println(findkmer)

function fasterFrequentWords(text,k)
    freqPattern = Set()
    freqArr = computingFrequencies(text,k)
    maxCount = max(freqArr...)
    for i in 1:4^k
        if freqArr[i] == maxCount
            pattern = numberToPattern(i, k)
            push!(freqPattern, pattern)
        end
    end
    return freqPattern
end

fname = "dataset_2994_5.txt"
file = open(fname,"r")
data = split(read(file, String))
text = data[1]
k = parse(Int, data[2])
close(file)
# text = "ACGCGGCTCTGAAA"
# k = 2

freqPattern = fasterFrequentWords(text, k)

println(freqPattern)


