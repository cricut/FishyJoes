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

if [ -e "$BIN_DIR/libFishyJoesNodeRuntime.dll" ]; then
    LIB_DIR=node-runtime/fishyjoes-runtime-native-windows
    mkdir -p $LIB_DIR
    cp $BIN_DIR/libFishyJoesNodeRuntime.dll $LIB_DIR/Runtime.cjs.node
    if [ ! -e $LIB_DIR/libFishyJoesNodeRuntime.dll ]; then
        ln -s Runtime.cjs.node $LIB_DIR/libFishyJoesNodeRuntime.dll
    fi
    echo "Copied and symlinked libFishyJoesNodeRuntime.dll to $LIB_DIR/Runtime.cjs.node"
fi

if [ -e "$BIN_DIR/libFishyJoesNodeRuntime.dylib" ]; then
    LIB_DIR=node-runtime/fishyjoes-runtime-native-macos
    mkdir -p $LIB_DIR
    cp $BIN_DIR/libFishyJoesNodeRuntime.dylib $LIB_DIR/Runtime.cjs.node
    if [ ! -e $LIB_DIR/libFishyJoesNodeRuntime.dylib ]; then
        ln -s Runtime.cjs.node $LIB_DIR/libFishyJoesNodeRuntime.dylib
    fi
    echo "Copied and symlinked libFishyJoesNodeRuntime.dylib to $LIB_DIR/Runtime.cjs.node"
fi

if [ -e "$BIN_DIR/libFishyJoesNodeRuntime.so" ]; then
    LIB_DIR=node-runtime/fishyjoes-runtime-native-macos
    mkdir -p $LIB_DIR
    cp $BIN_DIR/libFishyJoesNodeRuntime.so $LIB_DIR/Runtime.cjs.node
    if [ ! -e $LIB_DIR/libFishyJoesNodeRuntime.so ]; then
        ln -s Runtime.cjs.node $LIB_DIR/libFishyJoesNodeRuntime.so
    fi
    echo "Copied and symlinked libFishyJoesNodeRuntime.so to $LIB_DIR/Runtime.cjs.node"
fi
