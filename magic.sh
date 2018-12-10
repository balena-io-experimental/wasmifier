#!/bin/bash

rm -fr dist 

set -e
set -o pipefail

# dependencies 
# rust
# cargo-edit

mkdir -p dist

cargo init --vcs none dist/wasmed
cp -v *.rs dist/wasmed/src/
cd dist/wasmed
cargo add wasm-bindgen
cat <<EOF >> Cargo.toml
[lib]
crate-type = ["cdylib", "rlib"]
EOF

wasm-pack build --target browser

