"""Extension integration tests.

After follow-up Step A's collision-disambiguation, the four Swift types
nested under different namespaces all called
``PuttingTypesIntoQuestionablePlaces`` are emitted into separate files
named after their export annotations
(``String_PuttingTypesIntoQuestionablePlaces``,
``Structs_PuttingTypesIntoQuestionablePlaces``, etc.) and each can be
imported and constructed directly without workarounds.
"""

import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.String_PuttingTypesIntoQuestionablePlaces import (
    String_PuttingTypesIntoQuestionablePlaces,
)
from cricut_testapi.Structs_PuttingTypesIntoQuestionablePlaces import (
    Structs_PuttingTypesIntoQuestionablePlaces,
)
from cricut_testapi.UnicodeScalar_PuttingTypesIntoQuestionablePlaces import (
    UnicodeScalar_PuttingTypesIntoQuestionablePlaces,
)


class TestExtensions(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_string_extension(self) -> None:
        instance = String_PuttingTypesIntoQuestionablePlaces(x="hello")
        self.assertEqual(instance.testCall(), 42)

    def test_struct_extension(self) -> None:
        instance = Structs_PuttingTypesIntoQuestionablePlaces.create()
        self.assertEqual(instance.testCall(), 43)

    def test_unicode_scalar_extension(self) -> None:
        result = UnicodeScalar_PuttingTypesIntoQuestionablePlaces.thing.testCall()
        self.assertEqual(result, 44)


if __name__ == "__main__":
    unittest.main()
