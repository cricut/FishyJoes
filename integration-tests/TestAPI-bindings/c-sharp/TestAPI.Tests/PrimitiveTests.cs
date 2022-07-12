using System;
using Xunit;
using Cricut.TestAPI;

namespace TestAPI.Tests {
    public class PrimitiveTests {
        [Fact]
        void testPrimitiveValues() {
            Assert.False(Primitives.falseBool);
            Assert.True(Primitives.trueBool);
            Assert.Equal(0u, Primitives.zeroUInt8);
            Assert.Equal(byte.MinValue, Primitives.minUInt8);
            Assert.Equal(byte.MaxValue, Primitives.maxUInt8);
            Assert.Equal(0u, Primitives.zeroUInt16);
            Assert.Equal(ushort.MinValue, Primitives.minUInt16);
            Assert.Equal(ushort.MaxValue, Primitives.maxUInt16);
            Assert.Equal(0u, Primitives.zeroUInt32);
            Assert.Equal(uint.MinValue, Primitives.minUInt32);
            Assert.Equal(uint.MaxValue, Primitives.maxUInt32);
            Assert.Equal(0u, Primitives.zeroUInt64);
            Assert.Equal(ulong.MinValue, Primitives.minUInt64);
            Assert.Equal(ulong.MaxValue, Primitives.maxUInt64);
            Assert.Equal(0, Primitives.zeroInt8);
            Assert.Equal(sbyte.MinValue, Primitives.minInt8);
            Assert.Equal(sbyte.MaxValue, Primitives.maxInt8);
            Assert.Equal(0, Primitives.zeroInt16);
            Assert.Equal(short.MinValue, Primitives.minInt16);
            Assert.Equal(short.MaxValue, Primitives.maxInt16);
            Assert.Equal(0, Primitives.zeroInt32);
            Assert.Equal(int.MinValue, Primitives.minInt32);
            Assert.Equal(int.MaxValue, Primitives.maxInt32);
            Assert.Equal(0, Primitives.zeroInt64);
            Assert.Equal(long.MinValue, Primitives.minInt64);
            Assert.Equal(long.MaxValue, Primitives.maxInt64);
            Assert.Equal(0.0f, Primitives.zeroFloat);
            Assert.Equal(-float.MaxValue, Primitives.minFloat);
            Assert.Equal(float.MaxValue, Primitives.maxFloat);
            Assert.Equal(0.0, Primitives.zeroDouble);
            Assert.Equal(-double.MaxValue, Primitives.minDouble);
            Assert.Equal(double.MaxValue, Primitives.maxDouble);
        }

        [Fact]
        void testArraysOfPrimitiveValues() {
            Assert.Equal(new bool[] { false, true }, Primitives.manyBool);
            Assert.Equal(new byte[] { (byte)0, byte.MinValue, byte.MaxValue }, Primitives.manyUInt8);
            Assert.Equal(new ushort[] { (ushort)0, ushort.MinValue, ushort.MaxValue }, Primitives.manyUInt16);
            Assert.Equal(new uint[] { 0u, uint.MinValue, uint.MaxValue }, Primitives.manyUInt32);
            Assert.Equal(new ulong[] { 0u, ulong.MinValue, ulong.MaxValue }, Primitives.manyUInt64);
            Assert.Equal(new sbyte[] { 0, sbyte.MinValue, sbyte.MaxValue }, Primitives.manyInt8);
            Assert.Equal(new short[] { 0, short.MinValue, short.MaxValue }, Primitives.manyInt16);
            Assert.Equal(new int[] { 0, int.MinValue, int.MaxValue }, Primitives.manyInt32);
            Assert.Equal(new long[] { 0, long.MinValue, long.MaxValue }, Primitives.manyInt64);
            Assert.Equal(new float[] { 0.0f, -float.MaxValue, float.MaxValue }, Primitives.manyFloat);
            Assert.Equal(new double[] { 0.0, -double.MaxValue, double.MaxValue }, Primitives.manyDouble);
        }

