#!/bin/zsh

set -euo pipefail

[[ -d kotlin-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

ARCH_ARGS=()
if [[ $(uname -s) == "Darwin" ]]; then
    ARCH_ARGS+=(--arch arm64 --arch x86_64)
fi

swift build --configuration $CONFIGURATION $ARCH_ARGS --product FishyJoesJavaRuntime
BIN_DIR=$(swift build --configuration $CONFIGURATION $ARCH_ARGS --show-bin-path)
echo $BIN_DIR

mkdir -p kotlin-runtime/src/generated/resources/{mac,windows,linux}

cp $BIN_DIR/libFishyJoesJavaRuntime.dylib kotlin-runtime/src/generated/resources/mac/ ||
cp $BIN_DIR/FishyJoesJavaRuntime.dll kotlin-runtime/src/generated/resources/windows/ ||
cp $BIN_DIR/libFishyJoesJavaRuntime.so kotlin-runtime/src/generated/resources/linux/
