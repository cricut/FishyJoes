# 0009. Generated AttributedString views are plain `@property`, never `@cached_property`

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

`AttributedString.runs`, `.characters`, `.unicode_scalars`, and
`.substring` are accessor properties on the Python wrapper that each
materialise a fresh Swift-backed view object via a
`runtime.iota_lib.<symbol>` call. Each property access pays an FFI
round-trip plus a Python wrapper allocation.

Two natural choices for the wrapper:

- `@property` — every access calls into Swift and returns a fresh wrapper.
- `@cached_property` — first access calls Swift, subsequent accesses
  return the cached wrapper.

The performance difference is real: a hot loop like
`for r in string.runs:` allocates a new wrapper on every iteration with
plain `@property`; with `@cached_property` it reuses one.

## Decision

**Plain `@property`. Never `@cached_property`. Every view access yields
a fresh wrapper backed by Swift's current state.**

This applies uniformly to `AttributedString.runs`, `.characters`,
`.unicode_scalars`, `.substring`, `.start_index`, `.end_index`, and any
similar future view accessor.

## Consequences

### Positive
- Correct semantics under mutation. Per
  [ADR-0005](0005-attributedstring-as-reference-type.md), mutating
  methods on `AttributedString` modify the underlying Swift object in
  place. With plain `@property`, the next read reflects the new state.
  With `@cached_property`, the cached view would be stale — Python
  would silently serve a view of the pre-mutation string.
- Matches Swift's "fresh view per access" semantic on the wrapper
  surface, which is what callers reading idiomatic Swift documentation
  expect.

### Negative
- Per-access wrapper allocation. A naive `for r in string.runs:` calls
  `get_runs` once via `__iter__` (the iterator captures the view and
  walks it), but reading `string.runs[idx]` and `string.runs[other_idx]`
  separately costs two FFI calls. Profiling has not yet surfaced this
  as a real bottleneck.

### Neutral
- The user can opt into iteration-scope caching at the call site —
  `view = string.runs; for r in view: …` — without changing the
  wrapper's contract.

## Alternatives considered

**`@cached_property`.** Faster repeated access; one FFI call per view
per AttributedString instance. Rejected: caches survive across
mutations of the underlying Swift string, so subsequent reads return
stale views. The `clone()`-then-mutate pattern from ADR-0005 makes the
problem worse, not better — every clone creates a new Python wrapper
with its own cache, and the original's cache becomes silently inconsistent.

**Instance-level caching with manual invalidation on mutation.** Track
which views have been materialised on each `AttributedString` and clear
them inside `replace_subrange`, `append`, etc. Rejected: every mutator
has to remember to invalidate, and the bookkeeping cost is non-trivial
relative to the FFI call it would save. The bug-prone failure mode
(forget to invalidate) is exactly what the
"fresh view per access" rule prevents.

**Iteration-scope caching at the call site.** Recommend that users bind
`view = string.runs` once before iterating. Already supported as the
zero-cost user-side optimisation; doesn't require a wrapper-level
change.

## Related

- [ADR-0005](0005-attributedstring-as-reference-type.md) — reference-
  type semantics that make stale caches the problem they are.
- [`documentation/plans/implemented/python-followups-plan.md`](../plans/implemented/python-followups-plan.md)
  §3.G.1 — first articulation of the `@property` / `@cached_property`
  decision.
- `python-runtime/src/fishyjoes_python/attributed_string.py:AttributedString` —
  view properties implementing this rule.
