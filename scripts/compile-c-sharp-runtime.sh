#!/bin/zsh

set -euo pipefail

[[ -d c-sharp-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

if [[ $(uname -s) == "Darwin" ]]; then
    swift build --configuration $CONFIGURATION --product FishyJoesCSharpRuntime --arch arm64
    swift build --configuration $CONFIGURATION --product FishyJoesCSharpRuntime --arch x86_64
    BIN_DIR=.build/apple/$CONFIGURATION
    mkdir -p $BIN_DIR
    lipo -create \
         -output $BIN_DIR/libFishyJoesCSharpRuntime.dylib \
         .build/{arm64,x86_64}-apple-macosx/$CONFIGURATION/libFishyJoesCSharpRuntime.dylib
else
    swift build --configuration $CONFIGURATION --product FishyJoesCSharpRuntime
    BIN_DIR=$(swift build --configuration $CONFIGURATION --show-bin-path)
fi

function install-lib () {
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p $LIB_DIR
        cp $BIN_DIR/$LIB_NAME $LIB_DIR
        echo "Copied $LIB_NAME to $LIB_DIR"
    fi
}

LIB_NAME="FishyJoesCSharpRuntime.dll"
LIB_DIR=c-sharp-runtime/runtimes/win/native
install-lib

LIB_NAME="libFishyJoesCSharpRuntime.dylib"
LIB_DIR=c-sharp-runtime/runtimes/osx/native
install-lib

LIB_NAME="libFishyJoesCSharpRuntime.so"
LIB_DIR=c-sharp-runtime/runtimes/linux/native
install-lib
