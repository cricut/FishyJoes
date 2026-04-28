"""The runtime must emit ``logging`` records on every FFI boundary
crossing that matters: library load, env setup, callback registration,
errors raised back from native, exceptions adapted, and lifecycle.

Without this, a SIGSEGV at the C boundary leaves zero breadcrumbs.

Per the no-mocks rule (``feedback_no_mocks_real_runtime``): tests run
against the real Swift dylibs.
"""

from __future__ import annotations

import logging
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


class LoggingTests(unittest.TestCase):
    def setUp(self) -> None:
        self._logger = logging.getLogger("fishyjoes")
        self._previous_level = self._logger.level
        self._logger.setLevel(logging.DEBUG)

    def tearDown(self) -> None:
        self._logger.setLevel(self._previous_level)

    def test_ensure_loaded_emits_log_record(self) -> None:
        """Loading the real runtime must produce log records that name
        the module and reference the load."""
        runtime = build_real_runtime()
        with self.assertLogs("fishyjoes", level="DEBUG") as captured:
            runtime.ensure_loaded()
        joined = "\n".join(captured.output)
        self.assertIn(
            "TestAPI", joined,
            f"expected module name in log output, got: {joined!r}",
        )
        self.assertTrue(
            any("ensure_loaded" in line or "load" in line.lower()
                for line in captured.output),
            f"expected a load-related log record, got: {captured.output!r}",
        )

    def test_register_error_factory_logs(self) -> None:
        """Replacing the runtime's error factory is auditable: the
        operation emits a DEBUG log."""
        runtime = build_real_runtime()
        with self.assertLogs("fishyjoes", level="DEBUG") as captured:
            runtime.register_error_factory(lambda msg: RuntimeError(msg))
        self.assertTrue(captured.output, "expected at least one log record")

    def test_native_error_log_includes_message(self) -> None:
        """``raise_native_error`` is the path Swift native errors take
        into Python; the message is preserved verbatim and surfaces in
        a WARNING log record so production debugging has breadcrumbs."""
        runtime = build_real_runtime()
        with self.assertRaises(fishyjoes_python.NativeCallError), \
                self.assertLogs("fishyjoes", level="WARNING") as captured:
            runtime.raise_native_error("boom from native")
        joined = "\n".join(captured.output)
        self.assertIn("boom from native", joined)


if __name__ == "__main__":
    unittest.main()
