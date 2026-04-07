"""Round-trip integration tests for FishyJoes Python bindings.

These tests exercise the full stack: Python → cffi → Swift Iota ABI → Python.
They require the TestAPI shared library to be built and available.
"""

import unittest

import sys
import os

# Allow running from the repo root as well as from the generated directory.
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.SimpleEnum import SimpleEnum
from cricut_testapi.AssociatedDataEnum import (
    AssociatedDataEnum,
    AssociatedDataEnum_Thing,
    AssociatedDataEnum_Other,
    AssociatedDataEnum_Bar,
    AssociatedDataEnum_NoValue,
    AssociatedDataEnum_SimpleEnum,
)
from cricut_testapi.EmptyClass import EmptyClass
from cricut_testapi.MutableStruct import MutableStruct
from cricut_testapi.MemberwiseStruct import MemberwiseStruct


class TestSimpleEnum(unittest.TestCase):
    """Round-trip tests for SimpleEnum — a plain (no associated values) enum."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_hex_red(self) -> None:
        self.assertEqual(SimpleEnum.red.hex, 0xFF0000)

    def test_hex_green(self) -> None:
        self.assertEqual(SimpleEnum.green.hex, 0x00FF00)

    def test_hex_blue(self) -> None:
        self.assertEqual(SimpleEnum.blue.hex, 0x0000FF)

    def test_pick_a_color_roundtrip(self) -> None:
        result = SimpleEnum.pickAColor(0)
        self.assertIs(result, SimpleEnum.red)

    def test_pick_a_color_none(self) -> None:
        # rawValue 99 is not a valid SimpleEnum case
        result = SimpleEnum.pickAColor(99)
        self.assertIsNone(result)

    def test_hex_method(self) -> None:
        self.assertEqual(SimpleEnum.red.hexMethod(), "16711680")

    def test_favorite_color_roundtrip(self) -> None:
        # favoriteColor defaults to blue; reset it to be safe
        SimpleEnum.resetFavoriteColor()
        result = SimpleEnum.favoriteColor()
        self.assertIs(result, SimpleEnum.blue)


class TestAssociatedDataEnum(unittest.TestCase):
    """Round-trip tests for AssociatedDataEnum — sum type with named associated values."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_thing_int_value(self) -> None:
        thing = AssociatedDataEnum_Thing(value=7)
        result = thing.intValue
        self.assertEqual(result, 7)

    def test_no_value_int_value(self) -> None:
        no_val = AssociatedDataEnum_NoValue()
        self.assertEqual(no_val.intValue, 42)

    def test_static_thing(self) -> None:
        static = AssociatedDataEnum.staticThing()
        # staticThing = .thing(value: 2) → intValue == 2
        self.assertEqual(static.intValue, 2)
        self.assertIsInstance(static, AssociatedDataEnum_Thing)

    def test_thing_field_name(self) -> None:
        # Verify the named field is accessible by its binding name, not positional "_0"
        thing = AssociatedDataEnum_Thing(value=99)
        self.assertEqual(thing.value, 99)

    def test_other_field_names(self) -> None:
        other = AssociatedDataEnum_Other(unnamed="hello", _1=5)
        # intValue for .other is the Int value
        result = other.intValue
        self.assertEqual(result, 5)

    def test_plus_thing_plus_thing(self) -> None:
        a = AssociatedDataEnum_Thing(value=3)
        b = AssociatedDataEnum_Thing(value=4)
        result = a.plus(b)
        self.assertIsInstance(result, AssociatedDataEnum_Thing)
        self.assertEqual(result.intValue, 7)

    def test_plus_no_value_stays_no_value(self) -> None:
        a = AssociatedDataEnum_NoValue()
        b = AssociatedDataEnum_Thing(value=100)
        result = a.plus(b)
        self.assertIsInstance(result, AssociatedDataEnum_NoValue)
        self.assertEqual(result.intValue, 42)

    def test_simple_enum_case(self) -> None:
        case = AssociatedDataEnum_SimpleEnum(value=SimpleEnum.green)
        self.assertEqual(case.intValue, 1)


class TestReferenceType(unittest.TestCase):
    """Round-trip tests for EmptyClass — a reference (class) type."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_create_and_blarg(self) -> None:
        obj = EmptyClass.create()
        self.assertIsInstance(obj, EmptyClass)
        self.assertEqual(obj.blarg, "Blarg!")

    def test_wibble_property(self) -> None:
        obj = EmptyClass.create()
        self.assertEqual(obj.wibbledyWobbledyTimeyWhimey, "<wibble>*Wobble*")

    def test_shme_method(self) -> None:
        obj = EmptyClass.create()
        self.assertEqual(obj.shme(), "Shme! Hand me my hook.")

    def test_gorpers_method(self) -> None:
        obj = EmptyClass.create()
        self.assertEqual(obj.Gorpers(), "Go Gorp!")


class TestValueStruct(unittest.TestCase):
    """Round-trip tests for value-type structs."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_mutable_struct_create(self) -> None:
        s = MutableStruct.create()
        self.assertIsInstance(s, MutableStruct)
        self.assertEqual(s.i, 0)

    def test_memberwise_struct_create(self) -> None:
        s = MemberwiseStruct.create()
        self.assertIsInstance(s, MemberwiseStruct)
        self.assertEqual(s.immutable, "Eternal")
        self.assertEqual(s.mutable, "Fickle")


if __name__ == "__main__":
    unittest.main()
