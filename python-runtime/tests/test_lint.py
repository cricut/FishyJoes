"""The hand-written runtime sources must pass ``ruff check`` and ``mypy``.

These run against ``python-runtime/src/`` only. Generated code is
covered by the integration-test bindings, not by this package's tests.

Skipped if the corresponding tool is not installed in the active venv,
so a contributor running ``unittest`` outside CI does not fail just
because they have not installed lint tools.
"""

from __future__ import annotations

import shutil
import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"


def _have(tool: str) -> bool:
    return shutil.which(tool) is not None or _module_available(tool)


def _module_available(name: str) -> bool:
    try:
        __import__(name)
    except ImportError:
        return False
    return True


class LintTests(unittest.TestCase):
    @unittest.skipUnless(_have("ruff"), "ruff not installed")
    def test_ruff_check(self) -> None:
        result = subprocess.run(
            [sys.executable, "-m", "ruff", "check", str(SRC)],
            cwd=ROOT,
            capture_output=True,
            text=True,
        )
        self.assertEqual(
            result.returncode, 0,
            f"ruff failures:\nSTDOUT:\n{result.stdout}\nSTDERR:\n{result.stderr}",
        )

    @unittest.skipUnless(_module_available("mypy"), "mypy not installed")
    def test_mypy_typecheck(self) -> None:
        result = subprocess.run(
            [sys.executable, "-m", "mypy", str(SRC)],
            cwd=ROOT,
            capture_output=True,
            text=True,
        )
        self.assertEqual(
            result.returncode, 0,
            f"mypy failures:\nSTDOUT:\n{result.stdout}\nSTDERR:\n{result.stderr}",
        )


if __name__ == "__main__":
    unittest.main()
