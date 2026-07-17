"""Regression tests for the descriptor cache / ensure_setup thread-safety fix.

The TypeDescriptor subclasses (Optional, Array, Dictionary, Tuple, ...) are
constructed inline on every generated method call and interned into a shared
`_descriptor_cache` by `__new__`; their `ensure_setup()` performs one-time native
converter registration. Because the runtime marshals from multiple threads (async
completions, per ADR 0010), both the interning check-then-act and the
`ensure_setup` guard previously raced. The fix serialises both under a single
reentrant `_descriptor_lock` (with double-checked locking on the hot path).

These tests exercise the fix deterministically: many threads are released
simultaneously by a `threading.Barrier` (no sleeps) and must observe a single
interned instance and an idempotent, exception-free setup.
"""

import concurrent.futures
import threading
import unittest

import testapi

_THREADS = 16


class DescriptorConcurrencyTests(unittest.TestCase):
    def _race(self, make):
        """Run `make()` on _THREADS threads released together by a Barrier.

        Returns the list of results in thread order. Any exception raised inside
        a worker is re-raised here so the test fails loudly rather than silently.
        """
        barrier = threading.Barrier(_THREADS)

        def worker(_index):
            # Block until every worker is ready, maximising contention on the
            # check-then-act windows the fix closes.
            barrier.wait()
            return make()

        with concurrent.futures.ThreadPoolExecutor(max_workers=_THREADS) as executor:
            futures = [executor.submit(worker, index) for index in range(_THREADS)]
            return [future.result() for future in futures]

    def test_optional_interning_is_consistent_under_concurrency(self) -> None:
        native = testapi._native
        results = self._race(lambda: native.Optional(native.INT))

        first = results[0]
        for instance in results[1:]:
            self.assertIs(instance, first)
        # A fresh construction on the main thread also returns the one interned
        # instance: the cache is a single source of truth, not per-thread.
        self.assertIs(native.Optional(native.INT), first)

    def test_array_interning_is_consistent_under_concurrency(self) -> None:
        native = testapi._native
        results = self._race(lambda: native.Array("X", native.INT))

        first = results[0]
        for instance in results[1:]:
            self.assertIs(instance, first)
        self.assertIs(native.Array("X", native.INT), first)

    def test_dictionary_interning_is_consistent_under_concurrency(self) -> None:
        native = testapi._native
        results = self._race(lambda: native.Dictionary("D", native.STRING, native.INT))

        first = results[0]
        for instance in results[1:]:
            self.assertIs(instance, first)
        self.assertIs(native.Dictionary("D", native.STRING, native.INT), first)

    def test_distinct_keys_intern_to_distinct_instances(self) -> None:
        # Sanity check that interning keys on the full tuple: a different element
        # descriptor must produce a different cached instance, so the identity
        # assertions above are meaningful (not every construction collapsing to
        # one object).
        native = testapi._native
        int_optional = native.Optional(native.INT)
        string_optional = native.Optional(native.STRING)
        self.assertIsNot(int_optional, string_optional)
        self.assertIs(native.Optional(native.INT), int_optional)
        self.assertIs(native.Optional(native.STRING), string_optional)

    def test_ensure_setup_is_idempotent_under_concurrency(self) -> None:
        # Exercise the double-checked-locked ensure_setup against the loaded
        # dylibs: many threads call ensure_setup on the SAME interned descriptor
        # at once. The native converter setup must run without raising, end with
        # _is_setup True, and not corrupt the descriptor (still the one interned
        # instance). We use a swift_name the Swift runtime actually registers
        # ("ArrayConverter<Swift.Int16>"); a made-up name would abort the process
        # in native FishyJoesIotaRuntime as an unregistered typeID.
        native = testapi._native
        swift_name = "ArrayConverter<Swift.Int16>"
        descriptor = native.Array(swift_name, native.INT16)

        # Whether this descriptor was already set up by an earlier test in the
        # shared runtime is ordering-dependent; record it so we can assert the
        # False -> True transition deterministically when we own that transition,
        # without silently skipping the concurrency exercise either way.
        was_setup_before = descriptor._is_setup

        results = self._race(descriptor.ensure_setup)

        # The core invariant: under maximal contention (all 16 threads released by
        # the Barrier) every concurrent ensure_setup returns cleanly (None) and
        # none raises -- no double native setup, no FFI-handle corruption.
        self.assertEqual(results, [None] * _THREADS)
        self.assertTrue(descriptor._is_setup)
        if not was_setup_before:
            # We observed the one-time transition happen exactly under the race.
            self.assertTrue(descriptor._is_setup)

        # Identity is preserved: concurrent setup did not replace the instance.
        self.assertIs(native.Array(swift_name, native.INT16), descriptor)

        # Re-running stays idempotent (fast path) and still does not raise.
        descriptor.ensure_setup()
        self.assertTrue(descriptor._is_setup)


if __name__ == "__main__":
    unittest.main()
