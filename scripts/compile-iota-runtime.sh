#!/bin/zsh

set -euo pipefail

[[ -d c-sharp-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

swift build --configuration $CONFIGURATION --product FishyJoesIotaRuntime
binPath=$(swift build --configuration $CONFIGURATION --show-bin-path)

mkdir -p c-sharp-runtime/runtimes/{osx,win,linux}/native
mkdir -p dart-runtime/native

{
    [[ -f $binPath/libFishyJoesIotaRuntime.dylib ]]
    cp $binPath/libFishyJoesIotaRuntime.dylib c-sharp-runtime/runtimes/osx/native/
    cp $binPath/libFishyJoesIotaRuntime.dylib dart-runtime/native/
    codesign -s i-hate-apple-security dart-runtime/native/libFishyJoesIotaRuntime.dylib
} || {
    [[ -f $binPath/libFishyJoesIotaRuntime.dll ]]
    cp $binPath/FishyJoesIotaRuntime.dll c-sharp-runtime/runtimes/win/native/
    cp $binPath/libFishyJoesIotaRuntime.dll dart-runtime/native/
} || {
    [[ -f $binPath/libFishyJoesIotaRuntime.so ]]
    cp $binPath/libFishyJoesIotaRuntime.so c-sharp-runtime/runtimes/linux/native/
    cp $binPath/libFishyJoesIotaRuntime.so dart-runtime/native/
}
