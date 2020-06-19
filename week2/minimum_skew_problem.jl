
min = Inf

function min_skew_with_count(seq)
    countArr = Array{Int64}(undef, length(seq))
    minSkew = 0
    tempArr = Int64[]
    for i in 2:length(seq)
        prevChr = seq[i-1]
        prevCount = countArr[i-1]
        if prevChr == 'G'
            countArr[i] = prevCount + 1
        elseif prevChr == 'C'
            countArr[i] = prevCount - 1
        else
            countArr[i] = prevCount
        end
        if countArr[i] < minSkew
            if length(tempArr) != 0
                tempArr = Int64[]
                push!(tempArr,i)
            else
                push!(tempArr, i)
            end
            minSkew = countArr[i]
        elseif countArr[i] == minSkew
            push!(tempArr, i)
        end
        
            
    end

    return countArr, tempArr
end

# seq = "TAAAGACTGCCGAGAGGCCAACACGAGTGCTAGAACGAGGGGCGTAAACGCGGGTCCGAT"

# countArr, minSkew = min_skew_with_count(seq)
# println(countArr)
# println(minSkew .- 1)

fname = "dataset_7_6.txt"
file = open(fname,"r")

data = split(read(file, String))[1]
close(file)

countArr, minSkew = min_skew_with_count(data)
println(countArr)
println(minSkew .- 1)