use rand::prelude::*;

fn main() {
    let x: u8 = random();
    println!("{}", x);
    let y: u8 = random();
    println!("{}", y);
}
