# 0005. Python Reference Lifetime Uses Finalizers

## Status

Proposed / Implemented

## Context

Swift-backed reference values need retained Swift objects to be released from
Python. Requiring users to call a public `.release()` method is error-prone and
does not feel like normal Python.

Python finalization is not deterministic, but it is the right user-facing
ownership model for ordinary reference wrappers.

A finalizer is cleanup code registered to run after an object is no longer
reachable. In this design, `weakref.finalize()` associates a release callback
with each Swift-backed Python wrapper. When the wrapper becomes unreachable, the
callback releases the retained Swift reference.

Finalization is not deterministic because Python does not promise exactly when
an unreachable object will be collected. CPython often releases non-cyclic
objects promptly because it uses reference counting, but cycles require the
garbage collector, other Python implementations may collect later, and
interpreter shutdown changes what globals and modules are still available.
Object reachability can also be extended accidentally by callbacks, closures,
tracebacks, caches, or reference cycles.

## Options Considered

- Require users to call `.release()`.
  This is deterministic, but it makes normal Python usage unsafe by default and
  leaks Swift references when users forget.
- Make reference wrappers context managers only.
  This is useful for deterministic internal cleanup, but many Swift-backed
  objects naturally outlive a single `with` block.
- Use `__del__`.
  This is direct, but it is easier to create resurrection and shutdown-order
  problems than with `weakref.finalize()`.
- Use `weakref.finalize()` in the runtime base class.
  This keeps the public API idiomatic while centralizing the release hook. The
  callback can be written to avoid holding `self`, which reduces accidental
  retention and cycle issues compared with naive `__del__` implementations.
- Never release and rely on process lifetime.
  This is simple, but it is unacceptable for long-running Python processes.

## Decision

Generated Python reference wrappers inherit from a runtime `SwiftReference`
base that uses `weakref.finalize()` to release the retained Swift reference.

The public API does not require users to call `.release()`.

The runtime may expose internal deterministic cleanup hooks for tests and
debugging, but those hooks are not the normal user workflow.

## Tradeoffs

Finalization timing is not deterministic, so tests cannot assert release by
waiting for ordinary garbage collection alone.

Finalizers must not capture `self` in a way that prevents collection.

Release still needs to honor the Iota thread/scheduler model, so the finalizer
path must be small and centralized.

The design optimizes normal user ergonomics over deterministic release timing.
When deterministic lifetime matters internally, the runtime needs explicit
non-public cleanup hooks or context-manager helpers for tests and tightly scoped
resources.

## Consequences

Python users get native-feeling lifetime behavior.

The runtime must centralize ownership rules so generated wrappers do not each
manage raw reference deletion.

Tests that assert release behavior need deterministic internal hooks rather than
depending on immediate garbage collection.
