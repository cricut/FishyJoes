# 0012. Python UX Includes Typing And Diagnostics

## Status

Proposed

## Context

A production Python target is not complete when FFI calls work. Python users
also need type information, stable names, importable packages, and useful
failures.

## Options Considered

- Generate runtime-callable Python only.
  This minimizes generator work, but produces a poor editor/type-checker
  experience and makes API mistakes harder to catch before runtime.
- Generate `.pyi` stubs and mark packages as typed.
  This improves editor and type-checker behavior while keeping runtime modules
  focused on execution.
- Rely on runtime exceptions for diagnostics.
  This is easy, but import and FFI failures become hard to diagnose.
- Add explicit diagnostics.
  This adds surface area, but it makes production failures manageable.
- Expose both Swift `camelCase` names and Python `snake_case` aliases as public
  generated members.
  This makes pasted Swift examples work in Python, but it doubles the visible
  API surface, clutters autocomplete and stubs, complicates collision handling,
  and makes the generated package feel less like a normal Python package. This
  remains a possible explicit compatibility mode, but it is not the default
  architecture.

## Decision

Generated Python packages include:

- `.pyi` type stubs for generated modules.
- A `py.typed` marker.
- Stable generated names with collision handling for Python keywords, builtins,
  dunder names, leading underscores, case-only differences, module/package name
  collisions, and exported Swift names that normalize to the same Python name.
- Idiomatic Python public names by default, including `snake_case` functions,
  methods, properties, and parameters when the Swift export spelling is not
  already idiomatic Python.
- Generated static Swift-origin metadata so users, documentation, and
  diagnostics can map Python-visible members back to Swift declarations. This
  metadata is not a runtime dispatch map; generated Python calls still bind
  directly to the real Iota symbols.
- Diagnostic helpers that expose loaded library paths, package versions, runtime
  versions, Iota ABI versions, and setup state.
- Clear import/setup errors for missing dylibs, architecture mismatch, missing
  symbols, wrong ABI version, and dependency setup failure.

## Tradeoffs

Generated stubs and origin metadata increase generated output size and add
artifacts that must stay deterministic.

Collision handling can produce less pretty names in rare cases, but predictable
safe names are better than import-time failures or shadowed APIs.

## Consequences

The Python generator needs tests for naming collisions and generated `.pyi`
content.

Packaging tests must verify that `py.typed` and stubs are included in wheels.
