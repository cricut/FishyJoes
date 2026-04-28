"""No generated module may define two top-level classes with the same name.

When three Swift types share an unqualified name (e.g.
``Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces``,
``Swift.String.PuttingTypesIntoQuestionablePlaces``, and
``TestAPI.Structs.PuttingTypesIntoQuestionablePlaces``), the generator
emitted all three into a single ``PuttingTypesIntoQuestionablePlaces.py``
file with three ``class PuttingTypesIntoQuestionablePlaces:`` blocks.
The runtime registry's ``_cls_<setupName>`` aliases pointed at whichever
definition won the source-level shadow contest — typically the wrong one,
producing the ``setup_reference_type`` arg-type mismatch surfaced by
mypy.
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


class GeneratedNoNameCollisionTests(unittest.TestCase):
    def test_no_module_defines_two_top_level_classes_with_same_name(self) -> None:
        if not GENERATED_BINDINGS.exists():
            self.skipTest(
                f"generated bindings not present at {GENERATED_BINDINGS}; "
                "run `fishy-joes code-gen --python generate` in TestAPI first",
            )
        offenders: list[tuple[str, str]] = []
        for path in sorted(GENERATED_BINDINGS.glob("*.py")):
            tree = ast.parse(path.read_text(), filename=str(path))
            seen: set[str] = set()
            for node in tree.body:
                if isinstance(node, ast.ClassDef):
                    if node.name in seen:
                        offenders.append((path.name, node.name))
                    seen.add(node.name)
        self.assertEqual(
            offenders, [],
            f"generated modules with duplicate class names: {offenders}",
        )


if __name__ == "__main__":
    unittest.main()
