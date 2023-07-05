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

test('AsyncCallbackFunctionCall0', async () => {
    let threw: boolean = false
    let value: number = 0
    let ran: boolean = false
    try {
        value = await TestAPI.Functions.asyncCallbackFunc0(async () => {
            ran = true
            return 42
        })
    } catch (e) {
        threw = true
    }
    expect(threw).toEqual(false)
    expect(value).toEqual(42)
    expect(ran).toEqual(true)
})

test('AsyncCallbackFunctionCall1', async () => {
    let threw: boolean = false
    let value: number = 0
    let values: number[] = []
    try {
        value = await TestAPI.Functions.asyncCallbackFunc1(async (a) => {
            values.push(a)
            return a
        })
    } catch (e) {
        threw = true
        console.log(e)
    }
    expect(threw).toEqual(false)
    expect(value).toEqual(1)
    expect(values).toEqual([1])
})

test('AsyncCallbackFunctionCall2', async () => {
    let threw: boolean = false
    let value: number = 0
    let values: number[] = []
    try {
        value = await TestAPI.Functions.asyncCallbackFunc2(async (a, b) => {
            values.push(a)
            values.push(b)
            return a + b
        })
    } catch (e) {
        threw = true
    }
    expect(threw).toEqual(false)
    expect(value).toEqual(1 + 2)
    expect(values).toEqual([1, 2])
})

test('AsyncCallbackFunctionCall3', async () => {
    let threw: boolean = false
    let value: number = 0
    let values: number[] = []
    try {
        value = await TestAPI.Functions.asyncCallbackFunc3(async (a, b, c) => {
            values.push(a)
            values.push(b)
            values.push(c)
            return a + b + c
        })
    } catch (e) {
        threw = true
    }
    expect(threw).toEqual(false)
    expect(value).toEqual(1 + 2 + 3)
    expect(values).toEqual([1, 2, 3])
})

test('AsyncCallbackFunctionCall4', async () => {
    let threw: boolean = false
    let value: number = 0
    let values: number[] = []
    try {
        value = await TestAPI.Functions.asyncCallbackFunc4(async (a, b, c, d) => {
            values.push(a)
            values.push(b)
            values.push(c)
            values.push(d)
            return a + b + c + d
        })
    } catch (e) {
        threw = true
    }
    expect(threw).toEqual(false)
    expect(value).toEqual(1 + 2 + 3 + 4)
    expect(values).toEqual([1, 2, 3, 4])
})

test('AsyncCallbackFunctionCall5', async () => {
    let threw: boolean = false
    let value: number = 0
    let values: number[] = []
    try {
        value = await TestAPI.Functions.asyncCallbackFunc5(async (a, b, c, d, e) => {
            values.push(a)
            values.push(b)
            values.push(c)
            values.push(d)
            values.push(e)
            return a + b + c + d + e
        })
    } catch (e) {
        threw = true
    }
    expect(threw).toEqual(false)
    expect(value).toEqual(1 + 2 + 3 + 4 + 5)
    expect(values).toEqual([1, 2, 3, 4, 5])
})

test('AsyncCallbackFunctionCall6', async () => {
    let threw: boolean = false
    let value: number = 0
    let values: number[] = []
    try {
        value = await TestAPI.Functions.asyncCallbackFunc6(async (a, b, c, d, e, f) => {
            values.push(a)
            values.push(b)
            values.push(c)
            values.push(d)
            values.push(e)
            values.push(f)
            return a + b + c + d + e + f
        })
    } catch (e) {
        threw = true
    }
    expect(threw).toEqual(false)
    expect(value).toEqual(1 + 2 + 3 + 4 + 5 + 6)
    expect(values).toEqual([1, 2, 3, 4, 5, 6])
})

//test('AsyncCallbackFunctionCallThrow', async () => {
//    let threw: boolean = false
//    let value: number = 0
//    let ran: boolean = false
//    let thrownValue: number = 0
//    try {
//        value = await TestAPI.Functions.asyncCallbackFunc0(async () => {
//            ran = true
//            throw 42
//        })
//    } catch (e) {
//        threw = true
//        expect(() => { throw e }).toThrowError(/42/)
//    }
//    expect(threw).toEqual(false)
//    expect(value).toEqual(0)
//    expect(ran).toEqual(true)
////    expect(thrownValue).toEqual(42)
//})

test('AsyncDoubleFunctionCall', async () => {
    const value = await TestAPI.Functions.asyncDoubleFunc(1.0)
    expect(value).toEqual(2.0)
})

test('AsyncMultipleArgsFunctionCall', async () => {
    const value = await TestAPI.Functions.asyncMultipleArgs(1, () => { return 2 })
    expect(value).toEqual(3)
})

test('AsyncThrowingFunctionCallThenCatch', async () => {
    let ranThen: boolean = false
    let ranCatch: boolean = false
    const promise = TestAPI.Functions.asyncThrowingFunc()
        .then((value) => {
            ranThen = true
        })
        .catch((error) => {
            ranCatch = true
            expect(() => { throw error }).toThrowError(/TheError/)
        })
    await promise
    expect(ranThen).toEqual(false)
    expect(ranCatch).toEqual(true)
})

test('AsyncThrowingFunctionCallTryCatch', async () => {
    try {
        await TestAPI.Functions.asyncThrowingFunc()
        throw "Function didn't throw expected error"
    } catch(error) {
        expect(() => { throw error }).toThrowError(/TheError/)
    }
})

test('Exceptions', () => {
    expect(() => TestAPI.Functions.willThrow()).toThrowError(/TheError/)

    const composed = TestAPI.Functions.intCompose((a: number) => a, (_: number) => { throw "ComposeError" })
    expect(() => composed(3)).toThrowError("ComposeError")
});
