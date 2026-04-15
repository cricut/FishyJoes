"""Extension integration tests.

The generated PuttingTypesIntoQuestionablePlaces.py redefines the name
`PuttingTypesIntoQuestionablePlaces` four times in the same file.  Only the
*last* definition (the UnicodeScalar_ enum) survives a plain
`from … import PuttingTypesIntoQuestionablePlaces`.

The three underlying classes are imported directly from the module object so
each FFI symbol is reached correctly.
"""

import sys
import os
import types
import importlib
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded

# Import the module so we can reach the intermediate class definitions via
# their iota symbols even though the Python name is shadowed.
import cricut_testapi.PuttingTypesIntoQuestionablePlaces as _ptiqp_mod


class TestExtensions(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_string_extension(self) -> None:
        # String_PuttingTypesIntoQuestionablePlaces: dataclass with field x: str
        # It is the second definition in the file — shadowed later.
        # We use a duck-typed SimpleNamespace with x="" rather than trying to
        # construct the shadowed class directly.
        from cricut_testapi.runtime import get_runtime, ensure_loaded as _el
        _el()
        rt = get_runtime()
        duck = types.SimpleNamespace(x="")
        result = rt.call_symbol(
            "__iota_Swift_String_PuttingTypesIntoQuestionablePlaces_testCall",
            "int",
            ("object", duck)
        )
        self.assertEqual(result, 42)

    def test_struct_extension(self) -> None:
        # Structs_PuttingTypesIntoQuestionablePlaces — the third definition
        # (NativeReference).  It is still the last class definition before the
        # enum, so it IS the current `PuttingTypesIntoQuestionablePlaces` at
        # import time (the enum shadows it).  We call create() then testCall().
        from cricut_testapi.runtime import get_runtime, ensure_loaded as _el
        _el()
        rt = get_runtime()
        instance = rt.call_symbol(
            "__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create",
            "object",
        )
        result = rt.call_symbol(
            "__iota_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall",
            "int",
            ("object", instance),
        )
        self.assertEqual(result, 43)

    def test_unicode_scalar_extension(self) -> None:
        # UnicodeScalar_PuttingTypesIntoQuestionablePlaces — the last (winning)
        # definition; it is the enum.
        UnicodeScalarPTIQP = _ptiqp_mod.PuttingTypesIntoQuestionablePlaces
        result = UnicodeScalarPTIQP.thing.testCall()
        self.assertEqual(result, 44)


if __name__ == "__main__":
    unittest.main()
