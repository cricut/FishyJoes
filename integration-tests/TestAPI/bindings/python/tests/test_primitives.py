"""Primitive type integration tests."""

import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Primitives import Primitives
from cricut_testapi.PrimitiveHolder import PrimitiveHolder


class TestPrimitives(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    # --- bool ---
    def test_false_bool(self) -> None:
        self.assertFalse(Primitives.falseBool())

    def test_true_bool(self) -> None:
        self.assertTrue(Primitives.trueBool())

    # --- signed integers ---
    def test_zero_int8(self) -> None:
        self.assertEqual(Primitives.zeroInt8(), 0)

    def test_min_int8(self) -> None:
        self.assertEqual(Primitives.minInt8(), -128)

    def test_max_int8(self) -> None:
        self.assertEqual(Primitives.maxInt8(), 127)

    def test_zero_int16(self) -> None:
        self.assertEqual(Primitives.zeroInt16(), 0)

    def test_min_int16(self) -> None:
        self.assertEqual(Primitives.minInt16(), -32768)

    def test_max_int16(self) -> None:
        self.assertEqual(Primitives.maxInt16(), 32767)

    def test_zero_int32(self) -> None:
        self.assertEqual(Primitives.zeroInt32(), 0)

    def test_min_int32(self) -> None:
        self.assertEqual(Primitives.minInt32(), -2147483648)

    def test_max_int32(self) -> None:
        self.assertEqual(Primitives.maxInt32(), 2147483647)

    def test_zero_int64(self) -> None:
        self.assertEqual(Primitives.zeroInt64(), 0)

    def test_min_int64(self) -> None:
        self.assertEqual(Primitives.minInt64(), -(2**63))

    def test_max_int64(self) -> None:
        self.assertEqual(Primitives.maxInt64(), (2**63) - 1)

    def test_zero_int(self) -> None:
        self.assertEqual(Primitives.zeroInt(), 0)

    def test_min_int(self) -> None:
        self.assertEqual(Primitives.minInt(), -(2**63))

    def test_max_int(self) -> None:
        self.assertEqual(Primitives.maxInt(), (2**63) - 1)

    # --- unsigned integers ---
    def test_zero_uint8(self) -> None:
        self.assertEqual(Primitives.zeroUInt8(), 0)

    def test_max_uint8(self) -> None:
        self.assertEqual(Primitives.maxUInt8(), 255)

    def test_zero_uint16(self) -> None:
        self.assertEqual(Primitives.zeroUInt16(), 0)

    def test_max_uint16(self) -> None:
        self.assertEqual(Primitives.maxUInt16(), 65535)

    def test_zero_uint32(self) -> None:
        self.assertEqual(Primitives.zeroUInt32(), 0)

    def test_max_uint32(self) -> None:
        self.assertEqual(Primitives.maxUInt32(), 4294967295)

    def test_zero_uint64(self) -> None:
        self.assertEqual(Primitives.zeroUInt64(), 0)

    def test_max_uint64(self) -> None:
        self.assertEqual(Primitives.maxUInt64(), (2**64) - 1)

    def test_zero_uint(self) -> None:
        self.assertEqual(Primitives.zeroUInt(), 0)

    def test_min_uint(self) -> None:
        self.assertEqual(Primitives.minUInt(), 0)

    def test_max_uint(self) -> None:
        self.assertEqual(Primitives.maxUInt(), (2**64) - 1)

    # --- float / double ---
    def test_zero_float(self) -> None:
        self.assertEqual(Primitives.zeroFloat(), 0.0)

    def test_min_float_positive(self) -> None:
        self.assertLess(Primitives.minFloat(), -3.0e38)

    def test_max_float(self) -> None:
        self.assertGreater(Primitives.maxFloat(), 3.0e38)

    def test_zero_double(self) -> None:
        self.assertEqual(Primitives.zeroDouble(), 0.0)

    def test_min_double_positive(self) -> None:
        self.assertLess(Primitives.minDouble(), -1.0e308)

    def test_max_double(self) -> None:
        self.assertGreater(Primitives.maxDouble(), 1.0e308)

    # --- many* arrays ---
    def test_many_bool(self) -> None:
        self.assertIsInstance(Primitives.manyBool(), list)

    def test_many_int(self) -> None:
        self.assertIsInstance(Primitives.manyInt(), list)

    def test_many_int8(self) -> None:
        self.assertIsInstance(Primitives.manyInt8(), list)

    def test_many_int16(self) -> None:
        self.assertIsInstance(Primitives.manyInt16(), list)

    def test_many_int32(self) -> None:
        self.assertIsInstance(Primitives.manyInt32(), list)

    def test_many_int64(self) -> None:
        self.assertIsInstance(Primitives.manyInt64(), list)

    def test_many_uint8(self) -> None:
        self.assertIsInstance(Primitives.manyUInt8(), list)

    def test_many_uint16(self) -> None:
        self.assertIsInstance(Primitives.manyUInt16(), list)

    def test_many_uint32(self) -> None:
        self.assertIsInstance(Primitives.manyUInt32(), list)

    def test_many_uint64(self) -> None:
        self.assertIsInstance(Primitives.manyUInt64(), list)

    def test_many_uint(self) -> None:
        self.assertIsInstance(Primitives.manyUInt(), list)

    def test_many_float(self) -> None:
        self.assertIsInstance(Primitives.manyFloat(), list)

    def test_many_double(self) -> None:
        self.assertIsInstance(Primitives.manyDouble(), list)

    # --- maybe* optional arrays contain None ---
    def test_many_maybe_bool_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeBool())

    def test_many_maybe_int_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeInt())

    def test_many_maybe_int8_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeInt8())

    def test_many_maybe_int16_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeInt16())

    def test_many_maybe_int32_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeInt32())

    def test_many_maybe_int64_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeInt64())

    def test_many_maybe_uint8_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeUInt8())

    def test_many_maybe_uint16_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeUInt16())

    def test_many_maybe_uint32_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeUInt32())

    def test_many_maybe_uint64_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeUInt64())

    def test_many_maybe_uint_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeUInt())

    def test_many_maybe_float_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeFloat())

    def test_many_maybe_double_contains_none(self) -> None:
        self.assertIn(None, Primitives.manyMaybeDouble())

    # --- echo functions ---
    def test_echo_bool_true(self) -> None:
        self.assertTrue(Primitives.echoBool(True))

    def test_echo_bool_false(self) -> None:
        self.assertFalse(Primitives.echoBool(False))

    def test_echo_int8(self) -> None:
        self.assertEqual(Primitives.echoInt8(42), 42)

    def test_echo_int16(self) -> None:
        self.assertEqual(Primitives.echoInt16(1000), 1000)

    def test_echo_int32(self) -> None:
        self.assertEqual(Primitives.echoInt32(70000), 70000)

    def test_echo_int64(self) -> None:
        self.assertEqual(Primitives.echoInt64(5000000000), 5000000000)

    def test_echo_int(self) -> None:
        self.assertEqual(Primitives.echoInt(-1), -1)

    def test_echo_uint8(self) -> None:
        self.assertEqual(Primitives.echoUInt8(200), 200)

    def test_echo_uint16(self) -> None:
        self.assertEqual(Primitives.echoUInt16(60000), 60000)

    def test_echo_uint32(self) -> None:
        self.assertEqual(Primitives.echoUInt32(4000000000), 4000000000)

    def test_echo_uint64(self) -> None:
        self.assertEqual(Primitives.echoUInt64((2**64) - 1), (2**64) - 1)

    def test_echo_uint(self) -> None:
        self.assertEqual(Primitives.echoUInt(0), 0)

    def test_echo_float(self) -> None:
        self.assertAlmostEqual(Primitives.echoFloat(1.5), 1.5, places=5)

    def test_echo_double(self) -> None:
        self.assertEqual(Primitives.echoDouble(3.14), 3.14)

    # --- maybe echo ---
    def test_maybe_echo_bool_some(self) -> None:
        self.assertTrue(Primitives.maybeEchoBool(True))

    def test_maybe_echo_bool_none(self) -> None:
        self.assertIsNone(Primitives.maybeEchoBool(None))

    def test_maybe_echo_int_some(self) -> None:
        self.assertEqual(Primitives.maybeEchoInt(7), 7)

    def test_maybe_echo_int_none(self) -> None:
        self.assertIsNone(Primitives.maybeEchoInt(None))

    def test_maybe_echo_double_some(self) -> None:
        self.assertEqual(Primitives.maybeEchoDouble(2.71), 2.71)

    def test_maybe_echo_double_none(self) -> None:
        self.assertIsNone(Primitives.maybeEchoDouble(None))

    # --- boolOverflow ---
    def test_bool_overflow_all_false(self) -> None:
        result = Primitives.boolOverflow(
            False, False, False, False, False, False, False, False,
            False, False, False, False, False, False, False, False,
        )
        self.assertEqual(result, 0)

    def test_bool_overflow_all_true(self) -> None:
        result = Primitives.boolOverflow(
            True, False, True, False,
            False, True, False, True,
            True, False, True, False,
            False, True, False, True,
        )
        self.assertEqual(result, 8)

    # --- valueMapper closure ---
    def test_value_mapper(self) -> None:
        self.assertEqual(Primitives.valueMapper(5, lambda x: None if x is None else x * 2), 10)

    def test_value_mapper_none(self) -> None:
        self.assertIsNone(Primitives.valueMapper(None, lambda x: x))


class TestPrimitiveHolder(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    def test_default_primitive_holder(self) -> None:
        self.assertIsInstance(Primitives.defaultPrimitiveHolder(), PrimitiveHolder)

    def test_static_property(self) -> None:
        self.assertIsInstance(PrimitiveHolder.staticProperty(), list)

    def test_static_mutable_property_roundtrip(self) -> None:
        original = PrimitiveHolder.staticMutableProperty()
        new_val = [100, 200]
        PrimitiveHolder.set_staticMutableProperty(new_val)
        self.assertEqual(PrimitiveHolder.staticMutableProperty(), new_val)
        PrimitiveHolder.set_staticMutableProperty(original)


if __name__ == "__main__":
    unittest.main()
