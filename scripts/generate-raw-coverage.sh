#!/bin/zsh

set -euxo pipefail

if [[ ! -d integration-tests ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

export GRADLE_OPTS=-Dorg.gradle.daemon=false

export FISHYJOES_COVERAGE_PATH=$PWD/coverage-data
rm -rf $FISHYJOES_COVERAGE_PATH
mkdir -p $FISHYJOES_COVERAGE_PATH

# swift 5.7 no longer recognizes "--enable-code-coverage" outside of the "test" command
COVERAGE_FLAGS=(-Xswiftc -profile-coverage-mapping -Xswiftc -profile-generate)

CONFIGURATION=debug SKIP_LIPO=1 ./scripts/compile-node-runtime.sh $COVERAGE_FLAGS
CONFIGURATION=debug SKIP_LIPO=1 ./scripts/compile-kotlin-native-runtime.sh $COVERAGE_FLAGS
CONFIGURATION=debug SKIP_LIPO=1 ./scripts/compile-c-sharp-runtime.sh $COVERAGE_FLAGS

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
    swift run $COVERAGE_FLAGS -- fishy-joes generate build --kotlin-fast --nodejs --c-sharp --debug
)

(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-node.profraw
    swift run $COVERAGE_FLAGS -- fishy-joes test --nodejs --debug
)

(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-kotlin.profraw
    swift run $COVERAGE_FLAGS -- fishy-joes test --kotlin-fast --debug
)

(
    cd integration-tests/TestAPI-bindings
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-c-sharp.profraw
    swift run $COVERAGE_FLAGS -- fishy-joes test --c-sharp --debug
)

# Check that generation didn't change anything
if [ ! -z "$(cd integration-tests/TestAPI-Bindings; git status --porcelain .)" ]; then
    # fail CI, but keep going
    echo '::error:: generation modified sources, coverage won'\''t match with commited files'
    echo '::error::   run `swift run fishy-joes generate` from integration-tests/TestAPI-Bindings and re-commit'
    git status
    exit 1
fi
