# Python Runtime Non-Goals

This package intentionally does not solve:

- **PyPy compatibility** — see [ADR-0003](../documentation/adr/0003-python-cpython-only.md)
  for the architectural reason and the alternatives considered (HPy is
  the most plausible future path).
- **Free-threaded CPython / no-GIL support** — same ADR. The C extension
  uses the GIL implicitly; certifying it for `Py_GIL_DISABLED` is real
  work, deferred until pressure exists.
- **Subinterpreter isolation (PEP 684)** — same ADR. Module-level
  state in `iota.py` and `_native.c` assumes one interpreter per
  process.
- **Off-main-thread work executor for Swift's scheduled-thread-work
  callback** — see [ADR-0010](../documentation/adr/0010-python-thread-scheduling-refuse-loudly.md).
  `IotaRuntime._schedule_thread_work` runs scheduled work inline on
  the calling thread. The runtime emits a one-time WARNING log for
  audibility; pass `strict_thread_scheduling=True` to `IotaRuntime` to
  make the absence loud and raise `NotImplementedInNativeError`
  instead.
- **Packaging policy for every platform at once.**
- **Automatic code generation for every FishyJoes type without
  generator support.**
- **Direct Swift source parsing inside Python.**
