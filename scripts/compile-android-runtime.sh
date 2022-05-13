#!/bin/zsh

set -euxo pipefail

libdir=kotlin-runtime/src/generated/resources

androidsStupidPlatforms=(
    "aarch64-linux-android aarch64-unknown-linux-android arm64-v8a"
    "arm-linux-androideabi armv7-unknown-linux-android armeabi-v7a"
    "i686-linux-android i686-unknown-linux-android x86"
    "x86_64-linux-android x86_64-unknown-linux-android x86_64"
)
export ANDROID_COMPATIBLE_ONLY=1

for platformStr in $androidsStupidPlatforms; do
    # From https://github.com/flowkey/swift-android-toolchain/pull/15/files
    NDK_VERSION=$(cat /Library/Developer/Toolchains/swift-android-toolchain/NDK_VERSION || echo 21.3.6528147)
    ANDROID_NDK_PATH=/usr/local/ndk/$NDK_VERSION

    # Ensure clang from ndk is used when invoking `clang` without specific path.
    # Otherwise it executes `/usr/bin/clang` which references clang from xcode command line tools.
    export PATH="$ANDROID_NDK_PATH/toolchains/llvm/prebuilt/darwin-x86_64/bin:$PATH"

    platform=(${(z)platformStr})
    /Library/Developer/Toolchains/swift-android-toolchain/usr/bin/swift-build-${platform[1]} --configuration release --product FishyJoesJavaRuntime
    installDir=$libdir/lib/${platform[3]}
    mkdir -p $installDir/
    cp .build/${platform[2]}/release/libFishyJoesJavaRuntime.so $installDir/
done