        [Fact]
        void testArraysOfOptionalPrimitiveValues() {
            Assert.Equal(new bool?[] { null, false, true }, Primitives.manyMaybeBool);
            Assert.Equal(new byte?[] { null, (byte)0, byte.MinValue, byte.MaxValue }, Primitives.manyMaybeUInt8);
            Assert.Equal(new ushort?[] { null, 0, ushort.MinValue, ushort.MaxValue }, Primitives.manyMaybeUInt16);
            Assert.Equal(new uint?[] { null, 0, uint.MinValue, uint.MaxValue }, Primitives.manyMaybeUInt32);
            Assert.Equal(new ulong?[] { null, 0, ulong.MinValue, ulong.MaxValue }, Primitives.manyMaybeUInt64);
            Assert.Equal(new sbyte?[] { null, 0, sbyte.MinValue, sbyte.MaxValue }, Primitives.manyMaybeInt8);
            Assert.Equal(new short?[] { null, 0, short.MinValue, short.MaxValue }, Primitives.manyMaybeInt16);
            Assert.Equal(new int?[] { null, 0, int.MinValue, int.MaxValue }, Primitives.manyMaybeInt32);
            Assert.Equal(new long?[] { null, 0, long.MinValue, long.MaxValue }, Primitives.manyMaybeInt64);
            Assert.Equal(new float?[] { null, 0.0f, -float.MaxValue, float.MaxValue }, Primitives.manyMaybeFloat);
            Assert.Equal(new double?[] { null, 0.0, -double.MaxValue, double.MaxValue }, Primitives.manyMaybeDouble);
        }

        [Fact]
        void testVoidctionsTakingAndReturningPrimitiveTypes() {
            Assert.False(Primitives.echoBool(false));
            Assert.True(Primitives.echoBool(true));
            Assert.Equal(0, Primitives.echoUInt8(0));
            Assert.Equal(byte.MinValue, Primitives.echoUInt8(byte.MinValue));
            Assert.Equal(byte.MaxValue, Primitives.echoUInt8(byte.MaxValue));
            Assert.Equal(0, Primitives.echoUInt16(0));
            Assert.Equal(ushort.MinValue, Primitives.echoUInt16(ushort.MinValue));
            Assert.Equal(ushort.MaxValue, Primitives.echoUInt16(ushort.MaxValue));
            Assert.Equal(0u, Primitives.echoUInt32(0u));
            Assert.Equal(uint.MinValue, Primitives.echoUInt32(uint.MinValue));
            Assert.Equal(uint.MaxValue, Primitives.echoUInt32(uint.MaxValue));
            Assert.Equal(0u, Primitives.echoUInt64(0u));
            Assert.Equal(ulong.MinValue, Primitives.echoUInt64(ulong.MinValue));
            Assert.Equal(ulong.MaxValue, Primitives.echoUInt64(ulong.MaxValue));
            Assert.Equal(0, Primitives.echoInt8(0));
            Assert.Equal(sbyte.MinValue, Primitives.echoInt8(sbyte.MinValue));
            Assert.Equal(sbyte.MaxValue, Primitives.echoInt8(sbyte.MaxValue));
            Assert.Equal(0, Primitives.echoInt16(0));
            Assert.Equal(short.MinValue, Primitives.echoInt16(short.MinValue));
            Assert.Equal(short.MaxValue, Primitives.echoInt16(short.MaxValue));
            Assert.Equal(0, Primitives.echoInt32(0));
            Assert.Equal(int.MinValue, Primitives.echoInt32(int.MinValue));
            Assert.Equal(int.MaxValue, Primitives.echoInt32(int.MaxValue));
            Assert.Equal(0, Primitives.echoInt64(0));
            Assert.Equal(long.MinValue, Primitives.echoInt64(long.MinValue));
            Assert.Equal(long.MaxValue, Primitives.echoInt64(long.MaxValue));
            Assert.Equal(0.0f, Primitives.echoFloat(0.0f));
            Assert.Equal(-float.MaxValue, Primitives.echoFloat(-float.MaxValue));
            Assert.Equal(float.MaxValue, Primitives.echoFloat(float.MaxValue));
            Assert.Equal(0.0, Primitives.echoDouble(0.0));
            Assert.Equal(-double.MaxValue, Primitives.echoDouble(-double.MaxValue));
            Assert.Equal(double.MaxValue, Primitives.echoDouble(double.MaxValue));
        }

