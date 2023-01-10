use std::path::PathBuf;

//TODO: access 'data' folder
//TODO: add copy and paste
//TODO: implehent git push

fn sum() -> i32 {
    let result = 1 + 1;
    result
}

fn main() {
    println!("Hello, world!");
}

#[test]
fn test_sum() {
    let p = PathBuf::from("/spirited/away.rs");
    let mut current = dirs::config_dir().expect("not a valid path");
    current.push("nvim");
    assert_eq!(p, current);
}
