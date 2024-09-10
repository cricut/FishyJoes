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

    swift-build \
        --configuration release \
        --product FishyJoesJavaRuntime \
        --destination /swift-android-$arch/usr/swiftpm-android-$arch.json
    installDir=$libdir/lib/$ndkArch
    mkdir -p $installDir/
    cp .build/$arch-unknown-linux-android$androidAPIVersion/release/libFishyJoesJavaRuntime.so $installDir/
done

cp /VERSIONS $libdir/FishyJoesAndroidVersions.txt
