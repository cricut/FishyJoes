"""Every generated Python file must parse with ``ast.parse``.

This is the cheapest possible regression net for the
``PythonProductClass`` / ``PythonTranslator`` emitters.  ``compileall``
already runs in CI but only after the full test phase, and it gives a
single pass/fail per binding rather than per-file diagnostics.  Walking
the tree directly catches a broken emitter early and points at the
specific file.

Pure stdlib; runs in a few milliseconds.
"""

from __future__ import annotations

import ast
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GENERATED_BINDINGS = (
    ROOT / "integration-tests" / "TestAPI" / "bindings" / "python"
    / "generated" / "src" / "cricut_testapi"
)


class GeneratedAstTests(unittest.TestCase):
    def test_every_generated_module_parses(self) -> None:
        if not GENERATED_BINDINGS.exists():
            self.skipTest(
                f"generated bindings not present at {GENERATED_BINDINGS}; "
                "run `fishy-joes code-gen --python generate` in TestAPI first",
            )
        py_files = sorted(GENERATED_BINDINGS.glob("*.py"))
        self.assertGreater(
            len(py_files), 5,
            f"expected many generated modules; saw {len(py_files)} in "
            f"{GENERATED_BINDINGS} — generator may be broken",
        )
        for path in py_files:
            with self.subTest(path=str(path.relative_to(GENERATED_BINDINGS))):
                source = path.read_text()
                try:
                    ast.parse(source, filename=str(path))
                except SyntaxError as exc:
                    self.fail(
                        f"{path.relative_to(GENERATED_BINDINGS)} did not parse: "
                        f"{exc.msg} at line {exc.lineno}",
                    )


if __name__ == "__main__":
    unittest.main()
