import { TestAPI } from 'TestAPI';

test('StructConstruction', () => {
    let memberwise = TestAPI.Structs.MemberwiseStruct.create()
    expect(memberwise.immutable).toEqual("Eternal")
    expect(memberwise.mutable).toEqual("Fickle")

    let reference = TestAPI.Structs.ReferenceStruct.create()
    expect(reference.immutable).toEqual("Eternal")
    expect(reference.mutable).toEqual("Fickle")
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
