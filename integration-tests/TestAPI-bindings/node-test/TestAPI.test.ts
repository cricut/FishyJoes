import { TestAPI } from 'TestAPI';

test('primitive values', () => {
    expect(TestAPI.Primitives.falseBool).toStrictEqual(false);
    expect(TestAPI.Primitives.trueBool).toStrictEqual(true);
    expect(TestAPI.Primitives.zeroUInt8).toStrictEqual(0);
    expect(TestAPI.Primitives.minUInt8).toStrictEqual(0x00);
    expect(TestAPI.Primitives.maxUInt8).toStrictEqual(0xFF);
    expect(TestAPI.Primitives.zeroUInt16).toStrictEqual(0);
    expect(TestAPI.Primitives.minUInt16).toStrictEqual(0x0000);
    expect(TestAPI.Primitives.maxUInt16).toStrictEqual(0xFFFF);
    expect(TestAPI.Primitives.zeroUInt32).toStrictEqual(0);
    expect(TestAPI.Primitives.minUInt32).toStrictEqual(0x00000000);
    expect(TestAPI.Primitives.maxUInt32).toStrictEqual(0xFFFFFFFF);
    expect(TestAPI.Primitives.zeroUInt64).toStrictEqual(BigInt("0"));
    expect(TestAPI.Primitives.minUInt64).toStrictEqual(BigInt("0x0000000000000000"));
    expect(TestAPI.Primitives.maxUInt64).toStrictEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    expect(TestAPI.Primitives.zeroInt8).toStrictEqual(0);
    expect(TestAPI.Primitives.minInt8).toStrictEqual(-0x80);
    expect(TestAPI.Primitives.maxInt8).toStrictEqual(0x7F);
    expect(TestAPI.Primitives.zeroInt16).toStrictEqual(0);
    expect(TestAPI.Primitives.minInt16).toStrictEqual(-0x8000);
    expect(TestAPI.Primitives.maxInt16).toStrictEqual(0x7FFF);
    expect(TestAPI.Primitives.zeroInt32).toStrictEqual(0);
    expect(TestAPI.Primitives.minInt32).toStrictEqual(-0x80000000);
    expect(TestAPI.Primitives.maxInt32).toStrictEqual(0x7FFFFFFF);
    expect(TestAPI.Primitives.zeroInt64).toStrictEqual(BigInt("0"));
    expect(TestAPI.Primitives.minInt64).toStrictEqual(-BigInt("0x8000000000000000"));
    expect(TestAPI.Primitives.maxInt64).toStrictEqual(BigInt("0x7FFFFFFFFFFFFFFF"));
    expect(TestAPI.Primitives.zeroFloat).toStrictEqual(0.0);
    expect(TestAPI.Primitives.minFloat).toStrictEqual(-3.4028234663852886e+38);
    expect(TestAPI.Primitives.maxFloat).toStrictEqual(3.4028234663852886e+38);
    expect(TestAPI.Primitives.zeroDouble).toStrictEqual(0.0);
    expect(TestAPI.Primitives.minDouble).toStrictEqual(-Number.MAX_VALUE);
    expect(TestAPI.Primitives.maxDouble).toStrictEqual(Number.MAX_VALUE);
});

