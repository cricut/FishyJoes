#!/bin/bash

set -euxo pipefail

if [[ ! -d node-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

CONFIGURATION="${CONFIGURATION:-release}"
SKIP_LIPO="${SKIP_LIPO:-0}"
commonOptions=("$@" --configuration "$CONFIGURATION")
if [[ "${SWIFT_PACKAGE_RESOLVE:-1}" == 0 ]]; then
    commonOptions+=(--force-resolved-versions)
fi

SHIM_DIR="node-runtime/register-module-shim"
if [[ "$(uname -s)" == "Darwin" && $SKIP_LIPO == "0" ]]; then
    swift build "${commonOptions[@]}" --product FishyJoesNodeRuntime --arch arm64
    swift build "${commonOptions[@]}" --product FishyJoesNodeRuntime --arch x86_64
    BIN_DIR=".build/apple/$CONFIGURATION"
    mkdir -p "$BIN_DIR"
    lipo -create \
         -output "$BIN_DIR/libFishyJoesNodeRuntime.dylib" \
         .build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesNodeRuntime.dylib

    (
        cd "$SHIM_DIR"
        swift build "${commonOptions[@]}" --product NodeNativeShim --arch arm64
        swift build "${commonOptions[@]}" --product NodeNativeShim --arch x86_64
    )
    lipo -create \
         -output "$BIN_DIR/libNodeNativeShim.dylib" \
         "$SHIM_DIR"/.build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libNodeNativeShim.dylib
elif [[ "$(uname -s)" == *_NT* ]]; then
    SWIFT="$(realpath ./scripts/swift-shim.ps1)"

    WIN_LIBS=".build/lib"
    WIN_LIBS_ENV=$(echo "$WIN_LIBS" | tr "/" "\\")
    export EXTRA_LIBPATH="$WIN_LIBS_ENV"

    "$SWIFT" run "${commonOptions[@]}" fishy-joes -- download-node-lib --destination "$WIN_LIBS/node.lib"
    "$SWIFT" build "${commonOptions[@]}" --product FishyJoesNodeRuntime
    BIN_DIR="$("$SWIFT" build "${commonOptions[@]}" --show-bin-path)"

    (
        cd "$SHIM_DIR"
        "$SWIFT" run "${commonOptions[@]}" fishy-joes -- download-node-lib --destination "$WIN_LIBS/node.lib"
        "$SWIFT" build "${commonOptions[@]}" --product NodeNativeShim
        SHIM_BIN_DIR="$("$SWIFT" build "${commonOptions[@]}" --show-bin-path)"
        cp "$SHIM_BIN_DIR"/NodeNativeShim.dll "$BIN_DIR"
    )
else
    swift build "${commonOptions[@]}" --product FishyJoesNodeRuntime
    BIN_DIR="$(swift build --configuration "$CONFIGURATION" --show-bin-path)"
    (
        cd "$SHIM_DIR"
        swift build "${commonOptions[@]}" --product NodeNativeShim
        SHIM_BIN_DIR="$(swift build "${commonOptions[@]}" --show-bin-path)"
        if [[ "$(uname -s)" == "Darwin" ]]; then
            cp "$SHIM_BIN_DIR"/libNodeNativeShim.dylib "$BIN_DIR"
        else
            cp "$SHIM_BIN_DIR"/libNodeNativeShim.so "$BIN_DIR"
        fi
    )
fi

function install-runtime-common {
    LIB_DIR="$1"
    RUNTIME_COMMON_DIR="node-runtime/fishyjoes-runtime-common"
    cp "$RUNTIME_COMMON_DIR"/Runtime.extensions.js "$LIB_DIR"

    {
        cat "$RUNTIME_COMMON_DIR/Runtime.d.ts.part"
        cat "$RUNTIME_COMMON_DIR/Runtime.extensions.d.ts.part"
        echo 'export declare function init(): Promise<{ Runtime: typeof Runtime }>;'
        echo 'export default Runtime;'
    } >| "$LIB_DIR/Runtime.d.ts"

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

install-shim-lib "NodeNativeShim.dll" "node-runtime/fishyjoes-runtime-native-windows" ||
    install-shim-lib "libNodeNativeShim.dylib" "node-runtime/fishyjoes-runtime-native-macos" ||
    install-shim-lib "libNodeNativeShim.so" "node-runtime/fishyjoes-runtime-native-ubuntu"
