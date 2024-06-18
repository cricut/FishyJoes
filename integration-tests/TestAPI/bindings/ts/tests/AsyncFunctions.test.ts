import { TestAPI } from 'TestAPI';

test('GettingSwiftFunctions', async () => {
    await expect(TestAPI.AsyncFunctions.const42()).resolves.toEqual(42)
    await expect(TestAPI.AsyncFunctions.abs(-3)).resolves.toEqual(3)

    const composed = TestAPI.AsyncFunctions.intCompose(async x => x + 1, async x => x * 3)
    await expect(composed(3)).resolves.toEqual(10)
    await expect(composed(2)).resolves.toEqual(7)

    await expect(TestAPI.AsyncFunctions.add3Things(3, 4.5, 1)).resolves.toEqual(8.5)
    await expect(TestAPI.AsyncFunctions.makeList("a", "b", "c", "d")).resolves.toEqual(["a", "b", "c", "d"])
    await expect((await TestAPI.AsyncFunctions.fifthThing("hi", 1, 1, "...", async () => 84))()).resolves.toEqual(84)
    await expect(TestAPI.AsyncFunctions.sixthThing("hi", 1, 1, "...", async () => 84, 17)).resolves.toEqual(17)
});

test('PassingFunctionsToSwift', async () => {
    await expect(TestAPI.AsyncFunctions.exercise0(async () => 8)).resolves.toEqual("8")
    await expect(TestAPI.AsyncFunctions.exercise1(async (x) => Math.abs(x))).resolves.toEqual("3")
    await expect(TestAPI.AsyncFunctions.exercise2((f, g) => async (x) => f(await g(x)))).resolves.toEqual("25")
    await expect(TestAPI.AsyncFunctions.exercise3(async (a, b, c) => a + b + c)).resolves.toEqual("7.4")
    await expect(TestAPI.AsyncFunctions.exercise4(async (a, b, c, d) => [a, b, c, d])).resolves.toEqual('["a", "b", "c", "d"]')
    await expect(TestAPI.AsyncFunctions.exercise5(async (_a, _b, _c, _d, f) => f)).resolves.toEqual("83")
    await expect(TestAPI.AsyncFunctions.exercise6(async (_a, _b, _c, _d, _e, i) => i)).resolves.toEqual("42")
});

test('AsyncExceptions', async () => {
    await expect(TestAPI.AsyncFunctions.willThrow()).rejects.toThrowError(/TheAsyncError/)

    const composed = TestAPI.AsyncFunctions.intCompose(async (a: number) => a, async (_: number) => { throw "ComposeError" })
    await expect(composed(3)).rejects.toThrowError("ComposeError")
});
