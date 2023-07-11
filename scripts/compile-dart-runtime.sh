#!/bin/zsh

set -euxo pipefail

[[ -d dart-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

if [[ $(uname -s) == "Darwin" ]]; then
    swift build --configuration $CONFIGURATION --product FishyJoesDartRuntime --arch arm64
    swift build --configuration $CONFIGURATION --product FishyJoesDartRuntime --arch x86_64
    binPath=.build/apple/$CONFIGURATION
    mkdir -p $binPath
    lipo -create \
         -output $binPath/libFishyJoesDartRuntime.dylib \
         .build/{arm64,x86_64}-apple-macosx/$CONFIGURATION/libFishyJoesDartRuntime.dylib
    codesign -s - $binPath/libFishyJoesDartRuntime.dylib
else
    swift build --configuration $CONFIGURATION --product FishyJoesDartRuntime
    binPath=$(swift build --configuration $CONFIGURATION --show-bin-path)
fi

mkdir -p dart-runtime/native/{macos,windows,linux}

{
    [[ -f $binPath/libFishyJoesDartRuntime.dylib ]]
    cp $binPath/libFishyJoesDartRuntime.dylib dart-runtime/native/macos
} || {
    [[ -f $binPath/libFishyJoesDartRuntime.dll ]]
    cp $binPath/libFishyJoesDartRuntime.dll dart-runtime/native/windows
} || {
    [[ -f $binPath/libFishyJoesDartRuntime.so ]]
    cp $binPath/libFishyJoesDartRuntime.so dart-runtime/native/linux
}
