#!/bin/bash

# Steps performed in this file must also be performed on Windows
# When updating this script, change ../.github/workflows/iota-runtime.yaml

set -euo pipefail

if [[ ! -d c-sharp-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

CONFIGURATION="${CONFIGURATION:-release}"
SKIP_LIPO="${SKIP_LIPO:-0}"

if [[ "$(uname -s)" == "Darwin" && $SKIP_LIPO == "0" ]]; then
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesIotaRuntime --arch arm64
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesIotaRuntime --arch x86_64
    BIN_DIR=".build/apple/$CONFIGURATION"
    mkdir -p $BIN_DIR
    lipo -create \
         -output "$BIN_DIR/libFishyJoesIotaRuntime.dylib" \
         .build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesIotaRuntime.dylib
    codesign -s - "$BIN_DIR/libFishyJoesIotaRuntime.dylib"
else
    # Swift does not properly read Windows "PATH" variable, instead trying to read "Path".
    # See: https://github.com/apple/swift-tools-support-core/issues/446
    PATH="/usr/bin:$PATH" Path="$PATH" swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesIotaRuntime
    BIN_DIR="$(swift build --configuration "$CONFIGURATION" --show-bin-path)"
fi

function install-lib {
    LIB_NAME="$1"
    CS_LIB_DIR="$2"
    DART_LIB_DIR="$3"
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p "$CS_LIB_DIR"
        cp "$BIN_DIR/$LIB_NAME" "$CS_LIB_DIR"
        mkdir -p "$DART_LIB_DIR"
        cp "$BIN_DIR/$LIB_NAME" "$DART_LIB_DIR"
        echo "Copied $LIB_NAME to $CS_LIB_DIR and $DART_LIB_DIR"
        return 0
    else
        return 1
    fi
}

install-lib "FishyJoesIotaRuntime.dll" "c-sharp-runtime/runtimes/win/native" "dart-runtime/windows/native" ||
    install-lib "libFishyJoesIotaRuntime.dylib" "c-sharp-runtime/runtimes/osx/native" "dart-runtime/macos/native" ||
    install-lib "libFishyJoesIotaRuntime.so" "c-sharp-runtime/runtimes/linux/native" "dart-runtime/linux/native"
