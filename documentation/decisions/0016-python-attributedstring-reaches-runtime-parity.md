# 0016. Python AttributedString Reaches Runtime Parity

## Status

Accepted (implemented)

## Context

The Dart and Kotlin runtimes ship the full Foundation `AttributedString` family:
`AttributedString` and `AttributedSubstring` with `string`/`runs`/`characters`/
`unicodeScalars`/`substring`/`substringForRange`/`startIndex`/`endIndex` and the
mutating `append`/`appendSubstring`/`insert`/`insertSubstring`; the `Runs`,
`CharacterView`, and `UnicodeScalarView` views as iterables with index
navigation and element access; the `Runs.Run` descriptor (`range`/`attributes`);
and the Comparable `AttributedString.Index` / `Runs.Index` position types.

The Python runtime did not. It exposed only a minimal, partly-opaque
`AttributedString` (a `str` constructor plus `.string`/`.substring`) and
`AttributedSubstring` (`.base`/`.string`/`.substring`); the views, runs, and
index types were empty opaque reference classes
(`_opaque_runtime_references = {name: type(name, (SwiftReference,), {})}`) and
their `_native.pyi` stubs were empty `class Runtime_X: ...`. A Python consumer
could obtain an `AttributedString` but could not iterate its runs, walk its
characters or scalars, slice it by range, or build one up with `append`/`insert`
— the surface every other language already had.

The Swift IOTA runtime already exports every needed `@_cdecl` symbol
(`Sources/FishyJoesIotaRuntime/AttributedString/*+iota.swift`). The gap was
purely on the Python consumer side: the symbols were never bound, the classes
never implemented, and the generated stubs never typed. This is a Python-only
parity task; no Swift runtime change is required (and none was made).

## Options Considered

- Leave the family opaque and document the limitation. Rejected: it leaves
  Python a second-class target and keeps the shaping/segmentation tier and any
  run/attribute inspection unreachable from Python, contrary to the project bar
  that every target reach the same surface.
- Implement the family inline in `iota.py` alongside the existing minimal
  `AttributedString`. Rejected on its own: the full surface adds ~480 lines and
  pushes `iota.py` past the marshalling-core size budget asserted by
  `test_shared_runtime_has_separate_config_dependency_and_native_modules`
  (< 2600 lines), which exists precisely so large feature bodies live in their
  own modules (like `config`/`native`/`diagnostics`).
- Implement the full family in a dedicated runtime module, wired by a factory
  that `create_runtime` calls with the marshalling primitives it owns, and emit
  hardcoded typed `.pyi` for the whole family the same way SwiftRange/Result are
  emitted. Chosen.

## Decision

