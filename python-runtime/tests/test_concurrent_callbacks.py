"""retain/borrow/release under contention.

The C extension's retain/release are CPython refcount operations and
should be GIL-safe.  These tests pin that contract: many threads doing
many retain/borrow/release cycles on the same set of objects must not
corrupt the refcount, leak a reference, or double-free.

A failure here would manifest as a refcount drift (caught by
``sys.getrefcount`` deltas) or, worst case, a ``SIGSEGV`` from a
double-free — which we cannot recover from in a test, so the threshold
is conservative.
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

from fishyjoes_python import _native as _native_ext


class ConcurrentCallbackTests(unittest.TestCase):
    def test_retain_release_balanced_under_contention(self) -> None:
        """N threads each retain & release the same object many times.
        Refcount must return to baseline after the joinedd workers."""
        target = {"shared": object()}
        baseline = sys.getrefcount(target)
        iterations_per_thread = 1000
        thread_count = 16

        errors: list[BaseException] = []

        def worker() -> None:
            try:
                for _ in range(iterations_per_thread):
                    handle = _native_ext.retain(target)
                    borrowed = _native_ext.borrow(handle)
                    if borrowed is not target:
                        raise AssertionError("borrow returned wrong object")
                    _native_ext.release(handle)
            except BaseException as e:  # noqa: BLE001
                errors.append(e)

        threads = [threading.Thread(target=worker) for _ in range(thread_count)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        self.assertEqual(errors, [], f"unexpected errors: {errors}")
        # After all threads finish, the refcount should equal baseline.
        # A leak would manifest as baseline + N for some N > 0.
        self.assertEqual(
            sys.getrefcount(target), baseline,
            f"refcount drift: baseline={baseline}, "
            f"now={sys.getrefcount(target)}",
        )

    def test_retain_distinct_objects_concurrently(self) -> None:
        """Many threads retain/release on distinct objects must not
        cross-contaminate handle bookkeeping."""
        targets = [object() for _ in range(64)]
        baselines = [sys.getrefcount(o) for o in targets]
        iterations = 200
        errors: list[BaseException] = []

        def worker(obj: object) -> None:
            try:
                for _ in range(iterations):
                    h = _native_ext.retain(obj)
                    if _native_ext.borrow(h) is not obj:
                        raise AssertionError("retain/borrow identity failure")
                    _native_ext.release(h)
            except BaseException as e:  # noqa: BLE001
                errors.append(e)

        threads = [threading.Thread(target=worker, args=(o,)) for o in targets]
        for t in threads:
            t.start()
        for t in threads:
            t.join()
        # Drop Thread objects so their captured ``args`` tuples no longer
        # add to the targets' refcounts.
        del threads
        import gc
        gc.collect()

        self.assertEqual(errors, [], f"unexpected errors: {errors}")
        for i, baseline in enumerate(baselines):
            current = sys.getrefcount(targets[i])
            self.assertEqual(
                current, baseline,
                f"refcount drift on object index {i}: baseline={baseline}, "
                f"now={current}",
            )

    def test_borrow_does_not_release(self) -> None:
        """borrow returns a new reference; the caller must release the
        retained handle independently. Specifically: borrow N times
        without release must not produce N distinct refs that cancel
        the original retain."""
        obj = object()
        baseline = sys.getrefcount(obj)
        h = _native_ext.retain(obj)
        try:
            self.assertEqual(sys.getrefcount(obj), baseline + 1)
            # borrow N times — each should produce a new strong ref
            # (the C extension uses Py_INCREF before returning).
            borrowed = [_native_ext.borrow(h) for _ in range(8)]
            self.assertEqual(sys.getrefcount(obj), baseline + 1 + 8)
            del borrowed
            self.assertEqual(sys.getrefcount(obj), baseline + 1)
        finally:
            _native_ext.release(h)
        self.assertEqual(sys.getrefcount(obj), baseline)


if __name__ == "__main__":
    unittest.main()
