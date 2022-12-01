use std::fs;

fn main() {
    let contents = fs::read_to_string("input")
        .expect("Should be able to read file");
//    println!("{contents}");
   
    let mut sum = 0;
    let mut highest = 0;

    for i in contents.split("\n") {
        if i == "" {
            if sum > highest {
                highest = sum
            }
            sum = 0;
        } else {
            sum += i.parse::<i32>().unwrap();
        }
    }
    println!("{}", highest);
}
