import { TestAPI } from 'TestAPI';

test('GettingSwiftFunctions', async () => {
    expect(42).toEqual(TestAPI.AsyncFunctions.const42())
    expect(3).toEqual(TestAPI.AsyncFunctions.abs(-3))

    const composed = TestAPI.AsyncFunctions.intCompose(async x => x + 1, async x => x * 3)
    expect(10).toEqual(composed(3))
    expect(7).toEqual(composed(2))

    expect(8.5).toEqual(TestAPI.AsyncFunctions.add3Things(3, 4.5, 1))
    expect(["a", "b", "c", "d"]).toEqual(TestAPI.AsyncFunctions.makeList("a", "b", "c", "d"))
    expect(84).toEqual(await (await TestAPI.AsyncFunctions.fifthThing("hi", 1, 1, "...", async () => 84))())
    expect(17).toEqual(TestAPI.AsyncFunctions.sixthThing("hi", 1, 1, "...", async () => 84, 17))
});

test('PassingFunctionsToSwift', async () => {
    expect("8").toEqual(TestAPI.AsyncFunctions.exercise0(async () => 8))
    expect("3").toEqual(TestAPI.AsyncFunctions.exercise1(async (x: number) => Math.abs(x)))
    expect("25").toEqual(TestAPI.AsyncFunctions.exercise2((f: (_: number) => Promise<number>, g: (_: number) => Promise<number>) => async (x: number) => await f(await g(x))))
    expect("7.4").toEqual(TestAPI.AsyncFunctions.exercise3(async (a: number, b: number, c: number) => a + b + c))
    expect('["a", "b", "c", "d"]').toEqual(TestAPI.AsyncFunctions.exercise4(async (a: string, b: string, c: string, d: string) => [a, b, c, d]))
    expect("83").toEqual(TestAPI.AsyncFunctions.exercise5((_a: any, _b: any, _c: any, _d: any, f: any) => f))
    expect("42").toEqual(TestAPI.AsyncFunctions.exercise6((_a: any, _b: any, _c: any, _d: any, _e: any, i: any) => i))
});
test('Exceptions', () => {
    expect(() => TestAPI.AsyncFunctions.willThrow()).toThrowError(/TheError/)

    const composed = TestAPI.AsyncFunctions.intCompose(async (a: number) => a, async (_: number) => { throw "ComposeError" })
    expect(() => composed(3)).toThrowError("ComposeError")
});
