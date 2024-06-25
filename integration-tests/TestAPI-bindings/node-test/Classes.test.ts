import { TestAPI } from 'TestAPI';

test('EmptyClass', () => {
    console.log('pid: ' + process.pid);

    let a1 = TestAPI.EmptyClass1.create()
    let a2 = TestAPI.EmptyClass1.create()
    expect(a1.blarg).toEqual("Blarg!")
    expect(a1.wibbledyWobbledyTimeyWhimey).toEqual("<wibble>*Wobble*")
    expect(a1.shme()).toEqual("Shme! Hand me my hook.")
    expect(a1.Gorpers()).toEqual("Go Gorp!")

    let testDict = {
        a1: 'help me',
        a2: 'o deer'
    }

    console.log("testDict: " + JSON.stringify(testDict));
    // let c = testDict[a1]
    // console.log("c " + c);

    let hash1 = a1.hashCode
    console.log("hash1: " + hash1)
    let toString = a1.toString()
    console.log("toString: " + toString)

    expect(a1).toStrictEqual(a2)

    let b1 = TestAPI.EmptyClass2.make()
    expect(b1.blorg).toEqual("Gralb!")
    expect(b1.wibble).toEqual("<timey>*Whimey*")
    expect(b1.shmee()).toEqual("Shme? What's that ticking sound?")
    expect(b1.gorp()).toEqual("Stop Sreprog!")

    expect(a1).not.toStrictEqual(b1)
});
