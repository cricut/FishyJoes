import importlib
import unittest
from typing import cast

import testapi
from testapi import EmptyEnum, associated_data_enum, empty_enum, reference_case_enum, reference_empty_enum, simple_enum


class EnumTests(unittest.TestCase):
    def test_empty_enum_static_members(self) -> None:
        with self.assertRaises(RuntimeError):
            empty_enum.not_going_to_happen()
        self.assertEqual(empty_enum.get_a_static_property(), 54546)
        self.assertEqual(empty_enum.a_static_method(), 62645)

    def test_reference_empty_enum_static_members(self) -> None:
        with self.assertRaises(RuntimeError):
            reference_empty_enum.not_going_to_happen()
        self.assertEqual(reference_empty_enum.get_a_static_property, 5)
        self.assertEqual(reference_empty_enum.a_static_method(), 6)

    def test_associated_data_enum(self) -> None:
        def shape1(x: int) -> associated_data_enum.Thing:
            return associated_data_enum.Thing(x)

        def shape2(x: str, y: str, z: int) -> associated_data_enum.Bar:
            return associated_data_enum.Bar(x, associated_data_enum.Other(y, z), True)

        self.assertIsInstance(shape1(0), associated_data_enum.Thing)
        self.assertEqual(shape1(0).value, 0)
        subshape = shape2("1", "2", 3)._1
        self.assertIsInstance(subshape, associated_data_enum.Bar)
        self.assertEqual(cast(associated_data_enum.Bar, subshape)._1, 3)
        self.assertEqual(associated_data_enum.get_static_thing(), shape1(2))
        self.assertEqual(shape1(4).int_value, 4)
        self.assertEqual(shape2("hello", "world", 8).int_value, 11)
        self.assertEqual(shape1(2).plus(shape2("x", "y", 4)), shape1(9))
        self.assertEqual(shape2("y", "z", 2).plus(shape1(5)), shape2("y", "z", 7))
        self.assertEqual(associated_data_enum.SimpleEnum(simple_enum.Blue()).value, simple_enum.Blue())
        self.assertIsInstance(associated_data_enum.None_(), associated_data_enum.None_)
        self.assertEqual(associated_data_enum.None_().int_value, 42)

    def test_reference_annotated_enum_surfaces_cases(self) -> None:
        # An inhabited enum annotated `exportReference` must still bridge its cases
        # (an enum's cases are its only construction surface). Before the dispatch
        # fix this class was an opaque SwiftReference shell with no case members,
        # so attribute access / comparison failed and the consumer was uncallable.
        self.assertEqual(reference_case_enum.North().opposite, reference_case_enum.south)
        self.assertEqual(reference_case_enum.rotate180(reference_case_enum.East()), reference_case_enum.west)
        self.assertEqual(reference_case_enum.rotate180(reference_case_enum.North()), reference_case_enum.south)
        self.assertEqual(reference_case_enum.get_default_direction(), reference_case_enum.north)
        self.assertNotEqual(reference_case_enum.north, reference_case_enum.south)

    def test_settable_static_property_round_trip(self) -> None:
        try:
            # Default is .blue; assignment must reach the native setter, not just
            # rebind the class attribute (the getter-only bug silently no-oped).
            self.assertEqual(simple_enum.get_favorite_color(), simple_enum.blue)
            simple_enum.set_favorite_color(simple_enum.Red())
            self.assertEqual(simple_enum.get_favorite_color(), simple_enum.red)
            simple_enum.set_favorite_color(simple_enum.Green())
            self.assertEqual(simple_enum.get_favorite_color(), simple_enum.green)
            # Prove the write actually reached native: reset via an independent
            # native static method and observe the change through the getter.
            simple_enum.reset_favorite_color()
            self.assertEqual(simple_enum.get_favorite_color(), simple_enum.blue)
        finally:
            simple_enum.reset_favorite_color()


if __name__ == "__main__":
    unittest.main()
