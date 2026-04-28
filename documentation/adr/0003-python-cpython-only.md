# 0003. The Python target supports CPython only

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

Python has multiple production runtimes — CPython, PyPy, Jython, GraalPy,
IronPython — with very different internals. The IOTA handle ABI hands
Swift a `void*` and assumes pair-wise retain/release works against it: a
Python object's address is given to Swift, retained, kept around for an
arbitrary time, and eventually released. That contract requires the
address to be *stable* — the underlying object must not move while Swift
holds the pointer.

CPython never moves objects (no compacting GC), so `id(obj)` equals
`PyObject*` and stays valid for the lifetime of the extra reference.
PyPy's moving GC explicitly does not guarantee that. The other Python
runtimes have similar or worse mismatches with the address-based model.

## Decision

**The Python target supports CPython only. The runtime refuses to load on
non-CPython at import time, and the C extension (`_native.c`) is built
against the CPython stable ABI (`Py_LIMITED_API = 0x030B0000`).**

`fishyjoes_python.runtime.ensure_cpython()` checks
`sys.implementation.name == "cpython"` and raises `RuntimeError`
otherwise. Every `IotaRuntime` constructor invokes it. The C extension
uses `Py_INCREF` / `Py_DECREF` directly and returns raw `PyObject*`
addresses as Python ints — none of which is portable to PyPy or other
non-CPython implementations.

## Consequences

### Positive
- Address-based handles are correct by construction. Swift can hold a
  retained handle indefinitely without coordinating with a GC.
- The C extension is small (~191 lines) and uses only stable-ABI symbols,
  so one `.so` per platform serves Python 3.11 / 3.12 / 3.13 / 3.14+.
- `retain` / `release` are direct calls to `Py_INCREF` / `Py_DECREF`,
  faster and simpler than any portable equivalent.

### Negative
- **PyPy users are excluded outright.** A real population. They cannot use
  these bindings at all.
- **Free-threaded CPython (`Py_GIL_DISABLED`, 3.13t+) is not certified.**
  The C extension uses the GIL implicitly. Marking the module
  `Py_GIL_DISABLED`-clean is real work; deferred until pressure exists.
  Currently a non-goal.
- **Subinterpreters (PEP 684) are not supported.** Module-level state
  (`_ffi`, `_ffi_lock`, callback registries) assumes one interpreter per
  process. Currently a non-goal.

### Neutral
- The non-goals above are documented in
  [`python-runtime/README.non-goals.md`](../../python-runtime/README.non-goals.md)
  with rationale pointing back to this ADR.

## Alternatives considered

**Pure cffi via `ffi.new_handle` (PyPy-compatible).** cffi handles are
the canonical "give a foreign caller a pointer that keeps a Python object
alive" mechanism on PyPy. Rejected: each `new_handle` call returns a
*different* cdata pointer for the same object, so retain/release cannot
pair by address — Swift would need a separate handle-table indirection
that cffi already provides on the Python side, doubling the lookup cost.
A previous version of the runtime (commit `dde225b7`) used a cffi-handle
dict and was replaced by the current C extension specifically to
eliminate handle-dict memory leaks.

**`ctypes.pythonapi.Py_IncRef` / `Py_DecRef`.** Pure-Python access to
CPython's refcount API, avoids the C compilation step. Rejected:
`pythonapi` is itself CPython-only (so it gains no portability), and
per-call overhead is significantly higher than a direct C extension —
unhelpful at FFI scale where every retain/release is on the hot path.

**`pybind11` / `nanobind`.** Modern C++ wrappers around the CPython API.
Rejected: still CPython-only (no portability gain), adds a C++ toolchain
to every build environment, and the current C extension is small enough
that the wrapper-library overhead isn't worth it.

**[HPy](https://hpyproject.org).** A handle-oriented API designed
specifically for "stable across CPython, PyPy, GraalPy" — exactly the
abstraction that would unblock PyPy support. Rejected for now: HPy 1.0 is
recent, ecosystem support is thin, and adopting it would mean
redesigning the IOTA runtime's handle layer to use HPy handles instead
of raw `PyObject*` addresses. **This is the alternative to revisit if
PyPy support ever moves from non-goal to goal** — a future ADR would
supersede this one.

**Subinterpreters (PEP 684) for isolation.** Doesn't replace CPython-only;
it would complement it. Out of scope: same non-goal status as
free-threaded support.

## Related

- [ADR-0001](0001-iota-shared-ffi-not-per-target.md) — the shared-FFI
  premise; CPython-only is the Python-side cost of staying inside it.
- [ADR-0004](0004-python-min-version-3.11.md) — the version floor implied
  by the stable-ABI choice.
- [`python-runtime/README.non-goals.md`](../../python-runtime/README.non-goals.md)
  — user-facing scope statement; defers reasoning to this ADR.
- `python-runtime/src/fishyjoes_python/_native.c` — the C extension this
  decision authorises.
- `python-runtime/src/fishyjoes_python/runtime.py:ensure_cpython` — the
  runtime guard this decision installs.
