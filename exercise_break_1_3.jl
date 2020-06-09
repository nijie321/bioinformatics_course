


open(f -> read(f, String), "Vibrio_cholerae.txt")


io = open("Vibrio_cholerae.txt", "r")

data = strip(read(io, String))
close(io)


function pattern_count(text, pattern)
    k_len = length(pattern)
    limit = length(text) - k_len
    positions = []
    println("limit $limit")
    println("k_len $k_len")
    for i in 1:limit
        # println(text[i:i+k_len])
        # println(text[i:i+k_len])
        if text[i:i+k_len-1] == pattern
            # print("inside if")
            push!(positions, i-1)
        end
    end

    return positions
end

# print(data)
# print(pattern_count(data, "CTTGATCAT"))


print(join(pattern_count(data,"CTTGATCAT")," "))
