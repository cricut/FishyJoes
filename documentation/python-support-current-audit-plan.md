# Python Support Current Audit and TDD Plan

Date: 2026-04-28
Branch context: `codex-re-execute-plan`

This plan audits the current Python target after the Python support work has
landed. It compares Python with the other IOTA-based targets, records the user
decisions made on 2026-04-28, and defines the red/green implementation order
for the remaining production-hardening work.

Hard workflow rules for this plan:

- Python is an IOTA target only. Do not port Kotlin JNI scaffolding.
- Do not edit generated Python bindings directly. Change Swift emitters,
  runtime templates, or shared Python runtime sources, then regenerate.
- Tests that cross FFI must exercise the real Swift dylibs and real IOTA
  runtime. No fake runtimes or mocked runtime methods.
- Do not delete tests without explicit user approval. The quarantined duplicate
  tests were deleted only after explicit approval.
- Never push. All commits remain local unless the user explicitly authorizes a
  push as a separate action.

## Executive Summary

Python now fits the IOTA architecture reasonably well. It shares the Swift IOTA
export layer with C# and Dart through `IotaTranslator`, loads the real IOTA
dylibs, has broad generated and hand-written integration coverage, and runs
`ruff`, `mypy`, generated smoke tests, and Python integration tests from
`PythonPhases.testPhase`.

The implementation is necessarily different from C# and Dart because Python is
dynamic. C# and Dart emit statically typed native declarations directly into
generated classes and runtime loaders. Python emits class metadata plus a
dynamic `GeneratedRuntime` that registers Python constructors, converters,
callbacks, futures, functions, and enum case handlers with IOTA at runtime.
That difference makes sense, but it concentrates more complexity in the Python
runtime template.

Feature parity is mostly present for the current FishyJoes surface. Remaining
work is production hardening: coverage integration, real ABI export checks,
tighter linting, direct Swift-side emitter coverage, and moving reusable runtime
logic out of the generated template into shared Python modules. Scheduler,
tool-installation policy, and Python-version CI policy are intentionally
deferred and recorded in ADRs.

## User Decisions Recorded On 2026-04-28

1. **Python should participate similarly to other languages.**
   Python will participate in code coverage threading through
   `options.codeCoveragePath` in the same spirit as the other language phases.
   This plan implements Swift `LLVM_PROFILE_FILE` plumbing. Python
   `coverage.py` instrumentation is not part of this pass.

2. **Scheduler work is deferred.**
   A real thread executor / `asyncio` bridge / other scheduler design is future
   work. This plan records that in ADR-0010 and does not implement scheduler
   semantics now.

3. **Quarantined duplicate tests should be removed.**
   The fake-runtime duplicate tests were deleted in local commit
   `690aad445dc299518ce3252fa529fefc0ad1994e`
   (`test(python): remove quarantined duplicate runtime tests`). This item is
   resolved before the remaining plan starts.

4. **Split generated runtime behavior into shared modules.**
   Python should move reusable runtime/template behavior into shared
   `fishyjoes_python` modules where practical, matching the organization style
   of other IOTA-based languages without changing Python's dynamic registration
   contract.

5. **Tool installation policy is TBD later.**
   This plan records the open decision in a new ADR. It does not replace
   `--user --break-system-packages` with a venv or preinstalled-tool contract in
   this pass.

6. **Supported Python version CI policy is TBD later.**
   This plan records the open decision in a new ADR. It does not add a Python
   version matrix in this pass.

## Architecture Map

### Shared IOTA Layer

`Sources/FishyJoesCore/Translators/IotaTranslator.swift` is the core
Swift-to-IOTA bridge. It emits the Swift `@_cdecl` functions that:

- prepend the IOTA `Env`;
- convert Python/C#/Dart foreign values into Swift values;
- wrap async Swift calls in `Future`;
- round-trip errors through the `_exn` out parameter;
- handle mutating methods and field access.

Python, C#, and Dart all consume this same IOTA Swift surface. That is the
load-bearing architectural property, and it is correct.

### C# And Dart Shape

C# and Dart are static targets:

