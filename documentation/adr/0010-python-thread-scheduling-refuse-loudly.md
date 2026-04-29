# 0010. Python runtime refuses thread-scheduling loudly until a real executor exists

* **Status:** Accepted
* **Date:** 2026-04-28
* **Deciders:** Project leads

## Context and problem statement

Swift's `Env.schedule(_:)` callback hands the runtime a unit of work
"to schedule on a thread". The Python runtime's
`IotaRuntime._schedule_thread_work` is the corresponding callback. The
Python runtime does not own a real thread executor: there is no thread
pool, no async queue, no work-loop. Without an executor, the only
options for the callback are:

1. **Refuse loudly** — raise `NotImplementedInNativeError`. Async
   functions and any other Swift code that schedules work fail at the
   first attempt, with a clear message.
2. **Run inline on the calling thread** — invoke the work synchronously
   in the callback. Correct for simple async continuations that are
   reentrant-safe; wrong for any work Swift expects to actually run on
   a different thread.

Option (2) is what the callback was originally implemented as.
Silent inline execution is dishonest — Swift schedules work expecting
it to run later (potentially elsewhere); the runtime delivers it
immediately on the calling thread without saying so. Async tests
appear to pass because the work happens to be reentrant, but any
genuinely off-thread requirement would be silently broken.

## Decision

**Default behaviour: run inline on the calling thread, but emit a
one-time WARNING log per `IotaRuntime` instance so the limitation is
audible. Provide an opt-in
`strict_thread_scheduling=True` constructor flag that flips the
callback to raise `NotImplementedInNativeError` on every invocation.**

Follow-up decision on 2026-04-28: **a real Python scheduler is not part
of the current Python-support hardening plan.** The future design may be
a thread executor, an `asyncio` bridge, or another runtime-owned
scheduler, but that choice is deliberately TBD and must be made in a
later implementation plan/ADR before code changes begin.

In strict mode the absence of an executor is a hard error; the runtime
refuses and the caller fails fast. In permissive mode (the default) the
callback runs the work but logs a single `WARNING` that points to
`python-runtime/README.non-goals.md`; subsequent invocations within the
same `IotaRuntime` log at `DEBUG` so heavy async workloads do not
deafen.

## Consequences

### Positive
- The limitation is *audible* by default. A `WARNING` log on first
  schedule lets operators know inline execution is happening; without
  it, the silent inline path was effectively undocumented behaviour.
- Strict mode is a clean opt-in for callers (CI, integration tests,
  production deployments that must not fall back to the inline path)
  who want the "do not silently run on the wrong thread" guarantee.
- No change to async behaviour for existing tests; current code paths
  rely on the inline execution and continue to work.

### Negative
- **Inline execution on the calling thread is still the default.** A
  Swift caller that genuinely requires off-thread execution still gets
  the wrong behaviour unless it (a) is run with `strict_thread_scheduling=True`
  enabled, or (b) is rewritten to not depend on the schedule contract.
  This is documented; it is not solved.
- Adding a real executor remains future work. The right design (asyncio
  bridge, dedicated worker thread, multi-thread pool) is non-trivial
  and pressure has not built up to commit to one yet.

### Neutral
- The non-goal of "off-main-thread executor" is recorded in
  [`python-runtime/README.non-goals.md`](../../python-runtime/README.non-goals.md);
  this ADR is the *why* and *how-to-opt-in*.

## Alternatives considered

**Implement a real executor (asyncio bridge, worker thread pool, etc.).**
The actually-correct fix. Deferred: building it before there is a real
caller risks designing for the wrong shape of work. Add the executor
when an integration test legitimately requires off-thread execution to
pass, not before.

**Refuse loudly in all cases (no permissive mode).** Cleaner contract
but breaks every existing async test that relies on the synchronous
inline path. Rejected: the existing tests are the most plausible callers
of the schedule contract today; making them fail loses signal more than
it gains. Strict mode gives the same guarantee opt-in for callers who
want it.

**Silently run inline (status quo before this ADR).** Rejected: the
silence was the original sin. Even the warning log is a meaningful
improvement over no signal.

## Related

- [`documentation/plans/implemented/python-support-plan.md`](../plans/implemented/python-support-plan.md)
  §6 step 4 — TDD step that landed the implementation.
- [`python-runtime/README.non-goals.md`](../../python-runtime/README.non-goals.md)
  — user-facing scope statement.
- `python-runtime/src/fishyjoes_python/iota/_runtime.py:IotaRuntime._schedule_thread_work` —
  the callback implementation.
- `python-runtime/tests/test_thread_scheduling.py` — unit tests pinning
  the warn-once / strict-raise contract.
