"""Generated bindings must import Foundation runtime types from
``fishyjoes_python``, not as siblings of the per-module package.

Before this net existed, the Python codegen emitted
``if typing.TYPE_CHECKING: from .AttributedString import AttributedString``
in every per-module file that referenced Swift's
``AttributedString`` — but no ``AttributedString.py`` ever exists in
the generated tree (it lives in ``python-runtime`` as a hand-written
runtime wrapper).  ``mypy`` silently ignored the broken import inside
``TYPE_CHECKING``; the result was that every Foundation-typed return
silently became ``Any`` for type checkers, which is exactly how the
underlying wrapper-layer brokenness survived months of unit-test
passes against fictional Swift symbol names.

This regression net asserts the structural fix: walk every generated
``.py`` under TestAPI's ``cricut_testapi`` package, parse its imports,
and prove that every reference to a Foundation runtime type
(``AttributedString``, ``AttributeContainer``, etc.) is imported from
``fishyjoes_python``.  Sibling imports of those names are forbidden.

The list of Foundation classes mirrors
``Sources/FishyJoesCore/TranslatedTypes/TranslatedAttributedString.swift``;
keep them in sync.
"""

from __future__ import annotations

import ast
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "python-runtime" / "src"
if str(SRC) not in sys.path:
    sys.path.insert(0, str(SRC))
GENERATED_BINDINGS = (
    ROOT / "integration-tests" / "TestAPI" / "bindings" / "python"
    / "generated" / "src" / "cricut_testapi"
)

# Mirrors TranslatedAttributedString.swift's pythonTypeOverride entries.
# Every value here is a class exported from ``fishyjoes_python``;
# generated per-module code must import these from ``fishyjoes_python``,
# never as a sibling.
FOUNDATION_RUNTIME_CLASSES: frozenset[str] = frozenset({
    "AttributeContainer",
    "AttributeContainerFoundationAttributes",
    "AttributedString",
    "AttributedStringCharacterView",
    "AttributedStringIndex",
    "AttributedStringRun",
    "AttributedStringRuns",
    "AttributedStringUnicodeScalarView",
    "AttributedSubstring",
})


def _imports_in_module(tree: ast.Module) -> list[ast.AST]:
    """Return every Import / ImportFrom node, including those inside
    ``if typing.TYPE_CHECKING:`` guards."""
    nodes: list[ast.AST] = []
    for node in ast.walk(tree):
        if isinstance(node, (ast.Import, ast.ImportFrom)):
            nodes.append(node)
    return nodes


class GeneratedFoundationImportsTests(unittest.TestCase):
    def setUp(self) -> None:
        if not GENERATED_BINDINGS.exists():
            self.skipTest(
                f"generated bindings not present at {GENERATED_BINDINGS}; "
                "run `fishy-joes code-gen --python generate` in TestAPI first",
            )

    def test_no_sibling_imports_of_foundation_types(self) -> None:
        """No generated file may import a Foundation runtime type as a
        sibling (``from .AttributedString import AttributedString``).
        That pattern was the previous broken behaviour."""
        offenders: list[tuple[str, int, str]] = []
        for path in sorted(GENERATED_BINDINGS.glob("*.py")):
            source = path.read_text()
            tree = ast.parse(source, filename=str(path))
            for imp in _imports_in_module(tree):
                if not isinstance(imp, ast.ImportFrom):
                    continue
                # Sibling import of a Foundation type: ``from .X import X``
                # where X is in the Foundation list.
                if imp.level == 1 and imp.module in FOUNDATION_RUNTIME_CLASSES:
                    offenders.append((
                        path.name,
                        imp.lineno,
                        f"from .{imp.module} import ...",
                    ))
                # Or `from . import X` where X is Foundation.
                if imp.level == 1 and imp.module is None:
                    for alias in imp.names:
                        if alias.name in FOUNDATION_RUNTIME_CLASSES:
                            offenders.append((
                                path.name,
                                imp.lineno,
                                f"from . import {alias.name}",
                            ))
        self.assertEqual(
            offenders, [],
            "generated bindings must not import Foundation runtime types as "
            f"siblings; found {len(offenders)} violation(s):\n  " +
            "\n  ".join(f"{f}:{lineno}: {snippet}" for f, lineno, snippet in offenders),
        )

    def test_foundation_references_import_from_fishyjoes_python(self) -> None:
        """Every generated module that mentions a Foundation runtime type
        in a type annotation must also import that type from
        ``fishyjoes_python``."""
        offenders: list[tuple[str, str]] = []
        for path in sorted(GENERATED_BINDINGS.glob("*.py")):
            source = path.read_text()
            tree = ast.parse(source, filename=str(path))
            referenced = self._referenced_foundation_names(tree)
            if not referenced:
                continue
            imported = self._foundation_imports_from_fishyjoes_python(tree)
            missing = referenced - imported
            for name in sorted(missing):
                offenders.append((path.name, name))
        self.assertEqual(
            offenders, [],
            "every Foundation runtime type referenced in a generated "
            "module must be imported via "
            "``from fishyjoes_python import <Name>``; missing:\n  " +
            "\n  ".join(f"{f}: {name}" for f, name in offenders),
        )

    def test_runtime_re_exports_every_foundation_class(self) -> None:
        """``fishyjoes_python.__init__`` must export every name the
        generator emits in upstream imports.  Without this, the
        generated ``from fishyjoes_python import AttributedStringRun``
        would fail at runtime even though TYPE_CHECKING-gated."""
        import fishyjoes_python  # type: ignore[import-untyped]
        for name in FOUNDATION_RUNTIME_CLASSES:
            with self.subTest(name=name):
                self.assertTrue(
                    hasattr(fishyjoes_python, name),
                    f"fishyjoes_python.__init__ does not export {name}; "
                    f"either the wrapper class is missing or __all__/__init__ "
                    f"needs updating",
                )

    @staticmethod
    def _referenced_foundation_names(tree: ast.Module) -> set[str]:
        """Walk all ast.Name nodes; collect those whose id matches a
        Foundation runtime class name."""
        seen: set[str] = set()
        for node in ast.walk(tree):
            if isinstance(node, ast.Name) and node.id in FOUNDATION_RUNTIME_CLASSES:
                seen.add(node.id)
        return seen

    @staticmethod
    def _foundation_imports_from_fishyjoes_python(tree: ast.Module) -> set[str]:
        """Collect every name imported via
        ``from fishyjoes_python import X`` (or ``X as Y`` — we record
        the original X) from this module, including imports inside
        ``if typing.TYPE_CHECKING:`` blocks."""
        seen: set[str] = set()
        for node in ast.walk(tree):
            if isinstance(node, ast.ImportFrom) and node.module == "fishyjoes_python":
                for alias in node.names:
                    seen.add(alias.name)
        return seen


if __name__ == "__main__":
    unittest.main()
