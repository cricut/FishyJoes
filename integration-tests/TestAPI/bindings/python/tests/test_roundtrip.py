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
from cricut_testapi.AProtocolImplementation import AProtocolImplementation
from cricut_testapi.ExternalWitness_AProtocol import ExternalWitness_AProtocol


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


class TestProtocolWitness(unittest.TestCase):
    """Round-trip tests for protocol witnesses in both directions.

    Covers:
    - Python→Swift: pass a Python AProtocolImplementation to Swift via bar(); Swift
      reads its fields (foo, baz) and returns a new AProtocol conformer.
    - Swift→Python: the returned value is an ExternalWitness_AProtocol whose
      properties (foo, baz) are retrieved from Swift.
    - Default implementation: hasADefaultImplementation() exercises the Swift-side
      extension default that calls bar() internally.
    """

    def setUp(self) -> None:
        ensure_loaded()

    # ------------------------------------------------------------------
    # Python → Swift direction
    # ------------------------------------------------------------------

    def test_bar_returns_external_witness(self) -> None:
        """bar() on a Python struct passes self to Swift; the result is wrapped in
        ExternalWitness_AProtocol (Swift → Python direction)."""
        impl = AProtocolImplementation(foo="hello", baz=False)
        result = impl.bar(x=3, y=4)
        # bar(x:y:) returns AProtocolImplementation(foo: "7", baz: x == 2)
        # x=3, so baz=False; foo="7"
        self.assertIsInstance(result, ExternalWitness_AProtocol)

    def test_bar_result_foo_property(self) -> None:
        """foo property of the returned ExternalWitness_AProtocol is correct."""
        impl = AProtocolImplementation(foo="hello", baz=True)
        result = impl.bar(x=10, y=5)
        # foo = str(10+5) = "15"
        self.assertEqual(result.foo, "15")

    def test_bar_result_baz_property_true(self) -> None:
        """baz is True when x == 2."""
        impl = AProtocolImplementation(foo="hi", baz=False)
        result = impl.bar(x=2, y=0)
        # baz = (x == 2) = True
        self.assertTrue(result.baz)

    def test_bar_result_baz_property_false(self) -> None:
        """baz is False when x != 2."""
        impl = AProtocolImplementation(foo="hi", baz=True)
        result = impl.bar(x=5, y=3)
        # baz = (x == 2) = False
        self.assertFalse(result.baz)

    def test_bar_chained(self) -> None:
        """Call bar() on the ExternalWitness_AProtocol returned by a first bar() call.
        This exercises the Swift→Python→Swift round-trip chain."""
        impl = AProtocolImplementation(foo="start", baz=False)
        first = impl.bar(x=2, y=1)   # foo="3", baz=True
        self.assertIsInstance(first, ExternalWitness_AProtocol)
        self.assertEqual(first.foo, "3")
        self.assertTrue(first.baz)
        # Now call bar() on the ExternalWitness_AProtocol (Swift-side self)
        second = first.bar(x=4, y=6)  # foo="10", baz=(4==2)=False
        self.assertIsInstance(second, ExternalWitness_AProtocol)
        self.assertEqual(second.foo, "10")
        self.assertFalse(second.baz)

    # ------------------------------------------------------------------
    # Default-implementation path
    # ------------------------------------------------------------------

    def test_has_a_default_implementation_bazzy(self) -> None:
        """hasADefaultImplementation calls bar() internally via the Swift extension default.

        Swift default: bar(x=x, y=round(y*pi)) then if baz → "bazzy {foo}" else "{foo} notBazzed"
        With x=2, y=0: bar(x=2, y=round(0*pi))=bar(2,0) → foo="2", baz=(2==2)=True
        → "bazzy 2"
        """
        impl = AProtocolImplementation(foo="ignored", baz=False)
        result = impl.hasADefaultImplementation(x=2, y=0)
        self.assertEqual(result, "bazzy 2")

    def test_has_a_default_implementation_not_bazzy(self) -> None:
        """With x=3, y=0: bar(3,0) → foo="3", baz=(3==2)=False → "3 notBazzed"."""
        impl = AProtocolImplementation(foo="ignored", baz=False)
        result = impl.hasADefaultImplementation(x=3, y=0)
        self.assertEqual(result, "3 notBazzed")


if __name__ == "__main__":
    unittest.main()
