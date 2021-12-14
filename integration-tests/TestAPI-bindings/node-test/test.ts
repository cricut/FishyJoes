import(`${MODULE_PATH}/TestAPI.js`).then(({ TestAPI }) => {
    // Testing Utilities
    function assertEqual<T>(value: T, expected: T) {
        console.assert(value == expected, value + " was expected to be " + expected)
    }

    function assertArraysEqual<T>(array: Array<T>, expected: Array<T>) {
        console.assert(array.length == expected.length, array.every(function(e, i) { return e === expected[i] }), array + " was expected to be " + expected)
    }

    // Tests

    console.log("Testing Primitive Values...")
    function testPrimitiveValues() {
        assertEqual(TestAPI.Primitives.falseBool, false);
        assertEqual(TestAPI.Primitives.trueBool, true);
        assertEqual(TestAPI.Primitives.zeroUInt8, 0);
        assertEqual(TestAPI.Primitives.minUInt8, 0x00);
        assertEqual(TestAPI.Primitives.maxUInt8, 0xFF);
        assertEqual(TestAPI.Primitives.zeroUInt16, 0);
        assertEqual(TestAPI.Primitives.minUInt16, 0x0000);
        assertEqual(TestAPI.Primitives.maxUInt16, 0xFFFF);
        assertEqual(TestAPI.Primitives.zeroUInt32, 0);
        assertEqual(TestAPI.Primitives.minUInt32, 0x00000000);
        assertEqual(TestAPI.Primitives.maxUInt32, 0xFFFFFFFF);
        assertEqual(TestAPI.Primitives.zeroUInt64, 0);
        assertEqual(TestAPI.Primitives.minUInt64, BigInt("0x0000000000000000"));
        assertEqual(TestAPI.Primitives.maxUInt64, BigInt("0xFFFFFFFFFFFFFFFF"));
        assertEqual(TestAPI.Primitives.zeroInt8, 0);
        assertEqual(TestAPI.Primitives.minInt8, -0x80);
        assertEqual(TestAPI.Primitives.maxInt8, 0x7F);
        assertEqual(TestAPI.Primitives.zeroInt16, 0);
        assertEqual(TestAPI.Primitives.minInt16, -0x8000);
        assertEqual(TestAPI.Primitives.maxInt16, 0x7FFF);
        assertEqual(TestAPI.Primitives.zeroInt32, 0);
        assertEqual(TestAPI.Primitives.minInt32, -0x80000000);
        assertEqual(TestAPI.Primitives.maxInt32, 0x7FFFFFFF);
        assertEqual(TestAPI.Primitives.zeroInt64, 0);
        assertEqual(TestAPI.Primitives.minInt64, -BigInt("0x8000000000000000"));
        assertEqual(TestAPI.Primitives.maxInt64, BigInt("0x7FFFFFFFFFFFFFFF"));
        assertEqual(TestAPI.Primitives.zeroFloat, 0.0);
        assertEqual(TestAPI.Primitives.minFloat, -3.4028234663852886e+38);
        assertEqual(TestAPI.Primitives.maxFloat, 3.4028234663852886e+38);
        assertEqual(TestAPI.Primitives.zeroDouble, 0.0);
        assertEqual(TestAPI.Primitives.minDouble, -Number.MAX_VALUE);
        assertEqual(TestAPI.Primitives.maxDouble, Number.MAX_VALUE);
    }
    testPrimitiveValues()

    console.log("Testing Arrays of Primitive Values...")
    function testArraysOfPrimitiveValues() {
        assertArraysEqual(TestAPI.Primitives.manyBool, [false, true])
        assertArraysEqual(TestAPI.Primitives.manyUInt8, [0, 0x00, 0xFF]);
        assertArraysEqual(TestAPI.Primitives.manyUInt16, [0, 0x0000, 0xFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyUInt32, [0, 0x00000000, 0xFFFFFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyUInt64, [0, BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
        assertArraysEqual(TestAPI.Primitives.manyInt8, [0, -0x80, 0x7F]);
        assertArraysEqual(TestAPI.Primitives.manyInt16, [0, -0x8000, 0x7FFF]);
        assertArraysEqual(TestAPI.Primitives.manyInt32, [0, -0x80000000, 0x7FFFFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyInt64, [0, -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
        assertArraysEqual(TestAPI.Primitives.manyFloat, [0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
        assertArraysEqual(TestAPI.Primitives.manyDouble, [0, -Number.MAX_VALUE, Number.MAX_VALUE]);
    }
    testArraysOfPrimitiveValues()

    console.log("Testing Arrays of Optional Primitive Values...")
    function testArraysOfOptionalPrimitiveValues() {
        assertArraysEqual(TestAPI.Primitives.manyMaybeBool, [null, false, true]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeUInt8, [null, 0, 0x00, 0xFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeUInt16, [null, 0, 0x0000, 0xFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeUInt32, [null, 0, 0x00000000, 0xFFFFFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeUInt64, [null, 0, BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeInt8, [null, 0, -0x80, 0x7F]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeInt16, [null, 0, -0x8000, 0x7FFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeInt32, [null, 0, -0x80000000, 0x7FFFFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeInt64, [null, 0, -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeFloat, [null, 0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeDouble, [null, 0, -Number.MAX_VALUE, Number.MAX_VALUE]);
    }
    testArraysOfOptionalPrimitiveValues()

    // function testFunctionsTakingAndReturningPrimitiveTypes() {
    //     assertEqual(Primitives.echoBool(false), false);
    //     assertEqual(Primitives.echoBool(true), true);
    //     assertEqual(Primitives.echoUInt8(0.toUByte()), 0.toUByte());
    //     assertEqual(Primitives.echoUInt8(UByte.MIN_VALUE), UByte.MIN_VALUE);
    //     assertEqual(Primitives.echoUInt8(UByte.MAX_VALUE), UByte.MAX_VALUE);
    //     assertEqual(Primitives.echoUInt16(0.toUShort()), 0.toUShort());
    //     assertEqual(Primitives.echoUInt16(UShort.MIN_VALUE), UShort.MIN_VALUE);
    //     assertEqual(Primitives.echoUInt16(UShort.MAX_VALUE), UShort.MAX_VALUE);
    //     assertEqual(Primitives.echoUInt32(0.toUInt()), 0.toUInt());
    //     assertEqual(Primitives.echoUInt32(UInt.MIN_VALUE), UInt.MIN_VALUE);
    //     assertEqual(Primitives.echoUInt32(UInt.MAX_VALUE), UInt.MAX_VALUE);
    //     assertEqual(Primitives.echoUInt64(0.toULong()), 0.toULong());
    //     assertEqual(Primitives.echoUInt64(ULong.MIN_VALUE), ULong.MIN_VALUE);
    //     assertEqual(Primitives.echoUInt64(ULong.MAX_VALUE), ULong.MAX_VALUE);
    //     assertEqual(Primitives.echoInt8(0.toByte()), 0.toByte());
    //     assertEqual(Primitives.echoInt8(Byte.MIN_VALUE), Byte.MIN_VALUE);
    //     assertEqual(Primitives.echoInt8(Byte.MAX_VALUE), Byte.MAX_VALUE);
    //     assertEqual(Primitives.echoInt16(0.toShort()), 0.toShort());
    //     assertEqual(Primitives.echoInt16(Short.MIN_VALUE), Short.MIN_VALUE);
    //     assertEqual(Primitives.echoInt16(Short.MAX_VALUE), Short.MAX_VALUE);
    //     assertEqual(Primitives.echoInt32(0.toInt()), 0.toInt());
    //     assertEqual(Primitives.echoInt32(Int.MIN_VALUE), Int.MIN_VALUE);
    //     assertEqual(Primitives.echoInt32(Int.MAX_VALUE), Int.MAX_VALUE);
    //     assertEqual(Primitives.echoInt64(0.toLong()), 0.toLong());
    //     assertEqual(Primitives.echoInt64(Long.MIN_VALUE), Long.MIN_VALUE);
    //     assertEqual(Primitives.echoInt64(Long.MAX_VALUE), Long.MAX_VALUE);
    //     assertEqual(Primitives.echoFloat(0.0f), 0.0f);
    //     assertEqual(Primitives.echoFloat(-Float.MAX_VALUE), -Float.MAX_VALUE);
    //     assertEqual(Primitives.echoFloat(Float.MAX_VALUE), Float.MAX_VALUE);
    //     assertEqual(Primitives.echoDouble(0.0), 0.0);
    //     assertEqual(Primitives.echoDouble(-Double.MAX_VALUE), -Double.MAX_VALUE);
    //     assertEqual(Primitives.echoDouble(Double.MAX_VALUE), Double.MAX_VALUE);
    // }

    // function testFunctionsTakingReturningOptionalPrimitiveTypes() {
    //     assertEqual(Primitives.maybeEchoBool(null), null);
    //     assertEqual(Primitives.maybeEchoBool(false), false);
    //     assertEqual(Primitives.maybeEchoBool(true), true);
    //     assertEqual(Primitives.maybeEchoUInt8(null), null);
    //     assertEqual(Primitives.maybeEchoUInt8(0.toUByte()), 0.toUByte());
    //     assertEqual(Primitives.maybeEchoUInt8(UByte.MIN_VALUE), UByte.MIN_VALUE);
    //     assertEqual(Primitives.maybeEchoUInt8(UByte.MAX_VALUE), UByte.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoUInt16(null), null);
    //     assertEqual(Primitives.maybeEchoUInt16(0.toUShort()), 0.toUShort());
    //     assertEqual(Primitives.maybeEchoUInt16(UShort.MIN_VALUE), UShort.MIN_VALUE);
    //     assertEqual(Primitives.maybeEchoUInt16(UShort.MAX_VALUE), UShort.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoUInt32(null), null);
    //     assertEqual(Primitives.maybeEchoUInt32(0.toUInt()), 0.toUInt());
    //     assertEqual(Primitives.maybeEchoUInt32(UInt.MIN_VALUE), UInt.MIN_VALUE);
    //     assertEqual(Primitives.maybeEchoUInt32(UInt.MAX_VALUE), UInt.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoUInt64(null), null);
    //     assertEqual(Primitives.maybeEchoUInt64(0.toULong()), 0.toULong());
    //     assertEqual(Primitives.maybeEchoUInt64(ULong.MIN_VALUE), ULong.MIN_VALUE);
    //     assertEqual(Primitives.maybeEchoUInt64(ULong.MAX_VALUE), ULong.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoInt8(null), null);
    //     assertEqual(Primitives.maybeEchoInt8(0.toByte()), 0.toByte());
    //     assertEqual(Primitives.maybeEchoInt8(Byte.MIN_VALUE), Byte.MIN_VALUE);
    //     assertEqual(Primitives.maybeEchoInt8(Byte.MAX_VALUE), Byte.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoInt16(null), null);
    //     assertEqual(Primitives.maybeEchoInt16(0.toShort()), 0.toShort());
    //     assertEqual(Primitives.maybeEchoInt16(Short.MIN_VALUE), Short.MIN_VALUE);
    //     assertEqual(Primitives.maybeEchoInt16(Short.MAX_VALUE), Short.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoInt32(null), null);
    //     assertEqual(Primitives.maybeEchoInt32(0.toInt()), 0.toInt());
    //     assertEqual(Primitives.maybeEchoInt32(Int.MIN_VALUE), Int.MIN_VALUE);
    //     assertEqual(Primitives.maybeEchoInt32(Int.MAX_VALUE), Int.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoInt64(null), null);
    //     assertEqual(Primitives.maybeEchoInt64(0.toLong()), 0.toLong());
    //     assertEqual(Primitives.maybeEchoInt64(Long.MIN_VALUE), Long.MIN_VALUE);
    //     assertEqual(Primitives.maybeEchoInt64(Long.MAX_VALUE), Long.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoFloat(null), null);
    //     assertEqual(Primitives.maybeEchoFloat(0.0f), 0.0f);
    //     assertEqual(Primitives.maybeEchoFloat(-Float.MAX_VALUE), -Float.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoFloat(Float.MAX_VALUE), Float.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoDouble(null), null);
    //     assertEqual(Primitives.maybeEchoDouble(0.0), 0.0);
    //     assertEqual(Primitives.maybeEchoDouble(-Double.MAX_VALUE), -Double.MAX_VALUE);
    //     assertEqual(Primitives.maybeEchoDouble(Double.MAX_VALUE), Double.MAX_VALUE);
    // }

    function testFunctionsTakingClosuresWithPrimitiveTypes() {
        // TODO: Fix breakage
//        assertEqual(Primitives.valueMapper(10) { (it ?: 0) * 2 }, 20);
    }

    // function testObjectsWithPrimitiveMembers() {
    //     assertEqual(Primitives.PrimitiveHolder.staticPropery, [null, 0.toUByte(), UByte.MIN_VALUE, UByte.MAX_VALUE]);
    //     assertEqual(Primitives.PrimitiveHolder.staticMutablePropery, [null, 0.toUByte(), UByte.MIN_VALUE, UByte.MAX_VALUE]);
    //     Primitives.PrimitiveHolder.staticMutablePropery = [100.toUByte(), 200.toUByte(]);
    //     assertEqual(Primitives.PrimitiveHolder.staticMutablePropery, [100.toUByte(), 200.toUByte()]);
    //     val s = Primitives.defaultPrimitiveHolder;
    //     assertEqual(s, Primitives.defaultPrimitiveHolder);
    //     s.b = !s.b
    //     if (s, Primitives.defaultPrimitiveHolder);
    // }
})
