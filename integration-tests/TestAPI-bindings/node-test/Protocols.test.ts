import { TestAPI } from 'TestAPI';

test('AProtocol', () => {
    let a = new TestAPI.AProtocolImplementation(
        "Garply",
        false
    )
    expect(a.foo).toEqual("Garply")
    expect(a.baz).toEqual(false)

    let b = a.bar(2, 128)
    let c = b.foo

    expect(b.foo).toEqual("130")
    expect(b.baz).toEqual(true)
});
