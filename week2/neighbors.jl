

# return all neighbors to pattern with at most d hamming distances

# pseudo code:

# Neighbors(Pattern, d)
# if d = 0
#     return {Pattern}
# if |Pattern| = 1 
#     return {A, C, G, T}
# Neighborhood ← an empty set
# SuffixNeighbors ← Neighbors(Suffix(Pattern), d)
# for each string Text from SuffixNeighbors
#     if HammingDistance(Suffix(Pattern), Text) < d
#         for each nucleotide x
#             add x • Text to Neighborhood
#     else
#         add FirstSymbol(Pattern) • Text to Neighborhood
# return Neighborhood


function hammingdist(seq1::AbstractString, seq2::AbstractString)
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
	

function neighbors(pattern, d)
	nucleotides = ["A", "C", "G", "T"]
   if d == 0
		 return pattern
   end
   
   if length(pattern) == 1
		 return nucleotides
   end

	 neighborhood = Array{String,1}()
   
	 suffix = pattern[2:end]
	 suffixneighbors = neighbors(suffix, d)
	 
	 for text in suffixneighbors
		 if hammingdist(suffix, text) < d
			 for nucleotide in nucleotides
				 push!(neighborhood, nucleotide * text)
			 end
		 
		 elseif hammingdist(suffix, text) == d
			 push!(neighborhood, pattern[1] * text)
		 end
	 end

	 return neighborhood
end


pattern = "ACG"
d = 1

pattern = ARGS[1]
d = parse(Int64, ARGS[2])

nneighbors = neighbors(pattern, d)
println(nneighbors)
println(join(nneighbors, " "))




