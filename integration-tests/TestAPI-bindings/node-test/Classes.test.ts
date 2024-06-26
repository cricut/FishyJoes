import { TestAPI } from 'TestAPI';

test('EmptyClass', () => {
    //console.log('pid: ' + process.pid);
    let a1 = TestAPI.EmptyClass1.create()
    let a2 = TestAPI.EmptyClass1.create()

    expect(a1.blarg).toEqual("Blarg!")
    expect(a1.wibbledyWobbledyTimeyWhimey).toEqual("<wibble>*Wobble*")
    expect(a1.shme()).toEqual("Shme! Hand me my hook.")
    expect(a1.Gorpers()).toEqual("Go Gorp!")

    // There's not a standard equals/hashCode in javascript so we are not implementing it for typescript
    let testDict: {[key: string]: string} = {};
    testDict[a1.toString()] = 'gorp'

    let c = testDict[a1.toString()]
    expect(c).toEqual("gorp")

    expect(a1).toStrictEqual(a2)

    let b1 = TestAPI.EmptyClass2.make()
    expect(b1.blorg).toEqual("Gralb!")
    expect(b1.wibble).toEqual("<timey>*Whimey*")
    expect(b1.shmee()).toEqual("Shme? What's that ticking sound?")
    expect(b1.gorp()).toEqual("Stop Sreprog!")

    testDict[b1.toString()] = 'xyzyx'
    let d = testDict[b1.toString()]
    expect(d).toEqual("xyzyx")

    expect(JSON.stringify(testDict)).toEqual('{"TestAPI.EmptyClass":"gorp","TestAPI.EmptyClass2":"xyzyx"}')

    expect(a1).not.toStrictEqual(b1)
});
