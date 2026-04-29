# 0007. Always qualify Python builtins as `builtins.<name>` in generated annotations

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

A Swift class with a member named `bytes` (a method, a field, anything)
shadows the Python `bytes` builtin when `bytes` is used as a type
annotation in another method on the same class. mypy reports the
annotation as not-a-valid-type; runtime resolution silently picks the
member instead of the builtin. The same shadow would happen for
`int`, `str`, `list`, `dict`, `set`, `bool`, `type`, `float`,
`bytearray`, `frozenset`, `tuple`, `complex`, `object`, `range`, and
`memoryview` if a member with that name existed.

## Decision

**The generator always emits `builtins.bytes`, `builtins.int`,
`builtins.list`, etc. for primitive Python type names — unconditional,
no per-class shadow analysis. `import builtins` is added to every
generated file's header as a uniform import.**

Generic containers also qualify: `builtins.list[T]`, `builtins.dict[K, V]`,
`builtins.set[T]`, `builtins.tuple[…]`. The set of qualified names lives
in `PythonClass.PyType.pythonBuiltinNames`.

## Consequences

### Positive
- Trivially correct. Zero risk of shadowing, regardless of what members
  any current or future Swift class has.
- Uniform diff across every regenerated file. The rule is one line in
  `PyType.name` and one extra import.
- Adding a new builtin to the qualified set is one line in the
  `pythonBuiltinNames` set.

### Negative
- Slight visual noise. `def foo() -> builtins.bytes:` is longer than
  `def foo() -> bytes:`. The generated tree gains an `import builtins`
  on every file, even files that never reference any qualified name.
- Reading generated code requires a one-time mental note that all
  primitive types are namespaced.

### Neutral
- Hand-written code outside the generated tree is unaffected; this rule
  is generator-only.

## Alternatives considered

**Per-class shadow analysis** — qualify only when a same-class member
shadows the builtin. Rejected: requires the generator to know each
class's full member set before it emits any annotation, and to maintain
that knowledge if the class changes. Conditional code-generation logic
becomes a place to forget a case (a future field that shadows a future
builtin); the unconditional rule has no such failure mode.

**Use `from builtins import bytes as _bytes` and emit `_bytes`** — fewer
characters than `builtins.bytes`. Rejected: every alias is one more
identifier the reader has to remember; `builtins.X` is the standard
PEP-8 convention for explicit namespacing.

## Related

- [`documentation/plans/pending/python-followups-plan.md`](../plans/pending/python-followups-plan.md)
  §2.B — TDD step that landed the implementation.
- `Sources/FishyJoesCore/Unparse/PythonClass.swift:pythonBuiltinNames` —
  the qualified-names set.
- `Sources/FishyJoesCore/Unparse/PythonClass.swift:PyType.name` — the
  qualification site.
- `Sources/FishyJoesCore/FishyJoesContext.swift:pythonFragment` — emits
  the `import builtins` header.
