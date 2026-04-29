# Python Support: Follow-Ups Plan

Branch: `antonio/add-python-support`
Predecessor: [`python-support-plan.md`](../implemented/python-support-plan.md) — 15 steps, all landed.
Scope: the gaps the predecessor explicitly tracked but did not close. Two clusters.

This document is structured the same way as its predecessor: a feature/decision table, then numbered TDD steps, each with **R** (failing test, written first) → **G** (minimum fix) → optional Refactor. All steps end with a regenerate-and-diff to keep the generator and the committed bindings in sync.

---

## 1. What is still open

### 1.1 Generator-side mypy gaps (from step 10)

`python-runtime/tests/test_generated_typecheck.py:KNOWN_FAILING` lists five generated files that today produce 17 mypy errors collectively. They fall into four root causes:

| Root cause | Files | Errors | Section |
|---|---|---|---|
| Three Swift types share the unqualified name `PuttingTypesIntoQuestionablePlaces` so the generator emits them into one file with the same class name | `PuttingTypesIntoQuestionablePlaces.py`, `_type_setup.py` | 4 | §2.A |
| A method called `bytes` collides with the builtin `bytes` used as a type annotation in the same class | `Bytes.py` | 2 | §2.B |
| Cross-class import emission (step 10) walks fields/methods on the host class but not the associated-value fields of dataclass-style enum cases | `AssociatedDataEnum.py` | 1 | §2.C |
| `runtime.py` template has ctypes-callback lambdas mypy cannot infer, plus several `object`-typed values used as if they were `Sized`/indexable/callable | `runtime.py` | 10 | §2.D |

### 1.2 AttributedString iteration / mutation surface (from step 9)

`integration-tests/TestAPI/bindings/python/tests/test_attributed_string.py:AttributedStringDeferredViewTests` has seven `@unittest.skip` placeholders that mirror the Kotlin tests one-to-one. Each is a chunk of the runtime that the v1 wrappers do not yet expose.

| Kotlin test | Python runtime missing | Section |
|---|---|---|
| `testStringEcho` | (already exercised by v1 echo tests; close out coverage) | §3.0 |
| `testSubstring` | `AttributedSubstring`, `AttributedString.substring`, `substringForRange`, `AttributedString.Index`, `SwiftRange` | §3.A |
| `testViewIterationOverIndices` | `runs`, `characters`, `unicodeScalars` views with `startIndex`/`endIndex`/`indexAfter`/`indexBefore`/`elementAt` | §3.B |
| `testViewIterators` | `__iter__` on each view | §3.C |
| `testMutability` | `clone`, `replaceSubrange` | §3.D |
| `testMutabilityVariants` | `append`, `appendSubstring`, `insert`, `insertSubstring`, `replaceSubrangeWithSubstring`, `removeSubrange` | §3.E |
| `testAttributeMergeReplace` | `setAttributesForRange`, `mergeAttributesForRange`, `replaceAttributesForRange`, `runs.rangeIterator` | §3.F |
| `testAttributeMergeReplaceWhole` | `setAttributes`, `mergeAttributes`, `replaceAttributes`, `AttributeContainer.mergeAttributes` | §3.G |

The Kotlin runtime is ~1060 LoC across `AttributedString.kt` / `AttributeContainer.kt` / `AttributeContainerFoundationAttributes.kt`. The port is mechanical (one Python wrapper method per JNI external) but there is a lot of it; ten focused TDD steps land it without a single huge commit.

Python-side, the equivalent code lives in `python-runtime/src/fishyjoes_python/attributed_string.py` and routes through the existing IOTA FFI (`runtime.iota_lib.<symbol>(...)`). Kotlin-specific patterns from `AttributedString.kt` (JNI external decls, `loadNativeLibs`, `companion object init`) are not load-bearing for the Python port — the IOTA approach already does the work; do not port the JNI scaffolding.

### 1.3 Guiding principles (locked)

These resolve every decision in this plan. When two principles conflict, the higher-numbered one wins.

