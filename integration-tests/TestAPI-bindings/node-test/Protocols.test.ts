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

    // let d = a.bar(1, 2)
    // let e = d.foo
    // console.log(`e: ${ e }`)

    // let b = TestAPI.AProtocolImplementation.create()

    // // console.log(`a: ${JSON.stringify(a)}`)
    // //console.log(`b: ${JSON.stringify(b)}`)
    // let c = b.foo
    // console.log(`b.foo: ${ b.foo }`)
});
