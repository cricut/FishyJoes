# Python Runtime Implementation Plan

## Overview

Implementation plan for adding Python (3.12+) runtime support to FishyJoes, following the patterns established by C#, Dart, and Node.js runtimes.

## Key Design Decisions

- **Minimum Python Version**: 3.12+
- **Implementation**: Pure Python with ctypes/cffi for Swift interop
- **Packaging**: Modern `pyproject.toml` (PEP 621)
- **Type Hints**: Aim for full coverage where practical
- **Async Support**: Full asyncio integration for Swift async functions
- **Distribution**: TBD (internal use initially, PyPI later)

---

## Phase 1: Swift Runtime Foundation (Week 1-2) - ✅ 40% Complete

### 1.1 Create Swift Runtime Module

**Location**: `Sources/FishyJoesPythonRuntime/`

**Files to Create**:

- [x] `Box+Python.swift` - Python object boxing/unboxing ✅

  - Handle PyObject\* reference counting via Loader callbacks
  - Convert between Swift and Python objects
  - Follow patterns from `Box+Iota.swift`

- [x] `Env+python.swift` - Python environment integration ✅

  - Initialize Python environment via Env_setupPython C export
  - Setup memory management callbacks (NewRefFn, DeleteRefFn, etc.)
  - Type registration system for primitive converters
  - Thread safety with NSRecursiveLock
  - Follow patterns from `Env+c-sharp.swift`, `Env+dart.swift`

- [x] `PythonConverter.swift` - Type conversion infrastructure ✅ (primitives done)

  - Implement `PythonConverter` protocol
  - Handle primitive types (Bool, Int, Int64, UInt64, Float, Double, String, Void) ✅
  - TODO: Handle collections (Array, Dictionary, Set)
  - TODO: Handle optionals and Result types
  - Follow patterns from `IotaConverter.swift`

- [x] `PythonReference.swift` - Python object wrapper ✅

  - Reference wrapper for Python objects in Swift
  - Automatic refcounting via take/borrow semantics
  - Equatable/Hashable by pointer comparison

- [ ] `PythonConverter+Future.swift` - Async/await support

  - Bridge Swift async/await to Python asyncio
  - Convert Task to asyncio.Future
  - Handle coroutine suspension/resumption
  - Follow patterns from `IotaConverter+Future.swift`

- [ ] `PythonFunction.swift` - Callback handling

  - Convert Swift closures to Python callables
  - Handle function signatures with multiple parameters
  - Support async callbacks
  - Follow patterns from `IotaFunction.swift`

- [ ] `PythonReference.swift` - Reference type management

  - Track Swift objects from Python side
  - Implement proper lifetime management
  - Handle weak references if needed
  - Follow patterns from `IotaReference.swift`

- [ ] `TupleConverter.swift` - Tuple conversion
  - Convert Swift tuples to Python tuples
  - Support named tuple elements
  - Handle nested tuples

**Dependencies**:

- `FishyJoesCommonRuntime` - Common runtime utilities
- Python C API headers (system library)

### 1.2 Update Package.swift ✅

**Location**: `Package.swift`

**Changes**: ✅ Complete

```swift
// Added to products array:
P.library(
    name: "FishyJoesPythonRuntime",
    type: .dynamic,
    targets: ["FishyJoesPythonRuntime", "FishyJoesCommonRuntime"]
)

// Added system library target:
T.systemLibrary(name: "Python"),

// Added runtime target:
T.target(
    name: "FishyJoesPythonRuntime",
    dependencies: [
        .target(name: "Python"),
        .target(name: "FishyJoesCommonRuntime"),
    ],
    swiftSettings: strictConcurrencyFlags
)
```

### 1.3 Create Python C API Module Map ✅

**Location**: `Sources/Python/module.modulemap` ✅

```c
module Python [system] {
    // Platform-specific Python 3.12 headers
    header "/usr/include/python3.12/Python.h"      // Linux
    header "/usr/local/include/python3.12/Python.h" // macOS
    header "C:/Python312/include/Python.h"         // Windows
    link "python3.12"
    export *
}
```

---

## Phase 2: Python Runtime Library (Week 2-3) - ✅ 90% Complete

### 2.1 Create Python Package Structure ✅

