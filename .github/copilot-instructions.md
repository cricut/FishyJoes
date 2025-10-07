# FishyJoes AI Coding Instructions

## Project Overview

FishyJoes is a Swift-based code generation tool that creates foreign language bindings for Swift libraries. It generates TypeScript/Node.js, Kotlin/Android, C#/.NET, and Dart/Flutter bindings from annotated Swift code using Sourcery-based templating.

## Architecture

- **Core Generation**: `Sources/FishyJoesCore/` - Type analysis, translation, and code generation engine
- **CLI Tool**: `Sources/FishyJoesExecute/` - Main command-line interface with platform-specific build phases
- **Runtime Libraries**: Multi-platform runtimes in `*-runtime/` directories (Node.js, Kotlin, C#, Dart, Python)
- **Test Integration**: `integration-tests/TestAPI/` - Comprehensive test suite demonstrating all supported patterns

## Key Patterns

### Swift Export Annotations

Use HTML-style comments to mark Swift code for export:

```swift
/// <!-- FishyJoes.export(ForeignTypeName) -->
public struct SwiftType {}

/// <!-- FishyJoes.exportReference(RefTypeName) -->  // For reference types
public struct SwiftRefType {}

/// <!-- FishyJoes.export(methodName) -->
public func someMethod() {}

/// <!-- FishyJoes.export(genericMethod, generic: [T: [ConcreteType]]) -->
public func generic<T>(param: T) {}
```

### Platform-Specific Build Requirements

- **Generation**: macOS only (requires Sourcery and Swift Package Manager)
- **Testing**: All platforms can build and test generated bindings
- **Runtime compilation**: Use scripts in `scripts/` directory:
  - `compile-node-runtime.sh` - Builds Node.js native modules
  - `compile-kotlin-native-runtime.sh` - Builds Kotlin JNI libraries
  - `compile-iota-runtime.sh` - Builds C#/Dart native libraries
  - `compile-python-runtime.sh` - Builds Python native libraries (Python 3.12+)

### Testing Workflow

```bash
# In integration-tests/TestAPI/
swift run fishy-joes generate                    # Generate bindings
swift run fishy-joes --nodejs build test         # Test TypeScript
swift run fishy-joes --kotlin-fast build test    # Test Kotlin (fast)
swift run fishy-joes --c-sharp build test        # Test C#
swift run fishy-joes --dart build test           # Test Dart
swift run fishy-joes --python build test         # Test Python (3.12+)
```

### Code Generation Pipeline

1. **Parse**: Extract Swift types and export annotations using Sourcery
2. **Translate**: Convert Swift types to language-specific representations
3. **Unparse**: Generate target language code using templates in `Sources/FishyJoesCore/Unparse/`
4. **Build**: Platform-specific compilation using `Sources/FishyJoesExecute/Phases/`

## Important Constraints

- **No Windows Generation**: Code generation only works on macOS, but generated code builds/tests on Windows
- **POD Structs**: Value-exported structs must have public memberwise initializers
- **No Generic Types**: Only concrete type exports (except built-in generics like `Optional`, `Array`)
- **Runtime Dependencies**: Must build platform runtimes before testing bindings (`./scripts/compile-*-runtime.sh`)

## File Naming Conventions

- **Generated bindings**: `bindings/{language}/generated/`
- **Runtime templates**: `*-runtime/` directories with platform-specific structure
- **Test integration**: Mirror Swift API structure in language-specific test files

## Environment Variables

- `FISHYJOES=1` - Use local FishyJoes for development
- `CONFIGURATION=debug|release` - Build configuration
- `DISABLE_GENERATION=1` - Skip generation-only targets on non-macOS

## Development Workflow

1. Modify Swift source with FishyJoes annotations
2. Run generation: `swift run fishy-joes generate`
3. Build runtimes: `./scripts/compile-{platform}-runtime.sh`
4. Test bindings: `swift run fishy-joes --{platform} build test`
5. Check CI workflows in `.github/workflows/` for complete validation

Always verify cross-platform compatibility and ensure runtime libraries are current before testing generated bindings.
