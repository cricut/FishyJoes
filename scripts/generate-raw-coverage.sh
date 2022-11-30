#!/bin/zsh

set -euxo pipefail

export GRADLE_OPTS=-Dorg.gradle.daemon=false

export FISHYJOES_COVERAGE_PATH=$PWD/coverage-data
rm -rf $FISHYJOES_COVERAGE_PATH
mkdir -p $FISHYJOES_COVERAGE_PATH

javaLibDir=kotlin-runtime/src/generated/resources/mac
cSharpLibDir=c-sharp-runtime/runtimes/osx/native

rm -rf $javaLibDir $cSharpLibDir
mkdir -p $javaLibDir $cSharpLibDir

# swift 5.7 no longer recognizes "--enable-code-coverage" outside of the "test" command
COVERAGE_FLAGS=(-Xswiftc -profile-coverage-mapping -Xswiftc -profile-generate)

swift build --configuration debug $COVERAGE_FLAGS --product FishyJoesJavaRuntime
swift build --configuration debug $COVERAGE_FLAGS --product FishyJoesCSharpRuntime
cp .build/debug/libFishyJoesJavaRuntime.dylib $javaLibDir
cp .build/debug/libFishyJoesCSharpRuntime.dylib $cSharpLibDir
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
    swift run $COVERAGE_FLAGS -- fishy-joes generate build --kotlin-fast --nodejs --debug
)

(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-node.profraw
    swift run $COVERAGE_FLAGS -- fishy-joes test --nodejs --debug
)

(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-kotlin.profraw
    swift run $COVERAGE_FLAGS -- fishy-joes build test --kotlin-fast --debug
)

(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-c-sharp.profraw
    swift run $COVERAGE_FLAGS -- fishy-joes build test --c-sharp --debug
)

# Check that generation didn't change anything
if [ ! -z "$(cd integration-tests/TestAPI-Bindings; git status --porcelain .)" ]; then
    # fail CI, but keep going
    echo '::error:: generation modified sources, coverage won'\''t match with commited files'
    echo '::error::   run `swift run fishy-joes generate` from integration-tests/TestAPI-Bindings and re-commit'
    git status
    exit 1
fi
