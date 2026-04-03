# fishyjoes_python

Shared Python runtime support for FishyJoes-generated bindings.

## Scope

This package is the v1 Python runtime skeleton for CPython-only bindings built on the existing FishyJoes Iota ABI model.

## Supported

- CPython 3.11+
- abi3 extension packaging
- loader helpers for native shared libraries
- reference and error conversion helpers
- callback bookkeeping helpers

## Non-goals

- PyPy support
- free-threaded / no-GIL Python
- subinterpreters
- automatic support for every packaging target on day one
- a full generated binding surface without the FishyJoes code generator

