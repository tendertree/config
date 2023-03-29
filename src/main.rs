use std::fs;
static DATA_PATH: &str = "~/config/data";

fn copy_file(from: &str, dest: &str) -> Result<(), Box<dyn std::error::Error>> {
    fs::copy(from, dest).unwrap();
    Ok(())
}

fn main() {
    println!("upload neovim config");
    copy_file("~/hi.txt", DATA_PATH);
}

#[test]
fn test_sum() {
    let from = "~/hi.txt";
    let to = DATA_PATH;
    let result = copy_file(from, to);

    assert!(
        result.is_ok(),
        "FileCopy failed with error: {:?}",
        result.err()
    );
}
