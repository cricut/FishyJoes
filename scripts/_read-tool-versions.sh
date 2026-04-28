# This script is intended to be sourced, not run on its own

if [[ ! -d kotlin-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

swiftWasmToolchain="$(jq -r .swiftWasm.toolchain Sources/FishyJoesConfig/tool-versions.json)"
swiftWasmSDK="$(jq -r .swiftWasm.sdk Sources/FishyJoesConfig/tool-versions.json)"
swiftWasmSDKURL="$(jq -r .swiftWasm.sdkURL Sources/FishyJoesConfig/tool-versions.json)"
swiftWasmSDKChecksum="$(jq -r .swiftWasm.sdkChecksum Sources/FishyJoesConfig/tool-versions.json)"
swiftWasmTargetTriple="$(jq -r '.swiftWasm.targets[].triple' Sources/FishyJoesConfig/tool-versions.json)"

swiftAndroidToolchain="$(jq -r .swiftAndroid.toolchain Sources/FishyJoesConfig/tool-versions.json)"
swiftAndroidSDK="$(jq -r .swiftAndroid.sdk Sources/FishyJoesConfig/tool-versions.json)"
swiftAndroidSDKURL="$(jq -r .swiftAndroid.sdkURL Sources/FishyJoesConfig/tool-versions.json)"
swiftAndroidSDKChecksum="$(jq -r .swiftAndroid.sdkChecksum Sources/FishyJoesConfig/tool-versions.json)"
swiftAndroidNDKVersion="$(jq -r .swiftAndroid.ndkVersion Sources/FishyJoesConfig/tool-versions.json)"
swiftAndroidTargetTriples=($(jq -r '.swiftAndroid.targets[].triple' Sources/FishyJoesConfig/tool-versions.json))
swiftAndroidTargetNDKArchNames=($(jq -r '.swiftAndroid.targets[].ndkArchName' Sources/FishyJoesConfig/tool-versions.json))

if [[ "${1:-}" == "--verbose" ]]; then
    declare -p swiftWasmToolchain
    declare -p swiftWasmSDK
    declare -p swiftWasmSDKURL
    declare -p swiftWasmSDKChecksum
    declare -p swiftWasmTargetTriple

    declare -p swiftAndroidToolchain
    declare -p swiftAndroidSDK
    declare -p swiftAndroidSDKURL
    declare -p swiftAndroidSDKChecksum
    declare -p swiftAndroidNDKVersion
    declare -p swiftAndroidTargetTriples
    declare -p swiftAndroidTargetNDKArchNames
fi
