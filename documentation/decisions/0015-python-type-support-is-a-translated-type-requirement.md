# 0015. Python Type Support Is A TranslatedType Requirement

## Status

Accepted (implemented)

## Context

Every other language target makes its per-type representation a `TranslatedType`
protocol requirement: a conformer must supply `kotlinName`, `jniType`,
`cSharpType`, `dartType`, and the C#/Dart setup parameters, so a newly added
`TranslatedType` cannot compile until its representation for those targets
exists.

Python had no such requirement. Instead, `PythonTranslator` reconstructed all
Python support from three parallel `as?`-cast chains over the same ~16 type
kinds — `pythonType` (the `.pyi`/annotation), `pythonConversion` (the runtime
descriptor expression), and `pythonCType` (the C ABI type plus the other two
bundled). The three switches had to be kept in lockstep with each other and
with the set of translated types. Because support was a switch with `nil` and
`?? .any` fallbacks rather than a compile-required member, adding a new
`TranslatedType` (as happened with `TranslatedRange`) silently fell off the
Python switches: the member or whole type vanished from generated output, or its
annotation degraded to `Any`, with no compile error and no generation-time
diagnostic.

This violates the project bar that missing Python support for a translated type
must fail at compile, generator-test, or checker time — never silently degrade
to `Any`, disappear from output, or return `None`.

## Options Considered

- Leave the three switches and add a generator test that diffs the supported
  type set. Catches drift late (test time) and still duplicates per-type
  decisions across three switches.
- Three separate non-defaulted requirements (`pythonAnnotation`, `pythonCType`,
  `pythonConversion`). Compile-forces support, maps 1:1 onto today's switches,
  but keeps the three-way duplication this change exists to remove.
- One bundled `TranslatedType` requirement that a conformer cannot compile
  without, and that collapses the three switches into a single per-type
  recursion. Chosen.

Unlike `cSharpType`/`dartType` — which are stored, non-optional, init-time
properties with no recursion guard — Python representation is computed at
generation time, is genuinely optional (a type may have no Python
representation), and recurses under struct/protocol recursion guards. The new
requirement is therefore a richer shape than the other targets', not a literal
mirror of them.

## Decision

Add a single `TranslatedType` requirement that returns the bundled Python
representation:

```swift
func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation?
```

- `PythonRepresentation` bundles the three previously-separate results: the
  `PythonType` annotation (with its imports), the C ABI type string, and the
  optional runtime conversion-descriptor expression. Collapsing them into one
  per-type method removes the three-switch duplication: a conformer computes all
  three from its children's `pythonRepresentation` in a single recursion.
- `PythonTranslationContext` carries the `FishyJoesContext`, the
  visited-structs/visited-protocols recursion guards, and the shared Python
  naming/descriptor helpers, so per-type implementations stay small and the
  naming rules stay centralized.
- `PythonType` and `PythonImport` move out of `PythonTranslator` into the shared
  model so conformers can return them.
