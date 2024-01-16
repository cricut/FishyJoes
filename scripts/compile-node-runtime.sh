#!/bin/bash

set -euo pipefail

if [[ ! -d node-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

CONFIGURATION="${CONFIGURATION:-release}"
SKIP_LIPO="${SKIP_LIPO:-0}"

# Swift does not properly read Windows "PATH" variable, instead trying to read "Path" only.
# See: https://github.com/apple/swift-tools-support-core/issues/446
PATH="$PATH;/c/Program Files/Git/usr/bin;/c/Program Files/Git/mingw64/libexec/git-core"
[[ "${PATH:-}" ]] && export Path="$PATH"

if [[ "$(uname -s)" == "Darwin" && $SKIP_LIPO == "0" ]]; then
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime --arch arm64
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime --arch x86_64
    BIN_DIR=".build/apple/$CONFIGURATION"
    mkdir -p "$BIN_DIR"
    lipo -create \
         -output "$BIN_DIR/libFishyJoesNodeRuntime.dylib" \
         .build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesNodeRuntime.dylib
else
    env
    swift build "$@" --configuration "$CONFIGURATION" --product FishyJoesNodeRuntime
    BIN_DIR="$(swift build --configuration "$CONFIGURATION" --show-bin-path)"
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

function install-lib {
    LIB_NAME="$1"
    LIB_DIR="$2"
    NODE_LIB_NAME="Runtime.cjs.node"
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p "$LIB_DIR"
        cp "$BIN_DIR/$LIB_NAME" "$LIB_DIR/$NODE_LIB_NAME"
        if [ ! -e "$LIB_DIR/$LIB_NAME" ]; then
            ln -s "$NODE_LIB_NAME" "$LIB_DIR/$LIB_NAME"
        fi
        echo "Copied and symlinked $LIB_NAME to $LIB_DIR/$NODE_LIB_NAME"
        return 0
    else
        return 1
    fi
}

install-lib "FishyJoesNodeRuntime.dll" "node-runtime/fishyjoes-runtime-native-windows" ||
    install-lib "libFishyJoesNodeRuntime.dylib" "node-runtime/fishyjoes-runtime-native-macos" ||
    install-lib "libFishyJoesNodeRuntime.so" "node-runtime/fishyjoes-runtime-native-ubuntu"
