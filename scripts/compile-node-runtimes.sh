#!/bin/zsh

set -euo pipefail

[[ -d node-runtimes ]] || { echo "Not in root of FishyJoes"; exit 1 }

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

mkdir -p node-runtimes/fishyjoes-runtime-node-native-windows
mkdir -p node-runtimes/fishyjoes-runtime-node-native-macos
mkdir -p node-runtimes/fishyjoes-runtime-node-native-ubuntu

cp $BIN_DIR/libFishyJoesNodeRuntime.dll node-runtimes/fishyjoes-runtime-node-native-windows/Runtime.cjs.node ||
cp $BIN_DIR/libFishyJoesNodeRuntime.dylib node-runtimes/fishyjoes-runtime-node-native-macos/Runtime.cjs.node ||
cp $BIN_DIR/libFishyJoesNodeRuntime.so node-runtimes/fishyjoes-runtime-node-native-ubuntu/Runtime.cjs.node

