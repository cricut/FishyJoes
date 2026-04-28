"""Every generated binding must pass mypy.

After steps A–D ``KNOWN_FAILING`` is empty: the generator emits
type-correct Python for the entire TestAPI fixture (69 .py files).
Any new entry to ``KNOWN_FAILING`` is a regression and the explicit
``test_known_failing_must_stay_empty`` assertion fails to make sure
nobody quietly adds one to silence a real bug.

Skipped if mypy is not installed in the active venv, because
contributors running ``unittest`` outside CI should not fail just for
missing lint tooling.
"""

from __future__ import annotations

import importlib.util
import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GENERATED_BINDINGS = (
    ROOT / "integration-tests" / "TestAPI" / "bindings" / "python"
    / "generated" / "src" / "cricut_testapi"
)


# Files that mypy still flags.  Empty by design after follow-up steps
# A–D.  ``test_known_failing_must_stay_empty`` enforces this — any
# regression that would re-add an entry is caught at test time, not by
# someone reviewing the diff.
KNOWN_FAILING: frozenset[str] = frozenset()


class GeneratedTypecheckTests(unittest.TestCase):
    def test_known_failing_must_stay_empty(self) -> None:
        """Locks the gate.  Adding any file here should require fixing the
        generator instead — re-introducing an entry is a regression."""
        self.assertEqual(
            KNOWN_FAILING, frozenset(),
            "KNOWN_FAILING should remain empty; fix the underlying "
            "generator bug rather than adding a file to the allowlist.",
        )

    @unittest.skipUnless(
        importlib.util.find_spec("mypy") is not None, "mypy not installed",
    )
    def test_per_class_files_pass_mypy(self) -> None:
        if not GENERATED_BINDINGS.exists():
            self.skipTest(
                f"generated bindings not present at {GENERATED_BINDINGS}; "
                "run `fishy-joes code-gen --python generate` in TestAPI first",
            )
        targets: list[str] = []
        for entry in sorted(GENERATED_BINDINGS.glob("*.py")):
            if entry.name in KNOWN_FAILING:
                continue
            targets.append(str(entry))
        if not targets:
            self.skipTest("no generated files to check")
        result = subprocess.run(
            [
                sys.executable, "-m", "mypy",
                "--ignore-missing-imports",
                # ``silent`` so mypy still uses the imports for type
                # resolution but does not report errors *inside* them —
                # KNOWN_FAILING files are tracked separately.
                "--follow-imports=silent",
                *targets,
            ],
            cwd=GENERATED_BINDINGS,
            capture_output=True,
            text=True,
        )
        self.assertEqual(
            result.returncode, 0,
            f"mypy failures on supposedly-clean generated files:\n"
            f"STDOUT:\n{result.stdout}\nSTDERR:\n{result.stderr}",
        )


if __name__ == "__main__":
    unittest.main()
