#!/bin/zsh

set -euxo pipefail

SWIFT_WASM_HOST_VERSION=6.1
SWIFT_WASM_VERSION=6.1-RELEASE
SWIFT_WASM_CHECKSUM=7550b4c77a55f4b637c376f5d192f297fe185607003a6212ad608276928db992

if ! swiftly --version; then
    if [[ "$(uname -s)" == "Darwin" ]]; then
        tempdir="$(mktemp -d)"
        curl -o $tmpdir/swiftly.pkg https://download.swift.org/swiftly/darwin/swiftly.pkg
        installer -pkg $tmpdir/swiftly.pkg -target CurrentUserHomeDirectory
        rm -f $package
        ~/.swiftly/bin/swiftly init --assume-yes --no-modify-profile --skip-install
    elif [[ "$(uname -s)" == *_NT* ]]; then
        echo "wasm compilation is currently only supported on mac and linux"
        exit 1
    else
        tempdir="$(mktemp -d)"
        curl -o tempdir/swiftly.tgz "https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz"
        tar -xzf $tempdir/swiftly.tgz -C $tempdir
        $tempdir/swiftly init --assume-yes --no-modify-profile --skip-install
    fi
fi

~/.swiftly/bin/swiftly install --assume-yes $SWIFT_WASM_HOST_VERSION
if swift sdk configure --show-configuration $SWIFT_WASM_VERSION-wasm32-unknown-wasi wasm32-unknown-wasi &>/dev/null; then
    echo "swift-wasm $SWIFT_WASM_VERSION already installed"
else
    swift sdk install \
        https://github.com/swiftwasm/swift/releases/download/swift-wasm-$SWIFT_WASM_VERSION/swift-wasm-$SWIFT_WASM_VERSION-wasm32-unknown-wasi.artifactbundle.zip \
        --checksum $SWIFT_WASM_CHECKSUM
fi
