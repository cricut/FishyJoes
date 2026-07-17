import unittest

import testapi


class RangeTests(unittest.TestCase):
    def test_int_range_values_and_echo(self) -> None:
        ranges = testapi.Ranges

        expected = testapi.SwiftRange(-2147483648, 2147483647)
        self.assertEqual(ranges.int_range, expected)
        self.assertEqual(ranges.echo_int_range(expected), expected)

    def test_additional_range_descriptors_and_echo(self) -> None:
        ranges = testapi.Ranges

        self.assertEqual(ranges.u_int8_range, testapi.SwiftRange(0, 255))
        self.assertEqual(ranges.echo_uint8_range(testapi.SwiftRange(3, 8)), testapi.SwiftRange(3, 8))

        expected_int32 = testapi.SwiftRange(-2147483648, 2147483647)
        self.assertEqual(ranges.int32_range, expected_int32)
        self.assertEqual(ranges.echo_int32_range(testapi.SwiftRange(-5, 12)), testapi.SwiftRange(-5, 12))

    def test_int_closed_range_values_and_echo(self) -> None:
        ranges = testapi.ClosedRanges

        expected = testapi.SwiftClosedRange(-2147483648, 2147483647)
        self.assertEqual(ranges.int_range, expected)
        self.assertEqual(ranges.echo_int_range(expected), expected)

    def test_additional_closed_range_descriptors_and_echo(self) -> None:
        ranges = testapi.ClosedRanges

        self.assertEqual(ranges.u_int8_range, testapi.SwiftClosedRange(0, 255))
        self.assertEqual(ranges.echo_uint8_range(testapi.SwiftClosedRange(3, 8)), testapi.SwiftClosedRange(3, 8))

        self.assertEqual(ranges.int32_range, testapi.SwiftClosedRange(-2147483648, 2147483647))
        self.assertEqual(ranges.echo_int32_range(testapi.SwiftClosedRange(-5, 12)), testapi.SwiftClosedRange(-5, 12))

        self.assertEqual(ranges.string_range, testapi.SwiftClosedRange("A", "Z"))
        self.assertEqual(ranges.echo_string_range(testapi.SwiftClosedRange("cat", "dog")), testapi.SwiftClosedRange("cat", "dog"))

        double_range = testapi.SwiftClosedRange(1.25, 3.5)
        self.assertEqual(ranges.echo_double_range(double_range), double_range)


if __name__ == "__main__":
    unittest.main()
