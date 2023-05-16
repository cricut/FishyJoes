import { TestAPI } from 'TestAPI';

test('PrimitiveValues', () => {
    expect(TestAPI.Primitives.falseBool).toEqual(false);
    expect(TestAPI.Primitives.trueBool).toEqual(true);
    expect(TestAPI.Primitives.zeroUInt8).toEqual(0);
    expect(TestAPI.Primitives.minUInt8).toEqual(0x00);
    expect(TestAPI.Primitives.maxUInt8).toEqual(0xFF);
    expect(TestAPI.Primitives.zeroUInt16).toEqual(0);
    expect(TestAPI.Primitives.minUInt16).toEqual(0x0000);
    expect(TestAPI.Primitives.maxUInt16).toEqual(0xFFFF);
    expect(TestAPI.Primitives.zeroUInt32).toEqual(0);
    expect(TestAPI.Primitives.minUInt32).toEqual(0x00000000);
    expect(TestAPI.Primitives.maxUInt32).toEqual(0xFFFFFFFF);
    expect(TestAPI.Primitives.zeroUInt64).toEqual(BigInt("0"));
    expect(TestAPI.Primitives.minUInt64).toEqual(BigInt("0x0000000000000000"));
    expect(TestAPI.Primitives.maxUInt64).toEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    if (TestAPI.Primitives.bitCountUInt < 64) {
        expect(TestAPI.Primitives.zeroUInt).toEqual(BigInt("0"));
        expect(TestAPI.Primitives.minUInt).toEqual(BigInt("0x00000000"));
        expect(TestAPI.Primitives.maxUInt).toEqual(BigInt("0xFFFFFFFF"));
    } else {
        expect(TestAPI.Primitives.zeroUInt).toEqual(BigInt("0"));
        expect(TestAPI.Primitives.minUInt).toEqual(BigInt("0x0000000000000000"));
        expect(TestAPI.Primitives.maxUInt).toEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    }
    expect(TestAPI.Primitives.zeroInt8).toEqual(0);
    expect(TestAPI.Primitives.minInt8).toEqual(-0x80);
    expect(TestAPI.Primitives.maxInt8).toEqual(0x7F);
    expect(TestAPI.Primitives.zeroInt16).toEqual(0);
    expect(TestAPI.Primitives.minInt16).toEqual(-0x8000);
    expect(TestAPI.Primitives.maxInt16).toEqual(0x7FFF);
    expect(TestAPI.Primitives.zeroInt32).toEqual(0);
    expect(TestAPI.Primitives.minInt32).toEqual(-0x80000000);
    expect(TestAPI.Primitives.maxInt32).toEqual(0x7FFFFFFF);
    expect(TestAPI.Primitives.zeroInt64).toEqual(BigInt("0"));
    expect(TestAPI.Primitives.minInt64).toEqual(-BigInt("0x8000000000000000"));
    expect(TestAPI.Primitives.maxInt64).toEqual(BigInt("0x7FFFFFFFFFFFFFFF"));
    if (TestAPI.Primitives.bitCountInt < 64) {
        expect(TestAPI.Primitives.zeroInt).toEqual(0);
        expect(TestAPI.Primitives.minInt).toEqual(-0x80000000);
        expect(TestAPI.Primitives.maxInt).toEqual(0x7FFFFFFF);
    } else {
        expect(TestAPI.Primitives.zeroInt).toEqual(0);
        expect(TestAPI.Primitives.minInt).toEqual(-0x8000000000000000);
        expect(TestAPI.Primitives.maxInt).toEqual(0x7FFFFFFFFFFFFFFF);
    }
    expect(TestAPI.Primitives.zeroFloat).toEqual(0.0);
    expect(TestAPI.Primitives.minFloat).toEqual(-3.4028234663852886e+38);
    expect(TestAPI.Primitives.maxFloat).toEqual(3.4028234663852886e+38);
    expect(TestAPI.Primitives.zeroDouble).toEqual(0.0);
    expect(TestAPI.Primitives.minDouble).toEqual(-Number.MAX_VALUE);
    expect(TestAPI.Primitives.maxDouble).toEqual(Number.MAX_VALUE);
});

