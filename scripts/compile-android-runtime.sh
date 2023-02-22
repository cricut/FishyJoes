#!/bin/zsh

set -euxo pipefail

# Expects to run in android-swift-runtime docker image
source /VERSIONS

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
        --configuration release \
        --product FishyJoesJavaRuntime \
        --destination $toolchainPath/usr/swiftpm-android-$arch.json \
        -Xlinker -rpath -Xlinker '$'ORIGIN$toolchainPath/usr/lib/swift/android
    installDir=$libdir/lib/$ndkArch
    mkdir -p $installDir/
    cp .build/$arch-unknown-linux-android$androidAPIVersion/release/libFishyJoesJavaRuntime.so $installDir/
done
