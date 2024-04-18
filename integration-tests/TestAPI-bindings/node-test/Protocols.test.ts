import { TestAPI } from 'TestAPI';

test('AProtocol', () => {
    let a = new TestAPI.AProtocolImplementation(
        "Garply",
        false
    )

    let b = TestAPI.AProtocolImplementation.create()

    console.log(`a: ${JSON.stringify(a)}`)
    console.log(`b: ${JSON.stringify(b)}`)
});
