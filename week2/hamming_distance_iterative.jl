
module hammingDistIterative
export  calc_hamming_dist

function calc_hamming_dist(seq1::AbstractString, seq2::AbstractString)
   
    if length(seq1) != length(seq2)
        throw(DimensionMismatch("seq1 and seq2 are not of same size."))
    end
    diff = 0
    for i in 1:length(seq1)
        if seq1[i] != seq2[i]
            diff += 1
        end
    end
    
    return diff
end

end


# fname = "dataset_9_3.txt"

# file = open(fname,"r")

# data = split(read(file, String))
# close(file)

# seq1 = data[1]
# seq2 = data[2]

# try 
#     result = calc_hamming_dist(seq1,seq2)
#     println(result)
# catch e
#     println(e)
# end    