- `CSharpTranslator` emits P/Invoke declarations and typed wrapper classes.
- `DartTranslator` emits `dart:ffi` lookups and typed wrapper classes.
- Their runtimes are split by concern: primitives, collections, futures,
  functions, ranges, tuples, results, AttributedString, and loader code.
- Their phase implementations hook into native toolchains and support code
  coverage paths.

### Python Shape

Python is dynamic:

- `PythonTranslator` emits `_type_setup.py`, `__init__.py`, and
  `_declarations.h`.
- `PythonClass`, `PythonProductClass`, `PythonEnumClass`, and
  `PythonProtocolClass` render Python classes with annotations, dataclasses,
  properties, async methods, and runtime calls.
- `bindings-template/python/.../runtime.py` contains generated-module runtime
  registration.
- `python-runtime/src/fishyjoes_python/iota/_runtime.py` owns shared cffi
  loading, environment setup, callback retention, exception storage, symbol
  calls, and runtime Foundation registrations.
- `_native.c` handles CPython refcount/lifetime operations that should not be
  approximated in Python.

This design is different from C#/Dart, but the difference is justified. Python
cannot lean on compile-time type declarations in the same way, so it moves type
registration and converter setup into live runtime objects.

## Feature Parity Status

Python has integration tests for primitives, strings, bytes, URLs, tuples,
optionals, arrays, dictionaries, sets, ranges, structs, classes, enums,
protocols, extensions, methods, properties, default arguments, functions,
Swift-side closures, async functions, actors, exception round-tripping,
leading-underscore exported names, and AttributedString runtime wrappers.

For the feature set documented in `documentation/cans-and-cannots.md`, there is
no obvious user-facing exported API category where Python is absent while C#
and Dart are present. The remaining parity work is operational and structural:

1. Coverage reporting parity.
2. Runtime modularity parity.
3. Generated-template lint strictness.
4. ABI drift detection for runtime Foundation/IOTA symbols.
5. Swift-side emitter regression coverage.

Scheduler parity is explicitly deferred to a later ADR-backed design.

## Good Parts To Preserve

- Keep Python on IOTA and keep Kotlin JNI as documentation for symbol shape
  only.
- Keep generated files regenerated from templates/emitters.
- Keep `mypy` and `ruff` in the canonical Python phase.
- Keep integration tests as the source of truth for FFI behavior.
- Keep fail-loud dylib loading. Missing dylibs should not silently skip tests.
- Keep `py.typed`; it is backed by generated annotations and mypy checks.
- Keep the CPython-only scope unless there is real demand for PyPy or
  free-threaded Python.

## Risks To Reduce

1. **The Python runtime template is too large.**
   It mixes runtime loading, cffi conversion, enum setup, struct setup,
   protocol witnesses, futures, functions, collections, tuples, result, range,
   and helper parsing in one generated file.

2. **Runtime Foundation declarations are brittle.**
   Runtime AttributedString symbols are declared manually inside
   `IotaRuntime`. The table must be mechanically checked against actual
   exports.

3. **The scheduler contract is easy to misunderstand.**
   Inline scheduled work is a documented v1 non-goal, but it is a behavior gap
   versus a real executor and must stay audible.

4. **The generated package ruff allowlist is broad.**
   Some ignores are normal for generated code, but every broad ignore lowers
   the odds that future generator regressions are caught early.

5. **There are few Swift-side tests for Python emission internals.**
   Generated Python output is heavily tested after generation, but the Swift
   emitter needs narrower regression coverage for imports, disambiguation, and
   setup-line emission.

## Red / Green TDD Implementation Plan

Each implemented item should land as a focused local commit. For
generator/template changes: write the failing test first, edit non-generated
source, run `swift build`, regenerate Python bindings, then verify.

### Step 0 — Already Done: Remove Quarantined Duplicate Tests

**Red.** The quarantined duplicate tests used fake runtimes and were not useful
as real runtime coverage.

**Green.** After explicit user approval, delete
`python-runtime/tests/duplicates/` and clean stale quarantine references.

**Verified.** Runtime discovery passed with `Ran 111 tests ... OK` and no fake
runtime tests were executed. Completed in commit `690aad445dc299518ce3252fa529fefc0ad1994e`.

