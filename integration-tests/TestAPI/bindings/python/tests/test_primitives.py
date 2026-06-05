import importlib
import os
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") != "1":
    sys.path.insert(0, str(GENERATED_SRC))


class PrimitiveTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_primitive_values(self) -> None:
        primitives = self.testapi.Primitives

        self.assertFalse(primitives.false_bool)
        self.assertTrue(primitives.true_bool)
        self.assertEqual(primitives.zero_int32, 0)
        self.assertEqual(primitives.min_int32, -(2**31))
        self.assertEqual(primitives.max_int32, 2**31 - 1)
        self.assertEqual(primitives.zero_uint8, 0)
        self.assertEqual(primitives.max_uint8, 255)
        self.assertEqual(primitives.zero_double, 0.0)

    def test_int32_array_values(self) -> None:
        primitives = self.testapi.Primitives

        self.assertEqual(primitives.many_int32, [0, -(2**31), 2**31 - 1])

    def test_optional_int32_array_values(self) -> None:
        primitives = self.testapi.Primitives

        self.assertEqual(primitives.many_maybe_int32, [None, 0, -(2**31), 2**31 - 1])

    def test_additional_primitive_array_descriptors(self) -> None:
        primitives = self.testapi.Primitives

        self.assertEqual(primitives.many_bool, [False, True])
        self.assertEqual(primitives.many_maybe_bool, [None, False, True])
        self.assertEqual(primitives.many_uint8, [0, 0, 255])
        self.assertEqual(primitives.many_maybe_uint8, [None, 0, 0, 255])
        self.assertEqual(primitives.many_int, [0, primitives.min_int, primitives.max_int])
        self.assertEqual(primitives.many_maybe_int, [None, 0, primitives.min_int, primitives.max_int])
        self.assertEqual(primitives.many_double, [0.0, primitives.min_double, primitives.max_double])
        self.assertEqual(primitives.many_maybe_double, [None, 0.0, primitives.min_double, primitives.max_double])

    def test_primitive_echo_functions(self) -> None:
        primitives = self.testapi.Primitives

        self.assertFalse(primitives.echo_bool(False))
        self.assertTrue(primitives.echo_bool(True))
        self.assertEqual(primitives.echo_int32(-(2**31)), -(2**31))
        self.assertEqual(primitives.echo_int32(2**31 - 1), 2**31 - 1)
        self.assertEqual(primitives.echo_uint8(255), 255)
        self.assertEqual(primitives.echo_double(1.5), 1.5)

    def test_optional_int32_echo_function(self) -> None:
        primitives = self.testapi.Primitives

        self.assertIsNone(primitives.maybe_echo_int32(None))
        self.assertEqual(primitives.maybe_echo_int32(-(2**31)), -(2**31))
        self.assertEqual(primitives.maybe_echo_int32(2**31 - 1), 2**31 - 1)

    def test_additional_optional_primitive_echo_functions(self) -> None:
        primitives = self.testapi.Primitives

        self.assertIsNone(primitives.maybe_echo_bool(None))
        self.assertTrue(primitives.maybe_echo_bool(True))
        self.assertFalse(primitives.maybe_echo_bool(False))
        self.assertIsNone(primitives.maybe_echo_uint8(None))
        self.assertEqual(primitives.maybe_echo_uint8(255), 255)
        self.assertIsNone(primitives.maybe_echo_int(None))
        self.assertEqual(primitives.maybe_echo_int(primitives.min_int), primitives.min_int)
        self.assertIsNone(primitives.maybe_echo_double(None))
        self.assertEqual(primitives.maybe_echo_double(1.5), 1.5)

    def test_all_integer_width_constants(self) -> None:
        # Int8/Int16/Int64/UInt/UInt16/UInt32/UInt64 were previously unsupported in
        # Python (silently dropped); they are now at parity with the other targets.
        primitives = self.testapi.Primitives

        self.assertEqual((primitives.min_int8, primitives.max_int8), (-(2**7), 2**7 - 1))
        self.assertEqual((primitives.min_int16, primitives.max_int16), (-(2**15), 2**15 - 1))
        self.assertEqual((primitives.min_int64, primitives.max_int64), (-(2**63), 2**63 - 1))
        self.assertEqual((primitives.min_uint, primitives.max_uint), (0, 2 * sys.maxsize + 1))
        self.assertEqual((primitives.min_uint16, primitives.max_uint16), (0, 2**16 - 1))
        self.assertEqual((primitives.min_uint32, primitives.max_uint32), (0, 2**32 - 1))
        self.assertEqual((primitives.min_uint64, primitives.max_uint64), (0, 2**64 - 1))

    def test_all_integer_width_echo_round_trip(self) -> None:
        primitives = self.testapi.Primitives

        cases = [
            (primitives.echo_int8, primitives.min_int8, primitives.max_int8),
            (primitives.echo_int16, primitives.min_int16, primitives.max_int16),
            (primitives.echo_int64, primitives.min_int64, primitives.max_int64),
            (primitives.echo_uint, primitives.min_uint, primitives.max_uint),
            (primitives.echo_uint16, primitives.min_uint16, primitives.max_uint16),
            (primitives.echo_uint32, primitives.min_uint32, primitives.max_uint32),
            (primitives.echo_uint64, primitives.min_uint64, primitives.max_uint64),
        ]
        for echo, low, high in cases:
            self.assertEqual(echo(low), low)
            self.assertEqual(echo(high), high)

    def test_all_integer_width_boxed_round_trip(self) -> None:
        # The boxed/foreignObject path (Optional here) round-trips each width in BOTH
        # directions, which requires the native per-width converter setup (valueMethod +
        # constructor). The scalar echo path is cffi-direct and does NOT exercise this,
        # so this is the regression test for the missing Swift_<Width>_setup wiring.
        primitives = self.testapi.Primitives

        cases = [
            (primitives.maybe_echo_int8, primitives.min_int8, primitives.max_int8),
            (primitives.maybe_echo_int16, primitives.min_int16, primitives.max_int16),
            (primitives.maybe_echo_int64, primitives.min_int64, primitives.max_int64),
            (primitives.maybe_echo_uint, primitives.min_uint, primitives.max_uint),
            (primitives.maybe_echo_uint16, primitives.min_uint16, primitives.max_uint16),
            (primitives.maybe_echo_uint32, primitives.min_uint32, primitives.max_uint32),
            (primitives.maybe_echo_uint64, primitives.min_uint64, primitives.max_uint64),
        ]
        for echo, low, high in cases:
            self.assertIsNone(echo(None))
            self.assertEqual(echo(low), low)
            self.assertEqual(echo(high), high)

    def test_integer_width_range_validation(self) -> None:
        primitives = self.testapi.Primitives

        # Composite (optional) path runs the descriptor validators -> ValueError.
        with self.assertRaises(ValueError):
            primitives.maybe_echo_int8(2**7)
        with self.assertRaises(ValueError):
            primitives.maybe_echo_int8(-(2**7) - 1)
        with self.assertRaises(ValueError):
            primitives.maybe_echo_uint16(-1)
        with self.assertRaises(ValueError):
            primitives.maybe_echo_uint16(2**16)

    def test_bare_scalar_echo_rejects_out_of_range(self) -> None:
        # The bare-scalar path marshals through cffi directly; out-of-range input must
        # still be rejected (cffi raises OverflowError) rather than silently truncating.
        primitives = self.testapi.Primitives

        with self.assertRaises((ValueError, OverflowError)):
            primitives.echo_int8(2**7)
        with self.assertRaises((ValueError, OverflowError)):
            primitives.echo_uint8(256)
        with self.assertRaises((ValueError, OverflowError)):
            primitives.echo_uint64(2**64)

    def test_holder_static_mutable_property_round_trip(self) -> None:
        # Covers the type-based metaclass path (_Primitives_PrimitiveHolderMeta) with a
        # composite ([UInt8?]) value flowing through the static setter to native.
        holder = self.testapi.Primitives_PrimitiveHolder
        original = holder.static_mutable_property
        try:
            holder.static_mutable_property = [None, 1, 255]
            self.assertEqual(holder.static_mutable_property, [None, 1, 255])
        finally:
            holder.static_mutable_property = original


if __name__ == "__main__":
    unittest.main()
