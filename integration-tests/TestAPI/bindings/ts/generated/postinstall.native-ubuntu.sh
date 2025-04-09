#!/bin/bash

set -ex

if [[ "$npm_package_version" == "0.0.1" ]]; then
    # We are installed as a file local package
    package_directory="node_modules/@cricut"
else
    # We are installed as a published package
    package_directory=".."
fi

ln -sf "$(realpath "$package_directory/fishyjoes-runtime-native-ubuntu/libFishyJoesNodeRuntime.so")" "libFishyJoesNodeRuntime.so"
