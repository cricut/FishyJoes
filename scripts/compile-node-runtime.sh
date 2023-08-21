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

NODE_LIB_NAME="Runtime.cjs.node"
function install-lib () {
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p $LIB_DIR
        cp $BIN_DIR/$LIB_NAME $LIB_DIR/$NODE_LIB_NAME
        if [ ! -e $LIB_DIR/$LIB_NAME ]; then
            ln -s $NODE_LIB_NAME $LIB_DIR/$LIB_NAME
        fi
        echo "Copied and symlinked $LIB_NAME to $LIB_DIR/$NODE_LIB_NAME"
    fi
}

LIB_NAME="FishyJoesNodeRuntime.dll"
LIB_DIR=node-runtime/fishyjoes-runtime-native-windows
install-lib

LIB_NAME="libFishyJoesNodeRuntime.dylib"
LIB_DIR=node-runtime/fishyjoes-runtime-native-macos
install-lib

LIB_NAME="libFishyJoesNodeRuntime.so"
LIB_DIR=node-runtime/fishyjoes-runtime-native-ubuntu
install-lib
