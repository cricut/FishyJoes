"""Concurrent ``ensure_loaded`` must not corrupt the shared ``cffi.FFI()``.

The runtime keeps a single process-global ``cffi.FFI()`` and uses
``cdef()`` to register C declarations as new modules load.  ``cffi``
documents thread safety on individual ``Lib`` access, not on
concurrent ``cdef`` calls — racing two ``ensure_loaded`` calls on
distinct module libraries could observe a half-applied cdef and either
crash or register the wrong signature for a symbol.

The runtime serialises every ``cdef`` mutation through ``_cdef``, which
acquires ``_ffi_lock`` before delegating to ``_ffi.cdef``.  These tests
pin that contract:

1. The module exposes a real lock.
2. Calling ``_cdef`` while the lock is already held *blocks*, proving
   the wrapper acquires it (no monkey-patching needed — we observe the
   actual lock contention).
3. 16 concurrent ``load_module_declarations`` calls against the real
   runtime do not raise.

Per the no-mocks rule
([feedback_no_mocks_real_runtime](../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md)):
no ``mock.patch``, no ``_loaded = True`` bypass.  The runtime is the
real one, fully ``ensure_loaded()``'d, exercising real cdef paths.
"""

from __future__ import annotations

import sys
import threading
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))
TESTS = ROOT / "tests"
if str(TESTS) not in sys.path:
    sys.path.insert(0, str(TESTS))

from _real_runtime import build_real_runtime
from fishyjoes_python import iota as iota_module
from fishyjoes_python.iota._ffi import _cdef, _ffi_lock


class CffiThreadSafetyTests(unittest.TestCase):
    def test_module_exposes_a_cffi_lock(self) -> None:
        """The runtime must own a documented lock that protects every
        cffi mutation.  Naming it explicitly so tests and reviewers can
        assert against it."""
        self.assertTrue(hasattr(iota_module, "_ffi_lock"),
                        "iota module must expose `_ffi_lock`")
        lock = iota_module._ffi_lock
        self.assertTrue(hasattr(lock, "acquire"))
        self.assertTrue(hasattr(lock, "release"))

    def test_cdef_blocks_when_lock_already_held(self) -> None:
        """Hold ``_ffi_lock`` from a watcher thread and verify that
        ``_cdef`` blocks until the lock is released.  This pins the
        contract that ``_cdef`` actually acquires the lock for the
        duration of the call — without patching cffi or instrumenting
        the cdef call."""
        holder_acquired = threading.Event()
        holder_may_release = threading.Event()

        def hold_lock() -> None:
            with _ffi_lock:
                holder_acquired.set()
                holder_may_release.wait(timeout=5)

        holder = threading.Thread(target=hold_lock, name="ffi-lock-holder")
        holder.start()
        try:
            self.assertTrue(holder_acquired.wait(timeout=2),
                            "watcher thread never acquired _ffi_lock")

            cdef_completed = threading.Event()
            cdef_error: list[BaseException] = []

            def call_cdef() -> None:
                try:
                    # Distinct typedef per test invocation keeps cdef happy
                    # across re-runs without override=True.
                    _cdef(f"typedef int probe_lock_t_{id(self):x};")
                except BaseException as exc:  # noqa: BLE001 — surface every error
                    cdef_error.append(exc)
                finally:
                    cdef_completed.set()

            cdef_thread = threading.Thread(target=call_cdef, name="cdef-caller")
            cdef_thread.start()
            try:
                # While the watcher holds the lock, _cdef MUST NOT complete.
                self.assertFalse(
                    cdef_completed.wait(timeout=0.25),
                    "_cdef returned while _ffi_lock was held — lock not "
                    "acquired by the wrapper",
                )
            finally:
                holder_may_release.set()

            self.assertTrue(
                cdef_completed.wait(timeout=2),
                "_cdef did not complete within 2s after the lock was released",
            )
            cdef_thread.join(timeout=2)
            self.assertEqual(cdef_error, [],
                             f"unexpected error inside _cdef: {cdef_error!r}")
        finally:
            holder_may_release.set()
            holder.join(timeout=2)

    def test_concurrent_load_module_declarations_does_not_race(self) -> None:
        """Smoke test against the real, fully-loaded runtime: 16 threads
        each calling ``load_module_declarations`` with distinct (no-op)
        headers must not raise."""
        runtime = build_real_runtime()
        runtime.ensure_loaded()

        errors: list[BaseException] = []
        errors_lock = threading.Lock()

        def worker(idx: int) -> None:
            try:
                # Distinct typedef per thread keeps cdef happy.
                runtime.load_module_declarations(
                    f"typedef int fishyjoes_test_t_{idx};"
                )
            except BaseException as e:  # noqa: BLE001 — test wants every error
                with errors_lock:
                    errors.append(e)

        threads = [threading.Thread(target=worker, args=(i,)) for i in range(16)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        self.assertEqual(errors, [], f"unexpected errors: {errors}")


if __name__ == "__main__":
    unittest.main()