1. **Idiomatic Python wins by default.** `@property`, `@dataclass`, `__iter__`, snake_case method names where feasible. Generated code should look like code a Python developer would write.
2. **Best-practice production quality.** Type hints everywhere, mypy-clean, ruff-clean, `_assume`-style runtime checks at FFI boundaries (see [ADR-0008](../../adr/0008-assume-helper-for-ffi-boundaries.md)).
3. **IOTA only, never JNI.** See [ADR-0002](../../adr/0002-python-iota-only-never-jni.md) for the locked decision; [ADR-0001](../../adr/0001-iota-shared-ffi-not-per-target.md) for the project-wide premise it inherits from.
4. **Swift semantic fidelity is mandatory.** Reference type in Swift → reference type in Python. Value type in Swift → value type in Python. Mutating method in Swift → mutating method in Python. Behaviour from calling generated Python must be observationally compatible with calling the originating Swift directly.

Where rule 4 conflicts with rule 1 — for example, when a Swift mutating method on a value type would be more "Pythonic" returning a new instance — rule 4 wins. Deliberate exceptions to rule 4 are recorded in dedicated ADRs (e.g. [ADR-0005](../../adr/0005-attributedstring-as-reference-type.md) for `AttributedString` and `AttributedString.Index`); do not introduce more without writing one.

---

## 2. Generator-side follow-ups

### Step A — Disambiguate colliding `unqualifiedName`s

**Symptom:** `integration-tests/TestAPI/bindings/python/generated/src/cricut_testapi/PuttingTypesIntoQuestionablePlaces.py` defines three classes named `PuttingTypesIntoQuestionablePlaces` at lines 8, 24, 39 (mypy: `Name "PuttingTypesIntoQuestionablePlaces" already defined on line 8`). The runtime registers them under unique `iotaSetupName`s via the `_cls_<setupName>` alias mechanism, but the source-level definitions still shadow each other and `_type_setup.py` then resolves `setup_reference_type(..., PuttingTypesIntoQuestionablePlaces)` to the wrong class, producing the `type[…]` mismatch error.

**Decision:** see [ADR-0006](../../adr/0006-class-disambiguation-via-export-annotation.md) — disambiguate via the Swift `<!-- FishyJoes.export(NAME) -->` annotation when a collision is detected; non-colliding classes keep their bare unqualified name.

**R.** Add `tests/test_generated_no_name_collision.py` that walks the generated tree, parses each `.py`, and asserts no module defines two top-level `class X:` with the same name. Today: fails in `PuttingTypesIntoQuestionablePlaces.py`.

**G.** In `Sources/FishyJoesCore/Unparse/PythonClass.swift` (or wherever `unqualifiedName` is computed), when two `PythonClass` instances would emit the same `unqualifiedName`, prefix each with the immediate namespace from the source mangled name. Update `PythonProductClass.swift` and `PythonTranslator.swift:setupFragments` to use the disambiguated name in the file name, the class declaration, the `_cls_<setupName>` alias, and the `from .X import X` re-exports.

**Regen+diff.** Three new files appear under `bindings/python/generated/src/cricut_testapi/` (`AttributedString_…`, `String_…`, `Structs_…`); the old `PuttingTypesIntoQuestionablePlaces.py` either becomes one of them or is deleted.

**Effect.** Removes `PuttingTypesIntoQuestionablePlaces.py` and the `setup_reference_type` arg-type error from `KNOWN_FAILING` (-4 mypy errors).

---

### Step B — Qualify Python-builtin type annotations as `builtins.<name>`

**Symptom:** `bindings/python/generated/src/cricut_testapi/Bytes.py` line 40: `Function "cricut_testapi.Bytes.Bytes.bytes" is not valid as a type`. The class has a method called `bytes`, and a sibling method's return type annotation is `bytes` — Python's resolution picks the method, not the builtin.

**Decision:** see [ADR-0007](../../adr/0007-qualify-builtins-always.md) — always qualify Python builtins as `builtins.<name>`; no per-class shadow analysis.

