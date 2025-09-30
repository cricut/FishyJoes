#!/bin/zsh

set -euxo pipefail

if [[ ! -d kotlin-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

CONFIGURATION="${CONFIGURATION:-release}"
libdir=kotlin-runtime/src/generated/resources

export ANDROID_COMPATIBLE_ONLY=1

swiftAndroidToolchain=$(jq -r .swiftAndroid.toolchain Sources/FishyJoesConfig/tool-versions.json)
swiftAndroidSDK=$(jq -r .swiftAndroid.sdk Sources/FishyJoesConfig/tool-versions.json)

jq -r '.swiftAndroid.targets[] | .triple + " " +  .ndkArchName' Sources/FishyJoesConfig/tool-versions.json |
    while IFS= read -r line; do
        pair=(${(z)line})
        triple=${pair[1]}
        ndkArch=${pair[2]}

    swiftly run +$swiftAndroidToolchain ++ swift build \
        --swift-sdk $triple \
        --scratch-path .build/android-build \
        --configuration $CONFIGURATION \
        --product FishyJoesJavaRuntime
    installDir=$libdir/lib/$ndkArch
    mkdir -p $installDir/
    cp .build/android-build/$triple/$CONFIGURATION/libFishyJoesJavaRuntime.so $installDir/
done

# cp /VERSIONS $libdir/FishyJoesAndroidVersions.txt
