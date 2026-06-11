import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class StructTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_empty_struct_instance_members(self) -> None:
        a1 = self.testapi.EmptyStruct.create()
        self.assertEqual(a1.tutu, 35671)
        self.assertEqual(a1.tatiana, "Toodles! ta ta for now...")
        self.assertEqual(a1.aap(), "The Netherlands")
        self.assertEqual(a1.zxccxz(), "Cambridge University (England)")

        a2 = self.testapi.EmptyStruct.create()
        self.assertEqual(a2.tutu, 35671)
        self.assertEqual(a2.tatiana, "Toodles! ta ta for now...")
        self.assertEqual(a2.aap(), "The Netherlands")

        b1 = self.testapi.EmptyStruct2.create()
        self.assertEqual(b1.tutu, 12897)
        self.assertEqual(b1.tatiana, "Arrivederci")
        self.assertEqual(b1.aap(), "The Netherlands2")
        self.assertEqual(b1.zxccxz(), "Cambridge University (England)2")

    def test_reference_only_type_is_generated_when_used_by_api(self) -> None:
        marker = self.testapi.ReferenceOnlyTypes.marker()

        self.assertIsInstance(marker, self.testapi.ReferenceOnlyTypes_Marker)
        self.assertEqual(marker, marker)
        self.assertIsInstance(hash(marker), int)

    def test_hashable_value_structs_are_hashable_in_python(self) -> None:
        first = self.testapi.Structs_MemberwiseStruct("Eternal", "Fickle")
        second = self.testapi.Structs_MemberwiseStruct("Eternal", "Fickle")
        different = self.testapi.Structs_MemberwiseStruct("Eternal", "Changed")

        self.assertEqual(first, second)
        self.assertEqual(hash(first), hash(second))
        self.assertNotEqual(first, different)
        self.assertNotEqual(hash(first), hash(different))


if __name__ == "__main__":
    unittest.main()
