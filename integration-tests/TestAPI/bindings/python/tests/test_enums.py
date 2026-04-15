"""Enum integration tests — EmptyEnum, SimpleEnum, AssociatedDataEnum."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.EmptyEnum import EmptyEnum
from cricut_testapi.ReferenceEmptyEnum import ReferenceEmptyEnum
from cricut_testapi.SimpleEnum import SimpleEnum
from cricut_testapi.AssociatedDataEnum import (
    AssociatedDataEnum,
    AssociatedDataEnum_Thing,
    AssociatedDataEnum_Other,
    AssociatedDataEnum_Bar,
    AssociatedDataEnum_NoValue,
    AssociatedDataEnum_SimpleEnum,
)


class TestEmptyEnum(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_a_static_property(self) -> None:
        self.assertEqual(EmptyEnum.aStaticProperty(), 54546)

    def test_a_static_method(self) -> None:
        self.assertEqual(EmptyEnum.aStaticMethod(), 62645)

    def test_not_going_to_happen_raises(self) -> None:
        with self.assertRaises(Exception):
            EmptyEnum.notGoingToHappen()

    def test_reference_empty_enum_static_property(self) -> None:
        self.assertEqual(ReferenceEmptyEnum.aStaticProperty(), 5)

    def test_reference_empty_enum_static_method(self) -> None:
        self.assertEqual(ReferenceEmptyEnum.aStaticMethod(), 6)

    def test_reference_empty_enum_not_going_to_happen_raises(self) -> None:
        with self.assertRaises(Exception):
            ReferenceEmptyEnum.notGoingToHappen()


class TestSimpleEnum(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_hex_red(self) -> None:
        self.assertEqual(SimpleEnum.red.hex, 0xFF0000)

    def test_hex_green(self) -> None:
        self.assertEqual(SimpleEnum.green.hex, 0x00FF00)

    def test_hex_blue(self) -> None:
        self.assertEqual(SimpleEnum.blue.hex, 0x0000FF)

    def test_pick_a_color_roundtrip(self) -> None:
        self.assertIs(SimpleEnum.pickAColor(0), SimpleEnum.red)

    def test_pick_a_color_none(self) -> None:
        self.assertIsNone(SimpleEnum.pickAColor(99))

    def test_hex_method(self) -> None:
        self.assertEqual(SimpleEnum.red.hexMethod(), "16711680")

    def test_favorite_color_roundtrip(self) -> None:
        SimpleEnum.resetFavoriteColor()
        self.assertIs(SimpleEnum.favoriteColor(), SimpleEnum.blue)


class TestAssociatedDataEnum(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_thing_int_value(self) -> None:
        self.assertEqual(AssociatedDataEnum_Thing(value=7).intValue, 7)

    def test_no_value_int_value(self) -> None:
        self.assertEqual(AssociatedDataEnum_NoValue().intValue, 42)

    def test_static_thing(self) -> None:
        static = AssociatedDataEnum.staticThing()
        self.assertEqual(static.intValue, 2)
        self.assertIsInstance(static, AssociatedDataEnum_Thing)

    def test_thing_named_field(self) -> None:
        self.assertEqual(AssociatedDataEnum_Thing(value=99).value, 99)

    def test_other_field_names(self) -> None:
        other = AssociatedDataEnum_Other(unnamed="hello", _1=5)
        self.assertEqual(other.intValue, 5)

    def test_plus_thing_plus_thing(self) -> None:
        result = AssociatedDataEnum_Thing(value=3).plus(AssociatedDataEnum_Thing(value=4))
        self.assertIsInstance(result, AssociatedDataEnum_Thing)
        self.assertEqual(result.intValue, 7)

    def test_plus_no_value_stays_no_value(self) -> None:
        result = AssociatedDataEnum_NoValue().plus(AssociatedDataEnum_Thing(value=100))
        self.assertIsInstance(result, AssociatedDataEnum_NoValue)
        self.assertEqual(result.intValue, 42)

    def test_simple_enum_case(self) -> None:
        self.assertEqual(AssociatedDataEnum_SimpleEnum(value=SimpleEnum.green).intValue, 1)


if __name__ == "__main__":
    unittest.main()