**R.** In `python-runtime/tests/test_generated_typecheck.py`, drop `Bytes.py` from `KNOWN_FAILING` — it should now pass mypy. Today: fails.

**G.** Define `private static let BUILTIN_NAMES: Set<String> = ["bytes", "int", "str", "list", "dict", "set", "bool", "type", "float", "bytearray", "frozenset"]` somewhere reachable from `PyType` (likely `PythonClass.swift`). In `PyType.name` for the `.primitive` case (and the bare-identifier branch of `.named`), if the rendered name is in `BUILTIN_NAMES`, return `builtins.<name>`. Add `import builtins` unconditionally to the file headers in `FishyJoesContext.pythonFragment` (every generated file emits it; the import is cheap).

**Regen+diff.** Every generated file gains `import builtins`. Annotations like `-> bytes`, `-> int`, `: str`, `list[T]`, `dict[K, V]`, `set[T]` rewrite to their `builtins.…` form. Diff is large but mechanical and uniform.

**Effect.** -2 mypy errors. `Bytes.py` leaves `KNOWN_FAILING`.

---

### Step C — Walk enum case fields when emitting cross-class imports

**Symptom:** `AssociatedDataEnum.py` line 73 references `SimpleEnum` in an associated-value field's type but the file has no `from .SimpleEnum import SimpleEnum`. Step 10 added the cross-class walk for the host class's fields/methods only; enum case dataclasses live alongside the enum and contribute their own type references.

**R.** Drop `AssociatedDataEnum.py` from `KNOWN_FAILING`. Today: fails.

**G.** In `Sources/FishyJoesCore/Unparse/PythonClass.swift:fragment(context:)`, when the class is a `PythonEnumSumType` (or whatever the equivalent is — confirm during implementation), also walk each case's associated-value types via `PyType.referencedNamedClasses` and union them into `referenced`. This may already work for `PythonProductClass` but the enum-case shape is a different code path.

**Regen+diff.** `AssociatedDataEnum.py` and any other enum-with-associated-values gains the missing `if typing.TYPE_CHECKING: from .SimpleEnum import SimpleEnum` line.

**Effect.** -1 mypy error. `AssociatedDataEnum.py` leaves `KNOWN_FAILING`.

---

### Step D — Type the runtime template's ctypes callback closures

**Symptoms** (in `Sources/FishyJoesExecute/Resources/bindings-template/python/__TEMPLATE__/src/cricut___LOWERCASE_MODULE_NAME__/runtime.py`):
- `Cannot infer type of lambda` at the discriminator `case_matchers` and the constructor case-dispatch
- `Argument 1 to "len" has incompatible type "object"` (twice) and `No overload variant of "list" matches argument type "object"` and `"object" not callable` and `"object" has no attribute "items"` — all in code paths where `borrow_foreign_object` returns `object | None` and the surrounding code uses it as a tuple/list/dict

**Decision:** see [ADR-0008](../../adr/0008-assume-helper-for-ffi-boundaries.md) — `_assume(value, kind)` helper at concrete-type boundaries; `typing.cast` only for abstract Protocols (`Sized`, `Iterable`, `Mapping`, `Callable`) that mypy refuses as `type[T]`.

**R.** Drop `runtime.py` from `KNOWN_FAILING`. Today: ~10 mypy errors.

**G.** In the template:
- Replace each problematic `lambda` with a small named local function annotated with explicit parameter types. Most are inside `setup_enum_type`'s case-matcher dispatch.
- Replace `for cb in callback_args:` (line ~131) with a typed `cffi`/`ctypes`-aware accessor or `typing.cast(ctypes._FuncPointer, cb)` before the `ctypes.cast` call.
- For the `borrow_foreign_object`-returns-`object` chain inside enum constructor/setter callbacks, add `from fishyjoes_python.iota import _assume` to the template imports and apply at every boundary where a tag-string says we have a specific Python type.

**Companion change:** add the helper itself to `python-runtime/src/fishyjoes_python/iota/_handles.py` and export it from `iota/__init__.py`'s `__all__` *before* doing the runtime-template edits.

