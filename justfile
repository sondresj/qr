version := "v0.1.0"
bin_dir := "target/build/release"
files := bin_dir / "qr.exe" #, bin_dir / "qr"
release_title := "Release " + version

targets := "
x86_64-unknown-linux-gnu
aarch64-unknown-linux-gnu
x86_64-pc-windows-gnu
x86_64-apple-darwin
aarch64-apple-darwin
"

_build_targets:
    #!/usr/bin/env sh
    ts="{{targets}}"
    for target in ${ts[@]}; do
        echo ":: Building" $target;
        cargo build --release --target $target || exit $?;
    done

default:
    @just --list

run *args:
    cargo run {{args}}

build *args:
    cargo build {{args}}

build-release: (_build_targets)

[confirm('Publish github release {{version}}?')]
publish: build-release
    gh release create --verify-tag -t {{release_title}} --generate-notes {{version}} {{files}}

install: (build "--release")
    cargo install --profile release --path .