### Step 1 — Add Python Coverage Phase Support

**Red.** Add a `FishyJoesExecuteTests` regression that fails because
`PythonPhases.testPhase` does not thread `options.codeCoveragePath` into the
generated-package and hand-written Python test commands.

**Green.** Update `PythonPhases.testPhase` to pass an `LLVM_PROFILE_FILE`
environment variable when `codeCoveragePath` is set, matching the shape used by
other language phases. Do not introduce Python `coverage.py` in this pass.

**Verify.** Run focused `FishyJoesExecuteTests`, then canonical Python
generation/build/test commands.

### Step 2 — Mechanically Verify Runtime Foundation/IOTA Symbols

**Red.** Add a Python runtime test that reads built
`libFishyJoesIotaRuntime` exports with `nm` and compares every hardcoded
runtime Foundation/IOTA cffi symbol declaration against actual exports. The
test must fail loudly if the dylib is missing.

**Green.** If symbols are missing or stale, update the Swift runtime/export
side or the Python declaration list. Do not invent symbol names.

**Verify.** Run `swift build`, regenerate/build TestAPI Python bindings, then
run the symbol test and integration suite.

### Step 3 — Narrow Generated Ruff Ignores

**Red.** Add a test that asserts the generated template's ruff ignore list does
not include avoidable rules without a local justification. Start with `F841`,
then `B009`, `I001`, and reassess `F401` / `F811`.

**Green.** Fix the generator/template to avoid warnings, or document why a
rule is structurally necessary. Keep the ignore list as small and explicit as
the generated code allows.

**Verify.** Regenerate Python bindings and run `ruff check src tests` through
the Python phase.

### Step 4 — Add Swift Emitter Snapshot/Structure Tests For Python

**Red.** Add Swift-side tests for Python emission decisions: class-name
disambiguation, cross-class imports, enum associated-value imports, async
method rendering, and setup-line emission for every runtime setup family.

**Green.** Record the current correct generated output/structure. Future
refactors then get a narrow Swift-side net before full integration generation.

**Verify.** Run focused `FishyJoesCoreTests`/`FishyJoesExecuteTests` and the
Python phase.

### Step 5 — Split Generated Runtime Template By Concern

**Red.** Add import, AST, and mypy regressions that lock every runtime setup
category before movement.

**Green.** Move reusable runtime/template behavior into shared
`fishyjoes_python` modules one low-risk family at a time, starting with pure
helpers and generated-runtime support code that does not depend on module-local
symbols. Keep generated module imports backward-compatible.

**Verify.** After each family: regenerate, run generated smoke, mypy, ruff, and
integration tests.

### Deferred Step — Scheduler

No implementation in this pass. ADR-0010 records that a real thread executor,
`asyncio` bridge, or alternate scheduler design is later work.

### Deferred Step — Tool Installation Policy

No implementation in this pass. ADR-0012 records that the project still needs
to decide between the current `--user --break-system-packages` behavior, a
generated-output venv, or preinstalled-tool prerequisites.

### Deferred Step — Supported Python Version CI Policy

No implementation in this pass. ADR-0013 records that the project still needs
to decide which CPython minors CI must exercise.

## Recommended Order

1. Commit this plan and the ADR updates before implementation.
2. Add coverage support because it is a clear cross-target parity gap.
3. Add symbol export verification before more runtime/Foundation work.
4. Narrow lint ignores and add Swift emitter regression coverage.
5. Split runtime/template internals after the regression net is stronger.
6. Leave scheduler/tool-install/version-policy implementation for later ADR
   decisions.

## Definition Of Done For This Plan

- Accepted follow-up steps are implemented with red/green discipline.
- The plan and ADR decisions are committed before implementation work starts.
- No generated Python file is manually patched.
- `swift build` passes.
- Focused Swift tests for touched FishyJoesCore/FishyJoesExecute behavior pass.
- `fishy-joes --python generate`, `build`, and `test` pass.
- Python runtime tests run with zero unexpected skips.
- Any remaining skips have audited, current reasons.
- Worktree contains no untracked tool-install artifacts except intentional
  ignored build/cache output.
