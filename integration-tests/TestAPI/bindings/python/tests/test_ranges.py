"""Range and ClosedRange integration tests.

Mirrors C# RangeTests in Cricut.TestAPI.Tests/RangeTests.cs.
Ranges are represented as 2-tuples (lowerBound, upperBound) on the Python side.
"""

import sys
import os
import struct
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.Ranges import Ranges
from cricut_testapi.ClosedRanges import ClosedRanges


class TestRangeValues(unittest.TestCase):
    """Half-open Range<T> value tests (mirrors testRangeValues)."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_uint8_range(self) -> None:
        self.assertEqual(Ranges.uInt8Range(), (0, 255))

    def test_uint16_range(self) -> None:
        self.assertEqual(Ranges.uInt16Range(), (0, 65535))

    def test_uint32_range(self) -> None:
        self.assertEqual(Ranges.uInt32Range(), (0, 4294967295))

    def test_uint64_range(self) -> None:
        self.assertEqual(Ranges.uInt64Range(), (0, 18446744073709551615))

    def test_uint_range(self) -> None:
        # Swift UInt on ARM64 is 64-bit, but source uses UInt(UInt32.min)..<UInt(UInt32.max)
        self.assertEqual(Ranges.uIntRange(), (0, 4294967295))

    def test_int8_range(self) -> None:
        self.assertEqual(Ranges.int8Range(), (-128, 127))

    def test_int16_range(self) -> None:
        self.assertEqual(Ranges.int16Range(), (-32768, 32767))

    def test_int32_range(self) -> None:
        self.assertEqual(Ranges.int32Range(), (-2147483648, 2147483647))

    def test_int64_range(self) -> None:
        self.assertEqual(Ranges.int64Range(), (-(2**63), (2**63) - 1))

    def test_int_range(self) -> None:
        # Swift source: Int(Int32.min)..<Int(Int32.max) — matches C# nint(int.MinValue, int.MaxValue)
        self.assertEqual(Ranges.intRange(), (-2147483648, 2147483647))


class TestRangeBounds(unittest.TestCase):
    """Test that lowerBound and upperBound are accessible as tuple indices."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_uint64_bounds(self) -> None:
        r = Ranges.uInt64Range()
        self.assertEqual(r[0], 0)                       # lowerBound
        self.assertEqual(r[1], 18446744073709551615)     # upperBound

    def test_closed_uint64_bounds(self) -> None:
        r = ClosedRanges.uInt64Range()
        self.assertEqual(r[0], 0)
        self.assertEqual(r[1], 18446744073709551615)


