import { strict as assert } from 'assert';

import(`${MODULE_PATH}/TestAPI.js`).then(({ TestAPI }) => {

    // Primitive Tests

    function testPrimitiveValues() {
        console.log("Testing Primitive Values...")
        assert.equal(TestAPI.Primitives.falseBool, false);
        assert.equal(TestAPI.Primitives.trueBool, true);
        assert.equal(TestAPI.Primitives.zeroUInt8, 0);
        assert.equal(TestAPI.Primitives.minUInt8, 0x00);
        assert.equal(TestAPI.Primitives.maxUInt8, 0xFF);
        assert.equal(TestAPI.Primitives.zeroUInt16, 0);
        assert.equal(TestAPI.Primitives.minUInt16, 0x0000);
        assert.equal(TestAPI.Primitives.maxUInt16, 0xFFFF);
        assert.equal(TestAPI.Primitives.zeroUInt32, 0);
        assert.equal(TestAPI.Primitives.minUInt32, 0x00000000);
        assert.equal(TestAPI.Primitives.maxUInt32, 0xFFFFFFFF);
        assert.equal(TestAPI.Primitives.zeroUInt64, BigInt("0"));
        assert.equal(TestAPI.Primitives.minUInt64, BigInt("0x0000000000000000"));
        assert.equal(TestAPI.Primitives.maxUInt64, BigInt("0xFFFFFFFFFFFFFFFF"));
        assert.equal(TestAPI.Primitives.zeroInt8, 0);
        assert.equal(TestAPI.Primitives.minInt8, -0x80);
        assert.equal(TestAPI.Primitives.maxInt8, 0x7F);
        assert.equal(TestAPI.Primitives.zeroInt16, 0);
        assert.equal(TestAPI.Primitives.minInt16, -0x8000);
        assert.equal(TestAPI.Primitives.maxInt16, 0x7FFF);
        assert.equal(TestAPI.Primitives.zeroInt32, 0);
        assert.equal(TestAPI.Primitives.minInt32, -0x80000000);
        assert.equal(TestAPI.Primitives.maxInt32, 0x7FFFFFFF);
        assert.equal(TestAPI.Primitives.zeroInt64, BigInt("0"));
        assert.equal(TestAPI.Primitives.minInt64, -BigInt("0x8000000000000000"));
        assert.equal(TestAPI.Primitives.maxInt64, BigInt("0x7FFFFFFFFFFFFFFF"));
        assert.equal(TestAPI.Primitives.zeroFloat, 0.0);
        assert.equal(TestAPI.Primitives.minFloat, -3.4028234663852886e+38);
        assert.equal(TestAPI.Primitives.maxFloat, 3.4028234663852886e+38);
        assert.equal(TestAPI.Primitives.zeroDouble, 0.0);
        assert.equal(TestAPI.Primitives.minDouble, -Number.MAX_VALUE);
        assert.equal(TestAPI.Primitives.maxDouble, Number.MAX_VALUE);
    }
    testPrimitiveValues()

    function testArraysOfPrimitiveValues() {
        console.log("Testing Arrays of Primitive Values...")
        assert.deepEqual(TestAPI.Primitives.manyBool, [false, true])
        assert.deepEqual(TestAPI.Primitives.manyUInt8, [0, 0x00, 0xFF]);
        assert.deepEqual(TestAPI.Primitives.manyUInt16, [0, 0x0000, 0xFFFF]);
        assert.deepEqual(TestAPI.Primitives.manyUInt32, [0, 0x00000000, 0xFFFFFFFF]);
        assert.deepEqual(TestAPI.Primitives.manyUInt64, [BigInt("0"), BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
        assert.deepEqual(TestAPI.Primitives.manyInt8, [0, -0x80, 0x7F]);
        assert.deepEqual(TestAPI.Primitives.manyInt16, [0, -0x8000, 0x7FFF]);
        assert.deepEqual(TestAPI.Primitives.manyInt32, [0, -0x80000000, 0x7FFFFFFF]);
        assert.deepEqual(TestAPI.Primitives.manyInt64, [BigInt("0"), -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
        assert.deepEqual(TestAPI.Primitives.manyFloat, [0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
        assert.deepEqual(TestAPI.Primitives.manyDouble, [0, -Number.MAX_VALUE, Number.MAX_VALUE]);
    }
    testArraysOfPrimitiveValues()

    function testArraysOfOptionalPrimitiveValues() {
        console.log("Testing Arrays of Optional Primitive Values...")
        assert.deepEqual(TestAPI.Primitives.manyMaybeBool, [undefined, false, true]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeUInt8, [undefined, 0, 0x00, 0xFF]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeUInt16, [undefined, 0, 0x0000, 0xFFFF]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeUInt32, [undefined, 0, 0x00000000, 0xFFFFFFFF]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeUInt64, [undefined, BigInt("0"), BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeInt8, [undefined, 0, -0x80, 0x7F]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeInt16, [undefined, 0, -0x8000, 0x7FFF]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeInt32, [undefined, 0, -0x80000000, 0x7FFFFFFF]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeInt64, [undefined, BigInt("0"), -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeFloat, [undefined, 0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
        assert.deepEqual(TestAPI.Primitives.manyMaybeDouble, [undefined, 0, -Number.MAX_VALUE, Number.MAX_VALUE]);
    }
    testArraysOfOptionalPrimitiveValues()

    function testFunctionsTakingAndReturningPrimitiveTypes() {
        console.log("Testing Functions Taking and Returning Primitive Types...")
        assert.equal(TestAPI.Primitives.echoBool(false), false);
        assert.equal(TestAPI.Primitives.echoBool(true), true);
        assert.equal(TestAPI.Primitives.echoUInt8(0), 0);
        assert.equal(TestAPI.Primitives.echoUInt8(0x00), 0x00);
        assert.equal(TestAPI.Primitives.echoUInt8(0xFF), 0xFF);
        assert.equal(TestAPI.Primitives.echoUInt16(0), 0);
        assert.equal(TestAPI.Primitives.echoUInt16(0x0000), 0x0000);
        assert.equal(TestAPI.Primitives.echoUInt16(0xFFFF), 0xFFFF);
        assert.equal(TestAPI.Primitives.echoUInt32(0), 0);
        assert.equal(TestAPI.Primitives.echoUInt32(0x00000000), 0x00000000);
        assert.equal(TestAPI.Primitives.echoUInt32(0xFFFFFFFF), 0xFFFFFFFF);
        assert.equal(TestAPI.Primitives.echoUInt64(BigInt(0)), BigInt(0));
        assert.equal(TestAPI.Primitives.echoUInt64(BigInt("0x0000000000000000")), BigInt("0x0000000000000000"));
        assert.equal(TestAPI.Primitives.echoUInt64(BigInt("0xFFFFFFFFFFFFFFFF")), BigInt("0xFFFFFFFFFFFFFFFF"));
        assert.equal(TestAPI.Primitives.echoInt8(0), 0);
        assert.equal(TestAPI.Primitives.echoInt8(-0x80), -0x80);
        assert.equal(TestAPI.Primitives.echoInt8(0x7F), 0x7F);
        assert.equal(TestAPI.Primitives.echoInt16(0), 0);
        assert.equal(TestAPI.Primitives.echoInt16(-0x8000), -0x8000);
        assert.equal(TestAPI.Primitives.echoInt16(0x7FFF), 0x7FFF);
        assert.equal(TestAPI.Primitives.echoInt32(0), 0);
        assert.equal(TestAPI.Primitives.echoInt32(-0x80000000), -0x80000000);
        assert.equal(TestAPI.Primitives.echoInt32(0x7FFFFFFF), 0x7FFFFFFF);
        assert.equal(TestAPI.Primitives.echoInt64(BigInt(0)), BigInt(0));
        assert.equal(TestAPI.Primitives.echoInt64(-BigInt("0x8000000000000000")), -BigInt("0x8000000000000000"));
        assert.equal(TestAPI.Primitives.echoInt64(BigInt("0x7FFFFFFFFFFFFFFF")), BigInt("0x7FFFFFFFFFFFFFFF"));
        assert.equal(TestAPI.Primitives.echoFloat(0.0), 0.0);
        assert.equal(TestAPI.Primitives.echoFloat(-3.4028234663852886e+38), -3.4028234663852886e+38);
        assert.equal(TestAPI.Primitives.echoFloat(3.4028234663852886e+38), 3.4028234663852886e+38);
        assert.equal(TestAPI.Primitives.echoDouble(0.0), 0.0);
        assert.equal(TestAPI.Primitives.echoDouble(-Number.MAX_VALUE), -Number.MAX_VALUE);
        assert.equal(TestAPI.Primitives.echoDouble(Number.MAX_VALUE), Number.MAX_VALUE);
    }
    testFunctionsTakingAndReturningPrimitiveTypes()

    function testFunctionsTakingReturningOptionalPrimitiveTypes() {
        console.log("Testing Functions Taking and Returning Optional Primitive Types...")
        assert.equal(TestAPI.Primitives.maybeEchoBool(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoBool(false), false);
        assert.equal(TestAPI.Primitives.maybeEchoBool(true), true);
        assert.equal(TestAPI.Primitives.maybeEchoUInt8(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoUInt8(0), 0);
        assert.equal(TestAPI.Primitives.maybeEchoUInt8(0x00), 0x00);
        assert.equal(TestAPI.Primitives.maybeEchoUInt8(0xFF), 0xFF);
        assert.equal(TestAPI.Primitives.maybeEchoUInt16(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoUInt16(0), 0);
        assert.equal(TestAPI.Primitives.maybeEchoUInt16(0x0000), 0x0000);
        assert.equal(TestAPI.Primitives.maybeEchoUInt16(0xFFFF), 0xFFFF);
        assert.equal(TestAPI.Primitives.maybeEchoUInt32(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoUInt32(0), 0);
        assert.equal(TestAPI.Primitives.maybeEchoUInt32(0x00000000), 0x00000000);
        assert.equal(TestAPI.Primitives.maybeEchoUInt32(0xFFFFFFFF), 0xFFFFFFFF);
        assert.equal(TestAPI.Primitives.maybeEchoUInt64(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoUInt64(BigInt(0)), BigInt(0));
        assert.equal(TestAPI.Primitives.maybeEchoUInt64(BigInt("0x0000000000000000")), BigInt("0x0000000000000000"));
        assert.equal(TestAPI.Primitives.maybeEchoUInt64(BigInt("0xFFFFFFFFFFFFFFFF")), BigInt("0xFFFFFFFFFFFFFFFF"));
        assert.equal(TestAPI.Primitives.maybeEchoInt8(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoInt8(0), 0);
        assert.equal(TestAPI.Primitives.maybeEchoInt8(-0x80), -0x80);
        assert.equal(TestAPI.Primitives.maybeEchoInt8(0x7F), 0x7F);
        assert.equal(TestAPI.Primitives.maybeEchoInt16(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoInt16(0), 0);
        assert.equal(TestAPI.Primitives.maybeEchoInt16(-0x8000), -0x8000);
        assert.equal(TestAPI.Primitives.maybeEchoInt16(0x7FFF), 0x7FFF);
        assert.equal(TestAPI.Primitives.maybeEchoInt32(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoInt32(0), 0);
        assert.equal(TestAPI.Primitives.maybeEchoInt32(-0x80000000), -0x80000000);
        assert.equal(TestAPI.Primitives.maybeEchoInt32(0x7FFFFFFF), 0x7FFFFFFF);
        assert.equal(TestAPI.Primitives.maybeEchoInt64(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoInt64(BigInt(0)), BigInt(0));
        assert.equal(TestAPI.Primitives.maybeEchoInt64(-BigInt("0x8000000000000000")), -BigInt("0x8000000000000000"));
        assert.equal(TestAPI.Primitives.maybeEchoInt64(BigInt("0x7FFFFFFFFFFFFFFF")), BigInt("0x7FFFFFFFFFFFFFFF"));
        assert.equal(TestAPI.Primitives.maybeEchoFloat(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoFloat(0.0), 0.0);
        assert.equal(TestAPI.Primitives.maybeEchoFloat(-3.4028234663852886e+38), -3.4028234663852886e+38);
        assert.equal(TestAPI.Primitives.maybeEchoFloat(3.4028234663852886e+38), 3.4028234663852886e+38);
        assert.equal(TestAPI.Primitives.maybeEchoDouble(undefined), undefined);
        assert.equal(TestAPI.Primitives.maybeEchoDouble(0.0), 0.0);
        assert.equal(TestAPI.Primitives.maybeEchoDouble(-Number.MAX_VALUE), -Number.MAX_VALUE);
        assert.equal(TestAPI.Primitives.maybeEchoDouble(Number.MAX_VALUE), Number.MAX_VALUE);
    }
    testFunctionsTakingReturningOptionalPrimitiveTypes()
    
    function testFunctionsTakingClosuresWithPrimitiveTypes() {
        // TODO: Fix breakage
        // console.log("Testing Functions Taking Closures with Primitive Types...")
        // assert.equal(TestAPI.Primitives.valueMapper(10) { (it ?: 0) * 2 }, 20);
    }
    testFunctionsTakingClosuresWithPrimitiveTypes()

    function testObjectsWithPrimitiveMembers() {
        console.log("Testing Objects with Primitive Members...")
        assert.deepEqual(TestAPI.Primitives.PrimitiveHolder.staticPropery, [undefined, 0, 0x00, 0xFF]);
        assert.deepEqual(TestAPI.Primitives.PrimitiveHolder.staticMutablePropery, [undefined, 0, 0x00, 0xFF]);
        TestAPI.Primitives.PrimitiveHolder.staticMutablePropery = [100, 200];
        assert.deepEqual(TestAPI.Primitives.PrimitiveHolder.staticMutablePropery, [100, 200]);
        let s = TestAPI.Primitives.defaultPrimitiveHolder;
        assert.deepEqual(s, TestAPI.Primitives.defaultPrimitiveHolder);
        s.b = !s.b
        assert.notDeepEqual(s, TestAPI.Primitives.defaultPrimitiveHolder);
    }
    testObjectsWithPrimitiveMembers()

    // String Tests

    function testStringValues() {
        console.log("Testing String Values...")
        assert.equal(TestAPI.Strings.simple, "Hello")
        assert.equal(TestAPI.Strings.accent, "Olá")
        assert.equal(TestAPI.Strings.script, "こんにちは")
        assert.equal(TestAPI.Strings.chinese, "你好")
        assert.equal(TestAPI.Strings.chineseBMP, "豈更車賈滑")
        assert.equal(TestAPI.Strings.chineseSIP, "\u{20001}\u{20002}\u{20003}\u{20004}")
        assert.equal(TestAPI.Strings.emoji, "🤯🐶🍓")
        assert.equal(TestAPI.Strings.emojiMulti, "👨‍👩‍👧‍👦👍🏿🇺🇸")
    }
    testStringValues()

    function testStringEcho() {
        console.log("Testing String Echo...")
        assert.equal(TestAPI.Strings.echo(TestAPI.Strings.simple), TestAPI.Strings.simple)
        assert.equal(TestAPI.Strings.echo(TestAPI.Strings.accent), TestAPI.Strings.accent)
        assert.equal(TestAPI.Strings.echo(TestAPI.Strings.chinese), TestAPI.Strings.chinese)
        assert.equal(TestAPI.Strings.echo(TestAPI.Strings.chineseBMP), TestAPI.Strings.chineseBMP)
        assert.equal(TestAPI.Strings.echo(TestAPI.Strings.chineseSIP), TestAPI.Strings.chineseSIP)
        assert.equal(TestAPI.Strings.echo(TestAPI.Strings.emoji), TestAPI.Strings.emoji)
        assert.equal(TestAPI.Strings.echo(TestAPI.Strings.emojiMulti), TestAPI.Strings.emojiMulti)
    }
    testStringEcho()

    // Bytes Tests

    function testBytesValues() {
        console.log("Testing Bytes Values...")
        assert.deepEqual(TestAPI.Bytes.bytes, [0xDE, 0xAD, 0xBE, 0xEF])
        var buffer = new ArrayBuffer(4)
        var int8View = new Int8Array(buffer)
        int8View[0] = 0x0B
        int8View[1] = 0xAD
        int8View[2] = 0xF0
        int8View[3] = 0x0D
        assert.deepEqual(TestAPI.Bytes.data, buffer)
    }
    testBytesValues()

    function testBytesEcho() {
        console.log("Testing Bytes Echo...")
        assert.deepEqual(TestAPI.Bytes.echoBytes(TestAPI.Bytes.bytes), TestAPI.Bytes.bytes)
        assert.deepEqual(TestAPI.Bytes.echoData(TestAPI.Bytes.data), TestAPI.Bytes.data)
    }
    testBytesEcho()

    // Collection Tests

    function testCollectionValues() {
        console.log("Testing Collection Values...")
        assert.deepEqual(TestAPI.Collections.arrayOfInt, [2,7,3,5,8])
        assert([5,9,2,4,3].reduce(function(r,x){ return r && TestAPI.Collections.setOfInt.has(x); }))
        let map = new Map<number, number>([[1,10],[2,20],[3,30],[4,40],[5,50]])
        assert.deepEqual(TestAPI.Collections.dictionaryOfIntToInt, map)
    }
    testCollectionValues()

    function testOptionalCollectionValues() {
        console.log("Testing Optional Collection Values...")
        assert.deepEqual(TestAPI.Collections.maybeArrayOfInt, [2,7,3,5,8])
        assert([5,9,2,4,3].reduce(function(r,x){ return r && TestAPI.Collections.maybeSetOfInt.has(x); }))
        let map = new Map<number, number>([[1,10],[2,20],[3,30],[4,40],[5,50]])
        assert.deepEqual(TestAPI.Collections.maybeDictionaryOfIntToInt, map)
    }
    testOptionalCollectionValues()

    function testOptionalCollectionOfOptionalValues() {
        console.log("Testing Optional Collection of Optional Values...")
        assert.deepEqual(TestAPI.Collections.maybeArrayOfMaybeInt, [undefined, 2,7,3,5,8])
        // TODO: What happened to the nil value on the Swift side?!?
        assert([5,9,2,4,3].reduce(function(r,x){ return r && TestAPI.Collections.maybeSetOfMaybeInt.has(x); }))
        let map = new Map<number, number>([[undefined,100],[1,10],[2,20],[3,30],[4,40],[5,50]])
        assert.deepEqual(TestAPI.Collections.maybeDictionaryOfMaybeIntToMaybeInt, map)
    }
    testOptionalCollectionOfOptionalValues()

    function testFunctionsTakingAndReturningCollectionTypes() {
        console.log("Testing Functions Taking and Returning Collection Types...")
        assert.deepEqual(TestAPI.Collections.echoArrayOfInt(TestAPI.Collections.arrayOfInt), TestAPI.Collections.arrayOfInt)
        // TODO: Dies with: TODO: implement Swift.Set.static func fromNode(_:env:)
        // assert.deepEqual(TestAPI.Collections.echoSetOfInt(TestAPI.Collections.setOfInt), TestAPI.Collections.setOfInt)
        // TODO: Dies with: TODO: implement Swift.Dictionary.static func fromNode(_:env:)
        // assert.deepEqual(TestAPI.Collections.echoDictionaryOfIntToInt(TestAPI.Collections.dictionaryOfIntToInt), TestAPI.Collections.dictionaryOfIntToInt)
    }
    testFunctionsTakingAndReturningCollectionTypes()

    function testFunctionsTakingAndReturningOptionalCollectionTypes() {
        console.log("Testing Functions Taking and Returning Optional Collection Types...")
        assert.deepEqual(TestAPI.Collections.echoMaybeArrayOfMaybeInt(TestAPI.Collections.maybeArrayOfMaybeInt), TestAPI.Collections.maybeArrayOfMaybeInt)
        // TODO: Dies with: TODO: implement Swift.Set.static func fromNode(_:env:)
        // assert.deepEqual(TestAPI.Collections.echoMaybeSetOfMaybeInt(TestAPI.Collections.maybeSetOfMaybeInt), TestAPI.Collections.maybeSetOfMaybeInt)
        // TODO: Dies with: TODO: implement Swift.Dictionary.static func fromNode(_:env:)
        // assert.deepEqual(TestAPI.Collections.echoMaybeDictionaryOfMaybeIntToMaybeInt(TestAPI.Collections.maybeDictionaryOfMaybeIntToMaybeInt), TestAPI.Collections.maybeDictionaryOfMaybeIntToMaybeInt)
    }
    testFunctionsTakingAndReturningOptionalCollectionTypes()

    function testFunctionsTakingClosuresWithCollectionTypes() {
        // TODO: Fix breakage
        // console.log("Testing Functions Taking Closures with Collection Types...")
        // assert.deepEqual(TestAPI.Collections.collectionMapper(arrayOf(10,20,30)) { (it ?: arrayOf()).map { it * 2 } }, arrayListOf(20,40,60))
    }
    testFunctionsTakingClosuresWithCollectionTypes()

    function testObjectsWithCollectionMembers() {
        console.log("Testing Objects with Collection Members...")
        assert.deepEqual(TestAPI.Collections.CollectionHolder.staticPropery, [undefined,2,7,3,5,8]);
        assert.deepEqual(TestAPI.Collections.CollectionHolder.staticMutablePropery, [undefined,2,7,3,5,8]);
        TestAPI.Collections.CollectionHolder.staticMutablePropery = [100,undefined,200];
        assert.deepEqual(TestAPI.Collections.CollectionHolder.staticMutablePropery, [100,undefined,200]);
        let s = TestAPI.Collections.defaultCollectionHolder;
        assert.deepEqual(s, TestAPI.Collections.defaultCollectionHolder);
        var map = new Map<boolean,boolean>()
        s.boolDictionary.forEach((value: boolean, key: boolean) => {
            map.set(key, !value);
        });
        s.boolDictionary = map
        assert.notDeepEqual(s, TestAPI.Collections.defaultCollectionHolder);
    }
    testObjectsWithCollectionMembers()
})
