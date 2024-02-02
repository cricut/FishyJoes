import { TestAPI } from 'TestAPI';

test('staticMethods', () => {
    const { Methods } = TestAPI;

    expect(Methods.staticGet).toEqual(123)
    // TODO: support exportAsMethod in typescript?
    // expect(Methods.staticGetMethod()).toEqual(234)

    expect(Methods.staticModifiable).toEqual(345)
    Methods.staticModifiable = 987
    expect(Methods.staticModifiable).toEqual(987)

    expect(Methods.staticStored).toEqual(567)
    Methods.staticStored = 765
    expect(Methods.staticStored).toEqual(765)
});

test('instanceMethods', () => {
    const instance = TestAPI.Methods.create();

    expect(instance.instanceGet).toEqual(1234)
    // TODO: support exportAsMethod in typescript?
    // expect(instance.instanceGetMethod()).toEqual(2345)

    expect(instance.instanceModifiable).toEqual(3456)
    instance.instanceModifiable = 9876
    expect(instance.instanceModifiable).toEqual(9876)

    expect(instance.instanceStored).toEqual(5678)
    instance.instanceStored = 7654
    expect(instance.instanceStored).toEqual(7654)
});

describe('AsyncInstanceTests', () => {
    test('AsyncFunctionCall', async () => {
        const value: number = await TestAPI.Methods.create().async42()
        expect(value).toEqual(42)
    })

    test('AsyncYieldingFunctionCall', async () => {
        const value: number = await TestAPI.Methods.create().asyncYield()
        expect(value).toEqual(42)
    })

    test('AsyncSleepingFunctionCall', async () => {
        const value: number = await TestAPI.Methods.create().asyncSleep()
        expect(value).toEqual(42)
    })

    test('AsyncVoidFunctionCall', async () => {
        const value: void = await TestAPI.Methods.create().asyncVoid()
    })

    test('AsyncCallbackFunctionCall0', async () => {
        let threw: boolean = false
        let value: number = 0
        let ran: boolean = false
        try {
            value = await TestAPI.Methods.create().asyncCallbackFunc0(async () => {
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

    test('AsyncCallbackFunctionCallThrow', async () => {
        let threw: boolean = false
        let value: number = 0
        let ran: boolean = false
        try {
            value = await TestAPI.Methods.create().asyncCallbackFunc0(async () => {
                ran = true
                throw 42
            })
        } catch (e) {
            threw = true
            expect(() => { throw e }).toThrowError(/42/)
        }
        expect(threw).toEqual(true)
        expect(value).toEqual(0)
        expect(ran).toEqual(true)
    })

    test('AsyncDoubleFunctionCall', async () => {
        const value = await TestAPI.Methods.create().asyncDouble(1.0)
        expect(value).toEqual(2.0)
    })

    test('AsyncMultipleArgsFunctionCall', async () => {
        const value = await TestAPI.Methods.create().asyncMultipleArgs(1, async () => { return 2 })
        expect(value).toEqual(3)
    })

    test('AsyncThrowingMethod', async () => {
        const promise = TestAPI.Methods.create().asyncThrowing()
        console.log(`promise = ${promise}`)
        await expect(promise).rejects.toThrowError(/TheMethodError/)
    })
})

describe('AsyncStaticTests', () => {
    test('AsyncFunctionCall', async () => {
        const value: number = await TestAPI.Methods.staticAsync42()
        expect(value).toEqual(42)
    })

    test('AsyncYieldingFunctionCall', async () => {
        const value: number = await TestAPI.Methods.staticAsyncYield()
        expect(value).toEqual(42)
    })

    test('AsyncSleepingFunctionCall', async () => {
        const value: number = await TestAPI.Methods.staticAsyncSleep()
        expect(value).toEqual(42)
    })

    test('AsyncVoidFunctionCall', async () => {
        const value: void = await TestAPI.Methods.staticAsyncVoid()
    })

    test('AsyncCallbackFunctionCall0', async () => {
        let threw: boolean = false
        let value: number = 0
        let ran: boolean = false
        try {
            value = await TestAPI.Methods.staticAsyncCallbackFunc0(async () => {
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

    test('AsyncCallbackFunctionCallThrow', async () => {
        let threw: boolean = false
        let value: number = 0
        let ran: boolean = false
        try {
            value = await TestAPI.Methods.staticAsyncCallbackFunc0(async () => {
                ran = true
                throw 42
            })
        } catch (e) {
            threw = true
            expect(() => { throw e }).toThrowError(/42/)
        }
        expect(threw).toEqual(true)
        expect(value).toEqual(0)
        expect(ran).toEqual(true)
    })

    test('AsyncDoubleFunctionCall', async () => {
        const value = await TestAPI.Methods.staticAsyncDouble(1.0)
        expect(value).toEqual(2.0)
    })

    test('AsyncMultipleArgsFunctionCall', async () => {
        const value = await TestAPI.Methods.staticAsyncMultipleArgs(1, async () => { return 2 })
        expect(value).toEqual(3)
    })

    test('AsyncThrowingMethod', async () => {
        const promise = TestAPI.Methods.staticAsyncThrowing()
        console.log(`promise = ${promise}`)
        await expect(promise).rejects.toThrowError(/TheMethodError/)
    })
})
