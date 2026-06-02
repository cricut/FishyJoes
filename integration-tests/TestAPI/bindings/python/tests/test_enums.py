import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class EnumTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_empty_enum_static_members(self) -> None:
        empty_enum = self.testapi.EmptyEnum

        with self.assertRaises(RuntimeError):
            empty_enum.not_going_to_happen()
        self.assertEqual(empty_enum.a_static_property, 54546)
        self.assertEqual(empty_enum.a_static_method(), 62645)

    def test_reference_empty_enum_static_members(self) -> None:
        reference_empty_enum = self.testapi.ReferenceEmptyEnum

        with self.assertRaises(RuntimeError):
            reference_empty_enum.not_going_to_happen()
        self.assertEqual(reference_empty_enum.a_static_property, 5)
        self.assertEqual(reference_empty_enum.a_static_method(), 6)

    def test_associated_data_enum(self) -> None:
        associated = self.testapi.AssociatedDataEnum

        def shape1(x: int):
            return associated.thing(x)

        def shape2(x: str, y: str, z: int):
            return associated.bar(x, associated.other(y, z), True)

        self.assertIsInstance(shape1(0), associated.Thing)
        self.assertEqual(shape1(0).value, 0)
        self.assertEqual(shape2("1", "2", 3).m_1.m_1, 3)
        self.assertEqual(associated.static_thing, shape1(2))
        self.assertEqual(shape1(4).int_value, 4)
        self.assertEqual(shape2("hello", "world", 8).int_value, 11)
        self.assertEqual(shape1(2).plus(shape2("x", "y", 4)), shape1(9))
        self.assertEqual(shape2("y", "z", 2).plus(shape1(5)), shape2("y", "z", 7))
        self.assertEqual(associated.simple_enum(self.testapi.SimpleEnum.blue).value, self.testapi.SimpleEnum.blue)
        self.assertIsInstance(associated.none(), getattr(associated, "None"))
        self.assertEqual(associated.none().int_value, 42)


if __name__ == "__main__":
    unittest.main()
