"""Python <-> Swift exception round-trip mechanics.

The integration tests in
``integration-tests/TestAPI/bindings/python/tests/`` exercise the full
Python <-> Swift <-> Python pipeline.  These tests pin the runtime
mechanics in isolation so a regression in retain/release ordering on
exception handles is caught here, before the integration tier is even
loaded.

Round-trip contract:
1. ``store_exception`` retains the Python exception object and writes
   its CPython address into a void* out-parameter (the cffi cdef'd
   ``exn`` slot).
2. ``raise_if_exception`` inspects the slot; if non-null it borrows the
   exception, releases the retain, and re-raises the *same instance*
   it received — type and identity preserved.
3. If the slot contains something that is not a ``BaseException``
   (because Swift produced a string), the runtime wraps it in
   ``NativeCallError`` with the string as the message.

Per the no-mocks rule
([feedback_no_mocks_real_runtime](../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md)):
the runtime is the real one.  ``ensure_loaded()`` is called for real —
no ``_loaded = True`` bypass.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))
TESTS = ROOT / "tests"
if str(TESTS) not in sys.path:
    sys.path.insert(0, str(TESTS))

import fishyjoes_python
from _real_runtime import build_real_runtime
from fishyjoes_python.exceptions import (
    ModuleError,
    NativeCallError,
)
from fishyjoes_python.iota import _ffi


class CustomError(ModuleError):
    """A module-style typed error used to verify identity round-trip."""


class ExceptionRoundtripTests(unittest.TestCase):
    def setUp(self) -> None:
        self.runtime = build_real_runtime()
        self.runtime.ensure_loaded()

    def test_store_then_raise_preserves_exact_instance(self) -> None:
        """The runtime must re-raise the exact object we stored, not a
        copy. ModuleError-typed exceptions must arrive on the Python
        side as their original subclass."""
        original = CustomError("ka-pow")
        out = _ffi.new("void*[1]")
        self.runtime.store_exception(out, original)

        slot_value = int(_ffi.cast("uintptr_t", out[0]))
        self.assertNotEqual(slot_value, 0,
                            "store_exception must populate the out-slot")

        with self.assertRaises(CustomError) as ctx:
            self.runtime.raise_if_exception(slot_value)

        self.assertIs(ctx.exception, original,
                      "round-trip must preserve identity, not just message")
        self.assertEqual(str(ctx.exception), "ka-pow")

    def test_null_slot_does_not_raise(self) -> None:
        """raise_if_exception with a zero handle is a no-op — that is
        the success-path contract Swift relies on."""
        self.runtime.raise_if_exception(0)
        self.runtime.raise_if_exception(None)

    def test_nonexception_payload_wraps_in_native_call_error(self) -> None:
        """If something non-BaseException ends up in the handle (e.g. a
        bare description string from Swift), the runtime must surface
        it as NativeCallError rather than letting a TypeError slip out."""
        from fishyjoes_python import _native as _native_ext
        addr = _native_ext.retain("not-an-exception")
        with self.assertRaises(NativeCallError) as ctx:
            self.runtime.raise_if_exception(addr)
        self.assertIn("not-an-exception", str(ctx.exception))

    def test_chained_roundtrip_matches_swift_reraise_pattern(self) -> None:
        """Exercise the 'Swift caught and re-stashed' pattern: the
        Python side stores, Swift would conceptually pass through
        unchanged, then the next FFI call re-raises.  Two stores in
        sequence must each round-trip correctly with no cross-talk."""
        first = CustomError("first")
        second = NativeCallError("second")

        out = _ffi.new("void*[1]")
        self.runtime.store_exception(out, first)
        first_slot = int(_ffi.cast("uintptr_t", out[0]))

        out2 = _ffi.new("void*[1]")
        self.runtime.store_exception(out2, second)
        second_slot = int(_ffi.cast("uintptr_t", out2[0]))

        # Distinct slots, distinct identities preserved.
        self.assertNotEqual(first_slot, second_slot)
        with self.assertRaises(CustomError) as ctx1:
            self.runtime.raise_if_exception(first_slot)
        self.assertIs(ctx1.exception, first)

        with self.assertRaises(NativeCallError) as ctx2:
            self.runtime.raise_if_exception(second_slot)
        self.assertIs(ctx2.exception, second)


if __name__ == "__main__":
    unittest.main()
