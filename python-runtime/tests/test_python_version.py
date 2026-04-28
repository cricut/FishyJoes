"""The runtime must enforce its minimum Python version at import time
and via ``ensure_cpython``.

3.10 reaches end-of-life in October 2026; 3.11 is the lowest version
that survives 2026 and beyond.

Per the no-mocks rule
([feedback_no_mocks_real_runtime](../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md)):
the only sanctioned ``mock.patch`` here is on ``sys.version_info`` for
``test_ensure_supported_python_rejects_old_version`` — irreducible
without an actual 3.10 interpreter.  Every other test verifies its
contract against the real, unpatched implementation.

The delegation pin (``ensure_cpython`` ⟶ ``ensure_supported_python``)
that previously used ``mock.patch.object`` is rewritten as an AST
inspection of the real source: equally rigorous, zero patching.
"""

from __future__ import annotations

import ast
import inspect
import sys
import unittest
from pathlib import Path
from unittest import mock

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))

import fishyjoes_python
from fishyjoes_python.runtime import (
    MIN_PYTHON_VERSION,
    ensure_supported_python,
)


class PythonVersionTests(unittest.TestCase):
    def test_minimum_version_is_3_11(self) -> None:
        self.assertEqual(MIN_PYTHON_VERSION, (3, 11))

    def test_pyproject_requires_python_matches(self) -> None:
        text = (ROOT / "pyproject.toml").read_text()
        self.assertIn('requires-python = ">=3.11"', text)

    def test_ensure_cpython_calls_ensure_supported_python(self) -> None:
        """``ensure_cpython`` is the entry point used by IotaRuntime — it
        must enforce the minimum version, not just the implementation.

        Verified by AST inspection of the real source rather than
        ``mock.patch.object``: walk the function body and assert it
        contains a call to ``ensure_supported_python``.  The escape
        valve (sys.version_info mock) is reserved for the one test
        that genuinely cannot avoid it.
        """
        source = inspect.getsource(fishyjoes_python.ensure_cpython)
        tree = ast.parse(source)
        called_names = {
            node.func.id
            for node in ast.walk(tree)
            if isinstance(node, ast.Call) and isinstance(node.func, ast.Name)
        }
        self.assertIn(
            "ensure_supported_python", called_names,
            f"ensure_cpython source does not call ensure_supported_python; "
            f"called: {sorted(called_names)!r}",
        )

    def test_ensure_supported_python_rejects_old_version(self) -> None:
        """When run on a hypothetical 3.10 host, ensure_supported_python
        must raise.

        DOCUMENTED ESCAPE VALVE: this is the one ``mock.patch`` allowed
        in the unit suite — verifying 3.10 rejection is irreducible
        without spawning an actual 3.10 interpreter, which the test
        environment cannot guarantee.  See module docstring.
        """
        fake = (3, 10, 14)
        with mock.patch.object(sys, "version_info", fake):
            with self.assertRaises(RuntimeError) as ctx:
                ensure_supported_python()
        self.assertIn("3.11", str(ctx.exception))

    def test_ensure_supported_python_accepts_current_host(self) -> None:
        # Sanity: this test process is always >= 3.11 (pyproject pins it).
        ensure_supported_python()  # must not raise


if __name__ == "__main__":
    unittest.main()
