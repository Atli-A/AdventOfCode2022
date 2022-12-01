use std::fs;

fn lowest_index(value: &[i32]) -> usize {
    let mut index: usize = 0;
    for (i, val) in value.iter().enumerate() {
        if *val < value[index] {
            index =  i;
        }
    }
    return index;
}

fn main() {
    let contents = fs::read_to_string("input")
        .expect("Should be able to read file");
//    println!("{contents}");
   
    let mut _sum = 0;
    let mut highest = [0; 3];
    for i in contents.split("\n") {
        if i == "" {
            let lowest_index = lowest_index(&highest);
            if highest[lowest_index] < _sum {
                highest[lowest_index] = _sum;
            }
            _sum = 0;
        } else {
            _sum += i.parse::<i32>().unwrap();
        }
    }
    let result: i32 = highest.iter().sum();
    println!("{}", result);
}
