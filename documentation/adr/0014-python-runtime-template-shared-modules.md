# 0014. Split reusable Python generated-runtime behavior into shared modules

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

Python is an IOTA target like C# and Dart, but it differs because it performs
dynamic type registration at runtime. The generated Python `runtime.py`
template has accumulated loader, metadata, converter, callback, collection,
future, function, tuple, result, and range setup behavior. Keeping all of that
inside every generated binding package makes the template harder to review and
causes fixes to land in generated-template code instead of reusable runtime
modules.

## Decision

**Move reusable generated-runtime behavior into shared `fishyjoes_python`
modules while keeping generated packages as the owners of module-specific
metadata and declarations.**

Generated binding packages should still define their package name, module name,
generated declaration string, and generated type setup calls. Shared behavior
that does not depend on generated module contents should live under
`python-runtime/src/fishyjoes_python/` and be reused by generated packages.

## Consequences

### Positive
- Python's runtime organization becomes closer to the other IOTA targets,
  where loader/converter/runtime logic is split by concern.
- Bugs in reusable setup behavior can be fixed once in the shared runtime
  instead of copied into every generated package.
- The generated template becomes smaller and easier to audit.

### Negative
- Generated packages become more dependent on the installed
  `fishyjoes_python` runtime version.
- Refactors require careful regeneration and integration testing to avoid
  accidentally changing generated binding behavior.

### Neutral
- Python remains a dynamic IOTA consumer. This ADR does not make Python mimic
  Kotlin JNI, C# P/Invoke, or Dart `dart:ffi` declaration style.

## Alternatives considered

**Keep `runtime.py` fully self-contained.** Easier to inspect a generated
package in isolation, but it keeps shared runtime complexity in a template and
encourages duplicate fixes.

**Move all generated runtime behavior into shared code at once.** The end state
may be attractive, but a large move is harder to review. The implementation
should move low-risk families first with tests around each behavior.

## Related

- [`documentation/plans/pending/python-support-current-audit-plan.md`](../plans/pending/python-support-current-audit-plan.md)
  — implementation plan for the split.
- `Sources/FishyJoesExecute/Resources/bindings-template/python/{PackageName}/runtime.py`
  — generated runtime template to shrink.
- `python-runtime/src/fishyjoes_python/` — shared runtime modules.
