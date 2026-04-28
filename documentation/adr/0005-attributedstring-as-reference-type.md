# 0005. AttributedString is a reference type in target languages

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

Swift's `AttributedString` is a `struct` with copy-on-write storage. The
expression `var b = a; b.append(x)` does not mutate `a` because Swift's
value semantics give `b` an independent copy as soon as it diverges. The
same is true of `AttributedString.Index`.

Faithfully porting that semantic to a foreign-language wrapper would
require simulating COW across the FFI: every method call would either
need to copy the storage proactively, or hand each Python (or Kotlin, or
Dart, or C#) handle a private ref into a shared deep-clone arena. Both
options are expensive at FFI scale and complicate every wrapper method.

## Decision

**Every Iota-family target (Python, C#, Dart) and the JNI target (Kotlin)
treat `AttributedString` and `AttributedString.Index` as reference types.
A `.clone()` method is the documented escape hatch for callers who need
Swift-COW-equivalent independence.**

In Python specifically, `b = a; b.append(x)` mutates `a` too because both
names refer to the same `AttributedString` wrapper around the same Swift
object. To get the Swift-equivalent
`var b = a; b.append(x)` (`a` unchanged), callers write
`b = a.clone(); b.append(x)`.

## Consequences

### Positive
- Mutation methods are one-line `runtime.iota_lib.X(self.native_ref, …)`
  calls — no per-call cloning or arena bookkeeping.
- All Iota-family targets share the same semantic; cross-target tests
  exercise the same contract.
- `clone()` is explicit. Code that needs Swift COW semantics says so.

### Negative
- **Deviation from Swift semantics for value types.** The most surprising
  failure mode: a Python user reasons by Swift analogy ("`var b = a`
  copies"), assigns one `AttributedString` to another variable, mutates
  one, and is surprised when both change. The Python wrapper docstring
  on `replace_subrange` and similar mutators must point this out
  explicitly.
- `AttributedString.Index` is also a Swift value type but treated as a
  reference here for the same FFI reason. Lower-impact in practice
  because indices are rarely retained across mutations, but the
  divergence is real.

### Neutral
- This decision applies uniformly across language targets. A target-
  specific fix (e.g. Python-only COW emulation) would diverge from peers
  and create inconsistent semantics across the family.

## Alternatives considered

**Real COW emulation across the FFI.** Every method call would clone the
underlying Swift storage if a sibling reference exists. Rejected: very
expensive (every `append()` becomes a deep copy until reference counts
prove independence), and the bookkeeping to track sibling references
across the FFI boundary is a significant project of its own.

**Auto-clone on receipt of any value-type Swift handle.** Every time the
runtime hands a `AttributedString` from Swift to Python, clone first,
then hand back the clone's handle. Rejected: defeats the point — every
value-type return becomes an unconditional deep copy, including the
common case where the caller never mutates.

**Generate `__copy__` / `__deepcopy__` Python protocol methods.** Less
ambitious; lets `copy.copy(x)` work but does not change the default
`b = a` semantic. Rejected on its own (still surprising), but worth
considering as an addition on top of the explicit `.clone()` for users
who reach for the stdlib protocol. Tracked as a possible future
enhancement.

**[HPy](https://hpyproject.org)-style handle-aware semantics.** A future
runtime that uses HPy handles (see [ADR-0003](0003-python-cpython-only.md))
could re-evaluate this; HPy gives more flexibility around handle
ownership. Out of scope until ADR-0003 changes.

## Related

- [ADR-0003](0003-python-cpython-only.md) — the CPython handle model that
  shapes the FFI cost calculation here.
- [`documentation/python-followups-plan.md`](../python-followups-plan.md)
  §5.1 / §5.2 — first articulation of this as accepted tech debt.
- [ADR-0009](0009-attributedstring-views-as-property.md) — view caching
  decision; a downstream consequence.
- `python-runtime/src/fishyjoes_python/attributed_string.py` — wrapper
  implementations; `clone()` lives on `AttributedString`.
