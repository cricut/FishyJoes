# 0002. Python target uses IOTA exclusively, never JNI

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

The Python target ports much of its runtime shape from the Kotlin runtime —
both expose `AttributedString`, `AttributeContainer`, `SwiftRange`, and
similar wrappers around opaque Swift handles. Kotlin reaches Swift via JNI:
each external function is declared as `@JvmName private external fun __jni_X(…)`,
backed by a per-class `loadNativeLibs()` and a `companion object init`
block. When porting from Kotlin to Python, the temptation is to mirror
that scaffolding — declare cffi/ctypes CFUNCTYPE bindings per type, load a
parallel native library handle, replicate the per-class init plumbing.

That would defeat the entire reason the Iota family exists (see [ADR-0001](0001-iota-shared-ffi-not-per-target.md)).

## Decision

**The Python target routes every FFI call through IOTA, full stop. Port
Kotlin's *contract* (Swift symbol name and signature) but not its
*implementation* (JNI external decls, `loadNativeLibs()`, companion-object
init).**

A Kotlin `external fun __jni_X(...)` becomes one
`runtime.iota_lib.X(...)` call — not a new ctypes CFUNCTYPE binding, not a
new shared-library handle, not an alternate FFI path. Symbol naming
mirrors Kotlin's JNI external names with the `FishyJoesCommonRuntime_…`
prefix that IOTA already uses.

## Consequences

### Positive
- Python wrapper modules stay small (~800 LoC for the AttributedString
  surface vs Kotlin's ~1,060). Each method is a one-liner.
- Bug fixes in shared IOTA primitives (retain/release ordering, exception
  propagation, callback lifetime) flow into Python automatically without a
  separate review.
- New Python wrappers don't require a parallel native-library load; the
  IOTA dylib is the only Python-visible entry point.

### Negative
- Python wrappers depend on the Swift side exposing each symbol through
  the IOTA `FishyJoesCommonRuntime_*` namespace. A wrapper landed before
  its Swift counterpart will fail at first FFI call with a
  `cffi.error.CompileError` or symbol-not-found, not a clean staged
  rollout. Mitigated by the
  `@unittest.skipUnless(SUPPORTED, …)` guard pattern in
  `integration-tests/TestAPI/bindings/python/tests/test_attributed_string.py`.

### Neutral
- Kotlin's JNI runtime continues unchanged. This ADR is a Python-target
  rule and does not propose Kotlin migration.

## Alternatives considered

**Per-class cffi CFUNCTYPE bindings (the Kotlin pattern, ported)**.
Rejected: re-introduces the parallel-FFI-implementation cost ADR-0001
exists to avoid; gains nothing in return because IOTA already provides the
same symbol surface.

**`pybind11` extension module per target type**. Rejected: requires a C++
toolchain in every consumer environment, adds a binary dependency the
runtime currently avoids, and doesn't change the underlying ABI shape.

## Related

- [ADR-0001](0001-iota-shared-ffi-not-per-target.md) — the shared-FFI
  premise this ADR locks in for Python specifically.
- [`documentation/plans/implemented/python-followups-plan.md`](../plans/implemented/python-followups-plan.md)
  §1.3 (guiding principles) — first written articulation of this rule.
- `python-runtime/src/fishyjoes_python/iota/_runtime.py` — the IOTA
  consumer; every wrapper module routes calls through `iota_lib`.
