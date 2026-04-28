"""Every IOTA symbol referenced by ``attributed_string.py`` must actually
exist in the FishyJoesIotaRuntime Swift sources.

Background: it is easy to invent a plausible-sounding symbol name (the
sort of thing peer runtimes might use) and have every unit test pass
against a permissive ``_FakeRuntime`` whose ``__getattr__`` returns a
function for any attribute name.  When the integration suite eventually
runs against the real dylib, the symbol's absence surfaces as
``AttributeError`` — by which point a whole port may have been built on
fictional names.

This test grep-scans the actual Swift ``@_cdecl(...)`` exports under
``Sources/FishyJoesIotaRuntime/`` and asserts that every symbol the
Python wrapper reaches for is in that set.

It is the regression net for: not inventing symbol names; not assuming a
``clone`` symbol exists; not picking a wrong prefix.
"""

from __future__ import annotations

import ast
import re
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PYTHON_RUNTIME_SRC = ROOT / "python-runtime" / "src" / "fishyjoes_python"
IOTA_RUNTIME_SOURCES = ROOT / "Sources" / "FishyJoesIotaRuntime"


def _exported_symbols() -> set[str]:
    """Walk every .swift file under ``Sources/FishyJoesIotaRuntime/`` and
    collect the names declared with ``@_cdecl("…")``."""
    pattern = re.compile(r'@_cdecl\("([^"]+)"\)')
    found: set[str] = set()
    for swift_file in IOTA_RUNTIME_SOURCES.rglob("*.swift"):
        text = swift_file.read_text()
        for match in pattern.finditer(text):
            found.add(match.group(1))
    return found


def _referenced_iota_symbols(python_file: Path) -> set[str]:
    """Walk ``attributed_string.py`` (and any other file we point this
    at) and collect every ``runtime.iota_lib.<name>`` /
    ``self._runtime.iota_lib.<name>`` attribute access.

    Symbols are emitted as ``__iota_*`` or ``__iota_get_*`` or
    ``__iota_set_*`` etc.; the wrapper might also build a name with
    f-strings via ``getattr(...)``, but those go through ``_iota_prefix
    + "_endIndex"`` style lookups that the test exercises by
    instantiating each prefix concatenation explicitly (see
    ``_synthetic_view_symbols`` below).
    """
    tree = ast.parse(python_file.read_text())
    referenced: set[str] = set()

    class _Visitor(ast.NodeVisitor):
        def visit_Attribute(self, node: ast.Attribute) -> None:
            # Match ``<anything>.iota_lib.<name>`` for any name — the
            # whole point of this test is to catch invented prefixes
            # that don't start with ``__iota_`` either.
            if (
                isinstance(node.value, ast.Attribute)
                and node.value.attr == "iota_lib"
            ):
                referenced.add(node.attr)
            self.generic_visit(node)

    _Visitor().visit(tree)
    return referenced


def _synthetic_view_symbols() -> set[str]:
    """The view classes (``Runs``, ``CharacterView``, ``UnicodeScalarView``)
    build symbol names dynamically: ``f"{self._iota_prefix}_get_startIndex"``
    etc.  This helper enumerates every concrete name those expressions
    resolve to so the existence check covers them too.
    """
    sys.path.insert(0, str(PYTHON_RUNTIME_SRC.parent))
    from fishyjoes_python.attributed_string import (
        AttributedStringCharacterView,
        AttributedStringRuns,
        AttributedStringUnicodeScalarView,
    )

    names: set[str] = set()
    for view_cls in (
        AttributedStringRuns,
        AttributedStringCharacterView,
        AttributedStringUnicodeScalarView,
    ):
        prefix = view_cls._iota_prefix
        names.add(f"__iota_get_{prefix}_startIndex")
        names.add(f"__iota_get_{prefix}_endIndex")
        names.add(f"__iota_{prefix}_indexAfter")
        names.add(f"__iota_{prefix}_indexBefore")
    return names


class IotaSymbolNameTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls._exported = _exported_symbols()
        if not cls._exported:
            raise unittest.SkipTest(
                f"No @_cdecl exports found under {IOTA_RUNTIME_SOURCES}; "
                "is the iota runtime source tree present?",
            )

    def test_attributed_string_wrappers_use_real_symbols(self) -> None:
        target = PYTHON_RUNTIME_SRC / "attributed_string.py"
        referenced = _referenced_iota_symbols(target)
        referenced |= _synthetic_view_symbols()
        unknown = referenced - self._exported
        self.assertEqual(
            unknown, set(),
            f"attributed_string.py references {len(unknown)} IOTA symbol(s) "
            f"that do not exist as @_cdecl exports anywhere under "
            f"Sources/FishyJoesIotaRuntime/:\n  "
            + "\n  ".join(sorted(unknown))
            + "\n\nGrep the Swift sources for the correct names — see "
              "feedback_verify_ffi_symbols memory rule.",
        )

    def test_no_clone_symbol_is_assumed(self) -> None:
        """Specifically pin: peers (Kotlin, C#, Dart) all implement
        ``clone()`` via ``createFromSubstring(substring)`` because the
        IOTA runtime exposes no dedicated ``_clone`` export.  A new
        contributor reaching for ``…_clone`` should fail loudly."""
        clone_pattern = re.compile(r"_clone\b|_AttributedString_clone\b")
        offenders: list[str] = []
        for sym in self._exported:
            if clone_pattern.search(sym):
                offenders.append(sym)
        # The actual contract: there is no clone export.
        self.assertEqual(
            offenders, [],
            f"unexpected clone-style export — runtime now has {offenders}; "
            "the Python clone() wrapper relies on the absence and falls "
            "back to createFromSubstring(substring).  If a real clone "
            "export is added, update Python clone() to use it directly "
            "and revisit this test.",
        )


if __name__ == "__main__":
    unittest.main()
