"""Runtime-invariant checks must be real ``raise`` statements, not ``assert``.

Under ``python -O`` (or ``PYTHONOPTIMIZE=1``) all ``assert`` statements are
elided, which would silently turn a guarded FFI invariant violation into
undefined behaviour at the C boundary.  The runtime must therefore use
explicit ``raise`` statements for every invariant it actually relies on.

Per the no-mocks rule
([feedback_no_mocks_real_runtime](../../../.claude/projects/-Users-antoniogermano-work-cricut-FishyJoes/memory/feedback_no_mocks_real_runtime.md)):
the corrupted-state tests below build a **real** runtime (real Swift
dylibs, real ``ensure_loaded()``) and then null out individual fields
to simulate a post-load corruption.  This is not a bypass — it is the
only way to exercise a defensive guard from inside the test process.
The runtime is genuinely loaded; we are pinning the contract that
``_require_not_none`` raises ``FishyJoesError`` (not ``AttributeError``)
when the FFI lib it guards is absent.
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
from fishyjoes_python.exceptions import FishyJoesError


class RuntimeInvariantTests(unittest.TestCase):
    def test_iota_lib_property_raises_when_not_loaded(self) -> None:
        """Accessing ``iota_lib`` before ``ensure_loaded`` must raise."""
        runtime = build_real_runtime()  # real dylibs, deliberately not loaded
        with self.assertRaises(FishyJoesError):
            _ = runtime.iota_lib

    def test_release_raises_under_optimize(self) -> None:
        """release_native_reference must guard with explicit raise, not ``assert``.

        Build a real, fully-loaded runtime; then null out the env/lib
        fields to simulate a corrupted post-load state.  If any
        ``assert`` was guarding the env/lib invariants we would crash
        with an AttributeError on a None attribute, not raise
        ``FishyJoesError``.
        """
        runtime = build_real_runtime()
        runtime.ensure_loaded()
        runtime.iota_runtime_lib = None
        runtime.env = None
        with self.assertRaises(FishyJoesError):
            runtime.release_native_reference(123)

    def test_describe_raises_under_optimize(self) -> None:
        runtime = build_real_runtime()
        runtime.ensure_loaded()
        runtime.iota_runtime_lib = None
        runtime.env = None
        with self.assertRaises(FishyJoesError):
            runtime.describe_native_reference(123)

    def test_no_bare_asserts_remain(self) -> None:
        """Belt-and-braces: every module under fishyjoes_python.iota
        must contain no ``assert`` statements that guard runtime state."""
        import ast
        iota_pkg = ROOT / "src" / "fishyjoes_python" / "iota"
        offenders: list[tuple[str, int]] = []
        for source_path in sorted(iota_pkg.glob("*.py")):
            tree = ast.parse(source_path.read_text())
            for node in ast.walk(tree):
                if isinstance(node, ast.Assert):
                    offenders.append((source_path.name, node.lineno))
        self.assertEqual(
            offenders, [],
            f"iota package still contains assert at {offenders}; convert to raise",
        )


if __name__ == "__main__":
    unittest.main()