test('ArraysOfPrimitiveValues', () => {
    expect(TestAPI.Primitives.manyBool).toStrictEqual([false, true])
    expect(TestAPI.Primitives.manyUInt8).toStrictEqual([0, 0x00, 0xFF]);
    expect(TestAPI.Primitives.manyUInt16).toStrictEqual([0, 0x0000, 0xFFFF]);
    expect(TestAPI.Primitives.manyUInt32).toStrictEqual([0, 0x00000000, 0xFFFFFFFF]);
    expect(TestAPI.Primitives.manyUInt64).toStrictEqual([BigInt("0"), BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
    expect(TestAPI.Primitives.manyInt8).toStrictEqual([0, -0x80, 0x7F]);
    expect(TestAPI.Primitives.manyInt16).toStrictEqual([0, -0x8000, 0x7FFF]);
    expect(TestAPI.Primitives.manyInt32).toStrictEqual([0, -0x80000000, 0x7FFFFFFF]);
    expect(TestAPI.Primitives.manyInt64).toStrictEqual([BigInt("0"), -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
    expect(TestAPI.Primitives.manyFloat).toStrictEqual([0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
    expect(TestAPI.Primitives.manyDouble).toStrictEqual([0, -Number.MAX_VALUE, Number.MAX_VALUE]);
});

test('ArraysOfOptionalPrimitiveValues', () => {
    expect(TestAPI.Primitives.manyMaybeBool).toStrictEqual([undefined, false, true]);
    expect(TestAPI.Primitives.manyMaybeUInt8).toStrictEqual([undefined, 0, 0x00, 0xFF]);
    expect(TestAPI.Primitives.manyMaybeUInt16).toStrictEqual([undefined, 0, 0x0000, 0xFFFF]);
    expect(TestAPI.Primitives.manyMaybeUInt32).toStrictEqual([undefined, 0, 0x00000000, 0xFFFFFFFF]);
    expect(TestAPI.Primitives.manyMaybeUInt64).toStrictEqual([undefined, BigInt("0"), BigInt("0x0000000000000000"), BigInt("0xFFFFFFFFFFFFFFFF")]);
    expect(TestAPI.Primitives.manyMaybeInt8).toStrictEqual([undefined, 0, -0x80, 0x7F]);
    expect(TestAPI.Primitives.manyMaybeInt16).toStrictEqual([undefined, 0, -0x8000, 0x7FFF]);
    expect(TestAPI.Primitives.manyMaybeInt32).toStrictEqual([undefined, 0, -0x80000000, 0x7FFFFFFF]);
    expect(TestAPI.Primitives.manyMaybeInt64).toStrictEqual([undefined, BigInt("0"), -BigInt("0x8000000000000000"), BigInt("0x7FFFFFFFFFFFFFFF")]);
    expect(TestAPI.Primitives.manyMaybeFloat).toStrictEqual([undefined, 0, -3.4028234663852886e+38, 3.4028234663852886e+38]);
    expect(TestAPI.Primitives.manyMaybeDouble).toStrictEqual([undefined, 0, -Number.MAX_VALUE, Number.MAX_VALUE]);
});

test('FunctionsTakingAndReturningPrimitiveTypes', () => {
    expect(TestAPI.Primitives.echoBool(false)).toStrictEqual(false);
    expect(TestAPI.Primitives.echoBool(true)).toStrictEqual(true);
    expect(TestAPI.Primitives.echoUInt8(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.echoUInt8(0x00)).toStrictEqual(0x00);
    expect(TestAPI.Primitives.echoUInt8(0xFF)).toStrictEqual(0xFF);
    expect(TestAPI.Primitives.echoUInt16(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.echoUInt16(0x0000)).toStrictEqual(0x0000);
    expect(TestAPI.Primitives.echoUInt16(0xFFFF)).toStrictEqual(0xFFFF);
    expect(TestAPI.Primitives.echoUInt32(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.echoUInt32(0x00000000)).toStrictEqual(0x00000000);
    expect(TestAPI.Primitives.echoUInt32(0xFFFFFFFF)).toStrictEqual(0xFFFFFFFF);
    expect(TestAPI.Primitives.echoUInt64(BigInt(0))).toStrictEqual(BigInt(0));
    expect(TestAPI.Primitives.echoUInt64(BigInt("0x0000000000000000"))).toStrictEqual(BigInt("0x0000000000000000"));
    expect(TestAPI.Primitives.echoUInt64(BigInt("0xFFFFFFFFFFFFFFFF"))).toStrictEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    expect(TestAPI.Primitives.echoInt8(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.echoInt8(-0x80)).toStrictEqual(-0x80);
    expect(TestAPI.Primitives.echoInt8(0x7F)).toStrictEqual(0x7F);
    expect(TestAPI.Primitives.echoInt16(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.echoInt16(-0x8000)).toStrictEqual(-0x8000);
    expect(TestAPI.Primitives.echoInt16(0x7FFF)).toStrictEqual(0x7FFF);
    expect(TestAPI.Primitives.echoInt32(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.echoInt32(-0x80000000)).toStrictEqual(-0x80000000);
    expect(TestAPI.Primitives.echoInt32(0x7FFFFFFF)).toStrictEqual(0x7FFFFFFF);
    expect(TestAPI.Primitives.echoInt64(BigInt(0))).toStrictEqual(BigInt(0));
    expect(TestAPI.Primitives.echoInt64(-BigInt("0x8000000000000000"))).toStrictEqual(-BigInt("0x8000000000000000"));
    expect(TestAPI.Primitives.echoInt64(BigInt("0x7FFFFFFFFFFFFFFF"))).toStrictEqual(BigInt("0x7FFFFFFFFFFFFFFF"));
    expect(TestAPI.Primitives.echoFloat(0.0)).toStrictEqual(0.0);
    expect(TestAPI.Primitives.echoFloat(-3.4028234663852886e+38)).toStrictEqual(-3.4028234663852886e+38);
    expect(TestAPI.Primitives.echoFloat(3.4028234663852886e+38)).toStrictEqual(3.4028234663852886e+38);
    expect(TestAPI.Primitives.echoDouble(0.0)).toStrictEqual(0.0);
    expect(TestAPI.Primitives.echoDouble(-Number.MAX_VALUE)).toStrictEqual(-Number.MAX_VALUE);
    expect(TestAPI.Primitives.echoDouble(Number.MAX_VALUE)).toStrictEqual(Number.MAX_VALUE);
});

test('FunctionsTakingReturningOptionalPrimitiveTypes', () => {
    expect(TestAPI.Primitives.maybeEchoBool(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoBool(false)).toStrictEqual(false);
    expect(TestAPI.Primitives.maybeEchoBool(true)).toStrictEqual(true);
    expect(TestAPI.Primitives.maybeEchoUInt8(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoUInt8(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.maybeEchoUInt8(0x00)).toStrictEqual(0x00);
    expect(TestAPI.Primitives.maybeEchoUInt8(0xFF)).toStrictEqual(0xFF);
    expect(TestAPI.Primitives.maybeEchoUInt16(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoUInt16(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.maybeEchoUInt16(0x0000)).toStrictEqual(0x0000);
    expect(TestAPI.Primitives.maybeEchoUInt16(0xFFFF)).toStrictEqual(0xFFFF);
    expect(TestAPI.Primitives.maybeEchoUInt32(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoUInt32(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.maybeEchoUInt32(0x00000000)).toStrictEqual(0x00000000);
    expect(TestAPI.Primitives.maybeEchoUInt32(0xFFFFFFFF)).toStrictEqual(0xFFFFFFFF);
    expect(TestAPI.Primitives.maybeEchoUInt64(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoUInt64(BigInt(0))).toStrictEqual(BigInt(0));
    expect(TestAPI.Primitives.maybeEchoUInt64(BigInt("0x0000000000000000"))).toStrictEqual(BigInt("0x0000000000000000"));
    expect(TestAPI.Primitives.maybeEchoUInt64(BigInt("0xFFFFFFFFFFFFFFFF"))).toStrictEqual(BigInt("0xFFFFFFFFFFFFFFFF"));
    expect(TestAPI.Primitives.maybeEchoInt8(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoInt8(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.maybeEchoInt8(-0x80)).toStrictEqual(-0x80);
    expect(TestAPI.Primitives.maybeEchoInt8(0x7F)).toStrictEqual(0x7F);
    expect(TestAPI.Primitives.maybeEchoInt16(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoInt16(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.maybeEchoInt16(-0x8000)).toStrictEqual(-0x8000);
    expect(TestAPI.Primitives.maybeEchoInt16(0x7FFF)).toStrictEqual(0x7FFF);
    expect(TestAPI.Primitives.maybeEchoInt32(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoInt32(0)).toStrictEqual(0);
    expect(TestAPI.Primitives.maybeEchoInt32(-0x80000000)).toStrictEqual(-0x80000000);
    expect(TestAPI.Primitives.maybeEchoInt32(0x7FFFFFFF)).toStrictEqual(0x7FFFFFFF);
    expect(TestAPI.Primitives.maybeEchoInt64(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoInt64(BigInt(0))).toStrictEqual(BigInt(0));
    expect(TestAPI.Primitives.maybeEchoInt64(-BigInt("0x8000000000000000"))).toStrictEqual(-BigInt("0x8000000000000000"));
    expect(TestAPI.Primitives.maybeEchoInt64(BigInt("0x7FFFFFFFFFFFFFFF"))).toStrictEqual(BigInt("0x7FFFFFFFFFFFFFFF"));
    expect(TestAPI.Primitives.maybeEchoFloat(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoFloat(0.0)).toStrictEqual(0.0);
    expect(TestAPI.Primitives.maybeEchoFloat(-3.4028234663852886e+38)).toStrictEqual(-3.4028234663852886e+38);
    expect(TestAPI.Primitives.maybeEchoFloat(3.4028234663852886e+38)).toStrictEqual(3.4028234663852886e+38);
    expect(TestAPI.Primitives.maybeEchoDouble(undefined)).toStrictEqual(undefined);
    expect(TestAPI.Primitives.maybeEchoDouble(0.0)).toStrictEqual(0.0);
    expect(TestAPI.Primitives.maybeEchoDouble(-Number.MAX_VALUE)).toStrictEqual(-Number.MAX_VALUE);
    expect(TestAPI.Primitives.maybeEchoDouble(Number.MAX_VALUE)).toStrictEqual(Number.MAX_VALUE);
});

test('FunctionsTakingClosuresWithPrimitiveTypes', () => {
    // TODO: Fix breakage
    // expect(TestAPI.Primitives.valueMapper(10) { (it ?: 0) * 2 }).toStrictEqual(20);
});

test('ObjectsWithPrimitiveMembers', () => {
    expect(TestAPI.Primitives.PrimitiveHolder.staticPropery).toStrictEqual([undefined, 0, 0x00, 0xFF]);
    expect(TestAPI.Primitives.PrimitiveHolder.staticMutablePropery).toStrictEqual([undefined, 0, 0x00, 0xFF]);
    TestAPI.Primitives.PrimitiveHolder.staticMutablePropery = [100, 200];
    expect(TestAPI.Primitives.PrimitiveHolder.staticMutablePropery).toStrictEqual([100, 200]);
    let s = TestAPI.Primitives.defaultPrimitiveHolder;
    expect(s).toStrictEqual(TestAPI.Primitives.defaultPrimitiveHolder);
    s.b = !s.b
    expect(s).not.toStrictEqual(TestAPI.Primitives.defaultPrimitiveHolder);
});


// Struct Tests

test('StructConstruction', () => {
    let memberwise = TestAPI.Structs.MemberwiseStruct.create()
    expect(memberwise.immutable).toStrictEqual("Eternal")
    expect(memberwise.mutable).toStrictEqual("Fickle")

    let reference = TestAPI.Structs.ReferenceStruct.create()
    expect(reference.immutable).toStrictEqual("Eternal")
    expect(reference.mutable).toStrictEqual("Fickle")
});

test('StructMutablility', () => {
    let memberwise = TestAPI.Structs.MemberwiseStruct.create()
    expect(memberwise.immutable).toStrictEqual("Eternal")
    // memberwise.immutable = "Should generate a compile error!"
    expect(memberwise.mutable).toStrictEqual("Fickle")
    memberwise.mutable = "Fickle as the wind"
    expect(memberwise.mutable).not.toStrictEqual("Fickle")

    let reference = TestAPI.Structs.ReferenceStruct.create()
    expect(reference.immutable).toStrictEqual("Eternal")
    // reference.immutable = "Should generate a compile error!"
    expect(reference.mutable).toStrictEqual("Fickle")
    memberwise.mutable = "Fickle as the wind"
    expect(memberwise.mutable).not.toEqual("Fickle")
});

test('StructEquality', () => {
    expect(TestAPI.Structs.MemberwiseStruct.create()).toStrictEqual(TestAPI.Structs.MemberwiseStruct.create())
    expect(TestAPI.Structs.ReferenceStruct.create()).toStrictEqual(TestAPI.Structs.ReferenceStruct.create())
    expect(TestAPI.Structs.MemberwiseStruct.create()).not.toStrictEqual(TestAPI.Structs.ReferenceStruct.create())
});

// String Tests

test('StringValues', () => {
    expect(TestAPI.Strings.simple).toStrictEqual("Hello")
    expect(TestAPI.Strings.accent).toStrictEqual("Olá")
    expect(TestAPI.Strings.script).toStrictEqual("こんにちは")
    expect(TestAPI.Strings.chinese).toStrictEqual("你好")
    expect(TestAPI.Strings.chineseBMP).toStrictEqual("豈更車賈滑")
    expect(TestAPI.Strings.chineseSIP).toStrictEqual("\u{20001}\u{20002}\u{20003}\u{20004}")
    expect(TestAPI.Strings.emoji).toStrictEqual("🤯🐶🍓")
    expect(TestAPI.Strings.emojiMulti).toStrictEqual("👨‍👩‍👧‍👦👍🏿🇺🇸")
});

test('StringEcho', () => {
    expect(TestAPI.Strings.echo(TestAPI.Strings.simple)).toStrictEqual(TestAPI.Strings.simple)
    expect(TestAPI.Strings.echo(TestAPI.Strings.accent)).toStrictEqual(TestAPI.Strings.accent)
    expect(TestAPI.Strings.echo(TestAPI.Strings.chinese)).toStrictEqual(TestAPI.Strings.chinese)
    expect(TestAPI.Strings.echo(TestAPI.Strings.chineseBMP)).toStrictEqual(TestAPI.Strings.chineseBMP)
    expect(TestAPI.Strings.echo(TestAPI.Strings.chineseSIP)).toStrictEqual(TestAPI.Strings.chineseSIP)
    expect(TestAPI.Strings.echo(TestAPI.Strings.emoji)).toStrictEqual(TestAPI.Strings.emoji)
    expect(TestAPI.Strings.echo(TestAPI.Strings.emojiMulti)).toStrictEqual(TestAPI.Strings.emojiMulti)
});

// Bytes Tests

test('BytesValues', () => {
    expect(TestAPI.Bytes.bytes).toStrictEqual([0xDE, 0xAD, 0xBE, 0xEF])
    var buffer = new ArrayBuffer(4)
    var int8View = new Int8Array(buffer)
    int8View[0] = 0x0B
    int8View[1] = 0xAD
    int8View[2] = 0xF0
    int8View[3] = 0x0D
    expect(TestAPI.Bytes.data).toStrictEqual(buffer)
});

test('BytesEcho', () => {
    expect(TestAPI.Bytes.echoBytes(TestAPI.Bytes.bytes)).toStrictEqual(TestAPI.Bytes.bytes)
    expect(TestAPI.Bytes.echoData(TestAPI.Bytes.data)).toStrictEqual(TestAPI.Bytes.data)
});

// Collection Tests

test('CollectionValues', () => {
    expect(TestAPI.Collections.arrayOfInt).toStrictEqual([2,7,3,5,8])
    for (let x of [5, 9, 2, 4, 3]) {
        expect(TestAPI.Collections.setOfInt.has(x)).toBe(true)
    }
    let map = new Map<number, number>([[1,10],[2,20],[3,30],[4,40],[5,50]])
    expect(TestAPI.Collections.dictionaryOfIntToInt).toStrictEqual(map)
});

test('OptionalCollectionValues', () => {
    expect(TestAPI.Collections.maybeArrayOfInt).toStrictEqual([2,7,3,5,8])
    for (let x of [5, 9, 2, 4, 3]) {
        expect(TestAPI.Collections.maybeSetOfInt!.has(x)).toBe(true)
    }
    let map = new Map([[1,10],[2,20],[3,30],[4,40],[5,50]])
    expect(TestAPI.Collections.maybeDictionaryOfIntToInt).toStrictEqual(map)
});

test('OptionalCollectionOfOptionalValues', () => {
    expect(TestAPI.Collections.maybeArrayOfMaybeInt).toStrictEqual([undefined, 2,7,3,5,8])
    // TODO: What happened to the nil value on the Swift side?!?
    for (let x of [5, 9, 2, 4, 3]) {
        expect(TestAPI.Collections.maybeSetOfMaybeInt!.has(x)).toBe(true)
    }
    let map = new Map([[undefined,100],[1,10],[2,20],[3,30],[4,40],[5,50]])
    expect(TestAPI.Collections.maybeDictionaryOfMaybeIntToMaybeInt).toStrictEqual(map)
});

test('FunctionsTakingAndReturningCollectionTypes', () => {
    expect(TestAPI.Collections.echoArrayOfInt(TestAPI.Collections.arrayOfInt)).toStrictEqual(TestAPI.Collections.arrayOfInt)
    // TODO: Dies with: TODO: implement Swift.Set.static func fromNode(_:env:)
    // expect(TestAPI.Collections.echoSetOfInt(TestAPI.Collections.setOfInt)).toStrictEqual(TestAPI.Collections.setOfInt)
    // TODO: Dies with: TODO: implement Swift.Dictionary.static func fromNode(_:env:)
    // expect(TestAPI.Collections.echoDictionaryOfIntToInt(TestAPI.Collections.dictionaryOfIntToInt)).toStrictEqual(TestAPI.Collections.dictionaryOfIntToInt)
});

test('FunctionsTakingAndReturningOptionalCollectionTypes', () => {
    expect(TestAPI.Collections.echoMaybeArrayOfMaybeInt(TestAPI.Collections.maybeArrayOfMaybeInt)).toStrictEqual(TestAPI.Collections.maybeArrayOfMaybeInt)
    // TODO: Dies with: TODO: implement Swift.Set.static func fromNode(_:env:)
    // expect(TestAPI.Collections.echoMaybeSetOfMaybeInt(TestAPI.Collections.maybeSetOfMaybeInt)).toStrictEqual(TestAPI.Collections.maybeSetOfMaybeInt)
    // TODO: Dies with: TODO: implement Swift.Dictionary.static func fromNode(_:env:)
    // expect(TestAPI.Collections.echoMaybeDictionaryOfMaybeIntToMaybeInt(TestAPI.Collections.maybeDictionaryOfMaybeIntToMaybeInt)).toStrictEqual(TestAPI.Collections.maybeDictionaryOfMaybeIntToMaybeInt)
});

test('FunctionsTakingClosuresWithCollectionTypes', () => {
    // TODO: Fix breakage
    // expect(TestAPI.Collections.collectionMapper(arrayOf(10,20,30)) { (it ?: arrayOf()).map { it * 2 } }).toStrictEqual(arrayListOf(20,40,60))
});

test('ObjectsWithCollectionMembers', () => {
    expect(TestAPI.Collections.CollectionHolder.staticPropery).toStrictEqual([undefined, 2, 7, 3, 5, 8]);
    expect(TestAPI.Collections.CollectionHolder.staticMutablePropery).toStrictEqual([undefined, 2, 7, 3, 5, 8]);
    // TODO: type annotation is buggy
    TestAPI.Collections.CollectionHolder.staticMutablePropery = [100, undefined as any, 200];
    expect(TestAPI.Collections.CollectionHolder.staticMutablePropery).toStrictEqual([100, undefined, 200]);
    let s = TestAPI.Collections.defaultCollectionHolder;
    expect(s).toStrictEqual(TestAPI.Collections.defaultCollectionHolder);
    var map = new Map<boolean, boolean>()
    s.boolDictionary.forEach((value: boolean, key: boolean) => {
        map.set(key, !value);
    });
    s.boolDictionary = map
    expect(s).not.toStrictEqual(TestAPI.Collections.defaultCollectionHolder);
});

// MARK: Function tests
test('GettingSwiftFunctions', () => {
    expect(42).toStrictEqual(TestAPI.Functions.const42())
    expect(3).toStrictEqual(TestAPI.Functions.abs(-3))

    const composed = TestAPI.Functions.intCompose(x => x + 1, x => x * 3)
    expect(10).toStrictEqual(composed(3))
    expect(7).toStrictEqual(composed(2))

    expect(8.5).toStrictEqual(TestAPI.Functions.add3Things(3, 4.5, 1))
    expect(["a", "b", "c", "d"]).toStrictEqual(TestAPI.Functions.makeList("a", "b", "c", "d"))
    expect(84).toStrictEqual(TestAPI.Functions.fifthThing("hi", 1, 1, "...", () => 84)())
    expect(17).toStrictEqual(TestAPI.Functions.sixthThing("hi", 1, 1, "...", () => 84, 17))
});

test('PassingFunctionsToSwift', () => {
    expect("8").toStrictEqual(TestAPI.Functions.exercise0(() => 8))
    expect("3").toStrictEqual(TestAPI.Functions.exercise1((x: number) => Math.abs(x)))
    expect("25").toStrictEqual(TestAPI.Functions.exercise2((f: (_: number) => number, g: (_: number) => number) => (x: number) => f(g(x))))
    expect("7.4").toStrictEqual(TestAPI.Functions.exercise3((a: number, b: number, c: number) => a + b + c))
    expect('["a", "b", "c", "d"]').toStrictEqual(TestAPI.Functions.exercise4((a: string, b: string, c: string, d: string) => [a, b, c, d]))
    expect("83").toStrictEqual(TestAPI.Functions.exercise5((a: any, b: any, c: any, d: any, f: any) => f))
    expect("42").toStrictEqual(TestAPI.Functions.exercise6((a: any, b: any, c: any, d: any, e: any, i: any) => i))
});

test('Exceptions', () => {
    expect(() => TestAPI.Functions.willThrow()).toThrowError(/TheError/)

    const composed = TestAPI.Functions.intCompose((a: number) => a, (_: number) => { throw "ComposeError" })
    expect(() => composed(3)).toThrowError("ComposeError")
});

// MARK: Enum tests

// Currently not supported in TS
// test('testEmptyEnum', () => {
//     expect(() => TestAPI.EmptyEnum.notGoingToHappen()).toThrow()
// });
// function testSimpleEnum() {
//     expect(0xff0000).toStrictEqual(TestAPI.SimpleEnum.red.hex)
//     expect(0x00ff00).toStrictEqual(TestAPI.SimpleEnum.green.hex)
//     expect(0x0000ff).toStrictEqual(TestAPI.SimpleEnum.blue.hex)
//     expect(TestAPI.SimpleEnum.red).toStrictEqual(TestAPI.SimpleEnum.pickAColor(0))
//     expect(TestAPI.SimpleEnum.green).toStrictEqual(TestAPI.SimpleEnum.pickAColor(1))
//     expect(TestAPI.SimpleEnum.blue).toStrictEqual(TestAPI.SimpleEnum.pickAColor(2))
// }
// testSimpleEnum()

test('AssociatedDataEnum', () => {
    const shape1 = (x: number) => new TestAPI.AssociatedDataEnum.Thing(x)
    const shape2 = (x: string, y: string, z: number) => new TestAPI.AssociatedDataEnum.Bar(x, new TestAPI.AssociatedDataEnum.Other(y, z))

    expect(4).toStrictEqual(shape1(4).intValue)
    expect(11).toStrictEqual(shape2("hello", "world", 8).intValue)
    expect(shape1(9)).toStrictEqual(shape1(2).plus(shape2("x", "y", 4)))
    expect(shape2("y", "z", 7)).toStrictEqual(shape2("y", "z", 2).plus(shape1(5)))
});