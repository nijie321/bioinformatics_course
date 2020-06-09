module freqWordFinder
export computingFrequencies
export  numberToPattern
function findkmer(str, k, t, unique)
    # unique = Dict()
    # unique1 = Dict()
    for i in 0:length(str) - k
        pattern = str[i+1:i+k]
        # get(unique, pattern, 1)
        if haskey(unique,pattern)
            unique[pattern] += 1
            if unique[pattern] >= t
                unique[pattern] = -1
            end
        else
            unique[pattern] = 1
        end
    end

    # push!(unique,key for (key,val) in unique1 if val >=t)
    # filtered = [push!(unique,key) for (key,val) in unique1 if val >= 4]
end


function solveclumpfinding(str, klt)
    k = klt[1]
    L = klt[2]
    t = klt[3]
    # s = Set()
    s = Dict()
    for i in 1:length(str)-L
        unique_kmer = Dict()
        text = str[i:i+L]
        # println(text)
        findkmer(text,k,t,s)
    end
    println(s)
    println(length(s))
    # println(join(s,", "))
    # println(length(s))
end

# fname = "E_coli.txt"
# file = open(fname, "r")
# data = read(file,String)
# close(file)
# tuple = (9,500,3)
# solveclumpfinding(data, tuple)

refDict = Dict(
    'A' => 0,
    'C' => 1,
    'G' => 2,
    'T' => 3,
)

refDict2 = Dict(
    '0' => "A",
    '1' => "C",
    '2' => "G",
    '3' => "T",
)

function patternToNumber(pattern)
    patternLen = length(pattern) - 1
    total = 0
    for (idx, val) in enumerate(pattern)
        refCode = get(refDict, val, -1)
        total += refCode * (4^patternLen)
        patternLen -= 1
    end
    return total
end

function numberToPattern(index, k)
    remainder = ""
    for i in 1:k
        remainder *= string(index % 4)
        index ÷= 4
    end
    
    k = join([get(refDict2, val, "") for val in remainder], "")
    return reverse(k)
    # println(reverse(k))
    # println(remainder)
end

function computingFrequencies(text, k)
    freqArray = Array{Int64}(undef, 4^k)
    lenFreqArray = length(freqArray)
    for i in 1:lenFreqArray
       freqArray[i] = 0
    end

    for i in 0:length(text) - k
        pattern = text[i+1:i+k]
        j = patternToNumber(pattern)
        # println(freqArray[j])
        freqArray[j+1] += 1
    end
    return freqArray
end


# fname = "dataset_2994_5.txt"
# file = open(fname,"r")
# data = split(read(file, String))
# text = data[1]
# k = parse(Int, data[2])
# close(file)

# freqArr = computingFrequencies(text, k)
# open("myfile.txt", "w") do f
#     write(f, join(freqArr, " "))
# end

end