test('ArraysOfPrimitiveValues', () => {
    expect(TestAPI.Primitives.manyBool).toEqual([false, true])
    expect(TestAPI.Primitives.manyUInt8).toEqual([0, 0x00, 0xFF]);
    expect(TestAPI.Primitives.manyUInt16).toEqual([0, 0x0000, 0xFFFF]);
    expect(TestAPI.Primitives.manyUInt32).toEqual([0, 0x00000000, 0xFFFFFFFF]);
    expect(TestAPI.Primitives.manyUInt64).toEqual([BigInt("0"), BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
    if (TestAPI.Primitives.bitCountUInt < 64) {
        expect(TestAPI.Primitives.manyUInt).toEqual([BigInt("0"), BigInt("0x00000000"), BigInt("0xFFFFFFFF")]);
    } else {
        expect(TestAPI.Primitives.manyUInt).toEqual([BigInt("0"), BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
    }
    expect(TestAPI.Primitives.manyInt8).toEqual([0, -0x80, 0x7F]);
    expect(TestAPI.Primitives.manyInt16).toEqual([0, -0x8000, 0x7FFF]);
    expect(TestAPI.Primitives.manyInt32).toEqual([0, -0x80000000, 0x7FFFFFFF]);
    expect(TestAPI.Primitives.manyInt64).toEqual([BigInt("0"), -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
    if (TestAPI.Primitives.bitCountInt < 64) {
        expect(TestAPI.Primitives.manyInt).toEqual([0, -0x80000000, 0x7FFFFFFF]);
    } else {
        expect(TestAPI.Primitives.manyInt).toEqual([0, -0x8000000000000000, 0x7FFFFFFFFFFFFFFF]);
    }
    expect(TestAPI.Primitives.manyFloat).toEqual([0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
    expect(TestAPI.Primitives.manyDouble).toEqual([0, -Number.MAX_VALUE, Number.MAX_VALUE]);
});

test('ArraysOfOptionalPrimitiveValues', () => {
    expect(TestAPI.Primitives.manyMaybeBool).toEqual([undefined, false, true]);
    expect(TestAPI.Primitives.manyMaybeUInt8).toEqual([undefined, 0, 0x00, 0xFF]);
    expect(TestAPI.Primitives.manyMaybeUInt16).toEqual([undefined, 0, 0x0000, 0xFFFF]);
    expect(TestAPI.Primitives.manyMaybeUInt32).toEqual([undefined, 0, 0x00000000, 0xFFFFFFFF]);
    expect(TestAPI.Primitives.manyMaybeUInt64).toEqual([undefined, BigInt("0"), BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
    if (TestAPI.Primitives.bitCountUInt < 64) {
        expect(TestAPI.Primitives.manyMaybeUInt).toEqual([undefined, BigInt("0"), BigInt("0x00000000"), BigInt("0xFFFFFFFF")]);
    } else {
        expect(TestAPI.Primitives.manyMaybeUInt).toEqual([undefined, BigInt("0"), BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
    }
    expect(TestAPI.Primitives.manyMaybeInt8).toEqual([undefined, 0, -0x80, 0x7F]);
    expect(TestAPI.Primitives.manyMaybeInt16).toEqual([undefined, 0, -0x8000, 0x7FFF]);
    expect(TestAPI.Primitives.manyMaybeInt32).toEqual([undefined, 0, -0x80000000, 0x7FFFFFFF]);
    expect(TestAPI.Primitives.manyMaybeInt64).toEqual([undefined, BigInt("0"), -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
    if (TestAPI.Primitives.bitCountInt < 64) {
        expect(TestAPI.Primitives.manyMaybeInt).toEqual([undefined, 0, -0x80000000, 0x7FFFFFFF]);
    } else {
        expect(TestAPI.Primitives.manyMaybeInt).toEqual([undefined, 0, -0x8000000000000000, 0x7FFFFFFFFFFFFFFF]);
    }
    expect(TestAPI.Primitives.manyMaybeFloat).toEqual([undefined, 0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
    expect(TestAPI.Primitives.manyMaybeDouble).toEqual([undefined, 0, -Number.MAX_VALUE, Number.MAX_VALUE]);
});

test('FunctionsTakingAndReturningPrimitiveTypes', () => {
    expect(TestAPI.Primitives.echoBool(false)).toEqual(false);
    expect(TestAPI.Primitives.echoBool(true)).toEqual(true);
    expect(TestAPI.Primitives.echoUInt8(0)).toEqual(0);
    expect(TestAPI.Primitives.echoUInt8(0x00)).toEqual(0x00);
    expect(TestAPI.Primitives.echoUInt8(0xFF)).toEqual(0xFF);
    expect(TestAPI.Primitives.echoUInt16(0)).toEqual(0);
    expect(TestAPI.Primitives.echoUInt16(0x0000)).toEqual(0x0000);
    expect(TestAPI.Primitives.echoUInt16(0xFFFF)).toEqual(0xFFFF);
    expect(TestAPI.Primitives.echoUInt32(0)).toEqual(0);
    expect(TestAPI.Primitives.echoUInt32(0x00000000)).toEqual(0x00000000);
    expect(TestAPI.Primitives.echoUInt32(0xFFFFFFFF)).toEqual(0xFFFFFFFF);
    expect(TestAPI.Primitives.echoUInt64(BigInt(0))).toEqual(BigInt(0));
    expect(TestAPI.Primitives.echoUInt64(BigInt("0x0000000000000000"))).toEqual(BigInt("0x0000000000000000"));
    expect(TestAPI.Primitives.echoUInt64(BigInt("0xFFFFFFFFFFFFFFFF"))).toEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    if (TestAPI.Primitives.bitCountUInt < 64) {
        expect(TestAPI.Primitives.echoUInt(BigInt(0))).toEqual(BigInt(0));
        expect(TestAPI.Primitives.echoUInt(BigInt("0x00000000"))).toEqual(BigInt("0x00000000"));
        expect(TestAPI.Primitives.echoUInt(BigInt("0xFFFFFFFF"))).toEqual(BigInt("0xFFFFFFFF"));
    } else {
        expect(TestAPI.Primitives.echoUInt(BigInt(0))).toEqual(BigInt(0));
        expect(TestAPI.Primitives.echoUInt(BigInt("0x0000000000000000"))).toEqual(BigInt("0x0000000000000000"));
        expect(TestAPI.Primitives.echoUInt(BigInt("0xFFFFFFFFFFFFFFFF"))).toEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    }
    expect(TestAPI.Primitives.echoInt8(0)).toEqual(0);
    expect(TestAPI.Primitives.echoInt8(-0x80)).toEqual(-0x80);
    expect(TestAPI.Primitives.echoInt8(0x7F)).toEqual(0x7F);
    expect(TestAPI.Primitives.echoInt16(0)).toEqual(0);
    expect(TestAPI.Primitives.echoInt16(-0x8000)).toEqual(-0x8000);
    expect(TestAPI.Primitives.echoInt16(0x7FFF)).toEqual(0x7FFF);
    expect(TestAPI.Primitives.echoInt32(0)).toEqual(0);
    expect(TestAPI.Primitives.echoInt32(-0x80000000)).toEqual(-0x80000000);
    expect(TestAPI.Primitives.echoInt32(0x7FFFFFFF)).toEqual(0x7FFFFFFF);
    expect(TestAPI.Primitives.echoInt64(BigInt(0))).toEqual(BigInt(0));
    expect(TestAPI.Primitives.echoInt64(-BigInt("0x8000000000000000"))).toEqual(-BigInt("0x8000000000000000"));
    expect(TestAPI.Primitives.echoInt64(BigInt("0x7FFFFFFFFFFFFFFF"))).toEqual(BigInt("0x7FFFFFFFFFFFFFFF"));
    if (TestAPI.Primitives.bitCountInt < 64) {
        expect(TestAPI.Primitives.echoInt(0)).toEqual(0);
        expect(TestAPI.Primitives.echoInt(-0x80000000)).toEqual(-0x80000000);
        expect(TestAPI.Primitives.echoInt(0x7FFFFFFF)).toEqual(0x7FFFFFFF);
    } else {
        expect(TestAPI.Primitives.echoInt(0)).toEqual(0);
        expect(TestAPI.Primitives.echoInt(-0x8000000000000000)).toEqual(-0x8000000000000000);
        expect(TestAPI.Primitives.echoInt(0x7FFFFFFFFFFFFFFF)).toEqual(0x7FFFFFFFFFFFFFFF);
    }
    expect(TestAPI.Primitives.echoFloat(0.0)).toEqual(0.0);
    expect(TestAPI.Primitives.echoFloat(-3.4028234663852886e+38)).toEqual(-3.4028234663852886e+38);
    expect(TestAPI.Primitives.echoFloat(3.4028234663852886e+38)).toEqual(3.4028234663852886e+38);
    expect(TestAPI.Primitives.echoDouble(0.0)).toEqual(0.0);
    expect(TestAPI.Primitives.echoDouble(-Number.MAX_VALUE)).toEqual(-Number.MAX_VALUE);
    expect(TestAPI.Primitives.echoDouble(Number.MAX_VALUE)).toEqual(Number.MAX_VALUE);
});

test('FunctionsTakingReturningOptionalPrimitiveTypes', () => {
    expect(TestAPI.Primitives.maybeEchoBool(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoBool(false)).toEqual(false);
    expect(TestAPI.Primitives.maybeEchoBool(true)).toEqual(true);
    expect(TestAPI.Primitives.maybeEchoUInt8(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoUInt8(0)).toEqual(0);
    expect(TestAPI.Primitives.maybeEchoUInt8(0x00)).toEqual(0x00);
    expect(TestAPI.Primitives.maybeEchoUInt8(0xFF)).toEqual(0xFF);
    expect(TestAPI.Primitives.maybeEchoUInt16(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoUInt16(0)).toEqual(0);
    expect(TestAPI.Primitives.maybeEchoUInt16(0x0000)).toEqual(0x0000);
    expect(TestAPI.Primitives.maybeEchoUInt16(0xFFFF)).toEqual(0xFFFF);
    expect(TestAPI.Primitives.maybeEchoUInt32(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoUInt32(0)).toEqual(0);
    expect(TestAPI.Primitives.maybeEchoUInt32(0x00000000)).toEqual(0x00000000);
    expect(TestAPI.Primitives.maybeEchoUInt32(0xFFFFFFFF)).toEqual(0xFFFFFFFF);
    expect(TestAPI.Primitives.maybeEchoUInt64(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoUInt64(BigInt(0))).toEqual(BigInt(0));
    expect(TestAPI.Primitives.maybeEchoUInt64(BigInt("0x0000000000000000"))).toEqual(BigInt("0x0000000000000000"));
    expect(TestAPI.Primitives.maybeEchoUInt64(BigInt("0xFFFFFFFFFFFFFFFF"))).toEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    if (TestAPI.Primitives.bitCountUInt < 64) {
        expect(TestAPI.Primitives.maybeEchoUInt(BigInt(0))).toEqual(BigInt(0));
        expect(TestAPI.Primitives.maybeEchoUInt(BigInt("0x00000000"))).toEqual(BigInt("0x00000000"));
        expect(TestAPI.Primitives.maybeEchoUInt(BigInt("0xFFFFFFFF"))).toEqual(BigInt("0xFFFFFFFF"));
    } else {
        expect(TestAPI.Primitives.maybeEchoUInt(BigInt(0))).toEqual(BigInt(0));
        expect(TestAPI.Primitives.maybeEchoUInt(BigInt("0x0000000000000000"))).toEqual(BigInt("0x0000000000000000"));
        expect(TestAPI.Primitives.maybeEchoUInt(BigInt("0xFFFFFFFFFFFFFFFF"))).toEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    }
    expect(TestAPI.Primitives.maybeEchoInt8(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoInt8(0)).toEqual(0);
    expect(TestAPI.Primitives.maybeEchoInt8(-0x80)).toEqual(-0x80);
    expect(TestAPI.Primitives.maybeEchoInt8(0x7F)).toEqual(0x7F);
    expect(TestAPI.Primitives.maybeEchoInt16(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoInt16(0)).toEqual(0);
    expect(TestAPI.Primitives.maybeEchoInt16(-0x8000)).toEqual(-0x8000);
    expect(TestAPI.Primitives.maybeEchoInt16(0x7FFF)).toEqual(0x7FFF);
    expect(TestAPI.Primitives.maybeEchoInt32(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoInt32(0)).toEqual(0);
    expect(TestAPI.Primitives.maybeEchoInt32(-0x80000000)).toEqual(-0x80000000);
    expect(TestAPI.Primitives.maybeEchoInt32(0x7FFFFFFF)).toEqual(0x7FFFFFFF);
    expect(TestAPI.Primitives.maybeEchoInt64(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoInt64(BigInt(0))).toEqual(BigInt(0));
    expect(TestAPI.Primitives.maybeEchoInt64(-BigInt("0x8000000000000000"))).toEqual(-BigInt("0x8000000000000000"));
    expect(TestAPI.Primitives.maybeEchoInt64(BigInt("0x7FFFFFFFFFFFFFFF"))).toEqual(BigInt("0x7FFFFFFFFFFFFFFF"));
    if (TestAPI.Primitives.bitCountInt < 64) {
        expect(TestAPI.Primitives.maybeEchoInt(0)).toEqual(0);
        expect(TestAPI.Primitives.maybeEchoInt(-0x80000000)).toEqual(-0x80000000);
        expect(TestAPI.Primitives.maybeEchoInt(0x7FFFFFFF)).toEqual(0x7FFFFFFF);
    } else {
        expect(TestAPI.Primitives.maybeEchoInt(0)).toEqual(0);
        expect(TestAPI.Primitives.maybeEchoInt(-0x8000000000000000)).toEqual(-0x8000000000000000);
        expect(TestAPI.Primitives.maybeEchoInt(0x7FFFFFFFFFFFFFFF)).toEqual(0x7FFFFFFFFFFFFFFF);
    }
    expect(TestAPI.Primitives.maybeEchoFloat(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoFloat(0.0)).toEqual(0.0);
    expect(TestAPI.Primitives.maybeEchoFloat(-3.4028234663852886e+38)).toEqual(-3.4028234663852886e+38);
    expect(TestAPI.Primitives.maybeEchoFloat(3.4028234663852886e+38)).toEqual(3.4028234663852886e+38);
    expect(TestAPI.Primitives.maybeEchoDouble(undefined)).toEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoDouble(0.0)).toEqual(0.0);
    expect(TestAPI.Primitives.maybeEchoDouble(-Number.MAX_VALUE)).toEqual(-Number.MAX_VALUE);
    expect(TestAPI.Primitives.maybeEchoDouble(Number.MAX_VALUE)).toEqual(Number.MAX_VALUE);
});

test('FunctionsTakingClosuresWithPrimitiveTypes', () => {
    // TODO: Fix breakage
    //expect(TestAPI.Primitives.valueMapper(10) { (it || 0) * 2 }).toEqual(20);
});

test('ObjectsWithPrimitiveMembers', () => {
    expect(TestAPI.Primitives.PrimitiveHolder.staticPropery).toEqual([undefined, 0, 0x00, 0xFF]);
    expect(TestAPI.Primitives.PrimitiveHolder.staticMutablePropery).toEqual([undefined, 0, 0x00, 0xFF]);
    TestAPI.Primitives.PrimitiveHolder.staticMutablePropery = [100, 200];
    expect(TestAPI.Primitives.PrimitiveHolder.staticMutablePropery).toEqual([100, 200]);
    let s = TestAPI.Primitives.defaultPrimitiveHolder;
    expect(s).toEqual(TestAPI.Primitives.defaultPrimitiveHolder);
    s.b = !s.b
    expect(s).not.toEqual(TestAPI.Primitives.defaultPrimitiveHolder);
});
