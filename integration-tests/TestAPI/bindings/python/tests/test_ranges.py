import unittest

from fishyjoes_runtime import SwiftClosedRange, SwiftRange

from testapi import closed_ranges, ranges


class RangeTests(unittest.TestCase):
    def test_int_range_values_and_echo(self) -> None:
        expected = SwiftRange(-2147483648, 2147483647)
        self.assertEqual(ranges.get_int_range(), expected)
        self.assertEqual(ranges.echo_int_range(expected), expected)

    def test_additional_range_descriptors_and_echo(self) -> None:
        self.assertEqual(ranges.get_uint8_range(), SwiftRange(0, 255))
        self.assertEqual(ranges.echo_uint8_range(SwiftRange(3, 8)), SwiftRange(3, 8))

        expected_int32 = SwiftRange(-2147483648, 2147483647)
        self.assertEqual(ranges.get_int32_range(), expected_int32)
        self.assertEqual(ranges.echo_int32_range(SwiftRange(-5, 12)), SwiftRange(-5, 12))

    def test_int_closed_range_values_and_echo(self) -> None:
        expected = SwiftClosedRange(-2147483648, 2147483647)
        self.assertEqual(closed_ranges.get_int_range(), expected)
        self.assertEqual(closed_ranges.echo_int_range(expected), expected)

    def test_additional_closed_range_descriptors_and_echo(self) -> None:
        self.assertEqual(closed_ranges.get_uint8_range(), SwiftClosedRange(0, 255))
        self.assertEqual(closed_ranges.echo_uint8_range(SwiftClosedRange(3, 8)), SwiftClosedRange(3, 8))

        self.assertEqual(closed_ranges.get_int32_range(), SwiftClosedRange(-2147483648, 2147483647))
        self.assertEqual(closed_ranges.echo_int32_range(SwiftClosedRange(-5, 12)), SwiftClosedRange(-5, 12))

        self.assertEqual(closed_ranges.get_string_range(), SwiftClosedRange[str]("A", "Z"))
        self.assertEqual(closed_ranges.echo_string_range(SwiftClosedRange("cat", "dog")), SwiftClosedRange("cat", "dog"))

        double_range = SwiftClosedRange(1.25, 3.5)
        self.assertEqual(closed_ranges.echo_double_range(double_range), double_range)


if __name__ == "__main__":
    unittest.main()
