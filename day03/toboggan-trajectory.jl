parse = function()
    MAP = open("tree-map") do x
        split(strip(read(x, String)), "\n")
    end
end

trajectory = function()
    MAP = parse()
    HORIZONTAL_MODULUS = length(MAP[1])
    slope_down = 1
    slope_right = 3
    horizontal = 1
    count_trees = 0
    for vertical in range(1, step = slope_down, stop = length(MAP))
        if MAP[vertical][(horizontal - 1) % HORIZONTAL_MODULUS + 1] == '#'
            count_trees += 1
        end
        horizontal += slope_right
    end
    return count_trees
end
