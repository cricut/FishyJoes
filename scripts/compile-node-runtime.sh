#!/bin/zsh

set -euo pipefail

[[ -d node-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

if [[ $(uname -s) == "Darwin" ]]; then
    swift build --configuration $CONFIGURATION --product FishyJoesNodeRuntime --arch arm64
    swift build --configuration $CONFIGURATION --product FishyJoesNodeRuntime --arch x86_64
    BIN_DIR=.build/apple/$CONFIGURATION
    mkdir -p $BIN_DIR
    lipo -create \
         -output $BIN_DIR/libFishyJoesNodeRuntime.dylib \
         .build/{arm64,x86_64}-apple-macosx/$CONFIGURATION/libFishyJoesNodeRuntime.dylib
else
    swift build --configuration $CONFIGURATION --product FishyJoesNodeRuntime
    BIN_DIR=$(swift build --configuration $CONFIGURATION --show-bin-path)
fi

function install-lib () {
    LIB_NAME="$1"
    LIB_DIR="$2"
    NODE_LIB_NAME="Runtime.cjs.node"
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p $LIB_DIR
        cp $BIN_DIR/$LIB_NAME $LIB_DIR/$NODE_LIB_NAME
        cp node-runtime/fishyjoes-runtime-native-common/{Runtime.d.ts,Runtime.extensions.ts} $LIB_DIR
        if [ ! -e $LIB_DIR/$LIB_NAME ]; then
            ln -s $NODE_LIB_NAME $LIB_DIR/$LIB_NAME
        fi
        echo "Copied and symlinked $LIB_NAME to $LIB_DIR/$NODE_LIB_NAME"
        return 0
    else
        return -1
    fi
}

install-lib "FishyJoesNodeRuntime.dll" "node-runtime/fishyjoes-runtime-native-windows" ||
install-lib "libFishyJoesNodeRuntime.dylib" "node-runtime/fishyjoes-runtime-native-macos" ||
install-lib "libFishyJoesNodeRuntime.so" "node-runtime/fishyjoes-runtime-native-ubuntu"
