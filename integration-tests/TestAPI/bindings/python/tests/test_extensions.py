import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class ExtensionTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_extension_declared_exported_types(self) -> None:
        string_extension_type = self.testapi.String_PuttingTypesIntoQuestionablePlaces
        structs_extension_type = self.testapi.Structs_PuttingTypesIntoQuestionablePlaces
        scalar_extension_type = self.testapi.UnicodeScalar_PuttingTypesIntoQuestionablePlaces

        self.assertEqual(string_extension_type("hello").test_call(), 42)
        self.assertEqual(structs_extension_type.create().test_call(), 43)
        self.assertEqual(scalar_extension_type.thing.test_call(), 44)


if __name__ == "__main__":
    unittest.main()
