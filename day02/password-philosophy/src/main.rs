use std::fs;
use regex::Regex;

fn main() {
    println!("Hello! Welcome to North Pole Toboggan Rental Shop. :-)");
    let passwords = fs::read_to_string("../passwords")
        .expect("Could not read file ../passwords");
    let passwords: Vec<_> = passwords.trim().split("\n").collect();
    let re = Regex::new(r"^(\d*)-(\d*) (\w): (.*)").unwrap();
    let mut invalid_passwords: Vec<usize> = Vec::new();
    for (i, password) in passwords.iter().enumerate() {
        for cap in re.captures_iter(password) {
            let min: usize = cap[1].parse().expect("couldn't parse first capture");
            let max: usize = cap[2].parse().expect("couldn't parse second capture");
            let restricted_char = &cap[3].chars().nth(0)
                .expect("invalid restricted_char");
            let pw_string = &cap[4];
            let count_restricted_chars =  pw_string.chars()
                .filter(|c| c == restricted_char)
                .count();
            if (count_restricted_chars < min) | (count_restricted_chars > max) {
                invalid_passwords.push(i);
                println!("invalid pw found: count {}, pw {}",
                         count_restricted_chars, password);
            }
        }
    }
    println!("number invalid passwords {}", invalid_passwords.len());
}