Bring the Python `AttributedString` family to full parity, with the **Swift
exported `@_cdecl` symbols as the source of truth** for which capabilities to
expose (the C#/Dart/Kotlin runtimes are peers that confirm the capabilities, not
the spec — they can rename, invent, or omit). Every Swift-exported member is
exposed the Pythonic way: Swift export-annotated **named methods** (`elementAt`,
`substringForRange`, `elementAtPosition`) become **public snake_case methods plus
a `__getitem__` operator** that delegates to them (every target exposes the named
method *and* a language operator); Swift properties become `@property` (with
setters where Swift exports them); Swift **initializers** become `__init__` (not
named `create*` factories — those are C#/Dart's constructor idiom); `Comparable`
/ `==` become rich-comparison dunders; collection iteration becomes `__iter__`
with a private iterator. Python-only; no Swift runtime, EmojiFun, or other-target
changes.

- **Runtime classes** live in
  `python-runtime/src/fishyjoes_runtime/attributed_string.py`, built by
  `setup_attributed_string_family(...)`, a factory that `create_runtime` calls
  once with the runtime primitives it owns (`runtime_lib`, `env`, `check`,
  `call`, `setup_reference_type`, `SwiftReference`, `STRING`, `VOID`, `URL`,
  `Optional`, `ValueType`, `Range`, and the `UInt32` validator). Keeping the
  family in its own module (the `config`/`native`/`diagnostics` precedent) leaves
  the `iota.py` marshalling core under its size budget. The factory binds the
  missing cdecl symbols, defines the classes, registers/sets up the reference
  types, and returns the `Runtime_*` export mapping that `create_runtime` merges
  into the runtime namespace so generated `_native` re-exports them.

- **Members added** mirror Dart/Kotlin, rendered Pythonically:
  - `AttributedString`: `string`, `runs`, `characters`, `unicode_scalars`,
    `substring`, `substring_for_range(range)` (+ `__getitem__` alias),
    `start_index`, `end_index`, `append`, `append_substring`, `insert`,
    `insert_substring`, plus the existing `str` constructor and `__eq__`/`__hash__`.
    The full value-edit + factory surface that the other targets expose is now
    present too: `replace_subrange(range, attributed_string)`,
    `replace_subrange_with_substring(range, substring)`, `remove_subrange(range)`,
    `set_attributes(container)`, `set_attributes_for_range(range, container)`,
    `merge_attributes(container, keep_current=False)`,
    `merge_attributes_for_range(range, container, keep_current=False)`,
    `replace_attributes(attributes, others)`,
    `replace_attributes_for_range(range, attributes, others)`,
    `create_empty()` and `create_from_substring(substring)` classmethods, and the
    Python idioms for the Dart/Kotlin operators: `__add__` (clone-and-append over
    `AttributedString` / `AttributedSubstring` / `str`, returning a new value),
    `__setitem__` (Kotlin's `operator set[range]=`, dispatching to
    `replace_subrange` / `replace_subrange_with_substring`), and `__copy__` /
    `copy()` for Dart/Kotlin `clone` (defined as `create_from_substring(substring)`,
    so `copy.copy(value)` works and yields an independent value).
  - `AttributedSubstring`: `base`, `string`, `runs`, `characters`,
    `unicode_scalars`, `start_index`, `end_index`, `substring`,
    `substring_for_range` (+ `__getitem__`), the `create_empty()` classmethod, and
    `__eq__`/`__hash__`.
  - `AttributeContainer`: `foundation` (the typed FoundationAttributes view),
    `merge(other, keep_current=False)`, the `create_empty()` classmethod, and
    `__eq__`/`__hash__`.
  - `AttributeContainer.FoundationAttributes`: `link` (`str | None`),
    `language_identifier` (`str | None`), `as_container()`, and `__eq__`/`__hash__`
    — now a typed stub (`Runtime_AttributeContainer_FoundationAttributes`) rather
    than an untyped allowlisted accessor.
  - `AttributedString_UnicodeScalarView` (`Iterable[int]`) and
    `AttributedString_CharacterView` (`Iterable[str]`): `start_index`,
    `end_index`, `index_before`, `index_after`, `__getitem__`, and `__iter__`.
    `__getitem__` is the sole public element accessor; the element lookup itself is
    the private `_element_at` helper (the iterator and `__getitem__` call it), so
    the verbatim duplicate that re-exposed `element_at` alongside `[]` is gone.
  - `AttributedString_Runs` (`Iterable[Run]`): `start_index`, `end_index`,
    `index_before`, `index_after`,
    `__getitem__` (overloaded on `Runs.Index` vs `AttributedString.Index`,
    dispatching to the private `_element_at` / `_element_at_position` helpers),
    `__iter__`, `__eq__`/`__hash__`.
  - `AttributedString_Runs_Run`: `range`
    (`SwiftRange[AttributedString_Index]`), `attributes`, `__eq__`/`__hash__`.
  - `AttributedString_Index` and `AttributedString_Runs_Index`: Comparable via
    the Swift `compare` cdecl, exposed as `__lt__`/`__le__`/`__gt__`/`__ge__`
    (returning `NotImplemented` for foreign operands) plus `__eq__`/`__hash__`.

  A single `_AttributedStringViewIterator` drives the shared index protocol
  (`start_index` → `index_after` until `end_index`, yielding each element via the
  private `_element_at`), matching the per-view iterators in the Dart/Kotlin
  runtimes. `index_before`/`index_after`, `start_index`/`end_index`, and `__iter__`
  stay public (they are genuine contract with no narrower Python idiom).

- **cdecl symbols** are bound by exact name from the `*+iota.swift` files and
  declared in the `_declarations.h` template
  (`Sources/FishyJoesExecute/Resources/bindings-template/python/.../_declarations.h`).
  C ABI types follow the Swift `.CType`s: getters/navigation return
  `foreignObject`; `AttributedString.Index`/`Runs.Index` `compare` returns
  `intptr_t` (`Int.CType`); `UnicodeScalarView.elementAt` returns a raw
  `uint32_t` (`UInt32.CType`); `CharacterView.elementAt` returns a boxed
  `foreignObject` string; ranges marshal as a `foreignObject` through
  `RangeConverter<Foundation.AttributedString.Index>`. The raw `uint32_t` return
  is validated directly (it is not a boxed `foreignObject`, so it must not flow
  through a `foreignObject` return conversion).

- **Typed stubs**: `PythonTranslator.emitAttributedStringFamilyStubs` emits
  precise `.pyi` for the whole family into the generated `_native.pyi`, the same
  hardcoded-stub mechanism `SwiftRange`/`SwiftClosedRange`/`Result*` already use
  (the classes are created dynamically by `create_runtime`, so these stubs are
  their only typing surface). The closed family — now including
  `Runtime_AttributeContainer` and the `Runtime_AttributeContainer_FoundationAttributes`
  view — is emitted whenever any member is referenced so cross-references resolve,
  with `Iterator` imported only then; the family names are removed from the generic
  empty-`class X: ...` emission. Member signatures match the runtime one-for-one so
  stubtest reconciles them directly.

- **Allowlist**: the now-typed family entries are removed from
  `integration-tests/TestAPI/bindings/python/tests/stubtest_allowlist.txt`
  (`Runtime_AttributedString.{__init__,string,substring}`,
  `Runtime_AttributedSubstring.{base,string,substring}`, and the
  `AttributedStrings.(accent|…|simple)` static-value entry, which the now-typed
  `Runtime_AttributedString` makes unnecessary). The
  `Runtime_AttributeContainer.foundation` entry is also gone: `AttributeContainer`
  and its `FoundationAttributes` view are now typed stubs, so stubtest reconciles
  `.foundation`/`.link`/`.language_identifier`/`.as_container` directly. A
  `fishyjoes_runtime.attributed_string..*` entry covers the factory-local class
  definitions, the same way `fishyjoes_runtime.iota..*` already does for
  `create_runtime`-local definitions.

## Consequences

- Python now exposes the same rich `AttributedString` surface as Dart and
  Kotlin. Views iterate, indices compare, runs and attributes are inspectable,
  ranges slice, and strings can be appended/inserted/built — all against real
  dylibs with no mocks.

- The surface mirrors Dart/Kotlin behavior, rendered Pythonically: views are
  `Iterable`, range-get is `__getitem__`, getters are `@property`, and
  Comparable indices use Python rich-comparison operators. The family now reaches
  **full parity** with Dart/Kotlin: the value-edit mutators
  (`replace_subrange`/`replace_subrange_with_substring`/`remove_subrange`,
  `set_attributes`/`set_attributes_for_range`,
  `merge_attributes`/`merge_attributes_for_range`,
  `replace_attributes`/`replace_attributes_for_range`), the factories
  (`AttributedString.create_empty`/`create_from_substring`,
  `AttributeContainer.merge`/`create_empty`, `AttributedSubstring.create_empty`),
  and the operator idioms (`__add__` for Dart/Kotlin `operator+`, `__setitem__`
  for Kotlin `operator set[range]=`, `__copy__`/`copy` for `clone`) are all
  implemented against the already-exported cdecl symbols and covered by
  real-binding tests. Where Dart/Kotlin spell a member as a named convenience
  (`createEmpty`, `clone`) Python uses the established idiom (a classmethod,
  `__copy__`); where there is no narrower Python idiom (`index_before`,
  `start_index`, `__iter__`) the named member stays public. The one cross-target
  difference deliberately *not* re-ported is the duplicate `element_at` /
  `element_at_position` accessor that simply re-exposed the `__getitem__` body:
  Python keeps `__getitem__` as the sole public element accessor (the lookup is the
  private `_element_at` / `_element_at_position` helper), which is the Pythonic
  contract.

- **Every Dart/Kotlin public member has a corresponding cdecl symbol**, so no
  member was skipped for lack of a binding. `mergeAttributes`/`merge` carry their
  `keepCurrent` Bool through as a raw `Swift.Bool` C arg (passed verbatim like the
  `self` pointer, validated against `bool` the way the marshalling core's Bool
  primitive does). The Dart/Kotlin `clone` is not its own cdecl in any runtime —
  it is defined locally as `createFromSubstring(substring)` — and Python follows
  suit in `__copy__`.

- `attributed_string.py` is a new runtime module (`hatchling` packages the whole
  `src/fishyjoes_runtime` tree, so it ships automatically). `iota.py` drops back
  under its size budget; its only residual coupling is the one-line factory call,
  placed after the marshalling primitives the family depends on exist.

- Real-binding integration tests in
  `integration-tests/TestAPI/bindings/python/tests/test_attributed_strings.py`
  exercise character/unicode-scalar views (iteration, `[]` element access, index
  navigation), runs iteration with attributes and ranges, `substring_for_range`
  and `__getitem__`, `append`/`append_substring`/`insert`/`insert_substring`
  round-trips, the rich `AttributedSubstring` surface, Comparable indices, and a
  Swift-returned `[Runs.Run]`. A `AttributedStringParitySurfaceTests` class adds
  coverage for the full-parity additions: `create_empty`/`create_from_substring`,
  `copy`/`__copy__` independence, `__add__` over all three operand kinds,
  `replace_subrange`/`replace_subrange_with_substring`/`remove_subrange`/`__setitem__`
  text edits, `set_attributes`/`set_attributes_for_range`,
  `merge_attributes`(`_for_range`) with `keep_current` both ways,
  `replace_attributes`(`_for_range`), `AttributeContainer.merge`/`create_empty`,
  the typed `FoundationAttributes` view (`link`/`language_identifier`/`as_container`),
  and `AttributedSubstring.create_empty` — all observed via `.string`/`.attributes`
  against real dylibs with no mocks or skips.

- Verified from `integration-tests/TestAPI`:
  `FISHYJOES=1 swift run -- fishy-joes --python generate build test` ends
  `OK (skipped=2)` with the new tests included and the typing gates green —
  `mypy --strict`, `mypy.stubtest` with the pruned allowlist, and the pyright
  type-check all pass. (`pyright --verifytypes` self-skips on this machine
  because the pyright wrapper reports an empty package directory regardless of
  install layout — a pre-existing environmental skip, independent of this
  change.) `git diff --stat` is limited to `iota.py`, the new
  `attributed_string.py`, the `_declarations.h` template (and the regenerated
  TestAPI `_declarations.h`), `PythonTranslator.swift`, the regenerated TestAPI
  `_native.pyi`, the stubtest allowlist, the test file, and this ADR — no Swift
  runtime, EmojiFun, or unrelated generated drift.
