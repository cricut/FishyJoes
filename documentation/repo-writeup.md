# FishyJoes Repo Writeup

## What This Repo Is

FishyJoes is a Swift-first binding generator plus runtime toolkit for exporting annotated Swift APIs to foreign languages. In this checkout, the supported foreign surfaces are:

- TypeScript on Node via N-API
- TypeScript on WASM
- Kotlin/Java via JNI
- C# via a shared "Iota" FFI runtime
- Dart via the same Iota runtime family

The repo is not just a code generator and not just a set of runtimes. It is both:

- A Swift package that contains the translation engine and reusable runtime libraries
- A CLI (`fishy-joes`) that generates, builds, tests, and packages bindings repos
- A set of published runtime artifacts for downstream bindings repos
- An integration-test fixture (`integration-tests/TestAPI`) that acts as the main end-to-end contract suite

The center of gravity is `Sources/FishyJoesCore`. The center of orchestration is `Sources/FishyJoesExecute`.

## High-Level Architecture

The repo is organized around four layers:

1. Annotation and semantic extraction
   FishyJoes reads special doc-comment annotations like `<!-- FishyJoes.export(...) -->` from Swift source symbols.

2. Internal type translation
   Sourcery is used to extract a structured dump of the Swift package, but FishyJoes does its own type resolution and translation using an internal IR.

3. Target-specific code emission
   FishyJoes emits generated Swift shims plus generated TypeScript, Kotlin, C#, and Dart source trees.

4. Runtime bridging
   Reusable runtime libraries handle actual language interop at execution time: N-API for Node/WASM, JNI for Kotlin/Java, and Iota for C#/Dart.

The important architectural point is that FishyJoes is not "a pile of Sourcery templates." Sourcery is mostly an extractor. The repo's real logic lives in FishyJoes' own translation pipeline.

## Top-Level Layout

### Swift package and products

`Package.swift` defines a multi-target Swift package. The major products are:

- `FishyJoesNodeRuntime`
- `FishyJoesJavaRuntime`
- `FishyJoesIotaRuntime`
- `JavaRuntimeTestHarness`
- `fishy-joes` executable

Some products and targets are excluded when `WASM_ONLY=1`, which keeps the WASM runtime build leaner and avoids non-WASM-only pieces.

### Main directories

- `Sources/FishyJoesCore`
  Translation engine, annotation parsing, type system, emitters
- `Sources/FishyJoesExecute`
  CLI, config loading, template installation, build/test/package orchestration
- `Sources/FishyJoesCommonRuntime`
  Shared runtime abstractions used by multiple bridges
- `Sources/FishyJoesNodeRuntime`
  Node/WASM bridge built on N-API
- `Sources/FishyJoesJavaRuntime`
  Kotlin/Java bridge built on JNI
- `Sources/FishyJoesIotaRuntime`
  Shared FFI bridge used by C# and Dart
- `node-runtime`
  Packaged Node runtime assets and module shims
- `kotlin-runtime`
  Published Kotlin runtime package and tests
- `c-sharp-runtime`
  Published .NET runtime package
- `dart-runtime`
  Native runtime packaging for Dart consumers
- `integration-tests/TestAPI`
  End-to-end fixture bindings repo used as the main compatibility oracle
- `Tests`
  Swift unit tests plus N-API/WASM conformance-style tests

## The Core Translation Model

### `FishyJoesContext`

`Sources/FishyJoesCore/FishyJoesContext.swift` is the main generation state object. It owns:

- The current module being generated
- Dependency module metadata loaded from `.fishyjoesmodule` files
- The Sourcery dump context
- A type cache
- Accumulators for generated Kotlin/C#/Dart classes
- Translator instances for Node, Kotlin, Iota, C#, and Dart

`translateAll()` is the key method. Its job is roughly:

1. Load dependent module metadata
2. Discover annotated types
3. Build translated type objects
4. Discover annotated methods and fields
5. Ask translators to emit language-specific code
6. Emit setup fragments and module metadata
7. Post-process nested classes

### `BetterType`

`Sources/FishyJoesCore/BetterType.swift` is the internal type IR. It exists because Sourcery's native type representation is not rich enough for FishyJoes' needs. `BetterType` can represent:

