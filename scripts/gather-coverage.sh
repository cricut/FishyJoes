#!/bin/zsh

set -euxo pipefail

export GRADLE_OPTS=-Dorg.gradle.daemon=false

export FISHYJOES_COVERAGE_PATH=$PWD/coverage-data
rm -rf $FISHYJOES_COVERAGE_PATH
mkdir -p $FISHYJOES_COVERAGE_PATH

# Publish runtime to maven local
libdir=kotlin-runtime/src/generated/resources/mac

rm -rf $libdir
mkdir -p $libdir

swift build --configuration debug --enable-code-coverage --product FishyJoesJavaRuntime
cp .build/debug/libFishyJoesJavaRuntime.dylib $libdir

(cd kotlin-runtime; ./gradlew publishToMavenLocal)

# Gather coverage for unit tests
(
    rm -rf .build/debug/codecov/
    swift test --enable-code-coverage
    cp .build/debug/codecov/*.profraw $FISHYJOES_COVERAGE_PATH
)

# Gather coverage from kotlin tests
(
    cd kotlin-runtime/
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/kotlin-runtime-tests.profraw
    ./gradlew test
)

# Gather coverage for integration tests
(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-generate-build.profraw
    swift run --enable-code-coverage -- fishy-joes generate build --kotlin-fast --nodejs --debug
)

(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-node.profraw
    swift run --enable-code-coverage -- fishy-joes test --nodejs --debug
)

(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-kotlin.profraw
    swift run --enable-code-coverage -- fishy-joes build test --kotlin-fast --debug
)

# Merge and report profile data
binaries=(
    .build/debug/fishy-joes
    .build/debug/FishyJoesPackageTests.xctest/Contents/MacOS/FishyJoesPackageTests
    .build/debug/libJavaRuntimeTestHarness.dylib
    .build/debug/libFishyJoesJavaRuntime.dylib
    integration-tests/TestAPI-bindings/.build/debug/libTestAPI.dylib
    integration-tests/TestAPI-bindings/.build/debug/libFishyJoesJavaRuntime.dylib
    integration-tests/TestAPI-bindings/.build/debug/libFishyJoesNodeRuntime.dylib
)

xcrun llvm-profdata merge coverage-data/*.profraw > coverage-data/combined.profdata

xcrun llvm-cov export -object=$^binaries -instr-profile=coverage-data/combined.profdata -format=text > coverage-data/combined.json
