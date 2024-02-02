import { TestAPI } from 'TestAPI';

test('GettingSwiftFunctions', () => {
    expect(TestAPI.Functions.const42()).toEqual(42)
    expect(TestAPI.Functions.abs(-3)).toEqual(3)

    const composed = TestAPI.Functions.intCompose(x => x + 1, x => x * 3)
    expect(composed(3)).toEqual(10)
    expect(composed(2)).toEqual(7)

    expect(TestAPI.Functions.add3Things(3, 4.5, 1)).toEqual(8.5)
    expect(TestAPI.Functions.makeList("a", "b", "c", "d")).toEqual(["a", "b", "c", "d"])
    expect(TestAPI.Functions.fifthThing("hi", 1, 1, "...", () => 84)()).toEqual(84)
    expect(TestAPI.Functions.sixthThing("hi", 1, 1, "...", () => 84, 17)).toEqual(17)
});

test('PassingFunctionsToSwift', () => {
    expect(TestAPI.Functions.exercise0(() => 8)).toEqual("8")
    expect(TestAPI.Functions.exercise1((x) => Math.abs(x))).toEqual("3")
    expect(TestAPI.Functions.exercise2((f, g) => (x: number) => f(g(x)))).toEqual("25")
    expect(TestAPI.Functions.exercise3((a, b, c) => a + b + c)).toEqual("7.4")
    expect(TestAPI.Functions.exercise4((a, b, c, d) => [a, b, c, d])).toEqual('["a", "b", "c", "d"]')
    expect(TestAPI.Functions.exercise5((_a, _b, _c, _d, f) => f)).toEqual("83")
    expect(TestAPI.Functions.exercise6((_a, _b, _c, _d, _e, i) => i)).toEqual("42")
});

test('Exceptions', () => {
    expect(() => TestAPI.Functions.willThrow()).toThrowError(/TheFunctionError/)

    const composed = TestAPI.Functions.intCompose((a: number) => a, (_: number) => { throw "ComposeError" })
    expect(() => composed(3)).toThrowError("ComposeError")
});
