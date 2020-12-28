use std::fs;

fn main() {
    println!("Hello elves!");
    let content = fs::read_to_string("../input")
        .expect("Could not read input!");
    let content = content.trim();
    let content = content.split("\n");
    let content: Vec<u32> = content.map(|x| x.parse().expect("Could not parse string!")).collect();
    // TODO make this work by
    // - iterating over content
    // - using iterators, but then how do I tell parse that I want u32 integers?
    for i in 0..Vec::len(&content) {
        for j in 0..Vec::len(&content) {
            for k in 0..Vec::len(&content) {
                if content[i] + content[j] + content[k] == 2020 {
                    println!("{} * {} * {} = {}", content[i], content[j], content[k], content[i] * content[j] * content[k]);
                    return;
                }
            }
        }
    }
    println!("input content: {:#?}", content);
}
