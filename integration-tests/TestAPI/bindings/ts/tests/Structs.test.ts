import { TestAPI } from 'TestAPI';

test('StructConstruction', () => {
    // let memberwise = TestAPI.Structs.MemberwiseStruct.create()
    // expect(memberwise.immutable).toEqual("Eternal")
    // expect(memberwise.mutable).toEqual("Fickle")

    let reference = TestAPI.Structs.ReferenceStruct.create()
    expect(reference.immutable).toEqual("Eternal")
    expect(reference.mutable).toEqual("Fickle")
});

test('EmptyStruct', () => {
    let a1 = TestAPI.EmptyStruct.create()
    expect(a1.tutu).toEqual(35671)
    expect(a1.tatiana).toEqual("Toodles! ta ta for now...")
    expect(a1.aap()).toEqual("The Netherlands")

    let a2 = TestAPI.EmptyStruct.create()
    expect(a2.tutu).toEqual(35671)
    expect(a2.tatiana).toEqual("Toodles! ta ta for now...")
    expect(a2.aap()).toEqual("The Netherlands")

    expect(a1).toStrictEqual(a2)

    let b1 = TestAPI.EmptyStruct2.create()
    expect(b1.tutu).toEqual(12897)
    expect(b1.tatiana).toEqual("Arrivederci")
    expect(b1.aap()).toEqual("The Netherlands2")
    expect(b1.zxccxz()).toEqual("Cambridge University (England)2")

    expect(a1).not.toStrictEqual(b1)
});

test('StructMutablility', () => {
    let memberwise = TestAPI.Structs.MemberwiseStruct.create()
    expect(memberwise.immutable).toEqual("Eternal")
    // memberwise.immutable = "Should generate a compile error!"
    expect(memberwise.mutable).toEqual("Fickle")
    memberwise.mutable = "Fickle as the wind"
    expect(memberwise.mutable).not.toEqual("Fickle")

    let reference = TestAPI.Structs.ReferenceStruct.create()
    expect(reference.immutable).toEqual("Eternal")
    // reference.immutable = "Should generate a compile error!"
    expect(reference.mutable).toEqual("Fickle")
    memberwise.mutable = "Fickle as the wind"
    expect(memberwise.mutable).not.toEqual("Fickle")
});

test('StructEquality', () => {
    expect(TestAPI.Structs.MemberwiseStruct.create()).toEqual(TestAPI.Structs.MemberwiseStruct.create())
    expect(TestAPI.Structs.ReferenceStruct.create()).toEqual(TestAPI.Structs.ReferenceStruct.create())
    expect(TestAPI.Structs.MemberwiseStruct.create()).not.toEqual(TestAPI.Structs.ReferenceStruct.create())
});

test('StructMutatingFunctions', async () => {
    let mutableStruct = TestAPI.Structs.MutableStruct.create()
    expect(mutableStruct.i).toEqual(0)
    mutableStruct.increment()
    expect(mutableStruct.i).toEqual(1)
    await mutableStruct.incrementAsync()
    expect(mutableStruct.i).toEqual(2)
});

test('StructAsyncMemberFunctions', async () => {
    const memberwise = TestAPI.Structs.MemberwiseStruct.create()
    expect(await memberwise.asyncGetMutable()).toEqual("Fickle")
    const reference = TestAPI.Structs.ReferenceStruct.create()
    expect(await reference.asyncGetMutable()).toEqual("Fickle")
    const mutable = TestAPI.Structs.MutableStruct.create()
    expect(await mutable.asyncGetI()).toEqual(0)
});
