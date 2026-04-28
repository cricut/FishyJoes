# Architecture Decision Records

Load-bearing decisions about FishyJoes architecture, scope, and language-target
shape live here. One file per decision, MADR-flavoured format ([template](0000-template.md)).

## When to write an ADR

Write one when:
- A choice constrains how future contributors are allowed to extend the project.
- The "obvious" path was rejected and someone will eventually try to take it again.
- A deliberate piece of tech debt was accepted instead of fixed.

Skip the ADR for:
- Plain implementation details a future change can flip without breaking anyone.
- Day-to-day work tracked in `documentation/python-*-plan.md` and similar plans.
- Per-target user-facing scope; that lives in each runtime's `README*.md`.

## When to supersede

Decisions evolve. When a new ADR replaces an old one:
1. Set the old ADR's status to `Superseded by ADR-NNNN`.
2. Cross-link from `Related`.
3. Keep the old ADR — the historical context matters.

## Index

| ID | Status | Title |
|---|---|---|
| [0001](0001-iota-shared-ffi-not-per-target.md) | Accepted | Use a shared IOTA FFI for new language targets, not per-target FFI |
| [0002](0002-python-iota-only-never-jni.md) | Accepted | Python target uses IOTA exclusively, never JNI |
| [0003](0003-python-cpython-only.md) | Accepted | The Python target supports CPython only |
| [0004](0004-python-min-version-3.11.md) | Accepted | Minimum Python version is 3.11 |
| [0005](0005-attributedstring-as-reference-type.md) | Accepted | AttributedString is a reference type in target languages |
| [0006](0006-class-disambiguation-via-export-annotation.md) | Accepted | Disambiguate colliding Python class names via the Swift export annotation |
| [0007](0007-qualify-builtins-always.md) | Accepted | Always qualify Python builtins as `builtins.<name>` in generated annotations |
| [0008](0008-assume-helper-for-ffi-boundaries.md) | Accepted | Use `_assume(value, kind)` for FFI-boundary type narrowing |
| [0009](0009-attributedstring-views-as-property.md) | Accepted | Generated AttributedString views are plain `@property`, never `@cached_property` |
| [0010](0010-python-thread-scheduling-refuse-loudly.md) | Accepted | Python runtime refuses thread-scheduling loudly until a real executor exists |
| [0011](0011-attributedstring-cow-future-fix.md) | Proposed | Restoring Swift COW semantics for AttributedString — future direction |

## Style

- One decision per file. Naming: `NNNN-kebab-case-title.md` with a four-digit
  zero-padded sequential number.
- Keep ADRs short. The template's sections are mandatory; everything else is
  optional. Aim for under 200 lines.
- The decision goes at the top of `## Decision` as a single sentence, then the
  rationale. Skim-reading the index page should reveal the project's spine.
- Prefer linking to source files over duplicating their content. Source-of-truth
  values (constants, configuration) stay in code; ADRs explain the *why*.
