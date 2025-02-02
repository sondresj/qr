# Qr

A small command line utility to generate qr-code.
Usage:

- Argument `qr foobar.com`
- Piped `echo "foobar.com" | qr`
- Tty (enter something, and create the qr-code by pressing Enter)

  ```sh
    qr
    > foobar.com
    <QR CODE RENDERS HERE>
  ```
