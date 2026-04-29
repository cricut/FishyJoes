# 0006. Disambiguate colliding Python class names via the Swift export annotation

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

Three Swift types nested under different namespaces can share the same
final segment. The `TestAPI` integration fixture has four:
- `Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces`
- `Swift.String.PuttingTypesIntoQuestionablePlaces`
- `TestAPI.Structs.PuttingTypesIntoQuestionablePlaces`
- `Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces`

Without disambiguation, the Python generator emits all four into a
single `PuttingTypesIntoQuestionablePlaces.py` with four identical
`class PuttingTypesIntoQuestionablePlaces:` declarations. Source-level
shadowing means only the last one is reachable; the runtime registry's
`_cls_<setupName>` aliases then resolve to whichever class definition
won the contest, producing surprising errors at FFI registration time
and a `type[…]` mismatch at mypy.

The Swift author always already encodes a disambiguated name in the
export annotation:
```swift
extension Structs {
    /// <!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->
    public struct PuttingTypesIntoQuestionablePlaces { … }
}
```

## Decision

**When two `PythonClass` instances share an `unqualifiedName`, parse the
export annotation `<!-- FishyJoes.export(NAME) -->` (or
`exportReference(NAME)`) out of the doc comment and use `NAME` verbatim
as the Python class name and file-name stem.**

Implemented as
`PythonClass.exportAnnotationName()` and
`FishyJoesContext.translateAll`'s pre-`setupFragments` collision pass.
Non-colliding classes keep their bare unqualified name and are not
affected.

## Consequences

### Positive
- Disambiguation is deterministic and author-controlled. Whatever name
  the Swift author chose in the annotation is what the Python class is
  named; no surprises from machine-generated mangling.
- Cross-target consistency: the Swift export comment is the same string
  Kotlin's, C#'s, and Dart's binding generators read for naming, so
  every target picks the same disambiguated name.
- Non-colliding classes are unaffected. The diff against pre-disambiguation
  output is empty for the common case.

### Negative
- Requires the Swift author to write a deliberate export annotation when
  collisions are possible. If two colliding types have identical
  annotations (or both are auto-generated from the bare name), the
  generator's collision detection still fires but cannot produce a
  unique disambiguation; that case is currently a generator-error
  condition handled by `pythonClassName(forSetup:fallback:)` falling
  back to the bare name, which then fails at mypy.

### Neutral
- The tracking regression net (`tests/test_generated_no_name_collision.py`)
  asserts no module emits two top-level classes with the same name, so a
  future case where the heuristic fails surfaces in CI rather than at
  runtime.

## Alternatives considered

**Prepend the immediate Swift namespace segment from the mangled
type name.** `Foundation.AttributedString.PuttingTypes…` →
`AttributedString_PuttingTypes…`. Tried first. Rejected: Swift's
`mangledName` replaces `.` with `_`, so the parent-segment extraction
became fragile (e.g. `Foundation_AttributedString_…` resolves to
`AttributedString` cleanly, but `TestAPI_Structs_…` resolves to
`Structs` while `TestAPI_…` (no intermediate namespace) resolves to
`TestAPI` — inconsistent with the Swift author's intent). The export
annotation already encodes the right answer, so leaning on it removes
guesswork.

**Always use the fully-qualified mangled name.** Stable, never collides,
but verbose for every class — `TestAPI_Structs_PrimitiveHolder` for a
type that has no collision peer and didn't need disambiguation.
Rejected: cost falls on the 99% non-colliding case to fix the 1%
colliding case.

**Refuse to generate when a collision is detected.** Author must
manually rename one of the Swift types or export comments. Rejected: the
export annotation already has the right information; refusing to use it
shifts the problem to the Swift side without adding any safety.

## Related

- [`documentation/plans/implemented/python-followups-plan.md`](../plans/implemented/python-followups-plan.md)
  §2.A — TDD step that landed the implementation.
- `Sources/FishyJoesCore/Unparse/PythonClass.swift:exportAnnotationName` —
  parser.
- `Sources/FishyJoesCore/FishyJoesContext.swift:translateAll` —
  collision-detection pass.
- `Sources/FishyJoesCore/Translators/PythonTranslator.swift:pythonClassName` —
  setup-line lookup that propagates the disambiguated name into runtime
  registration calls.
- `python-runtime/tests/test_generated_no_name_collision.py` — regression
  net.
