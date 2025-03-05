#!/bin/zsh

set -euxo pipefail

if [[ ! -d integration-tests ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

export GRADLE_OPTS=-Dorg.gradle.daemon=false
export FISHYJOES=1

export FISHYJOES_COVERAGE_PATH=$PWD/coverage-data
rm -rf $FISHYJOES_COVERAGE_PATH
mkdir -p $FISHYJOES_COVERAGE_PATH

# swift 5.7 no longer recognizes "--enable-code-coverage" outside of the "test" command
COVERAGE_FLAGS=(-Xswiftc -profile-coverage-mapping -Xswiftc -profile-generate)

CONFIGURATION=debug SKIP_LIPO=1 ./scripts/compile-node-runtime.sh $COVERAGE_FLAGS
CONFIGURATION=debug SKIP_LIPO=1 ./scripts/compile-kotlin-native-runtime.sh $COVERAGE_FLAGS
CONFIGURATION=debug SKIP_LIPO=1 ./scripts/compile-iota-runtime.sh $COVERAGE_FLAGS

swift build --configuration debug $COVERAGE_FLAGS --build-tests
ls .build/debug/*(.x)

(cd kotlin-runtime && ./gradlew publishToMavenLocal)

# Gather coverage from kotlin tests
(
    cd kotlin-runtime

    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/kotlin-runtime-tests.profraw
    ./gradlew cleanTest test jacocoTestReport
)

# Gather coverage for unit tests
(
    rm -rf .build/debug/codecov/
    swift test --skip-build --enable-code-coverage
    cp .build/debug/codecov/*.profraw $FISHYJOES_COVERAGE_PATH
)

# Gather coverage for integration tests
(cd integration-tests/TestAPI && swift package resolve)

(
    cd integration-tests/TestAPI
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-generate-build.profraw
    ../../.build/debug/fishy-joes generate build --kotlin-fast --nodejs --debug
)

(
    cd integration-tests/TestAPI
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-node.profraw
    ../../.build/debug/fishy-joes test --nodejs --debug
)

(
    cd integration-tests/TestAPI
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-kotlin.profraw
    ../../.build/debug/fishy-joes build test --kotlin-fast --debug
)

(
    cd integration-tests/TestAPI
    export LLVM_PROFILE_FILE=$FISHYJOES_COVERAGE_PATH/integration-tests-c-sharp.profraw
    ../../.build/debug/fishy-joes build test --c-sharp --debug
)

# Check that generation didn't change anything
if [ ! -z "$(cd integration-tests/TestAPI; git status --porcelain .)" ]; then
    # fail CI, but keep going
    echo '::error:: generation modified sources, coverage won'\''t match with commited files'
    echo '::error::   run `swift run fishy-joes generate` from integration-tests/TestAPI and re-commit'
    git status
    exit 1
fi
