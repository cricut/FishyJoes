using System;
using Xunit;
using Cricut.FishyJoesRuntime;

namespace Cricut.TestAPI.Tests {
    public class RangeTests {
        [Fact]
        void testRangeValues() {
            Assert.Equal(Ranges.UInt8Range, new SwiftRange<byte>(byte.MinValue, byte.MaxValue));
            Assert.Equal(Ranges.UInt16Range, new SwiftRange<ushort>(ushort.MinValue, ushort.MaxValue));
            Assert.Equal(Ranges.UInt32Range, new SwiftRange<uint>(uint.MinValue, uint.MaxValue));
            Assert.Equal(Ranges.UInt64Range, new SwiftRange<ulong>(ulong.MinValue, ulong.MaxValue));
            Assert.Equal(Ranges.UIntRange, new SwiftRange<nuint>(uint.MinValue, uint.MaxValue));
            Assert.Equal(Ranges.Int8Range, new SwiftRange<sbyte>(sbyte.MinValue, sbyte.MaxValue));
            Assert.Equal(Ranges.Int16Range, new SwiftRange<short>(short.MinValue, short.MaxValue));
            Assert.Equal(Ranges.Int32Range, new SwiftRange<int>(int.MinValue, int.MaxValue));
            Assert.Equal(Ranges.Int64Range, new SwiftRange<long>(long.MinValue, long.MaxValue));
            Assert.Equal(Ranges.IntRange, new SwiftRange<nint>(int.MinValue, int.MaxValue));
        }

        [Fact]
        void testRangeEcho() {
            Assert.Equal(Ranges.EchoUInt8Range(Ranges.UInt8Range), Ranges.UInt8Range);
            Assert.Equal(Ranges.EchoUInt16Range(Ranges.UInt16Range), Ranges.UInt16Range);
            Assert.Equal(Ranges.EchoUInt32Range(Ranges.UInt32Range), Ranges.UInt32Range);
            Assert.Equal(Ranges.EchoUInt64Range(Ranges.UInt64Range), Ranges.UInt64Range);
            Assert.Equal(Ranges.EchoUIntRange(Ranges.UIntRange), Ranges.UIntRange);
            Assert.Equal(Ranges.EchoInt8Range(Ranges.Int8Range), Ranges.Int8Range);
            Assert.Equal(Ranges.EchoInt16Range(Ranges.Int16Range), Ranges.Int16Range);
            Assert.Equal(Ranges.EchoInt32Range(Ranges.Int32Range), Ranges.Int32Range);
            Assert.Equal(Ranges.EchoInt64Range(Ranges.Int64Range), Ranges.Int64Range);
            Assert.Equal(Ranges.EchoIntRange(Ranges.IntRange), Ranges.IntRange);
        }

        [Fact]
        void testClosedRangeValues() {
            Assert.Equal(ClosedRanges.UInt8Range, new SwiftClosedRange<byte>(byte.MinValue, byte.MaxValue));
            Assert.Equal(ClosedRanges.UInt16Range, new SwiftClosedRange<ushort>(ushort.MinValue, ushort.MaxValue));
            Assert.Equal(ClosedRanges.UInt32Range, new SwiftClosedRange<uint>(uint.MinValue, uint.MaxValue));
            Assert.Equal(ClosedRanges.UInt64Range, new SwiftClosedRange<ulong>(ulong.MinValue, ulong.MaxValue));
            Assert.Equal(ClosedRanges.UIntRange, new SwiftClosedRange<nuint>(uint.MinValue, uint.MaxValue));
            Assert.Equal(ClosedRanges.Int8Range, new SwiftClosedRange<sbyte>(sbyte.MinValue, sbyte.MaxValue));
            Assert.Equal(ClosedRanges.Int16Range, new SwiftClosedRange<short>(short.MinValue, short.MaxValue));
            Assert.Equal(ClosedRanges.Int32Range, new SwiftClosedRange<int>(int.MinValue, int.MaxValue));
            Assert.Equal(ClosedRanges.Int64Range, new SwiftClosedRange<long>(long.MinValue, long.MaxValue));
            Assert.Equal(ClosedRanges.IntRange, new SwiftClosedRange<nint>(int.MinValue, int.MaxValue));
            Assert.Equal(ClosedRanges.FloatRange, new SwiftClosedRange<float>(-float.MaxValue, float.MaxValue));
            Assert.Equal(ClosedRanges.DoubleRange, new SwiftClosedRange<double>(-double.MaxValue, double.MaxValue));
            Assert.Equal(ClosedRanges.StringRange, new SwiftClosedRange<string>("A", "Z"));
        }

        [Fact]
        void testClosedRangeEcho() {
            Assert.Equal(ClosedRanges.EchoUInt8Range(ClosedRanges.UInt8Range), ClosedRanges.UInt8Range);
            Assert.Equal(ClosedRanges.EchoUInt16Range(ClosedRanges.UInt16Range), ClosedRanges.UInt16Range);
            Assert.Equal(ClosedRanges.EchoUInt32Range(ClosedRanges.UInt32Range), ClosedRanges.UInt32Range);
            Assert.Equal(ClosedRanges.EchoUInt64Range(ClosedRanges.UInt64Range), ClosedRanges.UInt64Range);
            Assert.Equal(ClosedRanges.EchoUIntRange(ClosedRanges.UIntRange), ClosedRanges.UIntRange);
            Assert.Equal(ClosedRanges.EchoInt8Range(ClosedRanges.Int8Range), ClosedRanges.Int8Range);
            Assert.Equal(ClosedRanges.EchoInt16Range(ClosedRanges.Int16Range), ClosedRanges.Int16Range);
            Assert.Equal(ClosedRanges.EchoInt32Range(ClosedRanges.Int32Range), ClosedRanges.Int32Range);
            Assert.Equal(ClosedRanges.EchoInt64Range(ClosedRanges.Int64Range), ClosedRanges.Int64Range);
            Assert.Equal(ClosedRanges.EchoIntRange(ClosedRanges.IntRange), ClosedRanges.IntRange);
            Assert.Equal(ClosedRanges.EchoFloatRange(ClosedRanges.FloatRange), ClosedRanges.FloatRange);
            Assert.Equal(ClosedRanges.EchoDoubleRange(ClosedRanges.DoubleRange), ClosedRanges.DoubleRange);
            Assert.Equal(ClosedRanges.EchoStringRange(ClosedRanges.StringRange), ClosedRanges.StringRange);

            // TODO: Empty ranges?
            // ClosedRange empty = new ClosedRange(0, -1)
            // Assert.True(empty.isEmpty())
            // Assert.True(ClosedRanges.EchoInt32Range(empty).isEmpty())
        }

        [Fact]
        void testBounds() {
            Assert.Equal(Ranges.UInt64Range.LowerBound, ulong.MinValue);
            Assert.Equal(Ranges.UInt64Range.UpperBound, ulong.MaxValue);
            Assert.Equal(ClosedRanges.UInt64Range.LowerBound, ulong.MinValue);
            Assert.Equal(ClosedRanges.UInt64Range.UpperBound, ulong.MaxValue);
        }
    }
}
