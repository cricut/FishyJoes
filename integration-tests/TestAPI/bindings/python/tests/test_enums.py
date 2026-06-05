import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
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

    def test_settable_static_property_round_trip(self) -> None:
        simple_enum = self.testapi.SimpleEnum
        try:
            # Default is .blue; assignment must reach the native setter, not just
            # rebind the class attribute (the getter-only bug silently no-oped).
            self.assertEqual(simple_enum.favorite_color, simple_enum.blue)
            simple_enum.favorite_color = simple_enum.red
            self.assertEqual(simple_enum.favorite_color, simple_enum.red)
            simple_enum.favorite_color = simple_enum.green
            self.assertEqual(simple_enum.favorite_color, simple_enum.green)
            # Prove the write actually reached native: reset via an independent
            # native static method and observe the change through the getter.
            simple_enum.reset_favorite_color()
            self.assertEqual(simple_enum.favorite_color, simple_enum.blue)
        finally:
            simple_enum.reset_favorite_color()


if __name__ == "__main__":
    unittest.main()
