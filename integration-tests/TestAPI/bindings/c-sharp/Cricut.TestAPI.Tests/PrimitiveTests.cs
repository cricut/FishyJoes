using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class PrimitiveTests {
        [Fact]
        void testPrimitiveValues() {
            Assert.False(Primitives.FalseBool);
            Assert.True(Primitives.TrueBool);
            Assert.Equal(0u, Primitives.ZeroUInt8);
            Assert.Equal(byte.MinValue, Primitives.MinUInt8);
            Assert.Equal(byte.MaxValue, Primitives.MaxUInt8);
            Assert.Equal(0u, Primitives.ZeroUInt16);
            Assert.Equal(ushort.MinValue, Primitives.MinUInt16);
            Assert.Equal(ushort.MaxValue, Primitives.MaxUInt16);
            Assert.Equal(0u, Primitives.ZeroUInt32);
            Assert.Equal(uint.MinValue, Primitives.MinUInt32);
            Assert.Equal(uint.MaxValue, Primitives.MaxUInt32);
            Assert.Equal(0u, Primitives.ZeroUInt64);
            Assert.Equal(ulong.MinValue, Primitives.MinUInt64);
            Assert.Equal(ulong.MaxValue, Primitives.MaxUInt64);
            Assert.Equal(0u, Primitives.ZeroUInt);
            Assert.Equal(nuint.MinValue, Primitives.MinUInt);
            Assert.Equal(nuint.MaxValue, Primitives.MaxUInt);
            Assert.Equal(0, Primitives.ZeroInt8);
            Assert.Equal(sbyte.MinValue, Primitives.MinInt8);
            Assert.Equal(sbyte.MaxValue, Primitives.MaxInt8);
            Assert.Equal(0, Primitives.ZeroInt16);
            Assert.Equal(short.MinValue, Primitives.MinInt16);
            Assert.Equal(short.MaxValue, Primitives.MaxInt16);
            Assert.Equal(0, Primitives.ZeroInt32);
            Assert.Equal(int.MinValue, Primitives.MinInt32);
            Assert.Equal(int.MaxValue, Primitives.MaxInt32);
            Assert.Equal(0, Primitives.ZeroInt64);
            Assert.Equal(long.MinValue, Primitives.MinInt64);
            Assert.Equal(long.MaxValue, Primitives.MaxInt64);
            Assert.Equal(0, Primitives.ZeroInt);
            Assert.Equal(nint.MinValue, Primitives.MinInt);
            Assert.Equal(nint.MaxValue, Primitives.MaxInt);
            Assert.Equal(0.0f, Primitives.ZeroFloat);
            Assert.Equal(-float.MaxValue, Primitives.MinFloat);
            Assert.Equal(float.MaxValue, Primitives.MaxFloat);
            Assert.Equal(0.0, Primitives.ZeroDouble);
            Assert.Equal(-double.MaxValue, Primitives.MinDouble);
            Assert.Equal(double.MaxValue, Primitives.MaxDouble);
        }

        [Fact]
        void testArraysOfPrimitiveValues() {
            Assert.Equal(new bool[] { false, true }, Primitives.ManyBool);
            Assert.Equal(new byte[] { (byte)0, byte.MinValue, byte.MaxValue }, Primitives.ManyUInt8);
            Assert.Equal(new ushort[] { (ushort)0, ushort.MinValue, ushort.MaxValue }, Primitives.ManyUInt16);
            Assert.Equal(new uint[] { 0u, uint.MinValue, uint.MaxValue }, Primitives.ManyUInt32);
            Assert.Equal(new ulong[] { 0u, ulong.MinValue, ulong.MaxValue }, Primitives.ManyUInt64);
            Assert.Equal(new nuint[] { 0u, nuint.MinValue, nuint.MaxValue }, Primitives.ManyUInt);
            Assert.Equal(new sbyte[] { 0, sbyte.MinValue, sbyte.MaxValue }, Primitives.ManyInt8);
            Assert.Equal(new short[] { 0, short.MinValue, short.MaxValue }, Primitives.ManyInt16);
            Assert.Equal(new int[] { 0, int.MinValue, int.MaxValue }, Primitives.ManyInt32);
            Assert.Equal(new long[] { 0, long.MinValue, long.MaxValue }, Primitives.ManyInt64);
            Assert.Equal(new nint[] { 0, nint.MinValue, nint.MaxValue }, Primitives.ManyInt);
            Assert.Equal(new float[] { 0.0f, -float.MaxValue, float.MaxValue }, Primitives.ManyFloat);
            Assert.Equal(new double[] { 0.0, -double.MaxValue, double.MaxValue }, Primitives.ManyDouble);
        }

        [Fact]
        void testArraysOfOptionalPrimitiveValues() {
            Assert.Equal(new bool?[] { null, false, true }, Primitives.ManyMaybeBool);
            Assert.Equal(new byte?[] { null, (byte)0, byte.MinValue, byte.MaxValue }, Primitives.ManyMaybeUInt8);
            Assert.Equal(new ushort?[] { null, 0, ushort.MinValue, ushort.MaxValue }, Primitives.ManyMaybeUInt16);
            Assert.Equal(new uint?[] { null, 0, uint.MinValue, uint.MaxValue }, Primitives.ManyMaybeUInt32);
            Assert.Equal(new ulong?[] { null, 0, ulong.MinValue, ulong.MaxValue }, Primitives.ManyMaybeUInt64);
            Assert.Equal(new nuint?[] { null, 0, nuint.MinValue, nuint.MaxValue }, Primitives.ManyMaybeUInt);
            Assert.Equal(new sbyte?[] { null, 0, sbyte.MinValue, sbyte.MaxValue }, Primitives.ManyMaybeInt8);
            Assert.Equal(new short?[] { null, 0, short.MinValue, short.MaxValue }, Primitives.ManyMaybeInt16);
            Assert.Equal(new int?[] { null, 0, int.MinValue, int.MaxValue }, Primitives.ManyMaybeInt32);
            Assert.Equal(new long?[] { null, 0, long.MinValue, long.MaxValue }, Primitives.ManyMaybeInt64);
            Assert.Equal(new nint?[] { null, 0, nint.MinValue, nint.MaxValue }, Primitives.ManyMaybeInt);
            Assert.Equal(new float?[] { null, 0.0f, -float.MaxValue, float.MaxValue }, Primitives.ManyMaybeFloat);
            Assert.Equal(new double?[] { null, 0.0, -double.MaxValue, double.MaxValue }, Primitives.ManyMaybeDouble);
        }

        [Fact]
        void testFunctionsTakingAndReturningPrimitiveTypes() {
            Assert.False(Primitives.EchoBool(false));
            Assert.True(Primitives.EchoBool(true));
            Assert.Equal(0, Primitives.EchoUInt8(0));
            Assert.Equal(byte.MinValue, Primitives.EchoUInt8(byte.MinValue));
            Assert.Equal(byte.MaxValue, Primitives.EchoUInt8(byte.MaxValue));
            Assert.Equal(0, Primitives.EchoUInt16(0));
            Assert.Equal(ushort.MinValue, Primitives.EchoUInt16(ushort.MinValue));
            Assert.Equal(ushort.MaxValue, Primitives.EchoUInt16(ushort.MaxValue));
            Assert.Equal(0u, Primitives.EchoUInt32(0u));
            Assert.Equal(uint.MinValue, Primitives.EchoUInt32(uint.MinValue));
            Assert.Equal(uint.MaxValue, Primitives.EchoUInt32(uint.MaxValue));
            Assert.Equal(0u, Primitives.EchoUInt64(0u));
            Assert.Equal(ulong.MinValue, Primitives.EchoUInt64(ulong.MinValue));
            Assert.Equal(ulong.MaxValue, Primitives.EchoUInt64(ulong.MaxValue));
            Assert.Equal(0u, Primitives.EchoUInt(0u));
            Assert.Equal(nuint.MinValue, Primitives.EchoUInt(nuint.MinValue));
            Assert.Equal(nuint.MaxValue, Primitives.EchoUInt(nuint.MaxValue));
            Assert.Equal(0, Primitives.EchoInt8(0));
            Assert.Equal(sbyte.MinValue, Primitives.EchoInt8(sbyte.MinValue));
            Assert.Equal(sbyte.MaxValue, Primitives.EchoInt8(sbyte.MaxValue));
            Assert.Equal(0, Primitives.EchoInt16(0));
            Assert.Equal(short.MinValue, Primitives.EchoInt16(short.MinValue));
            Assert.Equal(short.MaxValue, Primitives.EchoInt16(short.MaxValue));
            Assert.Equal(0, Primitives.EchoInt32(0));
            Assert.Equal(int.MinValue, Primitives.EchoInt32(int.MinValue));
            Assert.Equal(int.MaxValue, Primitives.EchoInt32(int.MaxValue));
            Assert.Equal(0, Primitives.EchoInt64(0));
            Assert.Equal(long.MinValue, Primitives.EchoInt64(long.MinValue));
            Assert.Equal(long.MaxValue, Primitives.EchoInt64(long.MaxValue));
            Assert.Equal(0, Primitives.EchoInt(0));
            Assert.Equal(nint.MinValue, Primitives.EchoInt(nint.MinValue));
            Assert.Equal(nint.MaxValue, Primitives.EchoInt(nint.MaxValue));
            Assert.Equal(0.0f, Primitives.EchoFloat(0.0f));
            Assert.Equal(-float.MaxValue, Primitives.EchoFloat(-float.MaxValue));
            Assert.Equal(float.MaxValue, Primitives.EchoFloat(float.MaxValue));
            Assert.Equal(0.0, Primitives.EchoDouble(0.0));
            Assert.Equal(-double.MaxValue, Primitives.EchoDouble(-double.MaxValue));
            Assert.Equal(double.MaxValue, Primitives.EchoDouble(double.MaxValue));
        }

        [Fact]
        void testFunctionsTakingReturningOptionalPrimitiveTypes() {
            Assert.Null(Primitives.MaybeEchoBool(null));
            Assert.False(Primitives.MaybeEchoBool(false));
            Assert.True(Primitives.MaybeEchoBool(true));
            Assert.Null(Primitives.MaybeEchoUInt8(null));
            Assert.Equal((byte) 0, Primitives.MaybeEchoUInt8((byte)0));
            Assert.Equal(byte.MinValue, Primitives.MaybeEchoUInt8(byte.MinValue));
            Assert.Equal(byte.MaxValue, Primitives.MaybeEchoUInt8(byte.MaxValue));
            Assert.Null(Primitives.MaybeEchoUInt16(null));
            Assert.Equal((ushort)0, Primitives.MaybeEchoUInt16((ushort)0));
            Assert.Equal(ushort.MinValue, Primitives.MaybeEchoUInt16(ushort.MinValue));
            Assert.Equal(ushort.MaxValue, Primitives.MaybeEchoUInt16(ushort.MaxValue));
            Assert.Null(Primitives.MaybeEchoUInt32(null));
            Assert.Equal(0u, Primitives.MaybeEchoUInt32(0u));
            Assert.Equal(uint.MinValue, Primitives.MaybeEchoUInt32(uint.MinValue));
            Assert.Equal(uint.MaxValue, Primitives.MaybeEchoUInt32(uint.MaxValue));
            Assert.Null(Primitives.MaybeEchoUInt64(null));
            Assert.Equal(0u, Primitives.MaybeEchoUInt64(0u));
            Assert.Equal(ulong.MinValue, Primitives.MaybeEchoUInt64(ulong.MinValue));
            Assert.Equal(ulong.MaxValue, Primitives.MaybeEchoUInt64(ulong.MaxValue));
            Assert.Null(Primitives.MaybeEchoUInt(null));
            Assert.Equal(0u, Primitives.MaybeEchoUInt(0u));
            Assert.Equal(nuint.MinValue, Primitives.MaybeEchoUInt(nuint.MinValue));
            Assert.Equal(nuint.MaxValue, Primitives.MaybeEchoUInt(nuint.MaxValue));
            Assert.Null(Primitives.MaybeEchoInt8(null));
            Assert.Equal((sbyte)0, Primitives.MaybeEchoInt8((sbyte)0));
            Assert.Equal(sbyte.MinValue, Primitives.MaybeEchoInt8(sbyte.MinValue));
            Assert.Equal(sbyte.MaxValue, Primitives.MaybeEchoInt8(sbyte.MaxValue));
            Assert.Null(Primitives.MaybeEchoInt16(null));
            Assert.Equal((short)0, Primitives.MaybeEchoInt16((short)0));
            Assert.Equal(short.MinValue, Primitives.MaybeEchoInt16(short.MinValue));
            Assert.Equal(short.MaxValue, Primitives.MaybeEchoInt16(short.MaxValue));
            Assert.Null(Primitives.MaybeEchoInt32(null));
            Assert.Equal(0, Primitives.MaybeEchoInt32(0));
            Assert.Equal(int.MinValue, Primitives.MaybeEchoInt32(int.MinValue));
            Assert.Equal(int.MaxValue, Primitives.MaybeEchoInt32(int.MaxValue));
            Assert.Null(Primitives.MaybeEchoInt64(null));
            Assert.Equal(0, Primitives.MaybeEchoInt64(0));
            Assert.Equal(long.MinValue, Primitives.MaybeEchoInt64(long.MinValue));
            Assert.Equal(long.MaxValue, Primitives.MaybeEchoInt64(long.MaxValue));
            Assert.Null(Primitives.MaybeEchoInt(null));
            Assert.Equal(0, Primitives.MaybeEchoInt(0));
            Assert.Equal(nint.MinValue, Primitives.MaybeEchoInt(nint.MinValue));
            Assert.Equal(nint.MaxValue, Primitives.MaybeEchoInt(nint.MaxValue));
            Assert.Null(Primitives.MaybeEchoFloat(null));
            Assert.Equal(0.0f, Primitives.MaybeEchoFloat(0.0f));
            Assert.Equal(-float.MaxValue, Primitives.MaybeEchoFloat(-float.MaxValue));
            Assert.Equal(float.MaxValue, Primitives.MaybeEchoFloat(float.MaxValue));
            Assert.Null(Primitives.MaybeEchoDouble(null));
            Assert.Equal(0.0, Primitives.MaybeEchoDouble(0.0));
            Assert.Equal(-Double.MaxValue, Primitives.MaybeEchoDouble(-Double.MaxValue));
            Assert.Equal(Double.MaxValue, Primitives.MaybeEchoDouble(Double.MaxValue));
        }

        [Fact]
        void testFunctionsTakingClosuresWithPrimitiveTypes() {
            Assert.Equal(Primitives.ValueMapper(10, it => (byte)((it ?? 0) * 2)), (byte)20);
        }

        [Fact]
        void testObjectsWithPrimitiveMembers() {
            Assert.Equal(Primitives.PrimitiveHolder.StaticProperty, new byte?[] { null, (byte)0, byte.MinValue, byte.MaxValue });
            Assert.Equal(Primitives.PrimitiveHolder.StaticMutableProperty, new byte?[] { null, (byte)0, byte.MinValue, byte.MaxValue });
            Primitives.PrimitiveHolder.StaticMutableProperty = new byte?[] { (byte)100, (byte)200 };
            Assert.Equal(Primitives.PrimitiveHolder.StaticMutableProperty, new byte?[] { (byte)100, (byte)200 });
            var s = Primitives.DefaultPrimitiveHolder;
            Assert.Equal(s, Primitives.DefaultPrimitiveHolder);
            s.B = !s.B;
            Assert.NotEqual(s, Primitives.DefaultPrimitiveHolder);
        }

        [Fact]
        void testBoolOverflow() {
            Assert.Equal(
                8,
                Primitives.BoolOverflow(
                    true, false, true, false,
                    false, true, false, true,
                    true, false, true, false,
                    false, true, false, true
                )
            );
        }
    }
}
