#!/bin/zsh

set -euxo pipefail

# Merge and report profile data
binaries=(
    .build/debug/fishy-joes
    .build/debug/FishyJoesPackageTests.xctest/Contents/MacOS/FishyJoesPackageTests
    .build/debug/libJavaRuntimeTestHarness.dylib
    .build/debug/libFishyJoesJavaRuntime.dylib
    .build/debug/libFishyJoesIotaRuntime.dylib
    integration-tests/TestAPI/.build/bindings/debug/libTestAPI.dylib
    integration-tests/TestAPI/.build/bindings/debug/libTestAPI-java.dylib
    integration-tests/TestAPI/.build/bindings/debug/libTestAPI-node.dylib
    integration-tests/TestAPI/.build/bindings/debug/libTestAPI-node-shim.dylib
    integration-tests/TestAPI/.build/bindings/debug/libTestAPI-iota.dylib
    integration-tests/TestAPI/.build/bindings/debug/libFishyJoesNodeRuntime.dylib
)

xcrun llvm-profdata merge coverage-data/*.profraw > coverage-data/combined.profdata

xcrun llvm-cov export \
      -object=$^binaries \
      -instr-profile=coverage-data/combined.profdata \
      -format=lcov \
      > coverage-data/lcov.info
