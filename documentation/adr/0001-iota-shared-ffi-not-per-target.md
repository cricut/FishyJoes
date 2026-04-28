# 0001. Use a shared IOTA FFI for new language targets, not per-target FFI

* **Status:** Accepted
* **Date:** 2026-04-28 *(documented; convention predates this branch)*
* **Deciders:** Project leads

## Context and problem statement

FishyJoes generates bindings from Swift to multiple target languages
(Kotlin, TypeScript/Node, C#, Dart, Python). Each target needs *some* FFI
between its host runtime and the Swift code being exposed. The earliest
targets — Kotlin (JNI) and Node (N-API) — built per-target FFI layers
designed around their host runtime's idioms. Adding more targets that way
would have meant re-writing the marshalling layer, exception propagation,
async wrapping, primitives, collections, and protocol witness logic once
per language: thousands of lines of bespoke Swift `@_cdecl` shims per
target, tracked separately and updated separately.

## Decision

**New language targets adopt the shared IOTA FFI ABI; only Kotlin and
Node continue with per-target FFI for historical reasons.**

The IOTA layer (`Sources/FishyJoesIotaRuntime/`,
`Sources/FishyJoesCore/Translators/IotaTranslator.swift`) defines a single
language-agnostic C ABI. Each Iota-family target — currently C#, Dart, and
Python — adds a thin host-runtime adapter that consumes that ABI.

## Consequences

### Positive
- ~3,000+ lines of Swift `@_cdecl` shim code written once instead of once
  per target.
- New target onboarding cost is the host-runtime adapter only (~700 LoC for
  Python's `iota/` package; comparable for C# and Dart). The cross-target
  test fixture under `integration-tests/TestAPI/` validates every consumer
  against the same ABI.
- Cross-cutting fixes (exception propagation, async, refcount semantics)
  land once in the shared IOTA layer and benefit every Iota-family target.

### Negative
- One extra indirection at every call site (host runtime → IOTA C ABI → Swift)
  versus a hand-tuned per-target shim.
- The IOTA ABI is the lowest common denominator across C#, Dart, and
  Python. Target-specific marshalling improvements (e.g. host-native string
  passing) require either upstreaming into IOTA or introducing a per-target
  fast path.

### Neutral
- Kotlin and Node remain on their original FFI layers. No plan to migrate;
  they predate IOTA and the cost-benefit doesn't favour the rewrite.

## Alternatives considered

**Per-target FFI for every language** (the Kotlin/Node pattern, applied
universally). Rejected: triples the maintenance surface for every cross-
cutting change.

**Per-target FFI for Python specifically** (use `pybind11` or a hand-rolled
ctypes layer). Rejected: would have needed parallel implementations of
retain/release semantics, exception propagation, and async marshalling
already present in IOTA. Also see [ADR-0002](0002-python-iota-only-never-jni.md)
for the Python-specific lock-in.

## Related

- [ADR-0002](0002-python-iota-only-never-jni.md) — Python-specific corollary.
- [`documentation/new-language-target-checklist.md`](../new-language-target-checklist.md)
  — checklist for onboarding a new target; this ADR is the architectural
  premise.
- `Sources/FishyJoesCore/Translators/IotaTranslator.swift` — the shared
  Swift-side translator that C#, Dart, and Python all subclass.
