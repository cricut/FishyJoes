#!/bin/zsh

set -euxo pipefail

export GRADLE_OPTS=-Dorg.gradle.daemon=false

export FISHYJOES_COVERAGE_PATH=$PWD/coverage-data
rm -rf $FISHYJOES_COVERAGE_PATH
mkdir -p $FISHYJOES_COVERAGE_PATH

libdir=kotlin-runtime/src/generated/resources/mac

rm -rf $libdir
mkdir -p $libdir

swift build --configuration debug --enable-code-coverage --product FishyJoesJavaRuntime
cp .build/debug/libFishyJoesJavaRuntime.dylib $libdir
(cd kotlin-runtime && ./gradlew publishToMavenLocal)

# Gather coverage from kotlin tests
(
    cd kotlin-runtime

    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/kotlin-runtime-tests.profraw
    ./gradlew clean test jacocoTestReport
)

# Gather coverage for unit tests
(
    rm -rf .build/debug/codecov/
    swift test --enable-code-coverage
    cp .build/debug/codecov/*.profraw $FISHYJOES_COVERAGE_PATH
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

# Check that generation didn't change anything
if [ ! -z "$(cd integration-tests/TestAPI-Bindings; git status --porcelain .)" ]; then
    # fail CI, but keep going
    echo '::error:: generation modified sources, coverage won'\''t match with commited files'
    echo '::error::   run `swift run fishy-joes generate` from integration-tests/TestAPI-Bindings and re-commit'
    git status
    exit 1
fi
