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

mkdir -p c-sharp-runtime/runtimes/{osx,win,linux}/native

cp $BIN_DIR/libFishyJoesCSharpRuntime.dylib c-sharp-runtime/runtimes/osx/native/ ||
cp $BIN_DIR/FishyJoesCSharpRuntime.dll c-sharp-runtime/runtimes/win/native/ ||
cp $BIN_DIR/libFishyJoesCSharpRuntime.so c-sharp-runtime/runtimes/linux/native/