class TestRangeEcho(unittest.TestCase):
    """Round-trip echo tests for half-open Range<T> (mirrors testRangeEcho)."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_echo_uint8_range(self) -> None:
        r = Ranges.uInt8Range()
        self.assertEqual(Ranges.echoUInt8Range(r), r)

    def test_echo_uint16_range(self) -> None:
        r = Ranges.uInt16Range()
        self.assertEqual(Ranges.echoUInt16Range(r), r)

    def test_echo_uint32_range(self) -> None:
        r = Ranges.uInt32Range()
        self.assertEqual(Ranges.echoUInt32Range(r), r)

    def test_echo_uint64_range(self) -> None:
        r = Ranges.uInt64Range()
        self.assertEqual(Ranges.echoUInt64Range(r), r)

    def test_echo_uint_range(self) -> None:
        r = Ranges.uIntRange()
        self.assertEqual(Ranges.echoUIntRange(r), r)

    def test_echo_int8_range(self) -> None:
        r = Ranges.int8Range()
        self.assertEqual(Ranges.echoInt8Range(r), r)

    def test_echo_int16_range(self) -> None:
        r = Ranges.int16Range()
        self.assertEqual(Ranges.echoInt16Range(r), r)

    def test_echo_int32_range(self) -> None:
        r = Ranges.int32Range()
        self.assertEqual(Ranges.echoInt32Range(r), r)

    def test_echo_int64_range(self) -> None:
        r = Ranges.int64Range()
        self.assertEqual(Ranges.echoInt64Range(r), r)

    def test_echo_int_range(self) -> None:
        r = Ranges.intRange()
        self.assertEqual(Ranges.echoIntRange(r), r)


class TestClosedRangeValues(unittest.TestCase):
    """ClosedRange<T> value tests (mirrors testClosedRangeValues)."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_uint8_range(self) -> None:
        self.assertEqual(ClosedRanges.uInt8Range(), (0, 255))

    def test_uint16_range(self) -> None:
        self.assertEqual(ClosedRanges.uInt16Range(), (0, 65535))

    def test_uint32_range(self) -> None:
        self.assertEqual(ClosedRanges.uInt32Range(), (0, 4294967295))

    def test_uint64_range(self) -> None:
        self.assertEqual(ClosedRanges.uInt64Range(), (0, 18446744073709551615))

    def test_uint_range(self) -> None:
        self.assertEqual(ClosedRanges.uIntRange(), (0, 4294967295))

    def test_int8_range(self) -> None:
        self.assertEqual(ClosedRanges.int8Range(), (-128, 127))

    def test_int16_range(self) -> None:
        self.assertEqual(ClosedRanges.int16Range(), (-32768, 32767))

    def test_int32_range(self) -> None:
        self.assertEqual(ClosedRanges.int32Range(), (-2147483648, 2147483647))

    def test_int64_range(self) -> None:
        self.assertEqual(ClosedRanges.int64Range(), (-(2**63), (2**63) - 1))

    def test_int_range(self) -> None:
        self.assertEqual(ClosedRanges.intRange(), (-2147483648, 2147483647))

    def test_float_range(self) -> None:
        lo, hi = ClosedRanges.floatRange()
        # C#: -float.MaxValue ... float.MaxValue
        # Python float32 max ≈ 3.4028234663852886e+38
        self.assertAlmostEqual(lo, -3.4028234663852886e+38, places=30)
        self.assertAlmostEqual(hi,  3.4028234663852886e+38, places=30)
        self.assertEqual(lo, -hi)

    def test_double_range(self) -> None:
        lo, hi = ClosedRanges.doubleRange()
        import sys as _sys
        self.assertEqual(hi, _sys.float_info.max)
        self.assertEqual(lo, -_sys.float_info.max)

    def test_string_range(self) -> None:
        self.assertEqual(ClosedRanges.stringRange(), ("A", "Z"))


class TestClosedRangeEcho(unittest.TestCase):
    """Round-trip echo tests for ClosedRange<T> (mirrors testClosedRangeEcho)."""

    def setUp(self) -> None:
        ensure_loaded()

    def test_echo_uint8_range(self) -> None:
        r = ClosedRanges.uInt8Range()
        self.assertEqual(ClosedRanges.echoUInt8Range(r), r)

    def test_echo_uint16_range(self) -> None:
        r = ClosedRanges.uInt16Range()
        self.assertEqual(ClosedRanges.echoUInt16Range(r), r)

    def test_echo_uint32_range(self) -> None:
        r = ClosedRanges.uInt32Range()
        self.assertEqual(ClosedRanges.echoUInt32Range(r), r)

    def test_echo_uint64_range(self) -> None:
        r = ClosedRanges.uInt64Range()
        self.assertEqual(ClosedRanges.echoUInt64Range(r), r)

    def test_echo_uint_range(self) -> None:
        r = ClosedRanges.uIntRange()
        self.assertEqual(ClosedRanges.echoUIntRange(r), r)

    def test_echo_int8_range(self) -> None:
        r = ClosedRanges.int8Range()
        self.assertEqual(ClosedRanges.echoInt8Range(r), r)

    def test_echo_int16_range(self) -> None:
        r = ClosedRanges.int16Range()
        self.assertEqual(ClosedRanges.echoInt16Range(r), r)

    def test_echo_int32_range(self) -> None:
        r = ClosedRanges.int32Range()
        self.assertEqual(ClosedRanges.echoInt32Range(r), r)

    def test_echo_int64_range(self) -> None:
        r = ClosedRanges.int64Range()
        self.assertEqual(ClosedRanges.echoInt64Range(r), r)

    def test_echo_int_range(self) -> None:
        r = ClosedRanges.intRange()
        self.assertEqual(ClosedRanges.echoIntRange(r), r)

    def test_echo_float_range(self) -> None:
        r = ClosedRanges.floatRange()
        self.assertEqual(ClosedRanges.echoFloatRange(r), r)

    def test_echo_double_range(self) -> None:
        r = ClosedRanges.doubleRange()
        self.assertEqual(ClosedRanges.echoDoubleRange(r), r)

    def test_echo_string_range(self) -> None:
        r = ClosedRanges.stringRange()
        self.assertEqual(ClosedRanges.echoStringRange(r), r)


if __name__ == "__main__":
    unittest.main()
