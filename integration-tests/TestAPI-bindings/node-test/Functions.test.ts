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
    const value: number = await TestAPI.Functions.async42Func()
    expect(value).toEqual(42)
})

test('AsyncYieldingFunctionCall', async () => {
    const value: number = await TestAPI.Functions.asyncYieldFunc()
    expect(value).toEqual(42)
})

test('AsyncSleepingFunctionCall', async () => {
    const value: number = await TestAPI.Functions.asyncSleepFunc()
    expect(value).toEqual(42)
})

test('AsyncVoidFunctionCall', async () => {
    const value: void = await TestAPI.Functions.asyncVoidFunc()
})

test('AsyncCallbackFunctionCall', async () => {
    let value: number = 0
    await TestAPI.Functions.asyncCallbackFunc(() => {
        value = 42
    })
    expect(value).toEqual(42)
})

test('AsyncDoubleFunctionCall', async () => {
    const value = await TestAPI.Functions.asyncDoubleFunc(1.0)
    expect(value).toEqual(2.0)
})

test('Exceptions', () => {
    expect(() => TestAPI.Functions.willThrow()).toThrowError(/TheError/)

    const composed = TestAPI.Functions.intCompose((a: number) => a, (_: number) => { throw "ComposeError" })
    expect(() => composed(3)).toThrowError("ComposeError")
});
