include("./exercise_1_4.jl")
using .freqWordFinder

include("numberToPattern.jl")
using .numToPat
function clumpFinding(genome, k, L, t)
    
    frequentPatterns = Set()
    clump = Array{Int64}(undef, 4^k)
    for i in 1:4^k
        clump[i] = 0
    end

    # slide a window of length L across entire genome
    for i in 0: length(genome) - L
        text = genome[i+1:i+L]

        ### SLOW

        # obtain the frequency array for each text of length L
        frequencyArray = computingFrequencies(text, k)
        
        # check if the frequency for each element is at least t and increment clup if so
        for index in 1: 4^k
            if frequencyArray[index] >= t
                clump[index] = 1
            end
        end
    end

    # get the clump with at least frequency t and add them to frequent pattern set
    for i in 1:4^k
        if clump[i] == 1
            pattern = numberToPattern(i-1,k)
            push!(frequentPatterns, pattern)
        end 
    end

    return frequentPatterns
end


function betterClumpFinding(genome, k, t, L)
    frequentPatterns = Set()
    clump = Array{Int64}(undef, 4^k)
    for i in 1:4^k
        clump[i] = 0
    end

    
    text = genome[1:L]
    frequencyArray = computingFrequencies(text, k)
    # initialize a frequency array
    for i in 1:4^k
        if frequencyArray[i] >= t
            clump[i] = 1
        end
    end

    # don't need to explicitly slide window length L through entire genome
    for i in 2:length(genome) - L
        firstPattern = genome[i-1:i-1+k]
        println("firstPattern = $firstPattern")
        index = patternToNumber(firstPattern)
        println("first index= $index")
        frequencyArray[index] = frequencyArray[index] - 1
        lastPattern = genome[i+L-k:i+L+k]
        println("lastPattern = $lastPattern")
        index = patternToNumber(lastPattern)
        println("last index = $index")
        frequencyArray[index] = frequencyArray[index] + 1
        
        if frequencyArray[index] >= t
            clump[index] = 1
        end
    end

    for i in 1:4^k
        if clump[i] == 1
            pattern = numberToPattern(i-1, k)
            push!(frequentPatterns, pattern)
        end
    end

    return frequentPatterns
end

genome = "AAGCAAAGGTGGGC"
k = 2
t = 3
L = 13
clump = clumpFinding(genome, k,L,t)
println(clump)


betterClump = betterClumpFinding(genome,k,t,L)
println(betterClump)