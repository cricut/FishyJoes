#!/bin/zsh

set -euxo pipefail

if [[ ! -d kotlin-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

source ./scripts/_read-tool-versions.sh --verbose

CONFIGURATION="${CONFIGURATION:-release}"
libdir=kotlin-runtime/src/generated/resources

export ANDROID_COMPATIBLE_ONLY=1

for ((i = 1; i <= $#swiftAndroidTargetTriples; i++)); do
    triple=${swiftAndroidTargetTriples[i]}
    ndkArch=${swiftAndroidTargetNDKArchNames[i]}

    swiftBuild=(swiftly run +$swiftAndroidToolchain ++ swift build)
    if ! swiftly --version; then
        echo "No swiftly found. Hoping that system swift version is $swiftAndroidToolchain"
        swift --version
        swiftBuild=(swift build)
    fi

    $swiftBuild \
        --swift-sdk $triple \
        --scratch-path .build/android-build \
        --configuration $CONFIGURATION \
        --product FishyJoesJavaRuntime
    installDir=$libdir/lib/$ndkArch
    mkdir -p $installDir/
    cp .build/android-build/$triple/$CONFIGURATION/libFishyJoesJavaRuntime.so $installDir/
done

FISHYJOES_UBUNTU_DEST=kotlin-runtime/src/generated/resources/linux ./scripts/copy-linux-swift-stdlib.sh

cat >$libdir/FishyJoesAndroidVersions.txt <<EOF
androidArchs=($swiftAndroidTargetTriples)
swiftVersion=$swiftAndroidToolchain
ndkVersion=$swiftAndroidNDKVersion
swiftAndroidSDKName=$swiftAndroidSDK
swiftAndroidSDKChecksum=$swiftAndroidSDKChecksum
EOF
