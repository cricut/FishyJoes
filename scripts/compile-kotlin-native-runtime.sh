#!/bin/zsh

set -euo pipefail

[[ -d kotlin-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

if [[ $(uname -s) == "Darwin" ]]; then
    swift build --configuration $CONFIGURATION --product FishyJoesJavaRuntime --arch arm64
    swift build --configuration $CONFIGURATION --product FishyJoesJavaRuntime --arch x86_64
    BIN_DIR=.build/apple/$CONFIGURATION
    mkdir -p $BIN_DIR
    lipo -create \
         -output $BIN_DIR/libFishyJoesJavaRuntime.dylib \
         .build/{arm64,x86_64}-apple-macosx/$CONFIGURATION/libFishyJoesJavaRuntime.dylib
else
    swift build --configuration $CONFIGURATION --product FishyJoesJavaRuntime
    BIN_DIR=$(swift build --configuration $CONFIGURATION --show-bin-path)
fi

function install-lib () {
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p $LIB_DIR
        cp $BIN_DIR/$LIB_NAME $LIB_DIR
        echo "Copied $LIB_NAME to $LIB_DIR"
    fi
}

LIB_NAME="FishyJoesJavaRuntime.dll"
LIB_DIR=node-runtime/fishyjoes-runtime-native-windows
install-lib

LIB_NAME="libFishyJoesJavaRuntime.dylib"
LIB_DIR=node-runtime/fishyjoes-runtime-native-macos
install-lib

LIB_NAME="libFishyJoesJavaRuntime.so"
LIB_DIR=node-runtime/fishyjoes-runtime-native-ubuntu
install-lib
