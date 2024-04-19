import { TestAPI } from 'TestAPI';

test('AProtocol', () => {
    let a = new TestAPI.AProtocolImplementation(
        "Garply",
        false
    )

    let d = a.bar(1, 2)
    let e = d.foo
    console.log(`e: ${ e }`)

    // let b = TestAPI.AProtocolImplementation.create()

    // // console.log(`a: ${JSON.stringify(a)}`)
    // //console.log(`b: ${JSON.stringify(b)}`)
    // let c = b.foo
    // console.log(`b.foo: ${ b.foo }`)
});
