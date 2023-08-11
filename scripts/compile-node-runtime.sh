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

mkdir -p node-runtime/fishyjoes-runtime-native-windows
mkdir -p node-runtime/fishyjoes-runtime-native-macos
mkdir -p node-runtime/fishyjoes-runtime-native-ubuntu

cp $BIN_DIR/libFishyJoesNodeRuntime.dll node-runtime/fishyjoes-runtime-native-windows/Runtime.cjs.node ||
cp $BIN_DIR/libFishyJoesNodeRuntime.dylib node-runtime/fishyjoes-runtime-native-macos/Runtime.cjs.node ||
cp $BIN_DIR/libFishyJoesNodeRuntime.so node-runtime/fishyjoes-runtime-native-ubuntu/Runtime.cjs.node