**Location**: `python-runtime/`

**Directory Structure**: ✅ Complete

```
python-runtime/
├── pyproject.toml ✅
├── README.md ✅
├── .gitignore ✅
├── fishyjoes_runtime/
│   ├── __init__.py ✅
│   ├── py.typed ✅
│   ├── loader.py ✅ (265 lines - core FFI bridge)
│   ├── utilities.py ✅ (error handling, ctypes helpers)
│   ├── swift_reference.py ✅ (reference wrapper with refcounting)
│   ├── result.py ✅ (Result[S, E] with Python 3.12+ syntax)
│   ├── swift_range.py ✅ (Range and ClosedRange types)
│   ├── attributed_string.py ⏸️ (defer to integration tests)
│   ├── _loader_primitives.py ⏸️ (TODO: implement _setup_primitives)
│   ├── _loader_collections.py ⏸️ (TODO: Array, Dict, Set converters)
│   ├── _loader_tuples.py ⏸️ (TODO: Tuple converters)
│   ├── _loader_futures.py ⏸️ (TODO: async/await support)
│   ├── _loader_ranges.py ⏸️ (defer)
│   └── _loader_results.py ⏸️ (defer)
└── tests/
    ├── __init__.py ✅
    └── test_runtime.py ✅ (16 tests - all passing)
```

### 2.2 Core Python Files

**`pyproject.toml`**:

```toml
[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "fishyjoes-runtime"
version = "0.0.1"
requires-python = ">=3.12"
description = "FishyJoes runtime for Python bindings to Swift libraries"
readme = "README.md"
license = {text = "Proprietary"}
authors = [
    {name = "Cricut", email = "clientenablement@cricut.com"}
]
classifiers = [
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3.12",
    "Programming Language :: Python :: 3.13",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.4.0",
    "pytest-asyncio>=0.21.0",
    "mypy>=1.5.0",
    "ruff>=0.0.291",
]

[tool.setuptools.packages.find]
include = ["fishyjoes_runtime*"]

[tool.setuptools.package-data]
fishyjoes_runtime = ["py.typed", "*.dylib", "*.so", "*.dll"]

[tool.pytest.ini_options]
asyncio_mode = "auto"
testpaths = ["tests"]

[tool.mypy]
python_version = "3.12"
strict = true
warn_return_any = true
warn_unused_configs = true

[tool.ruff]
line-length = 100
target-version = "py312"
```

### 2.2 Core Python Files ✅

**`pyproject.toml`**: ✅ Complete

- Modern PEP 621 configuration
- Python 3.12+ requirement
- Dev dependencies: pytest, pytest-asyncio, mypy, ruff
- Strict mypy configuration
- Ruff linter with Python 3.12 target

**`fishyjoes_runtime/__init__.py`**: ✅ Complete

```python
"""FishyJoes runtime for Python bindings to Swift libraries."""

from fishyjoes_runtime.loader import Loader
from fishyjoes_runtime.result import Failure, Result, Success, failure, success
from fishyjoes_runtime.swift_range import IntClosedRange, IntRange, SwiftClosedRange, SwiftRange
from fishyjoes_runtime.swift_reference import SwiftReference
from fishyjoes_runtime.utilities import NullPointerError, SwiftError

__version__ = "0.0.1"

__all__ = [
    "Loader",
    "Result", "Success", "Failure", "success", "failure",
    "SwiftReference",
    "SwiftRange", "SwiftClosedRange", "IntRange", "IntClosedRange",
    "NullPointerError", "SwiftError",
    "__version__",
]
```

**`fishyjoes_runtime/loader.py`**: ✅ Core loader (265 lines)

- [x] Load Swift dylib using ctypes (\_find_library with platform detection)
- [x] Initialize Swift environment (initialize() calls Env_setupPython)
- [x] Callback system for Swift-Python interop (5 callbacks)
- [x] Memory management hooks (\_new_ref_callback, \_delete_ref_callback)
- [x] Reference counting integration via SwiftReference
- [x] Type registration (get_type_id)
- [x] \_bag for keeping callback references alive
- [ ] TODO: \_setup_primitives() implementation
- [ ] TODO: Handle mapping for converters

**`fishyjoes_runtime/utilities.py`**: ✅ Complete (146 lines)