- `nil` semantics are precise: a `nil` result means "no C ABI representation"
  (exactly today's `pythonCType == nil`), so the `canGenerateValueType` /
  `canGenerateProtocolType` recursion that uses `nil` as a normal "skip this
  field" signal is unchanged. When the result is non-`nil` the annotation is
  always present, so the old `pythonType(...) ?? .any` fallback is removed
  without affecting which members are generated: a leaf with no annotation
  (e.g. an unlisted primitive) returns `nil` and fails loud instead of
  degrading to `Any`. The conversion slot is the call-site conversion (`nil`
  for primitives, whose C scalar passes through directly); the value-type field
  descriptor derives its descriptor from the C type as before.
- The diagnostic (`FishyJoesContext.warn`, the channel `warnMissingDefault`
  already uses) is emitted **only** by the top-level member delegators
  (`nativeStoredField` / `nativeField` / `nativeMethod` / parameters / the
  per-class enum-case and stored-field guards) when a member or whole type is
  dropped — never inside `pythonRepresentation` or the `canGenerate*` probes,
  so legitimately-skipped recursive fields stay silent.
- The synthetic `NoReturn` return type (a `@noReturn` method has no translated
  return type) is constructed in the translator, not by any conformer.

`PythonTranslator`'s `pythonType`/`pythonConversion`/`pythonCType` become thin
delegators to `pythonRepresentation`; all per-type dispatch moves onto the
conformers. Adding a new `TranslatedType` now fails to compile until its
`pythonRepresentation` is written, exactly as for the other targets.

## Tradeoffs

- Per-type logic is distributed across the conformers instead of centralized in
  the translator. This matches how `cSharpType`/`dartType` already work and is
  the point: the compiler enforces completeness.
- The change touches the shared `TranslatedType` protocol and every conformer.
  It is a pure restructuring: generated Python output is unchanged except for the
  new diagnostics on genuinely-unsupported members, and the other language
  targets are unaffected.

## Consequences

- A new translated type cannot be added without deciding its Python
  representation; the compiler enforces it.
- Genuinely-unsupported types/members surface a generation-time diagnostic
  instead of silently disappearing; no public member degrades to `Any` silently.
- Generated output remains deterministic and reproducible from the conformers'
  `pythonRepresentation`.

## Implementation Notes

- `PythonType`, `PythonImport`, `PythonRepresentation`, and
  `PythonTranslationContext` live in
  `Sources/FishyJoesCore/TranslatedTypes/PythonRepresentation.swift`. The
  translator's old nested `NativeType` (`{cType, conversion, pythonType}`) is
  replaced by `PythonRepresentation` (`{annotation, cType, conversion}`); its
  call sites read `.annotation` instead of `.pythonType`.
- The protocol requirement
  `func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation?`
  is non-defaulted on `TranslatedType` and implemented on every conformer
  (Void, Primitive, UnsignedPrimitive, String, Data, URL, Optional, Array, Set,
  Dictionary, Tuple, Range, Result, Future, Function, Struct, Reference,
  Protocol, Enum, ExternalTranslatedType). `PythonTranslator.pythonType`,
  `pythonConversion`, and `pythonCType` are now thin delegators to it.
- Recursion guards (R3) are reproduced by `PythonTranslationContext`:
  `recursingIntoChild()` threads both visited sets unchanged (annotation
  recursion); `recursingIntoValueTypeField(of:)` adds the struct and resets
  protocols; `recursingIntoProtocolMember(of:)` adds the protocol and resets
  structs. `canGenerateValueType`/`canGenerateProtocolType` moved onto the
  context and use `pythonRepresentation == nil` as a silent skip signal.
- nil-semantics (B1): a `nil` `PythonRepresentation?` means "no C ABI type"
  (the old `pythonCType == nil`); when non-nil the annotation is always present.
  `PythonType.any` and the `?? .any` fallback are removed: an unlisted
  primitive now returns `nil` and is failed loud, never degraded to `Any`.
- conversion-slot (R5): a primitive's `conversion` is `nil` (its C scalar passes
  through). `PythonRepresentation.conversionDescriptor` derives the descriptor
  from the C type when `conversion` is `nil`, reproducing the old
  `nativeType.conversion ?? pythonConversion(...)` and `descriptorExpression`
  behavior used by value-type field descriptors and container element
  conversions.
- diagnostics (B2): `FishyJoesContext.warn` (print-once) is emitted only by the
  top-level member delegators (`nativeStoredField`, `nativeField`,
  `nativeMethod` return + parameters, and the per-class enum-case associated
  value loop), never inside `pythonRepresentation` or the `canGenerate*` probes.
- The synthetic `NoReturn` return type (R4) is still constructed in
  `PythonTranslator.nativeMethod`, not in any conformer.
- Verified pure restructuring: `swift build` is clean; PythonDocstringTests and
  the 37 FishyJoesCoreTests pass; regenerating TestAPI ends `OK (skipped=2)`
  (151 tests); `git diff --stat` over every generated binding (Python and the
  other targets) is empty.