- Named types
- Generic instantiations
- Tuples
- Function types
- `Void`
- `Self`

This is the type system the rest of FishyJoes actually reasons about.

### `ExportAnnotation`

`Sources/FishyJoesCore/ExportAnnotation.swift` parses the embedded annotations from documentation comments. Supported metadata includes:

- Export kind: `export`, `exportReference`, `exportAsMethod`
- Alternate C# names
- Generic substitutions
- Omitted default parameters
- Compatibility ordering
- Override and no-return markers

This is effectively the public control surface for the generator.

### `TranslatedType`

The `TranslatedTypes` subtree is the real semantic engine. Each translated type knows how to describe itself for each target language/runtime shape. There are concrete translated types for:

- Primitives and unsigned primitives
- Strings and attributed strings
- Data and URLs
- Arrays, sets, dictionaries, optionals, results
- Tuples and functions
- Ranges
- Structs, enums, references, protocols, futures

If we want to extend what FishyJoes can export, this is one of the first areas to inspect.

### Unparse / code emitters

`Sources/FishyJoesCore/Unparse` contains AST-like source emitters for the host languages, such as Kotlin, C#, Dart, and Swift fragments. The repo does not build giant strings ad hoc everywhere; it has lightweight emitter types for structured generation.

## Generation Pipeline

The CLI entry point is `Sources/FishyJoesExecute/FishyJoes.swift`. The default subcommand is `CodeGen`.

### Main config

Bindings repos are configured by `bindings/fishy-joes.yaml`, parsed by `Sources/FishyJoesExecute/FishyJoesConfig.swift`.

Important config inputs include:

- `module`
- `requiredModules`
- `extraDynamicLibraries`
- `excludeSources`
- `publishRepository`
- `flexibleVersions`
- `sourceryOverride`
- `CIPreBuildHook`

Notable inconsistency: the integration-test fixture uses `CIPostCheckoutHook`, but the implementation only reads `CIPreBuildHook`. That fixture key appears stale or unused.

### What `fishy-joes generate` does

At a high level, `CodeGen`:

1. Ensures it is running inside a bindings repo
2. Reads `bindings/fishy-joes.yaml`
3. Parses the client `Package.swift` via `swift package dump-package`
4. Resolves dependent FishyJoes modules
5. Clears old generated output directories
6. Generates a bindings `Package.swift`
7. Runs Sourcery
8. Builds a `FishyJoesContext`
9. Emits generated code for all targets
10. Writes a `.fishyjoesmodule` metadata file for downstream modules

Generated outputs land under:

- `bindings/swift-interfaces/generated`
- `bindings/ts/generated`
- `bindings/kotlin/generated`
- `bindings/c-sharp/generated`
- `bindings/dart/generated`

### Platform phases

`Sources/FishyJoesExecute/Phases` contains the build/test/pack control plane.

- `NodePhases`
  Handles native Node and WASM packaging, JS assembly, shims, and npm metadata
- `KotlinPhases`
  Builds JNI libraries, installs them into Gradle resources, runs Gradle tests
- `CSharpPhases`
  Builds/install packages for .NET consumers
- `DartPhases`
  Builds/install packages for Dart consumers
- `IotaPhases`
  Shared behavior for Iota-based targets
- `BasePhases`
  Common install/template utilities

The phase abstraction is the main place to change packaging or test orchestration behavior without touching the translation engine.

## Runtime Layers

### Common runtime

`Sources/FishyJoesCommonRuntime` provides shared generic concepts:

- `Converter`
- tuple/function/future/result/collection converter families
- boxed references
- future abstraction
- common utility and error support

This layer is shared vocabulary for the bridge-specific runtimes.

### Node runtime

`Sources/FishyJoesNodeRuntime` bridges Swift values to JavaScript using N-API. The important pieces are:

- `NodeConverter.swift`
  Primitive and structured value conversion between Swift and JS
- `NodeFunction.swift`
  Bridging callable functions
- `NodeClass.swift`
  Class/type exposure into JS
- `NodeReference.swift`
  JS-managed references back to Swift
- `JavaScriptEventLoop.swift` and `JobQueue.swift`
  Async/event-loop coordination
- `TypeSetup.swift`
  Runtime registration entry point

