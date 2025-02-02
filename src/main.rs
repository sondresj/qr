use qrcode::render::unicode::Dense1x2;
use std::io::{self, IsTerminal, Read};

fn get_input() -> Option<String> {
    std::env::args().nth(1).or_else(|| {
        let mut buf = String::new();
        let mut stdin = io::stdin();
        if stdin.is_terminal() {
            stdin.read_line(&mut buf).ok()?;
        } else {
            stdin.read_to_string(&mut buf).ok()?;
        }
        Some(buf)
    })
}

fn main() {
    let data = get_input().unwrap();
    let dim = termsize::get().unwrap();
    let code = qrcode::QrCode::new(data.as_bytes()).unwrap();
    let image = code
        .render::<Dense1x2>()
        .max_dimensions(dim.cols.into(), (dim.rows / 2).into())
        .module_dimensions(1, 1)
        .build();

    println!("{image}");
}