**Regen+diff.** `bindings/python/generated/src/cricut_testapi/runtime.py` reflects the typed closures. Existing 49 unit tests must remain green; the integration suite (which actually exercises these callbacks) must pass once codegen runs.

**Effect.** -10 mypy errors. `runtime.py` leaves `KNOWN_FAILING`. After A/B/C/D, `KNOWN_FAILING` is empty and `test_generated_typecheck.py` checks the entire generated tree without exclusions.

---

### Step E — Lock down the regression net

**R.** In `python-runtime/tests/test_generated_typecheck.py`, change the assertion from "every file outside `KNOWN_FAILING` passes mypy" to "the entire generated tree passes mypy with `KNOWN_FAILING == frozenset()`". Today: fails because `KNOWN_FAILING` is non-empty.

**G.** Once steps A–D are landed and `KNOWN_FAILING` has been emptied, this is a one-line edit. No additional generator changes.

**Effect.** Future regressions to any one of A/B/C/D are caught the moment they land instead of being absorbed silently into the allowlist.

---

## 3. AttributedString iteration / mutation surface

The base wrappers (`AttributedString`, `AttributeContainer`, `AttributeContainerFoundationAttributes`) shipped in step 9. Each follow-up step un-skips one Kotlin test mirror by porting one slice of the Kotlin runtime.

Common pattern for every step here:
- The test in `integration-tests/TestAPI/bindings/python/tests/test_attributed_string.py:AttributedStringDeferredViewTests` is currently `@unittest.skip("v2: …")`. Drop the skip — that is the **R**.
- The fix lives in `python-runtime/src/fishyjoes_python/attributed_string.py`. Each new method is a thin `runtime.iota_lib.<symbol>(...)` call. Look up the symbol name in `kotlin-runtime/src/main/kotlin/com/cricut/fishyjoes/runtime/AttributedString.kt` (the JNI external decls already use the right names) — that is the **G**. **IOTA only, never JNI** (principle 3): port the symbol name and signature, not Kotlin's JNI scaffolding. Do not introduce ctypes-CFUNCTYPE bindings, do not load an alternate native library, do not replicate `loadNativeLibs()`. Every call is `runtime.iota_lib.<symbol>(...)` through the already-loaded IOTA dylib.
- All steps below also need a small real-runtime unit test in
  `python-runtime/tests/test_attributed_string.py` when the behavior cannot be
  expressed more clearly through integration. Do not use `_FakeRuntime` or
  symbol-recording fakes; wrapper logic that touches FFI must run against the
  real IOTA dylibs.

### Decisions locked for §3

Every step below assumes these. Architectural decisions are pinned in
ADRs; implementation-shape decisions stay here.

| Topic | Where it's locked |
|---|---|
| `AttributedString` and `AttributedString.Index` are reference types in Python (Swift value types in name only) | [ADR-0005](../../adr/0005-attributedstring-as-reference-type.md) |
| Views (`runs`, `characters`, `unicode_scalars`, `substring`, `startIndex`, `endIndex`) are plain `@property`, never `@cached_property` | [ADR-0009](../../adr/0009-attributedstring-views-as-property.md) |
| Mutation methods mutate `self` in place and return `None`; `clone()` is the documented escape hatch | [ADR-0005](../../adr/0005-attributedstring-as-reference-type.md) |

Implementation-shape decisions (no ADR; trivially derivable from the
above plus the principles in §1.3):

- **`SwiftRange[T]` (§F.1):** pure-Python frozen dataclass with two
  fields. Swift's `Range<T>` is itself a value type, so principle 4
  says it stays a value type in Python. Hashable via dataclass default.
- **`__iter__` semantics (§H.1):** live iteration over the current
  Swift state, matching Swift `Sequence` and Python `list` conventions.
  Mutation during iteration is undefined; documented in the view
  docstrings.
- **`runs[index]` indexing (§K.1):** accept only an
  `AttributedString.Index`, never a Python `int`. Swift's `Runs`
  collection is keyed by `Index` only; offering `int` overloads would
  invite the wrong call.
