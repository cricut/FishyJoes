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
    let emptyStruct1 = TestAPI.EmptyStruct.create()
    expect(emptyStruct1.tutu).toEqual(35671)
    expect(emptyStruct1.tatiana).toEqual("Toodles! ta ta for now...")
    expect(emptyStruct1.aap()).toEqual("The Netherlands")

    let emptyStruct2 = TestAPI.EmptyStruct.create()
    expect(emptyStruct2.tutu).toEqual(35671)
    expect(emptyStruct2.tatiana).toEqual("Toodles! ta ta for now...")
    expect(emptyStruct2.aap()).toEqual("The Netherlands")

    expect(emptyStruct1).toEqual(emptyStruct2)
    expect(emptyStruct1.toString()).toEqual(emptyStruct2.toString())
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
