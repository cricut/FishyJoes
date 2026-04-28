# 0011. Restoring Swift COW semantics for AttributedString — future direction

* **Status:** Proposed
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

[ADR-0005](0005-attributedstring-as-reference-type.md) records that every
binding-family target (Kotlin, C#, Dart, Python) currently models Swift's
`AttributedString` as a reference type and exposes a `.clone()` method
as the documented escape hatch for callers who need Swift's
copy-on-write independence. That decision is family-wide, accepted, and
correct under today's constraints.

The deviation it accepts has two distinct observable shapes:

**Case A — Python aliasing.** `s2 = s; s2.append(x)` mutates `s` too,
because both names refer to the same Python wrapper holding the same
Swift handle. Swift's `var s2 = s; s2.append(x)` would have left `s`
unchanged via COW.

**Case B — view-through-mutation.** `r1 = s.runs; s.append(x); r1.…`
shows `r1` reflecting the mutation, because the Swift `Runs` returned by
the first call is internally tied to `s`'s storage; in-place mutation of
that storage is visible to `r1`. Swift's COW would have given `s` new
storage on `append`, leaving `r1`'s storage intact.

This ADR records the question — *if and when this divergence becomes a
real problem, what is the correct fix?* — and pins the answer at the
"choose between two architectural options" stage so a future contributor
inherits the analysis rather than redoing it.

## Decision

**Defer.** No code change yet. The choice between the two viable
architectural fixes is captured below; both require non-trivial work
across either the Swift runtime (Option 4) or every target's binding
surface (Option 5).

When pressure to close the gap arrives — a concrete bug report,
integration with a Swift consumer that depends on COW, or a security
review that flags the alias surprise — the **preferred path is one of:**

- **Option 4 — true lazy COW via instrumented Swift `Box`.** Wrap each
  FFI-exposed `AttributedString` in an `AttributedStringBox` reference
  type Swift-side. Track a "potentially shared" flag, set when any view
  is taken. Mutators check the flag; if set, allocate a fresh Box (= COW)
  and return its handle, otherwise mutate in place. Python wrappers
  receive the (possibly new) handle and update `self.native_ref`. *This
  is the architecturally correct fix. It costs Swift-runtime work in
  `FishyJoesIotaRuntime` that benefits every Iota target uniformly.*

- **Option 5 — make `AttributedString` immutable in target languages.**
  Drop all 13 in-place mutators. Replace with a builder API that returns
  new instances: `s2 = s.appending(other)`, `s2 = s.replacing(range,
  replacement)`, etc. *This is the language-idiomatic fix; Python users
  would expect immutable semantics for a value type. It requires API
  rewrites across every target (Kotlin/C#/Dart all expose mutator names
  that mirror Swift's `mutating func`).*

The maintainer indicated either is acceptable, including Option 5's cost
of changing peer targets — semantic correctness is preferred over
preserving the family's current API surface if Option 5 turns out to be
the right answer.

## Consequences

### Positive
- Future contributors see this ADR before they invent a third option.
- When the work *is* taken on, reviewers compare against this analysis
  rather than re-deriving it.
- Both options are concrete enough to estimate; either could be picked
  up as a self-contained body of work.

### Negative
- The deviation from Swift continues. The most surprising failure mode
  remains a Python user reasoning by Swift analogy:
  `b = a; b.append(x)` mutates `a` (Case A). Mitigated only by
  documentation and `clone()`.
- Both viable options are large pieces of work; neither is trivial to
  squeeze into incremental backlog.

### Neutral
- `clone()` and the proposed `__copy__` / `__deepcopy__` integration
  remain useful in either future state. Option 4 makes them rarely
  needed; Option 5 makes the in-place equivalents disappear entirely.

## Alternatives considered

The full option space, ordered by ambition, with rejection reasons for
each non-recommended path:

**Option 1 — pessimistic clone-before-mutate (rejected as the *recommended* path, but acceptable as a stopgap).**
Each Python mutator first calls `clone()` on the underlying Swift
storage and updates `self.native_ref` to the clone before performing the
mutation. Fixes Case B (the original storage that views still reference
is preserved); does not fix Case A. About ten lines of Python; no Swift
change. **Rejected as the long-term answer** because it pays a clone on
every mutation regardless of whether sharing exists, which Swift's COW
specifically avoids. Acceptable as a stopgap if a real bug surfaces
before Option 4 / Option 5 land.

**Option 2 — eager view snapshotting.**
Every view accessor (`runs`, `characters`, `unicode_scalars`,
`substring`, `substring_for_range`) calls `clone()` on the parent first,
then takes the view of the clone. Fixes Case B at the cost of a full
clone on every view access, even when no mutation ever follows.
**Rejected**: pays the cost up-front in the common case (view-and-read,
no mutation) where Option 1 pays nothing. Strictly worse than Option 1
for the same correctness.

**Option 3 — `__copy__` / `__deepcopy__` integration only.**
Implement Python's standard copy protocol so `copy.copy(s)` /
`copy.deepcopy(s)` route to `s.clone()`. Fixes the subset of Case A
where the user *knew* to make an explicit copy; does not change the
default `b = a` semantic. **Rejected as the COW fix**; accepted as a
strictly-better-than-status-quo addition to be shipped today
(see Things-We-Should-Change Item A in
[`python-followups-plan.md`](../python-followups-plan.md)). Independent
of which architectural path is chosen later.

**Option 4 — true lazy COW via instrumented Swift `Box`.**
*See Decision above.* The architecturally correct fix; deferred.

**Option 5 — make `AttributedString` immutable in target languages.**
*See Decision above.* The language-idiomatic fix; deferred.

## Related

- [ADR-0005](0005-attributedstring-as-reference-type.md) — current
  reference-type decision this ADR proposes a future replacement for.
- [ADR-0009](0009-attributedstring-views-as-property.md) — view-as-
  `@property` decision that lives downstream of ADR-0005's reference-
  type choice. Option 4 would not change this; Option 5 would replace
  `@property`-style views with explicit factory methods.
- [`documentation/python-followups-plan.md`](../python-followups-plan.md)
  §5.1 / §5.2 — first articulation of the value-vs-reference debt.
- `python-runtime/src/fishyjoes_python/attributed_string.py` — wrapper
  implementations; the surface that Option 5 would refactor.
- `kotlin-runtime/.../AttributedString.kt`, `c-sharp-runtime/src/AttributedString.cs`,
  `dart-runtime/lib/AttributedString.dart` — peer runtimes that share
  the §5.1 debt; Option 4 fixes them all uniformly, Option 5 requires
  API changes in each.
