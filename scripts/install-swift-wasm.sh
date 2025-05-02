#!/bin/zsh

set -euxo pipefail

toolVersionsFile=Sources/FishyJoesConfig/tool-versions.json
if [[ ! -f $toolVersionsFile ]]; then
    echo "script must be executed in root of FishyJoes repo"
    exit 1
fi

SWIFT_WASM_HOST_VERSION=$(jq -r .swiftWasm.toolchain <$toolVersionsFile)
SWIFT_WASM_VERSION=$(jq -r .swiftWasm.sdk <$toolVersionsFile)
SWIFT_WASM_CHECKSUM=$(jq -r .swiftWasm.sdkChecksum <$toolVersionsFile)

function sourceSwiftlyEnv {
    if [[ -v SWIFTLY_HOME_DIR && -f $SWIFTLY_HOME_DIR/env.sh ]]; then
        source $SWIFTLY_HOME_DIR/env.sh
    elif [[ -v XDG_DATA_HOME && -f $XDG_DATA_HOME/.swifly/env.sh ]]; then
        source $XDG_DATA_HOME/.swifly/env.sh
    elif [[ -f ~/.swifly/env.sh ]]; then
        source ~/.swifly/env.sh
    elif [[ -f ~/.local/share//env.sh ]]; then
        source ~/.local/share/swiftly/env.sh
    fi
}

sourceSwiftlyEnv
if ! swiftly --version; then
    if [[ "$(uname -s)" == "Darwin" ]]; then
        tempdir="$(mktemp -d)"
        curl -o $tempdir/swiftly.pkg https://download.swift.org/swiftly/darwin/swiftly.pkg
        installer -pkg $tempdir/swiftly.pkg -target CurrentUserHomeDirectory
        rm -rf $tempdir
        ~/.swiftly/bin/swiftly init --assume-yes --no-modify-profile --skip-install
    elif [[ "$(uname -s)" == *_NT* ]]; then
        echo "wasm compilation is currently only supported on mac and linux"
        exit 1
    else
        tempdir="$(mktemp -d)"
        curl -o $tempdir/swiftly.tgz "https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz"
        tar -xzf $tempdir/swiftly.tgz -C $tempdir
        $tempdir/swiftly init --assume-yes --no-modify-profile --skip-install
        rm -rf $tempdir
    fi
    sourceSwiftlyEnv
fi

swiftly install --assume-yes $SWIFT_WASM_HOST_VERSION
if swift sdk configure --show-configuration $SWIFT_WASM_VERSION-wasm32-unknown-wasi wasm32-unknown-wasi &>/dev/null; then
    echo "swift-wasm $SWIFT_WASM_VERSION already installed"
else
    swift sdk install \
        https://github.com/swiftwasm/swift/releases/download/swift-wasm-$SWIFT_WASM_VERSION/swift-wasm-$SWIFT_WASM_VERSION-wasm32-unknown-wasi.artifactbundle.zip \
        --checksum $SWIFT_WASM_CHECKSUM
fi
