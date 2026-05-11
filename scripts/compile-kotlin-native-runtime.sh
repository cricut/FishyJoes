#!/bin/bash

set -euxo pipefail

if [[ ! -d kotlin-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

CONFIGURATION="${CONFIGURATION:-release}"
SKIP_LIPO="${SKIP_LIPO:-0}"
commonOptions=("$@" --configuration "$CONFIGURATION")
if [[ "${SWIFT_PACKAGE_RESOLVE:-1}" == 0 ]]; then
    commonOptions+=(--disable-automatic-resolution)
fi

if [[ "$(uname -s)" == "Darwin" && $SKIP_LIPO == "0" ]]; then
    swift build "${commonOptions[@]}" --product FishyJoesJavaRuntime --arch arm64
    swift build "${commonOptions[@]}" --product FishyJoesJavaRuntime --arch x86_64
    binDir=".build/apple/$CONFIGURATION"
    mkdir -p "$binDir"
    lipo -create \
         -output "$binDir/libFishyJoesJavaRuntime.dylib" \
         .build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesJavaRuntime.dylib
elif [[ "$(uname -s)" == *_NT* ]]; then
    ./scripts/swift-shim.ps1 build "${commonOptions[@]}" --product FishyJoesJavaRuntime
    binDir="$(./scripts/swift-shim.ps1 build "${commonOptions[@]}" --show-bin-path)"
else
    swift build "${commonOptions[@]}" --product FishyJoesJavaRuntime
    binDir="$(swift build "${commonOptions[@]}" --show-bin-path)"
fi

function install-lib {
    libName="$1"
    libDir="$2"
    if [ -e "$binDir/$libName" ]; then
        mkdir -p "$libDir"
        cp "$binDir/$libName" "$libDir"
        echo "Copied $libName to $libDir"
        return 0
    else
        return 1
    fi
}

case "$(uname -s)" in
    (Darwin)
        # Runtime isn't included for macOS
        install-lib "libFishyJoesJavaRuntime.dylib" "kotlin-runtime/src/generated/resources/mac"
        ;;
    (Linux)
        FISHYJOES_UBUNTU_DEST=kotlin-runtime/src/generated/resources/linux ./scripts/copy-linux-swift-stdlib.sh
        install-lib "libFishyJoesJavaRuntime.so" "kotlin-runtime/src/generated/resources/linux"
        ;;
    (*_NT*)
        swiftRuntimeDir="$(realpath "$SDKROOT/../../../.." | sed s#Platforms#Runtimes#g)"
        mkdir -p "kotlin-runtime/src/generated/resources/windows"
        cp -R "$swiftRuntimeDir"/usr/bin/*.dll "kotlin-runtime/src/generated/resources/windows"

        install-lib "FishyJoesJavaRuntime.dll" "kotlin-runtime/src/generated/resources/windows"
        ;;
    (*)
        echo >&2 "Unknown system type $(uname -s)"
        exit 1
        ;;
esac
