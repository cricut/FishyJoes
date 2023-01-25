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

mkdir -p kotlin-runtime/src/generated/resources/{mac,windows,linux}

cp $BIN_DIR/libFishyJoesJavaRuntime.dylib kotlin-runtime/src/generated/resources/mac/ ||
cp $BIN_DIR/FishyJoesJavaRuntime.dll kotlin-runtime/src/generated/resources/windows/ ||
cp $BIN_DIR/libFishyJoesJavaRuntime.so kotlin-runtime/src/generated/resources/linux/