        [Fact]
        void testVoidctionsTakingReturningOptionalPrimitiveTypes() {
            Assert.Null(Primitives.maybeEchoBool(null));
            Assert.False(Primitives.maybeEchoBool(false));
            Assert.True(Primitives.maybeEchoBool(true));
            Assert.Null(Primitives.maybeEchoUInt8(null));
            Assert.Equal((byte) 0, Primitives.maybeEchoUInt8((byte)0));
            Assert.Equal(byte.MinValue, Primitives.maybeEchoUInt8(byte.MinValue));
            Assert.Equal(byte.MaxValue, Primitives.maybeEchoUInt8(byte.MaxValue));
            Assert.Null(Primitives.maybeEchoUInt16(null));
            Assert.Equal((ushort)0, Primitives.maybeEchoUInt16((ushort)0));
            Assert.Equal(ushort.MinValue, Primitives.maybeEchoUInt16(ushort.MinValue));
            Assert.Equal(ushort.MaxValue, Primitives.maybeEchoUInt16(ushort.MaxValue));
            Assert.Null(Primitives.maybeEchoUInt32(null));
            Assert.Equal(0u, Primitives.maybeEchoUInt32(0u));
            Assert.Equal(uint.MinValue, Primitives.maybeEchoUInt32(uint.MinValue));
            Assert.Equal(uint.MaxValue, Primitives.maybeEchoUInt32(uint.MaxValue));
            Assert.Null(Primitives.maybeEchoUInt64(null));
            Assert.Equal(0u, Primitives.maybeEchoUInt64(0u));
            Assert.Equal(ulong.MinValue, Primitives.maybeEchoUInt64(ulong.MinValue));
            Assert.Equal(ulong.MaxValue, Primitives.maybeEchoUInt64(ulong.MaxValue));
            Assert.Null(Primitives.maybeEchoInt8(null));
            Assert.Equal((sbyte)0, Primitives.maybeEchoInt8((sbyte)0));
            Assert.Equal(sbyte.MinValue, Primitives.maybeEchoInt8(sbyte.MinValue));
            Assert.Equal(sbyte.MaxValue, Primitives.maybeEchoInt8(sbyte.MaxValue));
            Assert.Null(Primitives.maybeEchoInt16(null));
            Assert.Equal((short)0, Primitives.maybeEchoInt16((short)0));
            Assert.Equal(short.MinValue, Primitives.maybeEchoInt16(short.MinValue));
            Assert.Equal(short.MaxValue, Primitives.maybeEchoInt16(short.MaxValue));
            Assert.Null(Primitives.maybeEchoInt32(null));
            Assert.Equal(0, Primitives.maybeEchoInt32(0));
            Assert.Equal(int.MinValue, Primitives.maybeEchoInt32(int.MinValue));
            Assert.Equal(int.MaxValue, Primitives.maybeEchoInt32(int.MaxValue));
            Assert.Null(Primitives.maybeEchoInt64(null));
            Assert.Equal(0, Primitives.maybeEchoInt64(0));
            Assert.Equal(long.MinValue, Primitives.maybeEchoInt64(long.MinValue));
            Assert.Equal(long.MaxValue, Primitives.maybeEchoInt64(long.MaxValue));
            Assert.Null(Primitives.maybeEchoFloat(null));
            Assert.Equal(0.0f, Primitives.maybeEchoFloat(0.0f));
            Assert.Equal(-float.MaxValue, Primitives.maybeEchoFloat(-float.MaxValue));
            Assert.Equal(float.MaxValue, Primitives.maybeEchoFloat(float.MaxValue));
            Assert.Null(Primitives.maybeEchoDouble(null));
            Assert.Equal(0.0, Primitives.maybeEchoDouble(0.0));
            Assert.Equal(-Double.MaxValue, Primitives.maybeEchoDouble(-Double.MaxValue));
            Assert.Equal(Double.MaxValue, Primitives.maybeEchoDouble(Double.MaxValue));
        }

        [Fact]
        void testVoidctionsTakingClosuresWithPrimitiveTypes() {
            // TODO: Fix breakage
//        Assert.Equal(Primitives.valueMapper(10) { (it ?: 0) * 2 }, 20);
        }

        [Fact]
        void testObjectsWithPrimitiveMembers() {
            Assert.Equal(Primitives.PrimitiveHolder.staticPropery, new byte?[] { null, (byte)0, byte.MinValue, byte.MaxValue });
            Assert.Equal(Primitives.PrimitiveHolder.staticMutablePropery, new byte?[] { null, (byte)0, byte.MinValue, byte.MaxValue });
            Primitives.PrimitiveHolder.staticMutablePropery = new byte?[] { (byte)100, (byte)200 };
            Assert.Equal(Primitives.PrimitiveHolder.staticMutablePropery, new byte?[] { (byte)100, (byte)200 });
            var s = Primitives.defaultPrimitiveHolder;
            Assert.Equal(s, Primitives.defaultPrimitiveHolder);
            s.b = !s.b;
            Assert.NotEqual(s, Primitives.defaultPrimitiveHolder);
        }
    }
}
