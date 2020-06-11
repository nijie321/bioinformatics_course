
module numToPat
export numberToPattern

    refDict = Dict(
        0 => "A",
        1 => "C",
        2 => "G",
        3 => "T",
    )

    function numberToPattern(index,k)
        if k == 1
            return get(refDict,index,"")
        end
        prefixIndex = index ÷ 4
        r = index % 4
        symbol = get(refDict, r, "")
        prefixPattern = numberToPattern(prefixIndex, k-1)
        return prefixPattern * symbol
    end

    # output = numberToPattern(5562,11)

end