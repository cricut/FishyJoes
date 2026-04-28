# 0008. Use `_assume(value, kind)` for FFI-boundary type narrowing

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

The Python runtime template (`runtime.py`) crosses the cffi/ctypes
boundary frequently. `borrow_foreign_object(handle)` returns
`object | None` — the runtime knows the actual concrete type via the
FFI tag string passed alongside (`"object"`, `"int"`, `"str"`, …) but
mypy cannot prove it. Without narrowing, every downstream operation
(`len(value)`, `value.items()`, `value(*args)`, `tup[i]`) flags a
`object` type error or call-overload mismatch.

The choice is between three approaches:
1. `typing.cast(SomeType, value)` at each use site — pure type-system
   fiction, no runtime check.
2. Widen `borrow_foreign_object`'s return type to `Any` — lose
   information; `Any` is contagious.
3. A typed-cast-with-runtime-check helper that combines `isinstance`
   narrowing with mypy's `TypeVar` resolution.

## Decision

**At every dynamic-type boundary in the runtime template, use
`_assume(value, kind)` (raises `TypeMismatchError` on mismatch) when the
expected `kind` is concrete. Fall back to `typing.cast` only when the
kind is an abstract Protocol (`Sized`, `Iterable`, `Mapping`, `Callable`)
that mypy refuses as `type[T]`.**

```python
T = TypeVar("T")
def _assume(value: object, kind: type[T]) -> T:
    if not isinstance(value, kind):
        raise TypeMismatchError(kind.__name__, value)
    return value
```

The helper lives in
`python-runtime/src/fishyjoes_python/iota/_handles.py` and is
re-exported from `iota/__init__.py`.

## Consequences

### Positive
- Every type assertion at the FFI boundary is *also* a runtime check.
  Drift between "the FFI tag says we have X" and "we actually have X"
  surfaces loudly via `TypeMismatchError`, not as undefined behaviour
  fifty lines downstream.
- mypy narrows perfectly via the `isinstance` `TypeGuard` semantics, so
  the runtime template type-checks without `# type: ignore` clutter.
- Reads like `assert isinstance(x, str); use(x)` collapsed into one
  line — self-documenting at the call site (`kind` names the
  expectation).

### Negative
- One isinstance check per call. Cheap, but non-zero. A future
  performance-critical path could opt into `typing.cast` if the
  isinstance is provably redundant.
- Doesn't help when the value is a structural Protocol that doesn't
  isinstance cleanly. `Sized`, `Iterable`, etc. *do* support
  `isinstance` because they're `@runtime_checkable`, but mypy still
  rejects them as `type[T]` parameters — those sites use
  `typing.cast` with an explanatory comment.

### Neutral
- The helper is template-internal; users of the generated bindings
  never see it.

## Alternatives considered

**`typing.cast(SomeType, value)` at every use site.** Localised, zero
runtime cost, every assertion is greppable. Rejected: silent if wrong.
`cast(int, "hello")` compiles AND runs without complaint until something
downstream tries arithmetic. Each cast is type-system fiction, not a
real safety check. Comment hygiene becomes load-bearing — a cast
without a comment explaining *why* is just a mypy silencer.

**Widen `borrow_foreign_object` to return `Any`.** One-line change,
kills all errors at once. Rejected: `Any` is contagious. Every caller's
downstream type-erodes; defeats mypy in places where it currently *can*
prove things; existing tests that assume `object | None` silently relax
along with the change.

## Related

- [`documentation/python-followups-plan.md`](../python-followups-plan.md)
  §2.D — TDD step that landed the implementation.
- `python-runtime/src/fishyjoes_python/iota/_handles.py:_assume` — the
  helper.
- `python-runtime/tests/test_assume.py` — unit tests pinning the
  contract.
- `Sources/FishyJoesExecute/Resources/bindings-template/python/__TEMPLATE__/src/cricut___LOWERCASE_MODULE_NAME__/runtime.py` —
  the runtime template that uses `_assume` at every concrete-type FFI
  boundary and `typing.cast` at every Protocol boundary.
