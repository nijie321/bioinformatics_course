


function patterntonumber(pattern)
    atgcmap = Dict(
                'A'=>0,
                'C'=>1,
                'G'=>2,
                'T'=>3
                )
    idx = length(pattern) - 1
    num = 0
    
    for val in pattern
        num += (get(atgcmap, val,0) * (4^idx))
        idx -= 1
    end

    return num
end



function computingfrequencies(text, k)
    for i in 0:length(text) - k
        pattern = text[i+1:i+k]
        println("pattern = $pattern")
        j = patterntonumber(pattern)
        println("j = $j")
        frequencyarray[j] += 1
    end
end


data = "ACGCGGCTCTGAAA"
k = 2
# open("dataset_2994_5.txt","r") do io
#     d = split(read(io,String))
#     global data = d[1]
#     global k = parse(Int64, d[2])
# end
frequencyarray = Array{Int64}(undef, 4^k)
for i in 1:length(frequencyarray)
    frequencyarray[i] = 0
end
computingfrequencies(data, k)
# println(frequencyarray)
# println(join(frequencyarray, " "))


println(length(frequencyarray))
# open("myfile.txt","w") do io
#     write(io, join(frequencyarray," "))
# end

