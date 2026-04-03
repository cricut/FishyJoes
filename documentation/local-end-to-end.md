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

The Python target currently depends on the local shared runtime source during development. `PythonPhases` injects `PYTHONPATH=src:../../../../../python-runtime/src` automatically when that checkout layout exists.

## Current blocker profile

- If `swift test` fails in `NAPITests` complaining about a missing Swiftly toolchain, rerun `install-toolchains`.
- If `swift test` fails in `NAPITests` with missing Node packages such as `@wasmer/wasi`, rerun `npm install` in `Tests/NAPITests/node-tests`.
- If SwiftPM resolution or toolchain installation needs network access, run those commands with approval outside the sandbox.
- The Python target now bundles `FishyJoesIotaRuntime` in addition to the module and module-Iota libraries, because real runtime bootstrap needs `FishyJoesCommonRuntime_Env_setup` at import time.
