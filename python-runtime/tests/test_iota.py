"""Pinned mechanics for the iota package's Python-side helpers.

The two strong-duplicate-candidate tests that previously lived here
(``test_handle_coercion`` and ``test_reference_release_uses_runtime``)
were quarantined to ``tests/duplicates/`` for user review — see that
folder's ``README.md``.

Per the no-mocks rule
([feedback_no_mocks_real_runtime](../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md)):
the remaining tests construct the **real** runtime (real Swift dylibs,
real ``_native`` C extension) but deliberately do not invoke
``ensure_loaded()`` because the contracts they pin are pre-load:

- ``_decode_utf16_z`` is a pure-Python decoder over a cffi buffer — it
  never touches the runtime at all.
- ``_retain``/``_release`` go directly through the ``_native`` C
  extension; they do not require the Swift dylibs to be loaded.
- ``describe_native_reference(None)`` returns ``"<null>"`` before any
  dlopen runs; that is its documented pre-load contract.
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

from _real_runtime import build_real_runtime
from fishyjoes_python.iota import _decode_utf16_z, _ffi


class IotaRuntimeTests(unittest.TestCase):
    def test_decode_utf16_z(self) -> None:
        # Build a UTF-16LE buffer via cffi.
        buf = _ffi.new("uint16_t[]", [ord("h"), ord("i"), 0, 0])
        self.assertEqual(_decode_utf16_z(buf), "hi")

    def test_decode_utf16_z_null(self) -> None:
        self.assertEqual(_decode_utf16_z(None), "")
        self.assertEqual(_decode_utf16_z(_ffi.NULL), "")

    def test_retain_release_roundtrip(self) -> None:
        """retain stores a strong ref; borrow recovers the object; release drops it."""
        from fishyjoes_python.iota import _borrow_python_value

        runtime = build_real_runtime()  # real dylibs, but no ensure_loaded — _retain doesn't need it

        obj = {"key": "value"}
        before = sys.getrefcount(obj)
        handle = runtime._retain(obj)
        self.assertIsInstance(handle, int)
        self.assertNotEqual(handle, 0)
        self.assertEqual(sys.getrefcount(obj), before + 1)

        recovered = _borrow_python_value(handle)
        self.assertIs(recovered, obj)
        del recovered

        runtime._release(handle)
        self.assertEqual(sys.getrefcount(obj), before)

    def test_describe_native_reference_no_env(self) -> None:
        """describe_native_reference returns '<null>' for None input without loading."""
        runtime = build_real_runtime()  # real dylibs, no ensure_loaded — pre-load contract
        self.assertEqual(runtime.describe_native_reference(None), "<null>")


if __name__ == "__main__":
    unittest.main()