- **Hashability (§L.1):** `Index` and `SwiftRange[Index]` are both
  hashable. `Index.__hash__` routes through `_hash_symbol` per
  `_SwiftBackedReference`; `SwiftRange` gets a free hash from its
  frozen dataclass.
- **Threading:** the existing `_ffi_lock` (predecessor step 3) covers
  `cdef` mutation only. AttributedString method calls are *not*
  serialised. Concurrent mutation is undefined — same contract as
  Swift's `AttributedString` (documented as not thread-safe). Caller's
  responsibility; documented in the module docstring.

### Step F — `AttributedSubstring` + `substring` / `substringForRange`

**R-1.** Un-skip `test_substring`. **R-2.** New tests asserting
`AttributedSubstring.from_attributed_string`, `AttributedString.substring_for_range`,
and `Index` / `SwiftRange` construction produce the expected observable behavior
against the real runtime; pure-Python `SwiftRange` construction can stay a
non-FFI unit test.
**G.** Per the §3 decisions:
- `class SwiftRange[T]` — frozen dataclass, two fields, no IOTA. Lives next to the rest of `attributed_string.py`.
- `class AttributedString.Index(_SwiftBackedReference)` — `_equals_symbol` / `_hash_symbol` route through Swift.
- `class AttributedSubstring(_SwiftBackedReference)` — `.string` (`@property`), `.base` (`@property` returning the parent `AttributedString`), `.substring` (`@property` returning self for parity with Swift), `__getitem__` accepting only `SwiftRange[Index]`.
- `AttributedString.substring` (`@property`), `AttributedString.substring_for_range(range)`, `AttributedString.startIndex` / `endIndex` (`@property`).

### Step G — Views: `runs` / `characters` / `unicodeScalars`

**R.** Un-skip `test_view_iteration_over_indices`.
**G.** Add `AttributedString.Runs`, `AttributedString.CharacterView`, `AttributedString.UnicodeScalarView` classes, each `_SwiftBackedReference`. Each exposes `startIndex`, `endIndex`, `indexAfter(index)`, `indexBefore(index)`, `elementAt(index)`. `Runs.elementAt` returns a `Run` (also new `_SwiftBackedReference`) with `.range` (`@property` returning `SwiftRange[Index]`) and `.attributes` (`@property` returning `AttributeContainer`). The three view accessors on `AttributedString` are plain `@property` per §3 decisions; do not cache.

### Step H — `__iter__` on the views

**R.** Un-skip `test_view_iterators`.
**G.** Add `__iter__` on `Runs`, `CharacterView`, `UnicodeScalarView` that walks from `startIndex` to `endIndex` via `indexAfter`, yielding `elementAt(idx)` at each step. Live iteration per §3 decisions. No new Swift surface — pure Python on top of the §3.G methods. Mutation-during-iteration behaviour is "undefined, may produce inconsistent results"; document in each view's docstring.

### Step I — `clone` + `replaceSubrange`

**R.** Un-skip `test_mutability`.
**G.** `AttributedString.clone() -> AttributedString` and `AttributedString.replace_subrange(range: SwiftRange[Index], replacement: AttributedString) -> None` (mutating, returns None per §3 decisions). `clone` is the documented escape hatch for callers who need Swift's COW semantics — the `replace_subrange` docstring should point at it.

### Step J — `append` / `insert` / `removeSubrange` family

**R.** Un-skip `test_mutability_variants`.
**G.** Six methods, each a one-line `runtime.iota_lib.<symbol>` call returning `None`: `append(other: AttributedString)`, `append_substring(other: AttributedSubstring)`, `insert(other: AttributedString, at: Index)`, `insert_substring(other: AttributedSubstring, at: Index)`, `replace_subrange_with_substring(range, replacement: AttributedSubstring)`, `remove_subrange(range)`. All mutating per §3 decisions.

### Step K — Per-range attribute mutation + run iterators