WASM support lives here too, but with special-case behavior where N-API semantics do not map cleanly onto WASI memory. For example, `Data` conversion uses extra JS hooks in `node-runtime/fishyjoes-runtime-common/Runtime.extensions.js`.

### Java/Kotlin runtime

`Sources/FishyJoesJavaRuntime` bridges via JNI. The main responsibilities are:

- Mapping Swift values to JNI types and boxed Java/Kotlin objects
- Registering runtime support in `JNI_OnLoad`
- Handling async bridging through `JavaAsyncFunction`
- Managing Java references and callback entry points

`kotlin-runtime` is the published host-language package around this native layer. It includes Gradle config, dependencies on `android-swift-runtime`, and its own runtime tests.

### Iota runtime

`Sources/FishyJoesIotaRuntime` is the shared FFI bridge for C# and Dart. The important concept here is `Env`, which stores callback hooks supplied by the foreign host:

- reference creation/deletion
- error creation/description
- scheduling work back onto the host thread

It also manages runtime type IDs and thread-affinity helpers.

This runtime is packaged twice:

- `c-sharp-runtime` as a .NET package
- `dart-runtime` as platform-native binaries for Dart consumers

### Runtime packaging directories

The non-Swift runtime directories are packaging/distribution layers around the Swift-produced libraries:

- `node-runtime`
  npm package skeletons, runtime JS, `.d.ts` pieces, shim packaging
- `kotlin-runtime`
  Gradle module, Maven publishing, tests, native library resources
- `c-sharp-runtime`
  .NET library that loads the Iota runtime and ships per-OS native binaries
- `dart-runtime`
  Native binary layout for Dart plugins/packages

## Build and Packaging Scripts

The scripts under `scripts/` are the practical entry points used in CI and local development.

- `compile-node-runtime.sh`
  Builds `FishyJoesNodeRuntime`, builds the Node module registration shim, and installs artifacts into `node-runtime/*`
- `compile-kotlin-native-runtime.sh`
  Builds `FishyJoesJavaRuntime` and installs it into `kotlin-runtime/src/generated/resources/*`
- `compile-android-runtime.sh`
  Cross-compiles `FishyJoesJavaRuntime` for Android targets from `tool-versions.json`
- `compile-iota-runtime.sh`
  Builds `FishyJoesIotaRuntime`, copies artifacts into both C# and Dart runtime trees, and optionally packs the NuGet package
- `generate-raw-coverage.sh`
  Orchestrates coverage collection across multiple runtimes and integration suites
- `gather-coverage.sh`
  Merges raw coverage and exports Sonar-compatible reports

These scripts are effectively part of the product surface. CI depends on them heavily.

## Template Installation for Downstream Bindings Repos

`PackageInit` and `FileTemplater` exist to create or refresh the recommended file structure in a bindings repo.

The template source is embedded under:

- `Sources/FishyJoesExecute/Resources/bindings-template`

That template includes:

- Swift interface package files
- TS package files and Jest configs
- Kotlin Gradle wrapper/project files
- C# solution and test skeletons
- Dart pubspec/plugin skeletons
- Generated workflow templates

`FileTemplater` also merges user overrides into some generated JSON/YAML files, which is an important downstream customization mechanism.

## Integration Test Strategy

The repo uses layered validation rather than relying only on internal unit tests.

### Swift unit tests

The direct Swift tests are relatively small and focused:

- `FishyJoesCoreTests`
  Annotation parsing
- `FishyJoesExecuteTests`
  SwiftPM package parsing and version-format translation

These are high-value tests, but they do not cover the majority of the repo's behavior.

### N-API / WASM tests

`Tests/NAPITests` is effectively a conformance-style suite. It compiles native-api fixtures to WASM and runs Node JS tests against them. This is one of the stronger direct correctness checks for the Node/WASM runtime layer.

### Main end-to-end fixture: `integration-tests/TestAPI`

`integration-tests/TestAPI` is the most important test asset in the repo.

It is a small Swift package whose sources intentionally cover many export shapes:

- primitives
- collections
- default arguments
- enums
- structs
- classes
- protocols
- ranges
- results
- actors
- async functions
- attributed strings
- bytes and URLs

Generated bindings for this fixture are committed for TS, Kotlin, C#, Dart, and Swift interfaces. Each language also has consumer tests beside the generated output.

