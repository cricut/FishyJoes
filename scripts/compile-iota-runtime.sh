#!/bin/bash

set -euo pipefail

if [[ ! -d c-sharp-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

CONFIGURATION="${CONFIGURATION:-release}"
SKIP_LIPO="${SKIP_LIPO:-0}"
PYVERSION="${VERSION:-0.0.1dev0}"
VERSION="${VERSION:-0.0.1-unknown}"
commonOptions=("$@" --configuration "$CONFIGURATION")
if [[ "${SWIFT_PACKAGE_RESOLVE:-1}" == 0 ]]; then
    commonOptions+=(--disable-automatic-resolution)
fi

if [[ "$(uname -s)" == "Darwin" && $SKIP_LIPO == "0" ]]; then
    swift build "${commonOptions[@]}" --product FishyJoesIotaRuntime --arch arm64
    swift build "${commonOptions[@]}" --product FishyJoesIotaRuntime --arch x86_64
    BIN_DIR=".build/apple/$CONFIGURATION"
    mkdir -p "$BIN_DIR"
    lipo -create \
         -output "$BIN_DIR/libFishyJoesIotaRuntime.dylib" \
         .build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesIotaRuntime.dylib
    codesign -s - "$BIN_DIR/libFishyJoesIotaRuntime.dylib"
elif [[ "$(uname -s)" == *_NT* ]]; then
    ./scripts/swift-shim.ps1 build "${commonOptions[@]}" --product FishyJoesIotaRuntime
    BIN_DIR="$(./scripts/swift-shim.ps1 build "${commonOptions[@]}" --show-bin-path)"
else
    swift build "${commonOptions[@]}" --product FishyJoesIotaRuntime
    BIN_DIR="$(swift build "${commonOptions[@]}" --show-bin-path)"
fi

function install-lib {
    LIB_NAME="$1"
    CS_LIB_DIR="$2"
    DART_LIB_DIR="$3"
    PYTHON_LIB_DIR="$4"
    if [ -e "$BIN_DIR/$LIB_NAME" ]; then
        mkdir -p "$CS_LIB_DIR"
        cp "$BIN_DIR/$LIB_NAME" "$CS_LIB_DIR"
        mkdir -p "$DART_LIB_DIR"
        cp "$BIN_DIR/$LIB_NAME" "$DART_LIB_DIR"
        mkdir -p "$PYTHON_LIB_DIR"
        cp "$BIN_DIR/$LIB_NAME" "$PYTHON_LIB_DIR"
        echo "Copied $LIB_NAME to '$CS_LIB_DIR', '$DART_LIB_DIR', and '$PYTHON_LIB_DIR'"
        return 0
    else
        return 1
    fi
}

install-lib "FishyJoesIotaRuntime.dll" "c-sharp-runtime/runtimes/win/native" "dart-runtime/windows/native" "python-runtime/src/fishyjoes_runtime/native" ||
    install-lib "libFishyJoesIotaRuntime.dylib" "c-sharp-runtime/runtimes/osx/native" "dart-runtime/macos/native" "python-runtime/src/fishyjoes_runtime/native" ||
    install-lib "libFishyJoesIotaRuntime.so" "c-sharp-runtime/runtimes/linux/native" "dart-runtime/linux/native" "python-runtime/src/fishyjoes_runtime/native"

if dotnet --version >/dev/null 2>&1; then
    MSYS_NO_PATHCONV=1 dotnet pack \
           -c "$CONFIGURATION" \
           c-sharp-runtime/Cricut.FishyJoesRuntime.csproj \
           "/p:Version=$VERSION" \
           --output c-sharp-runtime/nupkgs
else
    echo "dotnet executable not found, skipping creation of nuget package"
fi

if uv --version >/dev/null 2>&1; then
    (
        cd python-runtime

        # Typecheck
        # Allow errors for now
        # TODO: fix
        # uv run mypy --strict --show-error-codes --no-error-summary -p fishyjoes_runtime

        # Pack, restoring any temporary changes made to pyproject.toml (TODO: find a more elegant way to do this)
        cp pyproject.toml pyproject.toml.bak
        result=0
        (
            uv version "$PYVERSION"
            uv build --wheel
        ) || result=$?
        mv pyproject.toml.bak pyproject.toml

        unzip -t dist/*.whl
        exit $result
    )
else
    echo "uv executable not found, skipping creation of python package"
fi
