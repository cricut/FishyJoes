import { TestAPI } from 'TestAPI';

test('GettingSwiftFunctions', () => {
    expect(42).toEqual(TestAPI.Functions.const42())
    expect(3).toEqual(TestAPI.Functions.abs(-3))

    const composed = TestAPI.Functions.intCompose(x => x + 1, x => x * 3)
    expect(10).toEqual(composed(3))
    expect(7).toEqual(composed(2))

    expect(8.5).toEqual(TestAPI.Functions.add3Things(3, 4.5, 1))
    expect(["a", "b", "c", "d"]).toEqual(TestAPI.Functions.makeList("a", "b", "c", "d"))
    expect(84).toEqual(TestAPI.Functions.fifthThing("hi", 1, 1, "...", () => 84)())
    expect(17).toEqual(TestAPI.Functions.sixthThing("hi", 1, 1, "...", () => 84, 17))
});
    
debugger;
var waitTill = new Date(new Date().getTime() + 5 * 1000);
while(waitTill > new Date()){}

test('PassingFunctionsToSwift', () => {
    expect("8").toEqual(TestAPI.Functions.exercise0(() => 8))
    expect("3").toEqual(TestAPI.Functions.exercise1((x: number) => Math.abs(x)))
    expect("25").toEqual(TestAPI.Functions.exercise2((f: (_: number) => number, g: (_: number) => number) => (x: number) => f(g(x))))
    expect("7.4").toEqual(TestAPI.Functions.exercise3((a: number, b: number, c: number) => a + b + c))
    expect('["a", "b", "c", "d"]').toEqual(TestAPI.Functions.exercise4((a: string, b: string, c: string, d: string) => [a, b, c, d]))
    expect("83").toEqual(TestAPI.Functions.exercise5((_a: any, _b: any, _c: any, _d: any, f: any) => f))
    expect("42").toEqual(TestAPI.Functions.exercise6((_a: any, _b: any, _c: any, _d: any, _e: any, i: any) => i))
});

test('AsyncFunctionCall', async () => {
    function delay(ms: number) {
        return new Promise( resolve => setTimeout(resolve, ms) );
    }

    var value: number = 0
    var count = 0
    TestAPI.Functions.async42Func((a: number) => {
        value = a
        console.log(value)
    })

    while (value == 0) {
        await delay(10)
        count += 1
        if (count == 25000) {
            console.log("AsyncFunctionCall timeout")
            break
        }
    }
    expect(value).toEqual(42)
})

test('Exceptions', () => {
    expect(() => TestAPI.Functions.willThrow()).toThrowError(/TheError/)

    const composed = TestAPI.Functions.intCompose((a: number) => a, (_: number) => { throw "ComposeError" })
    expect(() => composed(3)).toThrowError("ComposeError")
});
