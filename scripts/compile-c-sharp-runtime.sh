#!/bin/zsh

set -euo pipefail

[[ -d c-sharp-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

ARCH_ARGS=()
if [[ $(uname -s) == "Darwin" ]]; then
    ARCH_ARGS+=(--arch arm64 --arch x86_64)
fi

swift build --configuration $CONFIGURATION $ARCH_ARGS --product FishyJoesCSharpRuntime
BIN_DIR=$(swift build --configuration $CONFIGURATION $ARCH_ARGS --show-bin-path)
echo $BIN_DIR

mkdir -p c-sharp-runtime/runtimes/{osx,win,linux}/native

cp $BIN_DIR/libFishyJoesCSharpRuntime.dylib c-sharp-runtime/runtimes/osx/native/ ||
cp $BIN_DIR/FishyJoesCSharpRuntime.dll c-sharp-runtime/runtimes/win/native/ ||
cp $BIN_DIR/libFishyJoesCSharpRuntime.so c-sharp-runtime/runtimes/linux/native/
