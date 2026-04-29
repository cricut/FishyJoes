"""Generated Python package ruff policy should stay narrow and intentional."""

from __future__ import annotations

import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TEMPLATE_PYPROJECT = (
    ROOT
    / "Sources"
    / "FishyJoesExecute"
    / "Resources"
    / "bindings-template"
    / "python"
    / "__TEMPLATE__"
    / "pyproject.toml"
)


def _template_ruff_ignores() -> set[str]:
    text = TEMPLATE_PYPROJECT.read_text()
    match = re.search(r"ignore = \[(.*?)\]", text, flags=re.S)
    if match is None:
        raise AssertionError(f"No ruff ignore list found in {TEMPLATE_PYPROJECT}")
    return set(re.findall(r'"([A-Z]\d{3})"', match.group(1)))


class GeneratedRuffPolicyTests(unittest.TestCase):
    def test_fixed_runtime_template_rules_are_not_ignored(self) -> None:
        self.assertFalse(
            {"F841", "B009"} & _template_ruff_ignores(),
            "F841 and B009 are avoidable in the generated runtime template "
            "and must not be globally ignored.",
        )


if __name__ == "__main__":
    unittest.main()
