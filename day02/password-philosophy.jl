#!/bin/env julia
function part1()
    passwords = open(f -> read(f, String), "passwords")
    passwords = split(passwords, "\n")
    pop!(passwords)
    re = r"(\d*)-(\d*) (\w): (\w*)"
    invalid_passwords = []
    for i in range(1, stop = length(passwords))
        password = passwords[i]
        m = match(re, password)
        min = parse(Int, m[1])
        max = parse(Int, m[2])
        restricted_char = m[3][1]
        password_string = m[4]
        count_restricted_chars = length(filter(x -> x == restricted_char,
                                               password_string))
        if count_restricted_chars < min || count_restricted_chars > max
            push!(invalid_passwords, i)
            print("invalid password found: count ", count_restricted_chars,
                  ", min ", min,
                  ", max ", max,
                  ", pw ", password, "\n")
        end
    end
    return length(invalid_passwords)
end
