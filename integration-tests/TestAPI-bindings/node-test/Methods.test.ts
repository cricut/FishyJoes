import { TestAPI } from 'TestAPI';

test('staticMethods', () => {
    const { Methods } = TestAPI;

    expect(Methods.staticGet).toEqual(123)
    // TODO: support exportAsMethod in typescript?
    // expect(Methods.staticGetMethod()).toEqual(234)

    expect(Methods.staticModifiable).toEqual(345)
    Methods.staticModifiable = 987
    expect(Methods.staticModifiable).toEqual(987)

    expect(Methods.staticStored).toEqual(567)
    Methods.staticStored = 765
    expect(Methods.staticStored).toEqual(765)
});

test('instanceMethods', () => {
    const instance = TestAPI.Methods.create();

    expect(instance.instanceGet).toEqual(1234)
    // TODO: support exportAsMethod in typescript?
    // expect(instance.instanceGetMethod()).toEqual(2345)

    expect(instance.instanceModifiable).toEqual(3456)
    instance.instanceModifiable = 9876
    expect(instance.instanceModifiable).toEqual(9876)

    expect(instance.instanceStored).toEqual(5678)
    instance.instanceStored = 7654
    expect(instance.instanceStored).toEqual(7654)
});
