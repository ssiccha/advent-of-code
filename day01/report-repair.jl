#!/bin/env julia
function part1()
    input = open(f -> read(f, String), "input")
    input = split(input)
    input = [parse(Int, x) for x=input]
    for i in input
        for j in input
            if i + j ==  2020
                return [i, j, i* j]
            end
        end
    end
end

function part2()
    input = open(f -> read(f, String), "input")
    input = split(input)
    input = [parse(Int, x) for x=input]
    for i in input
        for j in input
            for k in input
                if i + j + k ==  2020
                    return [i, j, k, i* j * k]
                end
            end
        end
    end
end
