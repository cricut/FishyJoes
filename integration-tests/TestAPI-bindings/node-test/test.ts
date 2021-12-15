import(`${MODULE_PATH}/TestAPI.js`).then(({ TestAPI }) => {
    // Testing Utilities
    function assertEqual<T>(value: T, expected: T) {
        console.assert(value == expected, value + " was expected to be " + expected)
    }

    function assertArraysEqual<T>(array: Array<T>, expected: Array<T>) {
        console.assert(array.length == expected.length, array.every(function(e, i) { return e === expected[i] }), array + " was expected to be " + expected)
    }

    // Tests

    function testPrimitiveValues() {
        console.log("Testing Primitive Values...")
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

    function testArraysOfPrimitiveValues() {
        console.log("Testing Arrays of Primitive Values...")
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

    function testArraysOfOptionalPrimitiveValues() {
        console.log("Testing Arrays of Optional Primitive Values...")
        assertArraysEqual(TestAPI.Primitives.manyMaybeBool, [undefined, false, true]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeUInt8, [undefined, 0, 0x00, 0xFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeUInt16, [undefined, 0, 0x0000, 0xFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeUInt32, [undefined, 0, 0x00000000, 0xFFFFFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeUInt64, [undefined, 0, BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeInt8, [undefined, 0, -0x80, 0x7F]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeInt16, [undefined, 0, -0x8000, 0x7FFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeInt32, [undefined, 0, -0x80000000, 0x7FFFFFFF]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeInt64, [undefined, 0, -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeFloat, [undefined, 0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
        assertArraysEqual(TestAPI.Primitives.manyMaybeDouble, [undefined, 0, -Number.MAX_VALUE, Number.MAX_VALUE]);
    }
    testArraysOfOptionalPrimitiveValues()

    function testFunctionsTakingAndReturningPrimitiveTypes() {
        console.log("Testing Functions Taking and Returning Primitive Types...")
        assertEqual(TestAPI.Primitives.echoBool(false), false);
        assertEqual(TestAPI.Primitives.echoBool(true), true);
        assertEqual(TestAPI.Primitives.echoUInt8(0), 0);
        assertEqual(TestAPI.Primitives.echoUInt8(0x00), 0x00);
        assertEqual(TestAPI.Primitives.echoUInt8(0xFF), 0xFF);
        assertEqual(TestAPI.Primitives.echoUInt16(0), 0);
        assertEqual(TestAPI.Primitives.echoUInt16(0x0000), 0x0000);
        assertEqual(TestAPI.Primitives.echoUInt16(0xFFFF), 0xFFFF);
        assertEqual(TestAPI.Primitives.echoUInt32(0), 0);
        assertEqual(TestAPI.Primitives.echoUInt32(0x00000000), 0x00000000);
        assertEqual(TestAPI.Primitives.echoUInt32(0xFFFFFFFF), 0xFFFFFFFF);
        assertEqual(TestAPI.Primitives.echoUInt64(BigInt(0)), BigInt(0));
        assertEqual(TestAPI.Primitives.echoUInt64(BigInt("0x0000000000000000")), BigInt("0x0000000000000000"));
        assertEqual(TestAPI.Primitives.echoUInt64(BigInt("0xFFFFFFFFFFFFFFFF")), BigInt("0xFFFFFFFFFFFFFFFF"));
        assertEqual(TestAPI.Primitives.echoInt8(0), 0);
        assertEqual(TestAPI.Primitives.echoInt8(-0x80), -0x80);
        assertEqual(TestAPI.Primitives.echoInt8(0x7F), 0x7F);
        assertEqual(TestAPI.Primitives.echoInt16(0), 0);
        assertEqual(TestAPI.Primitives.echoInt16(-0x8000), -0x8000);
        assertEqual(TestAPI.Primitives.echoInt16(0x7FFF), 0x7FFF);
        assertEqual(TestAPI.Primitives.echoInt32(0), 0);
        assertEqual(TestAPI.Primitives.echoInt32(-0x80000000), -0x80000000);
        assertEqual(TestAPI.Primitives.echoInt32(0x7FFFFFFF), 0x7FFFFFFF);
        assertEqual(TestAPI.Primitives.echoInt64(BigInt(0)), BigInt(0));
        assertEqual(TestAPI.Primitives.echoInt64(-BigInt("0x8000000000000000")), -BigInt("0x8000000000000000"));
        assertEqual(TestAPI.Primitives.echoInt64(BigInt("0x7FFFFFFFFFFFFFFF")), BigInt("0x7FFFFFFFFFFFFFFF"));
        assertEqual(TestAPI.Primitives.echoFloat(0.0), 0.0);
        assertEqual(TestAPI.Primitives.echoFloat(-3.4028234663852886e+38), -3.4028234663852886e+38);
        assertEqual(TestAPI.Primitives.echoFloat(3.4028234663852886e+38), 3.4028234663852886e+38);
        assertEqual(TestAPI.Primitives.echoDouble(0.0), 0.0);
        assertEqual(TestAPI.Primitives.echoDouble(-Number.MAX_VALUE), -Number.MAX_VALUE);
        assertEqual(TestAPI.Primitives.echoDouble(Number.MAX_VALUE), Number.MAX_VALUE);
    }
    testFunctionsTakingAndReturningPrimitiveTypes()

    function testFunctionsTakingReturningOptionalPrimitiveTypes() {
        console.log("Testing Functions Taking and Returning Optional Primitive Types...")
        assertEqual(TestAPI.Primitives.maybeEchoBool(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoBool(false), false);
        assertEqual(TestAPI.Primitives.maybeEchoBool(true), true);
        assertEqual(TestAPI.Primitives.maybeEchoUInt8(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoUInt8(0), 0);
        assertEqual(TestAPI.Primitives.maybeEchoUInt8(0x00), 0x00);
        assertEqual(TestAPI.Primitives.maybeEchoUInt8(0xFF), 0xFF);
        assertEqual(TestAPI.Primitives.maybeEchoUInt16(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoUInt16(0), 0);
        assertEqual(TestAPI.Primitives.maybeEchoUInt16(0x0000), 0x0000);
        assertEqual(TestAPI.Primitives.maybeEchoUInt16(0xFFFF), 0xFFFF);
        assertEqual(TestAPI.Primitives.maybeEchoUInt32(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoUInt32(0), 0);
        assertEqual(TestAPI.Primitives.maybeEchoUInt32(0x00000000), 0x00000000);
        assertEqual(TestAPI.Primitives.maybeEchoUInt32(0xFFFFFFFF), 0xFFFFFFFF);
        assertEqual(TestAPI.Primitives.maybeEchoUInt64(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoUInt64(BigInt(0)), BigInt(0));
        assertEqual(TestAPI.Primitives.maybeEchoUInt64(BigInt("0x0000000000000000")), BigInt("0x0000000000000000"));
        assertEqual(TestAPI.Primitives.maybeEchoUInt64(BigInt("0xFFFFFFFFFFFFFFFF")), BigInt("0xFFFFFFFFFFFFFFFF"));
        assertEqual(TestAPI.Primitives.maybeEchoInt8(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoInt8(0), 0);
        assertEqual(TestAPI.Primitives.maybeEchoInt8(-0x80), -0x80);
        assertEqual(TestAPI.Primitives.maybeEchoInt8(0x7F), 0x7F);
        assertEqual(TestAPI.Primitives.maybeEchoInt16(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoInt16(0), 0);
        assertEqual(TestAPI.Primitives.maybeEchoInt16(-0x8000), -0x8000);
        assertEqual(TestAPI.Primitives.maybeEchoInt16(0x7FFF), 0x7FFF);
        assertEqual(TestAPI.Primitives.maybeEchoInt32(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoInt32(0), 0);
        assertEqual(TestAPI.Primitives.maybeEchoInt32(-0x80000000), -0x80000000);
        assertEqual(TestAPI.Primitives.maybeEchoInt32(0x7FFFFFFF), 0x7FFFFFFF);
        assertEqual(TestAPI.Primitives.maybeEchoInt64(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoInt64(BigInt(0)), BigInt(0));
        assertEqual(TestAPI.Primitives.maybeEchoInt64(-BigInt("0x8000000000000000")), -BigInt("0x8000000000000000"));
        assertEqual(TestAPI.Primitives.maybeEchoInt64(BigInt("0x7FFFFFFFFFFFFFFF")), BigInt("0x7FFFFFFFFFFFFFFF"));
        assertEqual(TestAPI.Primitives.maybeEchoFloat(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoFloat(0.0), 0.0);
        assertEqual(TestAPI.Primitives.maybeEchoFloat(-3.4028234663852886e+38), -3.4028234663852886e+38);
        assertEqual(TestAPI.Primitives.maybeEchoFloat(3.4028234663852886e+38), 3.4028234663852886e+38);
        assertEqual(TestAPI.Primitives.maybeEchoDouble(undefined), undefined);
        assertEqual(TestAPI.Primitives.maybeEchoDouble(0.0), 0.0);
        assertEqual(TestAPI.Primitives.maybeEchoDouble(-Number.MAX_VALUE), -Number.MAX_VALUE);
        assertEqual(TestAPI.Primitives.maybeEchoDouble(Number.MAX_VALUE), Number.MAX_VALUE);
    }
    testFunctionsTakingReturningOptionalPrimitiveTypes()
    
    function testFunctionsTakingClosuresWithPrimitiveTypes() {
        // TODO: Fix breakage
//        assertEqual(TestAPI.Primitives.valueMapper(10) { (it ?: 0) * 2 }, 20);
    }

    // function testObjectsWithPrimitiveMembers() {
    //     assertEqual(TestAPI.Primitives.PrimitiveHolder.staticPropery, [undefined, 0, U-0x80, U0x7F]);
    //     assertEqual(TestAPI.Primitives.PrimitiveHolder.staticMutablePropery, [undefined, 0, U-0x80, U0x7F]);
    //     TestAPI.Primitives.PrimitiveHolder.staticMutablePropery = [100, 200.toUByte(]);
    //     assertEqual(TestAPI.Primitives.PrimitiveHolder.staticMutablePropery, [100, 200]);
    //     val s = TestAPI.Primitives.defaultPrimitiveHolder;
    //     assertEqual(s, TestAPI.Primitives.defaultPrimitiveHolder);
    //     s.b = !s.b
    //     if (s, TestAPI.Primitives.defaultPrimitiveHolder);
    // }
})
