# 0010. Python Async Uses Explicit asyncio Loop Ownership

## Status

Accepted.

## Context

Iota futures and scheduled work can call back into the host language from Swift
threads. Python async must integrate with `asyncio`, cffi callbacks, and the GIL
without deadlocking or resolving futures on the wrong event loop.

Implicitly guessing the right event loop is unsafe in libraries, tests, worker
threads, and applications that run more than one loop over process lifetime.

## Options Considered

- Resolve all futures on whatever event loop is running when setup occurs.
  This is simple, but import/setup may happen outside the eventual application
  loop.
- Create and own a private event loop in the FishyJoes runtime.
  This isolates FishyJoes, but it makes integration with application `asyncio`
  tasks, cancellation, and shutdown harder.
- Require explicit loop registration when async callbacks or futures cross the
  boundary.
  This is more ceremony, but it makes thread handoff, cancellation, and shutdown
  behavior explicit.
- Block synchronously until async work completes.
  This is tempting for a bridge, but it can deadlock when Swift scheduled work
  needs the Python loop or when Python calls sync wrappers from inside a loop.

## Decision

Python async support uses explicit `asyncio` loop ownership.

The runtime captures an event loop only when async boundary behavior is needed:

- If a Swift async method returns a future to Python, the Python wrapper returns
  an awaitable bound to the current running loop.
- If Python passes an awaitable or async callable to Swift, the runtime requires
  a running loop or an explicitly registered loop.
- If Swift completes work from a non-Python-created thread, completion is posted
  back to the owning loop with a thread-safe scheduling primitive.
- If no owning loop exists, async conversion fails loudly with an actionable
  error.

Cancellation flows both ways where the underlying Iota future contract can
represent it. If Iota cannot cancel Swift work, Python cancellation cancels the
Python awaitable and detaches result delivery, but it must not pretend Swift work
was cancelled.

Runtime shutdown must reject unresolved Python futures and release retained
callbacks deterministically where possible.

## Tradeoffs

Explicit loop ownership is more verbose than guessing.

Some synchronous APIs may need clear errors when called from a running event loop
if they would block the loop waiting for Swift scheduled work.

Cancellation semantics may be asymmetric until the shared Iota future ABI grows
first-class cancellation.

## Consequences

Async integration tests must cover calls from Python's main loop, Swift
completion from non-Python threads, Python callback futures passed to Swift,
exception propagation, cancellation, and runtime shutdown.

The runtime must keep cffi callbacks alive until async completion or explicit
detachment.

Generated async wrappers should be small and delegate loop ownership to the
runtime.
