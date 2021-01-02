password_philosophy = function(part)
    if !(part in [1, 2])
        error("wrong part")
    end
    passwords = open(f -> read(f, String), "passwords")
    passwords = split(passwords, "\n")
    pop!(passwords)
    re = r"(\d*)-(\d*) (\w): (\w*)"
    valid_passwords = []
    for i in range(1, stop = length(passwords))
        password = passwords[i]
        m = match(re, password)
        min = parse(Int, m[1])
        max = parse(Int, m[2])
        restricted_char = m[3][1]
        password_string = m[4]
        if part == 1
            pw_criterium = part1
        else part == 2
            pw_criterium = part2
        end
        if pw_criterium(min, max, restricted_char, password_string)
            push!(valid_passwords, i)
        end
    end
    return length(valid_passwords)
end

part1 = function(min, max, restricted_char, password_string)
    count_restricted_chars = length(filter(x -> x == restricted_char,
                                           password_string))
    print("valid pw: ", restricted_char,
          ", ", min,
          " < ", count_restricted_chars,
          " < ", max,
          ", pw ", password_string, "\n")
    return (count_restricted_chars < min || count_restricted_chars > max)
end

part2 = function (min, max, restricted_char, password_string)
    return xor(password_string[min] == restricted_char,
           password_string[max] == restricted_char)
end
