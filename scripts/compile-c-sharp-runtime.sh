#!/bin/zsh

set -euo pipefail

[[ -d c-sharp-runtime ]] || { echo "Not in root of FishyJoes"; exit 1 }

CONFIGURATION=${CONFIGURATION:-release}

swift build --configuration $CONFIGURATION --product FishyJoesCSharpRuntime

mkdir -p c-sharp-runtime/runtimes/{osx,win,linux}/native

cp .build/$CONFIGURATION/libFishyJoesCSharpRuntime.dylib c-sharp-runtime/runtimes/osx/native/ ||
cp .build/$CONFIGURATION/FishyJoesCSharpRuntime.dll c-sharp-runtime/runtimes/win/native/ ||
cp .build/$CONFIGURATION/libFishyJoesCSharpRuntime.so c-sharp-runtime/runtimes/linux/native/
