# Python Support: Findings, Gaps, and TDD Plan

Branch: `antonio/add-python-support`
Scope: assess current state of the Python target against the existing Iota-family targets (C#, Dart) and the broader generator (Kotlin, Node), identify gaps for parity, and lay out a red/green TDD work plan to close them.

This document is organised around the project's own `documentation/new-language-target-checklist.md`. Cross-reference it when reading.

---

## 1. Architecture summary

### 1.1 Where Python fits

Python is the third member of the **Iota FFI family**, alongside C# and Dart. All three share the base `IotaTranslator` (`Sources/FishyJoesCore/Translators/IotaTranslator.swift`), which emits the Swift `@_cdecl` boundary (parameter marshalling, async wrapping, exception propagation, mutating semantics, getter/setter shims). Subclasses only override `setupFragments(...)` to emit target-specific type-registration code.

That part of the design is sensible and Python correctly reuses it.

### 1.2 Where Python diverges (and why)

Python is the only **dynamically-typed** target in the family. That single fact drives every architectural difference from C#/Dart:

| Concern | C# / Dart | Python |
|---|---|---|
| Type info shape | Compile-time, baked into emitted classes | Runtime metadata calls (`_runtime.setup_struct_type(...)`, etc.) |
| FFI binding | P/Invoke / `dart:ffi` (declared inline) | `cffi` consuming an emitted `_declarations.h` (unique to Python) |
| Refcount / lifetime | GCHandle / Dart finalizer | CPython C extension (`_native.c`) for `retain` / `release` / `borrow` |
| Class emission | `CSharpClass` / `DartClass` are both metadata + renderer | Split: `PythonTranslator` produces metadata, `Sources/FishyJoesCore/Unparse/PythonClass.swift` + `PythonProductClass.swift` render it |
| Generics | Emit `<T>` syntax | Pass an FFI tag string (`"i32"`, `"object"`) to a generic runtime helper |
| Type stubs | Static types intrinsic | None emitted, despite shipping a `py.typed` marker |

**Verdict: the divergences are appropriate** — Python's dynamism legitimately moves work from emit-time to runtime. The model resembles `pybind11` / `pydantic` more than P/Invoke, and is the right shape. What is questionable is not the strategy but the *execution* (see §3).

### 1.3 Layout (one page)

```
Sources/FishyJoesCore/Translators/
    IotaTranslator.swift            ← shared base (283 LoC)
    PythonTranslator.swift          ← 517 LoC — setupFragments + C-header emission + metadata for class renderer
Sources/FishyJoesCore/Unparse/
    PythonClass.swift               ← 257 LoC — class skeleton + parameterList helpers
    PythonProductClass.swift        ← 222 LoC — value-type vs reference-type emission
Sources/FishyJoesExecute/Phases/
    PythonPhases.swift              ← 83 LoC — install / compile / test / pack
python-runtime/
    src/fishyjoes_python/           ← 1,164 LoC of Python + 191 LoC of C extension
    tests/                          ← 162 LoC, smoke + lightweight iota unit tests
integration-tests/TestAPI/bindings/python/
    generated/...                   ← 19 .py test files
```

Phase-file size (LoC) for context: Kotlin 88, Python 83, C# 136, Dart 189, Node 527. Python is at the lean end and intentionally so.

---

## 2. Feature parity matrix

Source: `documentation/cans-and-cannots.md` (overall feature surface) cross-checked against the integration-test files actually present per language.

Legend: ✅ in target + has integration test, ⚠️ in target but no test / partial, ❌ missing.

| Feature                              | Kotlin | C# | Dart | Python |
|--------------------------------------|:------:|:--:|:----:|:------:|
| Primitives, strings, bytes, URL      | ✅ | ✅ | ✅ | ✅ |
| Tuples (named + unnamed)             | ✅ | ✅ | ✅ | ✅ |
| Optional, Result, Array, Dict, Set   | ✅ | ✅ | ✅ | ✅ |
| Range / ClosedRange                  | ✅ | ✅ | ✅ | ✅ (added on this branch) |
| Structs (POD + by-reference)         | ✅ | ✅ | ✅ | ✅ |
| Classes                              | ✅ | ✅ | ✅ | ✅ |
| Enums (incl. associated values)      | ✅ | ✅ | ✅ | ✅ |
| Protocols + witnesses                | ✅ | ✅ | ✅ | ✅ |
| Extensions                           | ✅ | ✅ | ✅ | ✅ |
| Default arguments                    | ✅ | ✅ | ✅ | ✅ |
| Async functions / actors             | ✅ | ✅ | ✅ | ✅ |
| Methods (static / instance / getset) | ✅ | ✅ | ✅ | ✅ |
| Equatable / Hashable                 | ✅ | ✅ | ✅ | ✅ (added this branch) |
| **AttributedString**                 | ✅ | ✅ | ✅ | **❌ no test, runtime status unclear** |
| **`TestLeadingUnderscoredProp` edge case** | ✅ | ✅ (generated only) | ✅ (generated only) | **⚠️ no dedicated test** |
| **Type stubs (`.pyi`)**              | n/a | n/a | n/a | **❌ shipping `py.typed` but no stubs** |
| **Linting / typechecking in CI**     | (gradle) | (msbuild) | (analyzer) | **❌ no mypy / ruff** |

The single **"missing exported feature"** gap is **AttributedString**. Everything else listed under Cans-and-Cannots either has a Python integration test or maps onto runtime infrastructure that is exercised indirectly.

---

## 3. What is good

1. **Iota-family reuse is honest.** `PythonTranslator` overrides only `setupFragments` and inherits the entire FFI shim layer from `IotaTranslator` — same as `CSharpTranslator` / `DartTranslator`. No drift, no copy-paste.
2. **CPython C extension for refcounts.** `_native.c` (191 LoC) handles `retain` / `release` / `borrow` and `malloc_copy_bytes` directly against the CPython C API, with `PyErr_Occurred()` checks. Avoids the cffi-handle-dict pattern and its known leaks (recent commit `dde225b7` deliberately removed the dict).
3. **Explicit non-goals.** `python-runtime/README.non-goals.md` lists what v1 will *not* cover (PyPy, free-threaded CPython, subinterpreters). This is the kind of scope discipline the new-language-target checklist asks for.
4. **No TODO/FIXME/HACK debt** anywhere in the Python tree (verified with `grep`). Recent commit history (`b162734c`, `3025f4dc`) shows real bugs being fixed (collection double-free, name shadowing, Int8/16/32 ABI).
5. **Broad integration coverage.** 19 test files, one per Cans-and-Cannots category, run via `unittest discover` from `PythonPhases.testPhase`.
6. **Idiomatic emission.** `PythonProductClass` uses `@dataclass(slots=True)` for value types, `weakref.finalize` for reference cleanup, `@property` for getters/setters, and keyword-only args after defaulted args. The output reads like real Python.
7. **Modern packaging.** `pyproject.toml` + setuptools + `python -m build`; uses `importlib.resources` for shared-library discovery (`loader.py`) instead of `__file__` hacks.
8. **cffi over ctypes** is the right choice: portable, GIL-aware, and matches the Iota family's "emit a C contract, consume from foreign code" posture.

---

## 4. What is bad / risky

These are concrete, file-and-line specific. Each has a corresponding TDD step in §6.

### 4.1 The `py.typed` lie
`python-runtime/src/fishyjoes_python/py.typed` is shipped, which is a public claim of full type coverage. But:
- `iota.py` has almost no type hints on its callbacks (the cffi `@ffi.callback(...)` decorators take a C signature, not a Python one).
- Generated `.py` modules have no `.pyi` stubs, and `PythonProductClass` only annotates dataclass fields, not method return types.

A consumer running `mypy --strict` against generated bindings will get nothing useful. Either drop `py.typed` and be honest, or generate stubs.

### 4.2 `iota.py` is a 772-line god module
Mixes: handle marshalling, callback registry plumbing, every primitive's converter, exception adaptation, the (stub) thread scheduler. Recent fixes have been confined to it precisely because everything is in it. Splitting reduces the blast radius of future edits.

### 4.3 `_schedule_thread_work` is a stub
`iota.py:463-478` registers `_schedule_thread_work` as an FFI callback but **runs the work synchronously on the calling thread**. If Swift ever actually relies on this for off-loop work, behaviour will be silently wrong. Either:
- (a) implement a real executor (queue + worker thread, or `asyncio` integration), or
- (b) make the absence loud: raise `NotImplementedInNativeError` and document it in `README.non-goals.md`.

### 4.4 Single shared `cffi.FFI()`
`iota.py:16` creates one process-global `FFI()` instance. `cdef()` is not documented thread-safe, and `ensure_loaded()` can be called concurrently by code that imports several generated modules. No lock, no test.

### 4.5 Bare `assert` in production paths
`iota.py:245, 324-325, 342-344` use `assert` to validate FFI invariants. Under `python -O` (common in production) these become no-ops, and the next thing that runs is undefined behaviour at the C boundary. Convert to explicit `raise FishyJoesError(...)`.

### 4.6 Callback accumulation on reload
`iota.py:176, 210-211` keep cffi callbacks alive by appending to `self._callbacks`. If `ensure_loaded()` runs twice (test isolation, hot-reload, multiple modules sharing a runtime), entries pile up and old ones are still reachable.

### 4.7 No logging anywhere in the runtime
Zero `logging` imports under `python-runtime/src/`. When something goes wrong at the FFI boundary, the user gets a `SIGSEGV` or a `FishyJoesError` with no breadcrumb. Other targets at least have stack traces from their host runtimes.

### 4.8 `setupFragments` in `PythonTranslator.swift` is brittle
`PythonTranslator.swift:7-118` hard-codes 12 distinct `_runtime.setup_*(...)` call patterns (struct, reference, enum, protocol, array, set, dict, tuple, result, range, future, function). Changing the Python runtime API means editing all twelve. A small dispatch table keyed by `TranslatedType` family would localise this.

### 4.9 No Python validation of generated code
`PythonPhases.compileHostLanguagePhase` runs `python -m compileall` (syntax) and `unittest discover` (behaviour). Neither catches:
- Unused imports, undefined names → `ruff check`.
- Type mismatches in stubs → `mypy`.
- Wrong-arity calls in pure-Python code paths that aren't covered by integration tests.

This means the generator can ship subtly broken bindings if a refactor in `PythonTranslator.swift` produces valid syntax but semantically wrong Python.

### 4.10 Sparse runtime unit tests
`python-runtime/tests/` is 162 LoC across `test_smoke.py` (imports + native version + callback-registry round-trip + CPython guard) and `test_iota.py` (handle coercion, UTF-16 decoding, basic setup). Nothing exercises:
- Concurrent access to the runtime.
- Exception round-tripping (raise in Swift → catch in Python and vice versa).
- Cleanup on repeated `ensure_loaded()`.
- Memory: a finalizer fires exactly once, doesn't double-free.

### 4.11 Class rendering is pure string concatenation
`PythonClass.swift` and `PythonProductClass.swift` build `.py` text by `outputBlock(...)` calls. There is no point at which the generator round-trips its own output through `ast.parse(...)` to confirm validity. The compileall step in `PythonPhases` catches *that*, but only after a full generation cycle.

---

## 5. Decisions locked

Each of the choices the original draft of this plan listed as open has
since been resolved. The locked answer lives in an ADR; this section
indexes them.

| Decision | ADR |
|---|---|
| Type stubs strategy: inline annotations on the generated `.py`, never separate `.pyi` (and always qualify Python builtins as `builtins.<name>` to keep them un-shadowed) | [ADR-0007](../../adr/0007-qualify-builtins-always.md) |
| Thread-scheduling contract: refuse loudly via `strict_thread_scheduling=True`, default warns once and runs inline | [ADR-0010](../../adr/0010-python-thread-scheduling-refuse-loudly.md) |
| AttributedString shape: opaque handle wrapper across the Iota family, with `clone()` as the documented escape hatch from Swift's COW semantics | [ADR-0005](../../adr/0005-attributedstring-as-reference-type.md) |
| Linting / typechecking gates: `ruff` + `mypy` invoked from `PythonPhases.testPhase` (no separate ADR — implementation-level choice tracked in `Sources/FishyJoesExecute/Phases/PythonPhases.swift`) | — |
| Runtime versioning: minimum Python 3.11, enforced both in `pyproject.toml` and at runtime | [ADR-0004](../../adr/0004-python-min-version-3.11.md) |
| Whether to split `iota.py`: yes, into the `iota/` package; all imports stay invisible to consumers | — (refactor; no ADR) |

Two project-wide decisions also apply throughout this plan:

- **IOTA-shared FFI for new language targets, never per-target FFI.** See [ADR-0001](../../adr/0001-iota-shared-ffi-not-per-target.md).
- **Python uses IOTA exclusively, never JNI.** See [ADR-0002](../../adr/0002-python-iota-only-never-jni.md).

These two are the architectural premise the support plan was written
against; they predate this branch as project conventions and are
captured as ADRs so future plans don't have to re-articulate them.

---

## 6. TDD plan (red → green, in order)

Each step lists: **R** (failing test to write first), **G** (minimum code to make it pass), **Refactor** (optional consolidation). All step numbers refer to the same numbering in §4 where applicable.

> Convention: tests for the runtime go under `python-runtime/tests/`. Tests for the generator go under `Tests/FishyJoesCoreTests/` (Swift). Integration tests for Python parity go under `integration-tests/TestAPI/bindings/python/tests/`.

### Step 1 — `assert` → `raise` (4.5)
**R.** New `python-runtime/tests/test_iota_invariants.py` with a `python -O` -friendly test that constructs an invalid handle and asserts a `FishyJoesError` (not `AssertionError`) is raised. Run the test under `PYTHONOPTIMIZE=1` in CI; today it passes silently — that's the red.
**G.** Replace each `assert` in `iota.py:245, 324-325, 342-344` with `if not <cond>: raise FishyJoesError(...)`.
**Refactor.** Introduce `_check(cond, msg)` helper if duplication grows.

### Step 2 — Bound callback accumulation (4.6)
**R.** New test that calls `IotaRuntime.ensure_loaded()` N=10 times against the same library and asserts `len(runtime._callbacks)` is bounded (constant after first call). Today it grows linearly.
**G.** Either gate `ensure_loaded` with an idempotency check (early return if already loaded), or store callbacks keyed by `(symbol_name, signature)` so re-registration replaces.
**Refactor.** Make `_callbacks` a private dict, not list; document ownership semantics in a one-line comment.

### Step 3 — Locked `cffi.FFI()` access (4.4)
**R.** New test that spawns 8 threads, each calling `ensure_loaded()` for a distinct mock library, and asserts no `cffi.error.CDefError` and no missing symbols. Today this is racy.
**G.** Wrap `_ffi.cdef(...)` and `dlopen` calls in a module-level `threading.Lock()`. Or: per-library `FFI()` instance.
**Refactor.** Decide which; document in `iota.py` module docstring.

### Step 4 — Thread-scheduling: refuse loudly (4.3, decision §5.2)
**R.** New test that registers a fake Swift caller of `_schedule_thread_work` and asserts behaviour matches the chosen contract: either (a) work runs on a worker thread (assert `threading.current_thread() != main_thread`), or (b) `NotImplementedInNativeError` is raised. Today it silently runs sync.
**G.** Implement chosen option. If (b), update `README.non-goals.md` in same commit.
**Refactor.** None.

### Step 5 — Logging (4.7)
**R.** New test under `python-runtime/tests/test_logging.py` that captures `logging.getLogger("fishyjoes")` records during a fake `ensure_loaded` and asserts at least one INFO record is emitted (load attempted) and one DEBUG record per registered callback. Today: no records.
**G.** Add `_log = logging.getLogger("fishyjoes")` to `iota.py`, `loader.py`, `runtime.py`. Emit at boundaries (load start/finish, callback register/release, exception adaptation).
**Refactor.** Settle on one logger name; document in package README.

### Step 6 — Concurrent callback round-trip (4.10)
**R.** Integration-test addition: a Swift-side function that takes a Python callback, invoked from N threads simultaneously. Today this isn't covered.
**G.** Verify the C extension `retain`/`release` paths are correct under contention; add a per-callback `Lock` only if needed.

### Step 7 — Exception round-trip integration test (4.10)
**R.** New `integration-tests/TestAPI/bindings/python/tests/test_exception_roundtrip.py` covering: Python raises → Swift catches → Swift rethrows → Python receives original type and message. Today: no end-to-end test.
**G.** Likely no code change needed (existing infrastructure handles this), but confirm `_set_exn` (`iota.py:410-424`) doesn't lose the original error if retention fails. Tighten if it does.

### Step 8 — `TestLeadingUnderscoredProp` parity (4 / Kotlin gap)
**R.** New `integration-tests/TestAPI/bindings/python/tests/test_leading_underscored_prop.py` mirroring the Kotlin test. Today: missing.
**G.** Either it works out of the box (commit the test) or `PythonTranslator` mangles names wrong; if so, fix the mangling.
**Refactor.** Audit `PythonProductClass` for any other name-collision blind spots.

### Step 9 — AttributedString parity (decision §5.3 = (a) opaque handle)
**R.** Port `integration-tests/TestAPI/bindings/kotlin/.../AttributedStringTests.kt` to `test_attributed_string.py` covering: round-trip, equality, length, substring access. Tests fail today (likely import error on the AttributedString class).
**G.** Add an `AttributedString` runtime type to `python-runtime/src/fishyjoes_python/` (or `iota.py` as a converter). Update `PythonTranslator.setupFragments` to register it with the same shape as Kotlin. Regenerate.
**Refactor.** If AttributedString needs more than a 50-line addition, that's a signal it should live in its own `attributed_string.py` module.

### Step 10 — Type stubs / hints in generated code (4.1, decision §5.1 = inline hints)
**R.** New Swift test in `Tests/FishyJoesCoreTests/` that runs the Python emitter against a small fixture and asserts the output, when piped through `mypy --strict`, has zero errors. (Use a snapshot or a `mypy --show-error-codes` parser.)
**G.** Extend `PythonProductClass` to emit return-type annotations on methods, parameter annotations on every callable, and `from __future__ import annotations` at the top of each generated file. For generic aliases (`list[T]`, `dict[K, V]`) emit Python 3.11 native syntax.
**Refactor.** Move repeated `pythonType.typeHint` formatting into one helper.

### Step 11 — Lint / typecheck gates in `PythonPhases` (4.9, decision §5.4)
**R.** New test in `Tests/FishyJoesExecuteTests/` that asserts `PythonPhases.testPhase` invokes `ruff check` and `mypy` with the configured versions. Today: no such call.
**G.** In `PythonPhases.swift:57-67`, add a `lintPhase` (or extend `testPhase`) that runs `python3 -m ruff check src/ tests/` and `python3 -m mypy src/`. Pin versions like `build` is pinned (`PythonPhases.swift:72`).
**Refactor.** Decide whether linting is fail-the-build or warn-only on first introduction; recommend fail-the-build with an allowlist initially.

### Step 12 — Generated-code `ast.parse` smoke (4.11)
**R.** New Swift test that invokes `PythonProductClass` on a representative fixture and asserts the result parses with Python's `ast` module (call out to `python3 -c 'import ast,sys;ast.parse(sys.stdin.read())'`). Today: only a real `compileall` after full generation catches this.
**G.** No code change expected; this is a regression net for steps 10/13.

### Step 13 — `setupFragments` dispatch table (4.8)
**R.** Refactor under test only — first add a snapshot test that captures the current `setupFragments` output for a fixture covering all 12 type families. Then refactor under that net.
**G.** Replace the 12 hard-coded blocks in `PythonTranslator.swift:7-118` with a `[TranslatedTypeKind: (TranslatedType, FishyJoesContext) -> SourceFragment]` dispatch table. Snapshot must match byte-for-byte.

### Step 14 — Split `iota.py` (4.2, decision §5.6)
**R.** Add tests for the public surface of each candidate sub-module *before* moving any code:
  - `tests/test_iota_handles.py` — handle coercion, retain/release.
  - `tests/test_iota_converters.py` — primitive marshalling.
  - `tests/test_iota_callbacks.py` — registry semantics.
**G.** Move code into `iota/handles.py`, `iota/converters.py`, `iota/callbacks.py`. Re-export from `iota/__init__.py` so existing imports keep working.
**Refactor.** Once stable, deprecate the flat module import path in a follow-up.

### Step 15 — Runtime version pinning (decision §5.5)
**R.** Add a test in `python-runtime/tests/test_smoke.py` that asserts `sys.version_info >= (3, 11)` (or whichever minimum gets picked).
**G.** Set `requires-python = ">=3.11"` in `pyproject.toml`. Update `RuntimeState.detect()` in `runtime.py` to fail fast on older versions.

---

## 7. Order of work (suggested)

Group the steps by risk and value:

1. **Quick safety fixes (low risk, high value):** Steps 1, 2, 5. Total: maybe a day. No behaviour change for working code, big diagnostic improvement.
2. **Decisions ratified in code:** Steps 4, 15, 11. Locks down v1 contract before more is built on top.
3. **Parity gaps:** Steps 7, 8, 9. Closes the visible "Python is missing X" complaints.
4. **Quality gates:** Steps 10, 12, 13. Make future generator changes safer.
5. **Bigger surgery, last:** Steps 3, 6, 14. Higher risk, do once the test net above is in place.

Each step should land as a separate commit with the failing test in the same diff as the fix, so `git log -p` reads like the TDD trail it is.

---

## 8. What this plan does **not** cover

- No PyPy or free-threaded CPython work — explicitly out of scope per `python-runtime/README.non-goals.md`.
- No subinterpreter isolation — same.
- No performance benchmarks — none exist for any target; cross-target benchmarking is a separate workstream.
- No Windows-specific packaging concerns beyond what setuptools already does — needs a separate audit if Windows is a v1 platform.
- No Cans-and-Cannots changes — Python should match the matrix as written, not add to it.
