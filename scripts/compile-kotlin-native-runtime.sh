#!/bin/bash

set -euo pipefail

if [[ ! -d kotlin-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

CONFIGURATION="${CONFIGURATION:-release}"
SKIP_LIPO="${SKIP_LIPO:-0}"

if [[ "$(uname -s)" == "Darwin" && $SKIP_LIPO == "0" ]]; then
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesJavaRuntime --arch arm64
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesJavaRuntime --arch x86_64
    BIN_DIR=".build/apple/$CONFIGURATION"
    mkdir -p "$BIN_DIR"
    lipo -create \
         -output "$BIN_DIR/libFishyJoesJavaRuntime.dylib" \
         .build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesJavaRuntime.dylib
elif [[ "$(uname -s)" == *_NT* ]]; then
    # Swift does not properly read Windows "PATH" variable, instead trying to read "Path" only.
    # See: https://github.com/apple/swift-tools-support-core/issues/446
    ./scripts/swift-shim.ps1 build "$@" --configuration "$CONFIGURATION" --product FishyJoesJavaRuntime
    BIN_DIR="$(./scripts/swift-shim.ps1 build --configuration "$CONFIGURATION" --show-bin-path)"
else
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesJavaRuntime
    BIN_DIR="$(swift build --configuration "$CONFIGURATION" --show-bin-path)"
fi

function install-lib {
    LIB_NAME="$1"
    LIB_DIR="$2"
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p "$LIB_DIR"
        cp "$BIN_DIR/$LIB_NAME" "$LIB_DIR"
        echo "Copied $LIB_NAME to $LIB_DIR"
        return 0
    else
        return 1
    fi
}

install-lib "FishyJoesJavaRuntime.dll" "kotlin-runtime/src/generated/resources/windows" ||
    install-lib "libFishyJoesJavaRuntime.dylib" "kotlin-runtime/src/generated/resources/mac" ||
    install-lib "libFishyJoesJavaRuntime.so" "kotlin-runtime/src/generated/resources/linux"
