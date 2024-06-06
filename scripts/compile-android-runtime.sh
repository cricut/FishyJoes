#!/bin/zsh

set -euo pipefail

source /VERSIONS || { echo "This script expects to run in android-swift-runtime docker image"; exit 1 }

set -x

git config --global --add safe.directory '*'

CONFIGURATION="${CONFIGURATION:-release}"
libdir=kotlin-runtime/src/generated/resources

androidsStupidPlatforms=(
    "armv7 armeabi-v7a"
    "aarch64 arm64-v8a"
    "x86_64 x86_64"
)
export ANDROID_COMPATIBLE_ONLY=1

for platformStr in $androidsStupidPlatforms; do
    platform=(${(z)platformStr})
    arch=${platform[1]}
    ndkArch=${platform[2]}

    toolchainPath=/swift-android-$arch
    swift-build \
        --scratch-path .build/android-build \
        --configuration $CONFIGURATION \
        --product FishyJoesJavaRuntime \
        --destination $toolchainPath/usr/swiftpm-android-$arch.json
    installDir=$libdir/lib/$ndkArch
    mkdir -p $installDir/
    cp .build/android-build/$arch-unknown-linux-android$androidAPIVersion/$CONFIGURATION/libFishyJoesJavaRuntime.so $installDir/
done

cp /VERSIONS $libdir/FishyJoesAndroidVersions.txt
