# 0009. Python cffi Declarations Define The ABI Contract

## Status

Proposed / Implemented

## Context

Python cffi calls need exact C declarations. A wrong integer width, nullability
assumption, ownership convention, callback typedef, or calling convention can
produce crashes rather than ordinary Python exceptions.

The generated `_declarations.h` must therefore be more than a convenience file.
It is the Python target's ABI contract with generated Swift Iota shims and the
shared Iota runtime.

## Options Considered

- Let cffi infer from ad hoc declarations in generated Python modules.
  This is quick to start, but it spreads ABI knowledge through generated Python
  code and makes drift likely.
- Maintain a handwritten shared runtime declaration file.
  This is easy for runtime functions, but it cannot safely track generated
  per-module symbols.
- Generate one `_declarations.h` file from the same symbol model that emits
  Swift Iota shims.
  This makes the generated header the reviewed ABI surface and lets tests verify
  declarations against actual exported symbols.

## Decision

FishyJoes generates `_declarations.h` as the cffi ABI contract for each Python
binding package.

The declaration model must define:

- `foreignObject` as an opaque pointer.
- `foreignOutExn` as a pointer to `foreignObject`.
- `EnvRef` as an opaque environment pointer.
- Fixed-width primitive mappings for Swift integer and floating-point types.
- The platform width mapping for Swift `Int` and `UInt`.
- Nullability for every pointer parameter and return value.
- Ownership for each pointer value: borrowed, created, consumed, or retained.
- Callback typedef names and signatures for protocols, functions, futures,
  collections, ranges, results, tuples, strings, data, URLs, references, and
  generated type setup.
- Calling convention assumptions for every platform. If Windows requires
  explicit cdecl spelling in cffi declarations, the generator must emit it.

The generated header should include ownership comments even where C cannot
enforce ownership. Generated Python code and tests must use those annotations as
the source of truth for reference handling.

## Tradeoffs

Generating a complete ABI header adds generator work before many user-visible
Python wrappers can run.

Ownership comments are not machine-enforced by C, so the Python runtime still
needs focused ownership tests.

Declaring ABI details explicitly may expose existing Iota inconsistencies that
C# and Dart tolerate through different FFI tooling.

## Consequences

Symbol verification must check both declaration presence and actual exported
symbol presence.

The Python runtime should centralize conversion from cffi raw values to typed
runtime wrappers so generated code does not reinterpret ABI details.

Any shared Iota ABI change that affects Python declarations must update the
declaration emitter and its verification tests in the same feature slice.
