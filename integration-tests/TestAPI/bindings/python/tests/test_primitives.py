import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
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


if __name__ == "__main__":
    unittest.main()
