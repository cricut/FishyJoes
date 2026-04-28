"""``ensure_loaded`` must be idempotent: callbacks must not accumulate
on repeated calls.

Each cffi callback held in ``runtime._callbacks`` is a strong reference
to a closure that captures ``self``.  If ``ensure_loaded`` ever ran more
than once, every type would re-register and the list would grow without
bound, leaking native shim memory and producing duplicate registrations
on the Swift side.

Per the no-mocks rule (``feedback_no_mocks_real_runtime``): tests run
against the real Swift dylibs.  The ``swift build && fishy-joes code-gen
--python build`` prerequisite is documented in ``_real_runtime.py``.
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


class CallbackAccumulationTests(unittest.TestCase):
    def test_repeated_ensure_loaded_does_not_grow_callbacks(self) -> None:
        """After the first ``ensure_loaded`` settles, calling it nine
        more times against the real runtime must leave the cffi
        callback list at the same length."""
        runtime = build_real_runtime()
        runtime.ensure_loaded()
        baseline = len(runtime._callbacks)
        self.assertGreater(
            baseline, 0,
            "first ensure_loaded must register at least the env / converter "
            "callbacks; got an empty list",
        )
        for _ in range(9):
            runtime.ensure_loaded()
        self.assertEqual(
            len(runtime._callbacks), baseline,
            f"expected callback count unchanged across repeated "
            f"ensure_loaded; baseline={baseline}, after-loop="
            f"{len(runtime._callbacks)}",
        )

    def test_loaded_flag_pins_idempotency(self) -> None:
        """The ``self._loaded`` flag is the explicit gate.  After the
        first ``ensure_loaded`` it is True; subsequent calls early-return
        without re-running setup, which is the property the callback
        non-accumulation depends on."""
        runtime = build_real_runtime()
        self.assertFalse(runtime._loaded)
        runtime.ensure_loaded()
        self.assertTrue(runtime._loaded)
        # A second call must not flip the flag back or do anything that
        # would re-execute setup.
        runtime.ensure_loaded()
        self.assertTrue(runtime._loaded)


if __name__ == "__main__":
    unittest.main()
