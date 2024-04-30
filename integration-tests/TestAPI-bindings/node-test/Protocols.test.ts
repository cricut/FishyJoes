import { TestAPI } from 'TestAPI';

test('AProtocol', () => {
    let a = new TestAPI.AProtocolImplementation(
        "Garply",
        false
    );
    expect(a.foo).toEqual("Garply");
    expect(a.baz).toEqual(false);

    let b = a.bar(2, 128);
    expect(b.foo).toEqual("130");
    expect(b.baz).toEqual(true)

    expect(a.hasADefaultImplementation?.(9, -102.1)).toEqual("-312 notBazzed");
    expect(a.hasADefaultImplementation?.(2, 0.345)).toEqual("bazzy 3");

    expect(a.hasADefaultImplementation2?.("923.2185", true, 0.0898714)).toEqual(3.7838466771424932E9);
    expect(a.hasADefaultImplementation2?.("923.2185", false, 0.0898714)).toEqual(1.9556754407899822E-5);

    expect(a.hasADefaultImplementation2?.("0.9870923", true, 1.123123)).toEqual(0.9589049888649063);
    expect(a.hasADefaultImplementation2?.("0.9870923", false, 1.123123)).toEqual(1.686253813623996);
});
