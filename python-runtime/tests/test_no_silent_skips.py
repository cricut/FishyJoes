"""Catch the "every test in a category skipped because the probe was
wrong" failure mode.

A test suite that reports ``OK (skipped=N)`` is **not** a green build
when N covers an entire category of work that was supposed to land.
The specific failure shape this guards against:

- A new wrapper port adds 12 integration tests, all guarded by
  ``@unittest.skipUnless(SUPPORTED, …)``.
- The ``SUPPORTED`` probe checks for a Swift symbol whose name is
  also wrong.  ``SUPPORTED`` is False; all 12 tests skip.
- Unit tests pass against an overly-lenient ``_FakeRuntime``; CI shows
  ``OK``; the wrong port ships unnoticed.

The defence here: assert that for each category of integration tests
known to have a non-trivial number of cases, at least one passes
(or the probe being False is at least called out as a tracked
skip-reason rather than a wiring bug).
"""

from __future__ import annotations

import ast
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
INTEGRATION_TESTS = (
    ROOT / "integration-tests" / "TestAPI" / "bindings" / "python" / "tests"
)


def _skipUnless_probes(test_file: Path) -> list[tuple[int, str | None]]:
    """Return ``(line, probe_name)`` pairs for every
    ``@unittest.skipUnless(<name>, …)`` decorator in the file.

    ``probe_name`` is the bare identifier passed as the first argument
    (``SUPPORTED`` etc.); ``None`` if the first argument isn't a simple
    Name node (could be an inline ``hasattr(...)`` call etc., which we
    don't try to resolve here).
    """
    tree = ast.parse(test_file.read_text())
    probes: list[tuple[int, str | None]] = []
    for node in ast.walk(tree):
        if isinstance(node, ast.Call):
            func = node.func
            if (
                isinstance(func, ast.Attribute)
                and func.attr == "skipUnless"
                and isinstance(func.value, ast.Name)
                and func.value.id == "unittest"
            ) or (
                isinstance(func, ast.Name) and func.id == "skipUnless"
            ):
                first_arg = node.args[0] if node.args else None
                if isinstance(first_arg, ast.Name):
                    probes.append((node.lineno, first_arg.id))
                else:
                    probes.append((node.lineno, None))
    return probes


class NoSilentSkipsTests(unittest.TestCase):
    def test_attributed_string_integration_probe_resolves_to_real_symbol(self) -> None:
        """The ``SUPPORTED`` probe in the AttributedString integration
        tests must check for a Swift symbol that *actually exists* in
        the IOTA runtime sources.  If the probe checks a fictional
        symbol, the entire integration suite skips silently — the bug
        this regression net is designed to catch."""
        target = INTEGRATION_TESTS / "test_attributed_string.py"
        if not target.exists():
            self.skipTest(f"integration test file not present at {target}")
        # The probe lives in ``_runtime_supports_attributed_string`` and
        # checks ``hasattr(rt.iota_lib, "<symbol>")``.  Walk the AST to
        # find that string literal — multiline regex would be brittle.
        tree = ast.parse(target.read_text())
        probe_symbol: str | None = None
        for node in ast.walk(tree):
            if (
                isinstance(node, ast.Call)
                and isinstance(node.func, ast.Name)
                and node.func.id == "hasattr"
                and len(node.args) == 2
                and isinstance(node.args[1], ast.Constant)
                and isinstance(node.args[1].value, str)
                and node.args[1].value.startswith("__iota_")
            ):
                probe_symbol = node.args[1].value
                break
        self.assertIsNotNone(
            probe_symbol,
            "AttributedString integration tests must probe via "
            "hasattr(rt.iota_lib, '__iota_…')",
        )

        # Now look the symbol up in the actual IOTA exports.
        import re
        iota_root = ROOT / "Sources" / "FishyJoesIotaRuntime"
        export_pattern = re.compile(r'@_cdecl\("([^"]+)"\)')
        exported: set[str] = set()
        for swift_file in iota_root.rglob("*.swift"):
            for match in export_pattern.finditer(swift_file.read_text()):
                exported.add(match.group(1))
        self.assertIn(
            probe_symbol, exported,
            f"AttributedString integration probe checks for "
            f"{probe_symbol!r}, which does not exist as a Swift "
            f"@_cdecl export.  The probe will always be False and the "
            f"entire integration suite will skip silently.  See "
            f"feedback_skipping_is_yellow memory rule.",
        )

    def test_every_skipUnless_probe_resolves_to_a_named_symbol_or_constant(self) -> None:
        """Every ``@unittest.skipUnless(<probe>, …)`` decorator under
        the integration tests must reference a probe defined in the
        same module (a constant or callable result), not a magic
        string that nobody noticed was wrong."""
        if not INTEGRATION_TESTS.exists():
            self.skipTest(f"integration tests not present at {INTEGRATION_TESTS}")
        offenders: list[tuple[str, int]] = []
        for test_file in sorted(INTEGRATION_TESTS.glob("test_*.py")):
            tree = ast.parse(test_file.read_text())
            module_names = {
                node.targets[0].id
                for node in tree.body
                if isinstance(node, ast.Assign)
                and len(node.targets) == 1
                and isinstance(node.targets[0], ast.Name)
            }
            for line, probe in _skipUnless_probes(test_file):
                if probe is not None and probe not in module_names:
                    # The probe is a Name that isn't defined at module
                    # scope.  Could legitimately be from an import; allow
                    # those by also checking imports.
                    imported = {
                        alias.asname or alias.name
                        for node in tree.body
                        if isinstance(node, ast.ImportFrom | ast.Import)
                        for alias in node.names
                    }
                    if probe not in imported:
                        offenders.append((test_file.name, line))
        self.assertEqual(
            offenders, [],
            f"skipUnless probes that reference an undefined name: {offenders}.  "
            "Each skip must be traceable to a probe that lives in the same module.",
        )


if __name__ == "__main__":
    unittest.main()