The key testing philosophy is:

- regenerate bindings
- build them as real consumer packages
- run real host-language tests against them

This is the repo's main regression net.

### Android app fixture

`integration-tests/android-test-app` is a separate Android consumer app used to validate:

- runtime loading
- packaged native libraries
- actual Android/device behavior

This catches packaging/runtime issues that plain Gradle JVM tests would miss.

## CI and Release Model

The main GitHub workflows cover:

- runtime build/publish for Node
- runtime build/publish for Java/Kotlin
- runtime build/publish for Iota/C#/Dart
- integration tests across macOS, Ubuntu, Windows, and Android
- coverage upload to SonarCloud
- linting

The release model is split:

- runtime repos/packages are assembled and published from this repo
- downstream bindings repos are expected to use generated workflow templates

The repo also enforces a regeneration discipline: CI checks that rerunning generation in `integration-tests/TestAPI` does not dirty committed files.

## Practical Developer Workflow

When working on FishyJoes itself, the common loop appears to be:

1. Change translation/runtime code in this repo
2. Regenerate `integration-tests/TestAPI`
3. Inspect generated diffs
4. Build the affected runtime(s)
5. Run language-specific tests through `fishy-joes ... build test`
6. Run fixture app tests if Android packaging is involved

Useful commands from the README and CI shape:

- `swift run fishy-joes generate`
- `swift run fishy-joes --nodejs build test`
- `swift run fishy-joes --wasm --nodejs build test`
- `swift run fishy-joes --kotlin-fast build test`
- `swift run fishy-joes --c-sharp build test`
- `swift run fishy-joes --dart build test`

## Where To Change Things

If the task is about export semantics, type support, or code generation:

- start in `Sources/FishyJoesCore`

If the task is about CLI behavior, config, repo templating, or packaging flow:

- start in `Sources/FishyJoesExecute`

If the task is about TS/Node runtime behavior:

- start in `Sources/FishyJoesNodeRuntime`
- then check `node-runtime`
- then check `Tests/NAPITests`

If the task is about Kotlin/Java behavior:

- start in `Sources/FishyJoesJavaRuntime`
- then check `kotlin-runtime`
- then check `integration-tests/TestAPI/bindings/kotlin`

If the task is about C# or Dart runtime behavior:

- start in `Sources/FishyJoesIotaRuntime`
- then check `c-sharp-runtime` or `dart-runtime`

If the task is about downstream bindings repo structure:

- start in `FileTemplater`
- then inspect `Resources/bindings-template`

## Current Caveats and Inconsistencies

The repo is coherent, but a few things stood out during inspection:

- The README still points at a `unit-tests.yaml` workflow badge, but that workflow file is not present.
- The integration fixture config uses `CIPostCheckoutHook`, while the implementation reads `CIPreBuildHook`.
- Some integration suites still contain placeholder example tests.
- Some N-API tests are intentionally skipped or marked unsupported.
- Coverage aggregation appears strong for Swift/Kotlin/Node/C#, but Dart coverage is not obviously part of the final Sonar upload path.
- Generation is intentionally unsupported on Windows even though build/test support exists there.

These are not blockers, but they are useful context before assuming docs and fixtures are perfectly current.

## Repo Shape at a Glance

Approximate file counts from this checkout:

- `Sources`: 227 files
- `Tests`: 156 files
- `integration-tests`: 413 files
- `Sources/FishyJoesCore`: 57 files
- `Sources/FishyJoesExecute`: 80 files
- `Sources/FishyJoesNodeRuntime`: 27 files
- `Sources/FishyJoesJavaRuntime`: 20 files
- `Sources/FishyJoesIotaRuntime`: 20 files

This is a moderate-sized repo, but the real complexity is cross-language and cross-runtime, not raw line count.

## Suggested Mental Model Going Forward

The fastest way to stay oriented is to think in three questions:

1. What Swift construct is being exported?
   This points to `FishyJoesCore`.

2. Which foreign runtime will execute it?
   This points to Node, Java/JNI, or Iota.

3. Is the issue about generated source, packaging, or runtime behavior?
   That tells us whether to inspect translators, phase orchestration, or runtime adapters.

That mental split should make most future tasks in this repo tractable.
