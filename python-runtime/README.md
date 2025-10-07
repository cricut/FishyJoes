# FishyJoes Python Runtime

Python runtime library for FishyJoes - enables Python bindings to Swift libraries.

## Requirements

- Python 3.12 or higher
- Swift 5.10+ (for building the native runtime library)

## Installation

```bash
# Development installation
pip install -e ".[dev]"
```

## Development

### Running Tests

```bash
pytest
```

### Type Checking

```bash
mypy fishyjoes_runtime
```

### Linting

```bash
ruff check fishyjoes_runtime tests
```

## Architecture

The runtime consists of two main components:

1. **Swift Runtime** (`libFishyJoesPythonRuntime.dylib/.so/.dll`)

   - Built from `Sources/FishyJoesPythonRuntime/`
   - Handles Swift-side type conversions and memory management

2. **Python Runtime** (`fishyjoes_runtime/`)
   - Pure Python library using ctypes for FFI
   - Provides Python-side API for generated bindings

## Usage

This runtime is typically used by generated bindings and not directly:

```python
from fishyjoes_runtime import Loader

# Generated bindings will initialize the runtime
# and provide the actual API
```

## License

Proprietary - Cricut, Inc.
