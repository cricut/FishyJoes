#!/bin/bash

set -euo pipefail

if [[ ! -d node-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

CONFIGURATION="${CONFIGURATION:-release}"
SKIP_LIPO="${SKIP_LIPO:-0}"

SHIM_DIR="Sources/FishyJoesNodeRuntime_NodeNativeShim"
if [[ "$(uname -s)" == "Darwin" && $SKIP_LIPO == "0" ]]; then
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime --arch arm64
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime --arch x86_64
    BIN_DIR=".build/apple/$CONFIGURATION"
    mkdir -p "$BIN_DIR"
    lipo -create \
         -output "$BIN_DIR/libFishyJoesNodeRuntime.dylib" \
         .build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesNodeRuntime.dylib
    
    (
        cd "$SHIM_DIR"
        swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime_NodeNativeShim --arch arm64
        swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime_NodeNativeShim --arch x86_64
    )
    lipo -create \
         -output "$BIN_DIR/libFishyJoesNodeRuntime_NodeNativeShim.dylib" \
         "$SHIM_DIR"/.build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesNodeRuntime_NodeNativeShim.dylib
elif [[ "$(uname -s)" == *_NT* ]]; then
    SWIFT="$(realpath ./scripts/swift-shim.ps1)"
    "$SWIFT" build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime
    BIN_DIR="$("$SWIFT" build --configuration "$CONFIGURATION" --show-bin-path)"
    (
        cd "$SHIM_DIR"
        "$SWIFT" build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime_NodeNativeShim
        SHIM_BIN_DIR="$("$SWIFT" build --configuration "$CONFIGURATION" --show-bin-path)"
        cp "$SHIM_BIN_DIR"/FishyJoesNodeRuntime_NodeNativeShim.dll "$BIN_DIR"
    )
else
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime
    BIN_DIR="$(swift build --configuration "$CONFIGURATION" --show-bin-path)"
    (
        cd "$SHIM_DIR"
        swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime_NodeNativeShim
        SHIM_BIN_DIR="$(swift build --configuration "$CONFIGURATION" --show-bin-path)"
        if [[ "$(uname -s)" == "Darwin" ]]; then
            cp "$SHIM_BIN_DIR"/libFishyJoesNodeRuntime_NodeNativeShim.dylib "$BIN_DIR"
        else
            cp "$SHIM_BIN_DIR"/libFishyJoesNodeRuntime_NodeNativeShim.so "$BIN_DIR"
        fi
    )
fi

function install-runtime-common {
    LIB_DIR="$1"
    RUNTIME_COMMON_DIR="node-runtime/fishyjoes-runtime-common"
    cp "$RUNTIME_COMMON_DIR"/Runtime.extensions.js "$LIB_DIR"

    DEFS="$LIB_DIR/Runtime.d.ts"
    cat "$RUNTIME_COMMON_DIR/Runtime.d.ts.part" >| "$DEFS"
    cat "$RUNTIME_COMMON_DIR/Runtime.extensions.d.ts.part" >> "$DEFS"
    echo 'export declare function init(): Promise<{ Runtime: typeof Runtime }>;' >> "$DEFS"
    echo 'export default Runtime;' >> "$DEFS"

    echo "Used runtime common files in $RUNTIME_COMMON_DIR to populate $LIB_DIR"
}

install-runtime-common "node-runtime/fishyjoes-runtime-native-windows"
install-runtime-common "node-runtime/fishyjoes-runtime-native-macos"
install-runtime-common "node-runtime/fishyjoes-runtime-native-ubuntu"
install-runtime-common "node-runtime/fishyjoes-runtime-wasm"

function install-node-lib {
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

install-node-lib "FishyJoesNodeRuntime.dll" "node-runtime/fishyjoes-runtime-native-windows" ||
    install-node-lib "libFishyJoesNodeRuntime.dylib" "node-runtime/fishyjoes-runtime-native-macos" ||
    install-node-lib "libFishyJoesNodeRuntime.so" "node-runtime/fishyjoes-runtime-native-ubuntu"

function install-shim-lib {
    LIB_NAME="$1"
    LIB_DIR="$2"
    NODE_LIB_NAME="Runtime.cjs.node"
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p "$LIB_DIR"
        cp "$BIN_DIR/$LIB_NAME" "$LIB_DIR/$NODE_LIB_NAME"
        echo "Copied $LIB_NAME to $LIB_DIR/$NODE_LIB_NAME"
        return 0
    else
        return 1
    fi
}

install-shim-lib "FishyJoesNodeRuntime_NodeNativeShim.dll" "node-runtime/fishyjoes-runtime-native-windows" ||
    install-shim-lib "libFishyJoesNodeRuntime_NodeNativeShim.dylib" "node-runtime/fishyjoes-runtime-native-macos" ||
    install-shim-lib "libFishyJoesNodeRuntime_NodeNativeShim.so" "node-runtime/fishyjoes-runtime-native-ubuntu"
