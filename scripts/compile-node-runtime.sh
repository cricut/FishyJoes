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
    mkdir -p node-runtime/fishyjoes-runtime-native-windows
    cp $BIN_DIR/libFishyJoesNodeRuntime.dll node-runtime/fishyjoes-runtime-native-windows/Runtime.cjs.node
    if [ ! -e node-runtime/fishyjoes-runtime-native-windows/libFishyJoesNodeRuntime.dll ]; then
        ln -s Runtime.cjs.node libFishyJoesNodeRuntime.dll
        popd
    fi
    echo "Copied libFishyJoesNodeRuntime.dll to node-runtime/fishyjoes-runtime-native-windows/Runtime.cjs.node"
fi

if [ -e "$BIN_DIR/libFishyJoesNodeRuntime.dylib" ]; then
    mkdir -p node-runtime/fishyjoes-runtime-native-macos
    cp $BIN_DIR/libFishyJoesNodeRuntime.dylib node-runtime/fishyjoes-runtime-native-macos/Runtime.cjs.node
    if [ ! -e node-runtime/fishyjoes-runtime-native-macos/libFishyJoesNodeRuntime.dylib ]; then
        pushd node-runtime/fishyjoes-runtime-native-macos
        ln -s Runtime.cjs.node libFishyJoesNodeRuntime.dylib
        popd
    fi
    echo "Copied libFishyJoesNodeRuntime.dylib to node-runtime/fishyjoes-runtime-native-macos/Runtime.cjs.node"
fi

if [ -e "$BIN_DIR/libFishyJoesNodeRuntime.so" ]; then
    mkdir -p node-runtime/fishyjoes-runtime-native-ubuntu
    cp $BIN_DIR/libFishyJoesNodeRuntime.so node-runtime/fishyjoes-runtime-native-ubuntu/Runtime.cjs.node
    if [ ! -e node-runtime/fishyjoes-runtime-native-ubuntu/libFishyJoesNodeRuntime.so ]; then
        pushd node-runtime/fishyjoes-runtime-native-ubuntu
        ln -s Runtime.cjs.node libFishyJoesNodeRuntime.so
        popd
    fi
    echo "Copied libFishyJoesNodeRuntime.so to node-runtime/fishyjoes-runtime-native-ubuntu/Runtime.cjs.node"
fi
