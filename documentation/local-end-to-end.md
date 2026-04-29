# Local End-to-End

This is the current local bootstrap and verification path for FishyJoes on macOS.

## One-time bootstrap

Resolve SwiftPM dependencies:

```bash
swift package resolve --disable-sandbox
```

Install the toolchains expected by `tool-versions.json`. The package test suite currently needs the Swiftly-managed WASM snapshot because `Tests/NAPITests` shells out to it:

```bash
swift run -- fishy-joes install-toolchains --swiftly --wasm --no-android
```

Install the Node workspace dependencies used by `Tests/NAPITests`:

```bash
cd Tests/NAPITests/node-tests
npm install
cd ../../..
```

## Package-level verification

Run the Swift package tests from the repo root:

```bash
HOME="$PWD" \
CLANG_MODULE_CACHE_PATH="$PWD/.build/clang-module-cache" \
SWIFTPM_MODULECACHE_OVERRIDE="$PWD/.build/swiftpm-module-cache" \
swift test --disable-sandbox
```

The explicit `HOME` and module cache paths keep the run self-contained inside the workspace.

## Integration flow

Generate bindings from the consumer fixture:

```bash
cd integration-tests/TestAPI
FISHYJOES=1 swift run -- fishy-joes generate
```

Then build and test each target you care about. Examples:

```bash
swift run -- fishy-joes --node build test
swift run -- fishy-joes --c-sharp build test
swift run -- fishy-joes --dart build test
swift run -- fishy-joes --python build test
```

The Python target uses the shared `fishyjoes_python` runtime. In the in-repo TestAPI layout, `PythonPhases` installs `../../../../../python-runtime` and injects `PYTHONPATH=src:../../../../../python-runtime/src` automatically. In an external local consumer, `PythonPhases` resolves the local FishyJoes package dependency and installs `<FishyJoes>/python-runtime` instead, so a clean generated Python package can import `fishyjoes_python` without editing the consumer library.

## Python with a local FishyJoes dependency

A clean local Python validation should start from no generated bindings in the consumer:

```bash
rm -rf bindings/swift-interfaces/generated \
       bindings/kotlin/generated \
       bindings/c-sharp/generated \
       bindings/dart/generated \
       bindings/python/generated \
       bindings/ts/generated \
       bindings/ts/tests/generated \
       .github/workflows/GENERATED-*.yaml
```

Point the consumer's `Package.swift` at the local FishyJoes checkout, then run:

```bash
FISHYJOES=1 swift run -- fishy-joes --python generate build test
```

That flow should regenerate the Python package, build the module IOTA dylibs, copy the runtime dylibs into `bindings/python/generated/src/cricut_<module>/lib`, run `compileall`, run Ruff, run mypy, and execute generated smoke tests. If the consumer has hand-written tests under `bindings/python/tests`, FishyJoes runs those too with `PYTHONPATH` pointed at both the generated package and the local FishyJoes Python runtime.

## Dart with a local FishyJoes dependency

Dart has one extra local-development prerequisite: the local FishyJoes checkout must already contain its packaged IOTA runtime binary.

For release/Git dependencies, `dart run fishyjoes_dart:setup` reads `pubspec.lock`, downloads `FishyJoes-dart-binaries.tgz` from the matching FishyJoes GitHub release, and extracts `macos/native/libFishyJoesIotaRuntime.dylib` into the generated Dart package.

For path dependencies, there is no release asset to download. `setup.dart` instead archives the local dependency's platform native directory, so a local checkout must provide one of:

```text
dart-runtime/macos/native/libFishyJoesIotaRuntime.dylib
dart-runtime/linux/native/libFishyJoesIotaRuntime.so
dart-runtime/windows/native/FishyJoesIotaRuntime.dll
```

Plain `swift build` builds `libFishyJoesIotaRuntime.dylib` under `.build/...`, but it does not install that file into `dart-runtime/macos/native`. Run the runtime packaging script first:

```bash
CONFIGURATION=release ./scripts/compile-iota-runtime.sh
```

On macOS this builds `FishyJoesIotaRuntime` for both `arm64` and `x86_64`, creates `.build/apple/release/libFishyJoesIotaRuntime.dylib`, codesigns it, and copies it into both `c-sharp-runtime/runtimes/osx/native` and `dart-runtime/macos/native`.

After that, a local consumer can point `Package.swift` at this checkout and run the usual Dart flow from a clean generated tree:

```bash
FISHYJOES=1 swift run -- fishy-joes --dart generate build test
```

Current caveat: `dart run fishyjoes_dart:setup` requires GitHub credentials even when every binary source is a local path archive. In a local-only run, dummy `GITHUB_USER` and `GITHUB_TOKEN` values are sufficient because no GitHub download is attempted:

```bash
FISHYJOES=1 GITHUB_USER=local GITHUB_TOKEN=local swift run -- fishy-joes --dart generate build test
```

## Current blocker profile

- If `swift test` fails in `NAPITests` complaining about a missing Swiftly toolchain, rerun `install-toolchains`.
- If `swift test` fails in `NAPITests` with missing Node packages such as `@wasmer/wasi`, rerun `npm install` in `Tests/NAPITests/node-tests`.
- If SwiftPM resolution or toolchain installation needs network access, run those commands with approval outside the sandbox.
- The Python target now bundles `FishyJoesIotaRuntime` in addition to the module and module-Iota libraries, because real runtime bootstrap needs `FishyJoesCommonRuntime_Env_setup` at import time.
