use std::fs;

fn main() {
    println!("Hello elves!");
    let content = fs::read_to_string("../input")
        .expect("Could not read input!");
    let content = content.trim();
    let content = content.split("\n");
    let content = content.map(|x| -> u32 {x.parse().expect("Could not parse string!")});
    let vec: Vec<u32> = content.collect();
    // let mut it = content.iter();
    // TODO make this work by
    // - iterating over content
    // - using iterators, but then how do I tell parse that I want u32 integers?
    for i in vec.iter() {
        for j in vec.iter() {
            for k in vec.iter() {
                if i + j + k == 2020 {
                    println!("{} * {} * {} = {}", i, j, k, i * j * k);
                    return;
                }
            }
        }
    }
}
