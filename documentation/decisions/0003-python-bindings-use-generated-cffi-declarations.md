# 0003. Python Bindings Use Generated cffi Declarations

## Status

Proposed / Implemented

## Context

Python needs to call Iota dynamic libraries. cffi can bind C ABI functions and
callbacks without requiring a large handwritten C extension.

FishyJoes already has the information needed to emit Swift shims and setup
functions. A hand-maintained Python declaration list would drift from the
generated Swift symbols.

## Options Considered

- Use cffi ABI mode with generated declarations.
  This gives typed calls and callbacks without compiling Python extension code
  for the normal path, and it ties Python declarations to FishyJoes codegen.
- Use `ctypes`.
  This avoids a third-party dependency, but callback signatures and structured
  declarations are harder to manage safely at the scale of generated bindings.
- Use a compiled C extension for the whole binding layer.
  This can be faster and can hide some pointer details, but it creates a larger
  native code surface and makes packaging/debugging more expensive.
- Use a generic dynamic invocation helper.
  This reduces generated wrapper code, but it moves symbol mistakes to runtime,
  loses per-function type clarity, and makes code review less effective.
- Maintain declarations by hand in the Python runtime.
  This is initially simple, but it will drift from generated Swift exports.

## Decision

Python bindings use cffi in ABI mode as the default FFI mechanism.

`IotaTranslator` or a shared Iota declaration emitter will generate a
`_declarations.h` file alongside Swift Iota shims. Generated Python code will
`cdef()` that header and bind functions once during setup or import.

Generated wrappers call typed cffi function objects. They do not perform generic
string-keyed dispatch for normal method, field, or setup calls.

Compiled C extensions are reserved for small, measured runtime needs that cannot
be handled safely or clearly in Python. They are not the default binding
architecture.

## Tradeoffs

cffi is an additional runtime dependency and must be included in packaging.

ABI mode still requires precise generated C declarations; bad declarations can
crash the process just like any other C FFI boundary.

Generated code will be more explicit than a generic dispatcher, but that
verbosity is useful because symbols and signatures are reviewable.

## Consequences

Generated declarations remain tied to the generator's real symbol source.

Missing symbols fail early during setup instead of being hidden behind dynamic
lookup.

The runtime remains mostly Python, which should be easier to maintain and
debug than a broad C extension layer.
