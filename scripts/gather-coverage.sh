#!/bin/zsh

set -euxo pipefail

# Merge and report profile data
binaries=(
    .build/debug/fishy-joes
    .build/debug/FishyJoesPackageTests.xctest/Contents/MacOS/FishyJoesPackageTests
    .build/debug/libJavaRuntimeTestHarness.dylib
    .build/debug/libFishyJoesJavaRuntime.dylib
    .build/debug/libFishyJoesCSharpRuntime.dylib
    .build/debug/$'\U1f41f\U2615\Ufe0f'
    integration-tests/TestAPI-bindings/.build/debug/libTestAPI.dylib
    integration-tests/TestAPI-bindings/.build/debug/libTestAPI-java.dylib
    integration-tests/TestAPI-bindings/.build/debug/libTestAPI-node.dylib
    integration-tests/TestAPI-bindings/.build/debug/libTestAPI-c-sharp.dylib
    integration-tests/TestAPI-bindings/.build/debug/libFishyJoesJavaRuntime.dylib
    integration-tests/TestAPI-bindings/.build/debug/libFishyJoesNodeRuntime.dylib
    integration-tests/TestAPI-bindings/.build/debug/libFishyJoesCSharpRuntime.dylib
)

xcrun llvm-profdata merge coverage-data/*.profraw > coverage-data/combined.profdata

xcrun llvm-cov export -object=$^binaries -instr-profile=coverage-data/combined.profdata -format=lcov > coverage-data/lcov.info

./scripts/lcov-to-xml.sh <coverage-data/lcov.info >coverage-data/coverage.xml