- [x] Error checking and exception mapping (check_error, SwiftError)
- [x] NullPointerError exception class
- [x] CatchingContext manager for Swift exception handling
- [x] C function signature factories (NewRefFn, DeleteRefFn, etc.)
- [x] Type conversion helpers (ensure_bytes, ensure_str, unwrap)

**`fishyjoes_runtime/swift_reference.py`**: ✅ Complete (85 lines)

- [x] Wrapper for Swift reference types
- [x] Implement `__del__` for cleanup via Loader.delete_ref()
- [x] Handle pointer storage (c_void_p)
- [x] Take/borrow ownership semantics
- [x] **eq**/**hash** by pointer comparison

**`fishyjoes_runtime/result.py`**: ✅ Complete (75 lines)

- [x] Generic Result[S, E] type using Python 3.12+ PEP 695 syntax
- [x] Success[S] and Failure[E] dataclasses
- [x] ResultHelpers with map/flatMap/get/get_or
- [x] Convenience functions (success(), failure())
- [ ] Pattern matching helpers
- [ ] Type hints with TypeVar

**`fishyjoes_runtime/swift_range.py`**:

- [ ] SwiftRange (half-open range)
- [ ] SwiftClosedRange
- [ ] Python range() integration

**`fishyjoes_runtime/attributed_string.py`**:

- [ ] AttributedString support
- [ ] AttributeContainer
- [ ] Character view
- [ ] Runs support

### 2.3 Loader Sub-modules

**`_loader_primitives.py`**:

- [ ] Int, UInt, Int64, Float, Double, String, Bool converters
- [ ] Void/None handling
- [ ] Register converters with main loader

**`_loader_collections.py`**:

- [ ] Array/List converter
- [ ] Dictionary/Dict converter
- [ ] Set converter
- [ ] Generic collection handling

**`_loader_tuples.py`**:

- [ ] Tuple2 through Tuple5+ converters
- [ ] Named tuple support
- [ ] Nested tuple handling

**`_loader_futures.py`**:

- [ ] Swift Task to asyncio.Future bridge
- [ ] Coroutine wrapper
- [ ] Event loop integration
- [ ] Cancellation support

**`_loader_ranges.py`**:

- [ ] Range type converters
- [ ] ClosedRange converters

**`_loader_results.py`**:

- [ ] Result type converters
- [ ] Exception mapping

---

## Phase 3: Code Generation Support (Week 3-5)

### 3.1 Create Python Translator

**Location**: `Sources/FishyJoesCore/Translators/PythonTranslator.swift`

- [ ] Implement `Translator` protocol
- [ ] `setupFragments()` - Generate `_type_setup.py`
- [ ] Type conversion methods for all supported types
- [ ] Handle generic instantiation
- [ ] Follow patterns from `CSharpTranslator.swift`

**Key Methods**:

- `python(method:of:context:)` - Convert Method to Python
- `python(field:of:context:)` - Convert Field to Python
- `python(type:context:)` - Resolve Python type name
- Parameter handling with type hints
- Default value conversion

### 3.2 Create Python Unparser Classes

**Location**: `Sources/FishyJoesCore/Unparse/`

**`PythonClass.swift`**:

- [ ] Generate Python class definitions
- [ ] `__init__` method generation
- [ ] Property getters/setters with `@property`
- [ ] Instance and static methods
- [ ] Type hints (using `typing` module)
- [ ] Docstrings from Swift documentation
- [ ] `__repr__`, `__eq__` special methods
- [ ] 4-space indentation

**`PythonProtocolClass.swift`**:

- [ ] Generate Protocol as ABC (Abstract Base Class)
- [ ] Abstract methods with `@abstractmethod`
- [ ] Protocol inheritance
- [ ] Default implementations
- [ ] Type hints for protocol methods

**`PythonEnumClass.swift`**:

- [ ] Generate `enum.Enum` subclasses
- [ ] Simple enums (no associated data)
- [ ] Associated data as dataclass members
- [ ] Enum methods

**`PythonProductClass.swift`**:

- [ ] Generate dataclasses for product types
- [ ] POD structs as `@dataclass`
- [ ] Memberwise initializers
- [ ] Type hints for all fields

### 3.3 Python Type System

**Location**: `Sources/FishyJoesCore/Unparse/PythonClass.swift`

**Define PythonType enum**:

```swift
enum PythonType {
    case void  // None
    case primitive(String, swiftName: String)  // int, float, str, bool
    case named(module: String?, name: String)
    case generic(name: String, typeArgs: [PythonType])
    case optional(PythonType)  // Optional[T]
    case tuple([PythonType])
    case callable(params: [PythonType], returnType: PythonType)
    case coroutine(returnType: PythonType)  // Coroutine[Any, Any, T]

    func pythonTypeHint() -> String
    func pythonTypeName() -> String
}
```

### 3.4 Update Core Context

**Location**: `Sources/FishyJoesCore/FishyJoesContext.swift`

- [ ] Add `pythonClasses: [PythonClass]` collection
- [ ] Add `pythonFragment(_ filename: String)` method
- [ ] Register Python translator
- [ ] Python-specific helper methods

---

## Phase 4: Build & Execution Support (Week 5-6)

### 4.1 Create Python Build Phases

**Location**: `Sources/FishyJoesExecute/Phases/PythonPhases.swift`

```swift
class PythonPhases: Phases {
    func generationPhaseTemplateReplacements() throws -> [String: String]
    func preBuildPhase() throws
    func buildSwiftPhase() throws
    func preInstallPhase() throws
    func installPhase() throws
    func compileHostLanguagePhase() throws
    func preTestPhase() throws
    func testPhase() throws
    func packPhase() throws
}
```

**Implementation Details**:

- [ ] `generationPhaseTemplateReplacements()` - Module name, version, dependencies
- [ ] `buildSwiftPhase()` - Build FishyJoesPythonRuntime dylib
- [ ] `installPhase()` - Copy dylib to `fishyjoes_runtime/` in bindings
- [ ] `compileHostLanguagePhase()` - Run `pip install -e .` or validate
- [ ] `testPhase()` - Run `pytest` with coverage
- [ ] `packPhase()` - Build wheel with `python -m build`

### 4.2 Update Platform Support

**Location**: `Sources/FishyJoesExecute/Platform.swift`

**Add to Platform enum**:

```swift
case python
```

**Implement platform-specific methods**:

- [ ] Add to `allCases`
- [ ] Update `description` property
- [ ] Update `dylibName()` - platform-specific extension
- [ ] Update `outputDir()` - `"bindings/python/generated/fishyjoes_runtime/"`
- [ ] Update `packageDescription()` - Python description
- [ ] Update `platform` computed property

### 4.3 Update CLI

**Location**: `Sources/FishyJoesExecute/CodeGen.swift`

```swift
@Flag(name: .long, inversion: .prefixedNo, help: "Generate a Python package")
var python = false
```

- [ ] Add `--python` flag
- [ ] Wire up `PythonPhases` in execution logic
- [ ] Update platform selection to include Python

---

## Phase 5: Build Scripts (Week 6)

### 5.1 Create Python Runtime Build Script

**Location**: `scripts/compile-python-runtime.sh`

```bash
#!/bin/bash
set -euxo pipefail

CONFIGURATION="${CONFIGURATION:-release}"
commonOptions=("$@" --configuration "$CONFIGURATION")

# Build for current platform
if [[ "$(uname -s)" == "Darwin" ]]; then
    # macOS: Build universal binary
    swift build "${commonOptions[@]}" --product FishyJoesPythonRuntime --arch arm64
    swift build "${commonOptions[@]}" --product FishyJoesPythonRuntime --arch x86_64

    BIN_DIR=".build/apple/$CONFIGURATION"
    mkdir -p "$BIN_DIR"
    lipo -create \
         -output "$BIN_DIR/libFishyJoesPythonRuntime.dylib" \
         .build/{arm64,x86_64}-apple-macosx/"$CONFIGURATION"/libFishyJoesPythonRuntime.dylib

    # Copy to runtime
    cp "$BIN_DIR/libFishyJoesPythonRuntime.dylib" \
       python-runtime/fishyjoes_runtime/

elif [[ "$(uname -s)" == *_NT* ]]; then
    # Windows
    swift build "${commonOptions[@]}" --product FishyJoesPythonRuntime
    BIN_DIR="$(swift build --configuration "$CONFIGURATION" --show-bin-path)"
    cp "$BIN_DIR/FishyJoesPythonRuntime.dll" \
       python-runtime/fishyjoes_runtime/

else
    # Linux
    swift build "${commonOptions[@]}" --product FishyJoesPythonRuntime
    BIN_DIR="$(swift build --configuration "$CONFIGURATION" --show-bin-path)"
    cp "$BIN_DIR/libFishyJoesPythonRuntime.so" \
       python-runtime/fishyjoes_runtime/
fi

echo "Python runtime built successfully"
```

- [ ] Handle platform-specific library names
- [ ] Set proper RPATH for library loading
- [ ] Copy to correct location in python-runtime

---

## Phase 6: Templates & Resources (Week 7)

### 6.1 Create Project Templates

**Location**: `Sources/FishyJoesExecute/Resources/python/`

**Files to Create**:

- [ ] `pyproject.toml.part` - Package configuration template
- [ ] `__init__.py.part` - Module init template
- [ ] `py.typed` - Empty marker file for type hints
- [ ] `.gitignore` - Python-specific ignores
- [ ] `README.md.part` - Package documentation template

### 6.2 Create Test Templates

- [ ] `conftest.py.part` - pytest fixtures
- [ ] `test_example.py.part` - Sample test file

---

## Phase 7: Integration Tests (Week 7-8)

### 7.1 Create Python Test Suite

**Location**: `integration-tests/TestAPI/bindings/python/tests/`

**Port tests from existing runtimes**:

- [ ] `test_primitives.py` - Int, Float, String, Bool
- [ ] `test_collections.py` - List, Dict, Set
- [ ] `test_structs.py` - POD and reference structs
- [ ] `test_enums.py` - Simple and associated data enums
- [ ] `test_classes.py` - Reference types
- [ ] `test_protocols.py` - Protocol conformance
- [ ] `test_async.py` - Async/await with asyncio
- [ ] `test_closures.py` - Function callbacks
- [ ] `test_tuples.py` - Tuple handling
- [ ] `test_results.py` - Result types
- [ ] `test_ranges.py` - Range types
- [ ] `test_optionals.py` - Optional parameters
- [ ] `test_defaults.py` - Default arguments
- [ ] `test_attributed_strings.py` - AttributedString

### 7.2 Test Infrastructure

- [ ] Setup pytest configuration
- [ ] Async test support with pytest-asyncio
- [ ] Fixtures for common setup
- [ ] Coverage reporting
- [ ] Type checking with mypy in CI

---

## Phase 8: CI/CD Integration (Week 8)

### 8.1 Update GitHub Actions

**Location**: `.github/workflows/`

**`unit-tests.yaml`**:

```yaml
- name: Setup Python
  uses: actions/setup-python@v4
  with:
    python-version: '3.12'

- name: Build Python runtime
  run: ./scripts/compile-python-runtime.sh

- name: Install Python runtime
  run: |
    cd python-runtime
    pip install -e ".[dev]"
```

**`integration-tests.yaml`**:

```yaml
- name: Test Python via fishy-joes
  run: |
    cd integration-tests/TestAPI
    FISHYJOES=1 swift run -- fishy-joes --python build test
```

### 8.2 Add Quality Checks

- [ ] Run `mypy` for type checking
- [ ] Run `ruff` for linting
- [ ] Generate coverage reports
- [ ] Upload to SonarCloud if configured

---

## Phase 9: Documentation (Week 9)

### 9.1 Update Main Documentation

- [ ] Update `README.md` with Python sections
- [ ] Add Python to workflow examples
- [ ] Document Python version requirement (3.12+)

### 9.2 Create Python-Specific Docs

**Location**: `documentation/`

- [ ] `python-getting-started.md` - Quick start guide
- [ ] `python-api-reference.md` - Runtime API documentation
- [ ] `python-examples.md` - Code examples
- [ ] Update `cans-and-cannots.md` with Python notes

### 9.3 Update Copilot Instructions

- [x] Added Python to `.github/copilot-instructions.md`
- [ ] Document Python-specific patterns
- [ ] Add Python testing workflow

---

## Phase 10: Polish & Testing (Week 9-10)

### 10.1 Type Hints & Validation

- [ ] Full type coverage in runtime
- [ ] Run mypy in strict mode
- [ ] Fix all type issues
- [ ] Generate type stubs if needed

### 10.2 Error Handling

- [ ] Map Swift errors to Python exceptions
- [ ] Clear error messages
- [ ] Test error propagation
- [ ] Document exception hierarchy

### 10.3 Memory Management

- [ ] Profile for memory leaks
- [ ] Test reference counting
- [ ] Ensure proper cleanup
- [ ] Document memory model

### 10.4 Performance

- [ ] Profile hot paths
- [ ] Optimize critical conversions
- [ ] Compare with C# runtime performance
- [ ] Document performance characteristics

---

## Testing Strategy

### Unit Tests

- Test each converter independently
- Test type conversions in isolation
- Test error handling
- Test memory management

### Integration Tests

- Full round-trip Swift → Python → Swift
- All supported type patterns
- Async/await scenarios
- Error propagation
- Memory leak tests

### Manual Testing

- Test on macOS (x86_64, ARM64)
- Test on Linux (Ubuntu)
- Test on Windows
- Test with different Python 3.12.x versions

---

## Success Criteria

### Minimum Viable Product (MVP)

- [ ] Generate Python bindings for basic types
- [ ] Runtime loads and initializes successfully
- [ ] Primitives work (int, float, str, bool)
- [ ] Collections work (list, dict, set)
- [ ] Simple structs work (POD types)
- [ ] Basic functions callable from Python
- [ ] Tests pass on at least one platform

### Full Feature Parity

- [ ] All types from TestAPI generate successfully
- [ ] Reference types work correctly
- [ ] Enums with associated data work
- [ ] Protocols/ABCs work
- [ ] Async/await fully functional
- [ ] Closures/callbacks work
- [ ] Memory management is sound
- [ ] Tests pass on all platforms
- [ ] Documentation complete
- [ ] CI/CD fully integrated

---

## Timeline Summary

| Phase                | Duration     | Key Deliverables                            |
| -------------------- | ------------ | ------------------------------------------- |
| 1. Swift Runtime     | 2 weeks      | Swift runtime module, Package.swift updates |
| 2. Python Runtime    | 1 week       | Python package with core functionality      |
| 3. Code Generation   | 2 weeks      | Translator, unparser, type system           |
| 4. Build Support     | 1 week       | Build phases, platform support, CLI         |
| 5. Build Scripts     | 0.5 weeks    | compile-python-runtime.sh                   |
| 6. Templates         | 0.5 weeks    | Project templates, test templates           |
| 7. Integration Tests | 1 week       | Full test suite ported to Python            |
| 8. CI/CD             | 0.5 weeks    | GitHub Actions integration                  |
| 9. Documentation     | 0.5 weeks    | Docs and guides                             |
| 10. Polish           | 1 week       | Type hints, performance, testing            |
| **Total**            | **10 weeks** | **Production-ready Python runtime**         |

---

## Next Steps

1. **Get approval** on this plan
2. **Set up development environment** with Python 3.12+
3. **Create feature branch** for Python runtime work
4. **Start with Phase 1** - Swift runtime foundation
5. **Iterate with small PRs** rather than one massive PR
6. **Test continuously** as each phase completes

---

## Open Questions

1. **Should we support Python 3.13** when it becomes stable?
2. **Distribution strategy**: Internal only, or plan for PyPI?
3. **C extension optimization**: If performance is critical, consider Cython later
4. **Type stub generation**: Auto-generate .pyi files or inline types?
5. **GIL handling**: Any special considerations for multi-threaded Swift code?
6. **Virtual environment handling**: Document best practices?

---

## Resources & References

- **Python C API**: https://docs.python.org/3/c-api/
- **ctypes Documentation**: https://docs.python.org/3/library/ctypes.html
- **PEP 621** (pyproject.toml): https://peps.python.org/pep-0621/
- **Type Hints PEP 484**: https://peps.python.org/pep-0484/
- **Asyncio**: https://docs.python.org/3/library/asyncio.html
- **Existing runtimes**: Study `c-sharp-runtime/`, `dart-runtime/`, `node-runtime/`
