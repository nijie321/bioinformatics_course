

refDict = Dict(
    'A' => 0,
    'C' => 1,
    'G' => 2,
    'T' => 3,
)

function patternToNumber(pattern)
    if pattern == ""
        return 0
    end
    symbol = pattern[end]
    prefix = pattern[1:end-1]

    return 4 * patternToNumber(prefix) + get(refDict, symbol,0)
end


fname = "dataset_3010_2.txt"
file = open(fname,"r")
data = strip(read(file,String))
close(file)

num = patternToNumber(data)
println(num)