import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class RangeTests(unittest.TestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    def test_int_range_values_and_echo(self) -> None:
        ranges = self.testapi.Ranges

        expected = self.testapi.SwiftRange(-2147483648, 2147483647)
        self.assertEqual(ranges.int_range, expected)
        self.assertEqual(ranges.echo_int_range(expected), expected)

    def test_additional_range_descriptors_and_echo(self) -> None:
        ranges = self.testapi.Ranges

        self.assertEqual(ranges.u_int8_range, self.testapi.SwiftRange(0, 255))
        self.assertEqual(ranges.echo_uint8_range(self.testapi.SwiftRange(3, 8)), self.testapi.SwiftRange(3, 8))

        expected_int32 = self.testapi.SwiftRange(-2147483648, 2147483647)
        self.assertEqual(ranges.int32_range, expected_int32)
        self.assertEqual(ranges.echo_int32_range(self.testapi.SwiftRange(-5, 12)), self.testapi.SwiftRange(-5, 12))

    def test_int_closed_range_values_and_echo(self) -> None:
        ranges = self.testapi.ClosedRanges

        expected = self.testapi.SwiftClosedRange(-2147483648, 2147483647)
        self.assertEqual(ranges.int_range, expected)
        self.assertEqual(ranges.echo_int_range(expected), expected)

    def test_additional_closed_range_descriptors_and_echo(self) -> None:
        ranges = self.testapi.ClosedRanges

        self.assertEqual(ranges.u_int8_range, self.testapi.SwiftClosedRange(0, 255))
        self.assertEqual(ranges.echo_uint8_range(self.testapi.SwiftClosedRange(3, 8)), self.testapi.SwiftClosedRange(3, 8))

        self.assertEqual(ranges.int32_range, self.testapi.SwiftClosedRange(-2147483648, 2147483647))
        self.assertEqual(ranges.echo_int32_range(self.testapi.SwiftClosedRange(-5, 12)), self.testapi.SwiftClosedRange(-5, 12))

        self.assertEqual(ranges.string_range, self.testapi.SwiftClosedRange("A", "Z"))
        self.assertEqual(ranges.echo_string_range(self.testapi.SwiftClosedRange("cat", "dog")), self.testapi.SwiftClosedRange("cat", "dog"))

        double_range = self.testapi.SwiftClosedRange(1.25, 3.5)
        self.assertEqual(ranges.echo_double_range(double_range), double_range)


if __name__ == "__main__":
    unittest.main()
