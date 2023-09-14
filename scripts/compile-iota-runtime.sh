#!/bin/zsh

set -euo pipefail

[[ -d c-sharp-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

if [[ $(uname -s) == "Darwin" ]]; then
    swift build --configuration $CONFIGURATION --product FishyJoesIotaRuntime --arch arm64
    swift build --configuration $CONFIGURATION --product FishyJoesIotaRuntime --arch x86_64
    binPath=.build/apple/$CONFIGURATION
    mkdir -p $binPath
    lipo -create \
         -output $binPath/libFishyJoesIotaRuntime.dylib \
         .build/{arm64,x86_64}-apple-macosx/$CONFIGURATION/libFishyJoesIotaRuntime.dylib
    codesign -s - $binPath/libFishyJoesIotaRuntime.dylib
else
    swift build --configuration $CONFIGURATION --product FishyJoesIotaRuntime
    binPath=$(swift build --configuration $CONFIGURATION --show-bin-path)
fi

mkdir -p c-sharp-runtime/runtimes/{osx,win,linux}/native
mkdir -p dart-runtime/native/{macos,windows,linux}

{
    [[ -f $binPath/libFishyJoesIotaRuntime.dylib ]]
    cp $binPath/libFishyJoesIotaRuntime.dylib c-sharp-runtime/runtimes/osx/native/
    cp $binPath/libFishyJoesIotaRuntime.dylib dart-runtime/native/macos
} || {
    [[ -f $binPath/libFishyJoesIotaRuntime.dll ]]
    cp $binPath/FishyJoesIotaRuntime.dll c-sharp-runtime/runtimes/win/native/
    cp $binPath/libFishyJoesIotaRuntime.dll dart-runtime/native/windows
} || {
    [[ -f $binPath/libFishyJoesIotaRuntime.so ]]
    cp $binPath/libFishyJoesIotaRuntime.so c-sharp-runtime/runtimes/linux/native/
    cp $binPath/libFishyJoesIotaRuntime.so dart-runtime/native/linux
}