**R.** Un-skip `test_attribute_merge_replace`.
**G.** Three mutating methods on `AttributedString`: `set_attributes_for_range(range, container)`, `merge_attributes_for_range(range, container)`, `replace_attributes_for_range(range, old_container, new_container)`. Add `Runs.range_iterator() -> Iterator[SwiftRange[Index]]` and `Runs.__getitem__(index: Index) -> Run` (only `Index`, never `int`, per §3 decisions). Add `AttributeContainer.merge_attributes(other)` if not already in the v1 wrapper.

### Step L — Whole-string attribute mutation

**R.** Un-skip `test_attribute_merge_replace_whole`.
**G.** `set_attributes(container)`, `merge_attributes(container)`, `replace_attributes(old_container, new_container)` on `AttributedString` (whole-string variants of the per-range methods from Step K). All mutating, return `None`.

### Step M — Drop the v2-skip class entirely

**R.** Convert `AttributedStringDeferredViewTests` into a normal `TestCase` — every test now runs (un-skipped through F–L). Today: fails because earlier steps have not landed yet.

**G.** Remove the `@unittest.skip(...)` decorators wholesale; if a single test still fails, that points at a specific F–L step that didn't fully land.

**Effect.** AttributedString surface fully matches Kotlin's contract. Python target now has an empty `@unittest.skip` count under `bindings/python/tests/`.

---

## 4. Order of work

Group by risk + value, same as the predecessor plan:

1. **Quick generator wins (Steps A, B, C):** isolated, narrow diff per step, three classes leave `KNOWN_FAILING`, integration suite unaffected. ~half a day.
2. **Runtime template typing (Step D):** more invasive, touches the single most-used template, but each lambda is independent. Land after A/B/C so the regen-diff is small.
3. **Lock the gate (Step E):** one-line edit; do it the moment `KNOWN_FAILING` empties.
4. **AttributedString port (Steps F–L):** mechanical but voluminous. Sequence: F → G → H → I → J → K → L → M. Each step is its own commit and un-skips one test. Pause-able at any step boundary.

Each step lands as one commit per the established TDD convention (test in same diff as fix, no broken intermediate state). Regenerate after every generator-side change; commit the regenerated bindings in the same commit as the source change.

---

## 5. Tech debt explicitly accepted

The deliberate deviations from Swift's contract are tracked in dedicated
ADRs so reviewers know they are decisions, not oversights, and so
future work has a concrete starting point if the cost calculation
changes.

| Topic | ADR |
|---|---|
| `AttributedString` is value-type-with-COW in Swift, reference type in Python (every Iota target). `clone()` is the documented escape hatch. | [ADR-0005](../../adr/0005-attributedstring-as-reference-type.md) |
| `AttributedString.Index` is value type in Swift, reference type in Python. | [ADR-0005](../../adr/0005-attributedstring-as-reference-type.md) |
| No view-result caching across mutations — plain `@property`, never `@cached_property`. | [ADR-0009](../../adr/0009-attributedstring-views-as-property.md) |

### 5.4 Cross-class import emission walks fields/methods only

Step C extends the walk to enum case fields. If a future generator change emits cross-class references in another shape (e.g., default-argument literals that reference a sibling enum case, or computed-property bodies), the cross-class import emission will need to be extended again. Track via the `test_generated_typecheck.py` regression net — adding the gate (Step E) catches new cases the moment they appear.

---

## 6. What this plan does not cover

- New language features beyond what `documentation/cans-and-cannots.md` already promises. AttributedString is in scope; closures, generic types beyond the existing exceptions, and inheritance are not.
- Performance benchmarks for AttributedString iteration (none exist for any target; cross-target benchmarking is its own workstream).
- Free-threaded CPython / subinterpreter / PyPy support (still listed as non-goals in `python-runtime/README.non-goals.md`).
- Generator changes to other targets (Kotlin, C#, Dart) — Steps A–C might apply equally well there but those targets are not currently regressing on these issues so closing the Python gap stays scoped.
- AttributedString-as-value-type or Index-as-value-type Python-side. Pre-existing across the Iota family; see §5.1 / §5.2.
