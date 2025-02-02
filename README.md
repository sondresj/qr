# Qr

A small command line utility to generate qr-code.

## Usage

- Argument `qr foobar.com`
- Piped `echo "foobar.com" | qr`
- Tty (enter something, and create the qr-code by pressing Enter)

  ```sh
    qr
    > foobar.com
    <QR CODE RENDERS HERE>
  ```

## Installing

Requirements:

- Cargo
- (Optional) Just

Clone the repo, `cd` into it, then run `just install` or `cargo build --release && cargo install --profile release --path .` if you don't have "just" installed.

Make sure to add ~/.cargo/bin to PATH if you haven't done so already
